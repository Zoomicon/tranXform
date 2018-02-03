//VBFormCodeFilter - a filter that takes VB's .frm file content as input and spits out only the form code part
//(C)opyright 2002 - George Birbilis <birbilis@kagi.com>

(* History:
  10Dec2002 - first version
*)

{$APPTYPE CONSOLE}

program VBFormCodeFilter;
uses ac_Strings in '..\..\..\..\DELPHI\LIB\Text\ac_strings.pas';

const VB_ATTRIBUTE='Attribute';

procedure ignoreTillFirstAttribute;
var s:string;
begin
 while not eof do
  begin
  readln(s);
  if startsWith(VB_ATTRIBUTE,s) then break;
  end;
end;

procedure spitNonAttributes;
var s:string;
begin
 while not eof do
  begin
  readln(s);
  if not startsWith(VB_ATTRIBUTE,s) then writeln(s);
  end;
end;

begin
 ignoreTillFirstAttribute;
 spitNonAttributes;
end.

