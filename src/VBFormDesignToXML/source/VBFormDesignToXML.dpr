//VBFormDesignToXML - a filter that takes VB's form design info (extracted from a .frm file with the VBFormDesignFilter tool or manually) and spits it out as XML
//(C)opyright 2002-2004 / George Birbilis <birbilis@kagi.com>

(* History:
  19Aug2002 - first version
   1Nov2002 - renamed "fix" function to "escape" and using to escape reserved XML characters
            - added "resolveExternalString" function
            - changed "processSimpleProperty" routine
  10Dec2002 - added "codeFile" command-line parameter
            - added "processEventHandlers" logic
  18Aug2004 - fixed "useCommandLineParameters" to allow more than 2 parameters
            - added optional 4th parameter to specify encoding (default is ISO-8859-1)
*)

{$APPTYPE CONSOLE}

program VBFormDesignToXML;
uses
  SysUtils,
  ac_Strings in '..\..\..\..\..\DELPHI\LIB\Text\ac_strings.pas',
  Tokenizer in '..\..\..\..\..\DELPHI\LIB\Text\Tokenizer.pas',
  ac_Math in '..\..\..\..\..\DELPHI\LIB\Math\ac_Math.pas',
  ac_TextFileUtil in '..\..\..\..\..\DELPHI\LIB\Text\ac_TextFileUtil.pas';

function escape(const s:string):string;
begin
 result:=s;
 //result:=replaceStr(result,'&','&amp;'); //must do first!
 result:=replaceStr(result,'&',''); //removing "&" chars (e.g. used by VB6 for hex numbers or for defining shortcut keys in captions)

 //result:=replaceStr(result,'"','&quot;');
 //result:=replaceStr(result,'''','&apos;');
 result:=replaceStr(result,'<','&lt;');
 result:=replaceStr(result,'>','&gt;');
end;

//

procedure writeVersion(version:string);
begin
 writeln(' <VERSION>'+version+'</VERSION>');
end;

procedure writeObject(guid,ver,filename:string);
begin
 writeln('  <OBJECT>');
 writeln('   <GUID>'+guid+'</GUID>');
 writeln('   <VER>'+ver+'</VER>');
 writeln('   <FILENAME>'+filename+'</FILENAME>');
 writeln('  </OBJECT>');
end;

procedure writeSimpleProperty(name,value:string);
begin
 writeln('   <PROPERTY>');
 writeln('    <NAME>'+name+'</NAME>');
 writeln('    <VALUE>'+escape(value)+'</VALUE>');
 writeln('   </PROPERTY>');
end;

procedure writeAttribute(name,value:string);
begin
 writeln('  <ATTRIBUTE>');
 writeln('   <NAME>'+name+'</NAME>');
 writeln('   <VALUE>'+escape(value)+'</VALUE>');
 writeln('  </ATTRIBUTE>');
end;

procedure writeEventHandler(name:string;handler:string);
begin
 writeln('    <EVENT>');
 writeln('     <NAME>'+name+'</NAME>');
 writeln('     <HANDLERNAME>'+handler+'</HANDLERNAME>');
 writeln('    </EVENT>');
end;

//

const
 VB_VERSION='VERSION';
 VB_OBJECT='Object';
 VB_BEGIN='Begin';
 VB_END='End';
 VB_BEGIN_PROPERTY='BeginProperty';
 VB_END_PROPERTY='EndProperty';
 VB_ATTRIBUTE='Attribute';

resourcestring STR_DEFAULT_ENCODING='ISO-8859-1';

var s:string;
    inputPath:string;
    code:string;
    encoding:string;

procedure nextLine;
begin
 readln(s);
end;

procedure processVersion;
begin
 if(checkFirst(s)=VB_VERSION) then
  begin
  getFirstToken(s); //skip VERSION token
  writeVersion(GetFirstToken(s)); //read version number
  nextLine;
  end;
end;

procedure processObjects;
var guid,ver,filename:string;
begin
 while(checkFirst(s)=VB_OBJECT) do
  begin
  GetFirstTokenUsingSeparator(s,'{'); //ignore the [ Object = "{ ] part
  guid:=GetFirstTokenUsingSeparator(s,'}');
  ver:=GetFirstTokenUsingSeparator(s,'"');
  GetFirstToken(s); //skip ; token
  filename:=GetFirstTokenUsingSeparator(s,'"');
  writeObject(guid,ver,filename);
  nextLine;
  end;
end;

function resolveExternalString(s:string):string;
var filename:string;
    i,offset:cardinal;
    f:file of char;
    c:char;
    len:integer; //4 bytes
    lenChars:array[1..4] of char absolute len;
begin
 result:='';

 if not convertHex(toEnd(s,rightPos(':',s)+1),offset) then exit;
 filename:=part(s,3,rightPos('"',s)-1);

 assignFile(f,inputPath+filename);
 reset(f);

 seek(f,offset);

 for i:=1 to 4 do read(f,lenChars[i]); //read 4 bytes, assuming big-endian order (Intel)

 while (not eof(f)) and (len<>0) do
  begin
  read(f,c);
  result:=result+c;
  dec(len);
 end;
 close(f);
