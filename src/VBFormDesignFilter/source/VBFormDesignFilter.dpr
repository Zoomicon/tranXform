//VBFormDesignFilter - a filter that takes VB's .frm file content as input and spits out only the form design part
//(C)opyright 2002 - George Birbilis <birbilis@kagi.com>

(* History:
  6Aug2002 - first version
*)

{$APPTYPE CONSOLE}

program VBFormDesignFilter;
uses ac_Strings in '..\..\..\..\DELPHI\LIB\Text\ac_strings.pas';

const VB_ATTRIBUTE='Attribute';

procedure spitTillFirstAttribute;
var s:string;
begin
 while not eof do
  begin
  readln(s);
  writeln(s);
  if startsWith(VB_ATTRIBUTE,s) then break;
  end;
end;

procedure spitOnlyAttributes;
var s:string;
begin
 while not eof do
  begin
  readln(s);
  if startsWith(VB_ATTRIBUTE,s) then writeln(s);
  end;
end;

begin
 spitTillFirstAttribute;
 spitOnlyAttributes;
end.

