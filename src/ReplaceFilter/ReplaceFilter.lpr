//ReplaceFilter utility
//Copyright: G.Birbilis <birbilis@kagi.com>
//Version: 1Jan2003
//Status: FREEWARE

{$APPTYPE CONSOLE}

program ReplaceFilter;

uses
  SysUtils,
  ac_TextFileUtil in '..\LIB\ac_TextFileUtil.pas',
  ac_Strings in '..\LIB\ac_strings.pas';

procedure checkArguments;
begin
 if (ParamCount<2) or (ParamCount>4) then
  begin
  writeln('Syntax: '+ParamStr(0)+' fromToken toToken [inFile [outFile]]');
  halt(1);
  end;
end;

var fromToken,toToken,inFile,outFile,contents:String;
    f:text;
begin
 checkArguments;

 fromToken:=ParamStr(1);
 toToken:=ParamStr(2);
 inFile:=ParamStr(3); //will be empty if this parameter is missing
 outFile:=ParamStr(4); //will be empty if this parameter is missing

 assign(f,inFile);
 contents:=loadText(f);

 contents:=replaceStr(contents,fromToken,toToken);

 assign(f,outFile);
 writeText(f,contents);
end.