end;

procedure processSimpleProperty;
var name,value:string;
begin
 name:=GetFirstTokenUsingSeparator(s,'=');
 lrTrim(s,' ');
 if startsWith('$"',s) then  //only string resources start with $, others will be ignored in effect
  value:=resolveExternalString(s)
 else
  if startsWith('"',s)
   then value:=skipFirst(skipLast(s,1),1)
   else value:=getFirstTokenUsingSeparator(s,'''');
 writeSimpleProperty(name,value); //don't use parsing functions directly as parameters, since Object Pascal evaluates from right to left the parameter list
 nextLine;
end;

procedure processProperties; forward;

procedure processComplexProperty;
begin
 if(checkFirst(s)=VB_BEGIN_PROPERTY) then
  begin
  GetFirstToken(s); //skip BeginProperty token
  writeln('   <PROPERTY>');
  writeln('    <NAME>'+GetFirstToken(s)+'</NAME>');
  nextLine;
  processProperties; //will do nextLine if needed
  nextLine; //skip EndProperty token
  writeln('   </PROPERTY>');
  end;
end;

procedure processProperties;
begin
 while (checkFirst(s)<>VB_BEGIN) and (checkFirst(s)<>VB_END) and (checkFirst(s)<>VB_END_PROPERTY) do
  begin
  if(checkFirst(s)<>VB_BEGIN_PROPERTY)
   then processSimpleProperty //will do nextLine if needed
   else processComplexProperty; //will do nextLine if needed
  end;
end;

procedure processBlock; forward;

procedure processBlocks;
begin
 while(checkFirst(s)<>VB_END) do
  processBlock; //will do nextLine if needed
end;

procedure processEventHandlers(name:String);
var localCode,handlerPrefix,handler:string;
    p:integer;
begin
 localCode:=code;
 handlerPrefix:='Sub '+name+'_';

 p:=pos(handlerPrefix,localCode);
 if (p<>0) then
  begin
  writeln('    <EVENTS>');
  repeat
   localCode:=toEnd(localCode,p);
   getFirstToken(localCode); //skip the "Sub" token
   handler:=getFirstToken(localCode);
   removeChars(handler,['(',')']);
   writeEventHandler(copyAfterChar('_', handler), handler);
   p:=pos(handlerPrefix,localCode);
  until (p=0);
  writeln('    </EVENTS>');
  end;
end;

procedure processBlock;
var name:string;
begin
 if(checkFirst(s)=VB_BEGIN) then
  begin
  writeln(' <COMPONENT>');
  GetFirstToken(s); //skip Begin token
  writeln('  <CLASS>'+GetFirstToken(s)+'</CLASS>');
  name:=GetFirstToken(s);
  writeln('  <NAME>'+name+'</NAME>');
  nextLine;
  processProperties;
  processEventHandlers(name);
  processBlocks;
  nextLine; //skip End token
  writeln(' </COMPONENT>');
  end;
end;

procedure processAttribute;
var name,value:string;
begin
 if(checkFirst(s)=VB_ATTRIBUTE) then
  begin
  GetFirstToken(s); //skip Attribute token
  name:=GetFirstTokenUsingSeparator(s,'=');
  value:=GetFirstToken(s);
  writeAttribute(name,value);
  nextLine;
  end;
end;

procedure processAttributes;
begin
 while (checkFirst(s)=VB_ATTRIBUTE) do
  processAttribute;
end;

//

procedure useCommandLineParameters;
var f:text;
begin
 if(paramCount>4) then
  begin
  writeln('VBFormDesignToXML - (C)2002-2004 G.Birbilis <birbilis@kagi.com>');
  writeln('Syntax: [codeFile [inputFile [outputFile [encoding]]]]');
  halt(1);
  end;

 if(paramCount>3)
  then encoding:=ParamStr(4)
  else encoding:=STR_DEFAULT_ENCODING;

 if(paramCount>2) then
  begin
  assign(output,paramStr(3));
  rewrite(output);
  end;

 if(paramCount>1) then
  begin
  assign(input,paramStr(2));
  reset(input);
  inputPath:=extractFilePath(paramStr(2));
  end
 else
  inputPath:='';

 if(paramCount>0) then
  begin
  assignFile(f,paramStr(1));
  code:=loadText(f); //if file not found will set to an empty string
  end //note: should use a filter that removes comments from the code
 else
  code:='';

end;

begin
 useCommandLineParameters;
 writeln('<?xml version="1.0" encoding="'+encoding+'" standalone="no"?>');
 writeln('<!DOCTYPE VBFORM SYSTEM "VBFormDesign.dtd" []>');
 //writeln('<?xml:stylesheet type="text/xsl" href="VBFormDesign.xsl"?>');

 writeln;
 writeln('<!--');
 writeln(' VB form design info generated using the VBFormDesignToXML');
 writeln(' tool which is (C)2002-2004 G.Birbilis (birbilis@kagi.com)');
 writeln('-->');
 writeln;

 nextLine;
 writeln('<VBFORM>');
 processVersion;
 processObjects;
 processBlock;
 processAttributes;
 writeln('</VBFORM>')
end.

