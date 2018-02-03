//History:
//  1Nov2002 - first creation, added "cardinalPower" and "convertHex" functions

Unit ac_Math;

interface

 function cardinalPower(base,exponent:cardinal):cardinal;
 function convertHex(s:string;var resultNum:cardinal):boolean;

implementation

//@version: 1Nov2002

function cardinalPower(base,exponent:cardinal):cardinal;
var i,v:cardinal;
begin
 v:=1;
 for i:=1 to exponent do v:=v*base;
 result:=v;
end;

//@version: 1Nov2002

function convertHex(s:string;var resultNum:cardinal):boolean;
var b,i,v:cardinal;
const HexChars:string[16]='0123456789ABCDEF';
begin
 b:=0;
 for i:=1 to length(s) do
  begin
  v:=pos(upcase(s[i]),HexChars);
  if (v=0) then begin
   convertHex:=FALSE;
   exit;
   end;
  b:=b+(v-1)*cardinalPower(16,cardinal(length(s))-i);
  end;
 convertHex:=TRUE;
 resultNum:=b;
end;

end.

