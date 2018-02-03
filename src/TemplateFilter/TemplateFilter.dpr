//version: 4Jun2002

program TemplateFilter;
{$APPTYPE CONSOLE}

uses
  SysUtils,
  ac_TextFileUtil in '..\..\..\DELPHI\LIB\Text\ac_TextFileUtil.pas',
  ac_Strings in '..\..\..\DELPHI\LIB\Text\ac_strings.pas';

var template:string;

procedure copyright;
begin
 writeln('TemplateFilter - ouput each input line filtered via a template');
 writeln('(C)2002 George Birbilis <birbilis@kagi.com>');
end;

procedure syntax;
begin
 writeln(ParamStr(0)+' templateFile');
end;

procedure loadTemplate;
var f:text;
begin
 assignFile(f,ParamStr(1));
 template:=loadText(f);
end;

(*
type variantArray=array of TVarRec;

function strArrayToVariantArray(s:strArray):variantArray;
var i,count:integer;
begin
 count:=length(s);
 setLength(result,count);
 //...maybe VarArrayLock both arrays here...
 for i:=0 to count-1 do
  with result[i] do
   begin
   VType:=vtAnsiString;
   VAnsiString:=pointer(s[i]); //don't use @s[i] here, must use pointer(s[i]), even if it sounds strange
   end;
 //...maybe VarArrayUnlock both arrays here (using try/finally as well)...
end;
*)

function applyTemplate(s:string):string;
var tokens:strArray;
    i:integer;
begin
 //writeln( format(template, strArrayToVariantArray( tokenizeStr(s,';') ) ) );
 tokens:=tokenizeStr(s,';');
 result:=template;
 for i:=1 to length(tokens) do
  result:=replaceStr(result,'%'+IntToStr(i),tokens[i-1]);
end;

var s:string;
begin
 if paramCount<>1 then
  begin
  copyright; //show copyright only on error, normal usage should produce just the needed output
  syntax;
  halt(1);
  end;
 loadTemplate;
 //writeln(template);
 while not eof do
  begin
  readln(s);
  write(applyTemplate(s)); //don't use "writeln", the template can contain new lines if wanted so
  end;
end.