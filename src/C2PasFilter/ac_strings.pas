(************************************************************************
 History:
  28Feb1999 - added startsWith function
            - added endsWith function
   4Aug1999 - fixed a wrong-result case bug in 'endsWith' function
   6Aug1999 - added RightPos function
  26Sep1999 - added toEnd function

************************************************************************)

Unit ac_STRINGS; (* (C)opyright 1995-1999 George Birbilis / Agrinio Club *)

interface

type charSet=set of char;

function StringChar(s:string; pos:integer):char;
function extractnum(s:string;var start:integer{start=0};default:word):word;
function CharPos(s:string;c:char;start:integer;RightDir:boolean):integer;
function RightPos(c:char;s:string):integer;
function Long2CommaStr(x:longint):string;
function Int2Str(x:integer):string;
function Long2Str(x:real):string;
function Real2Str(x:real):string;
function Str2Int(s:string):integer;
function Str2Long(s:string):longint;
function Str2Real(s:string):real;
function part(s:string;first,last:integer):string;
function upStr(s:string):string;
procedure upString(var s:string);
procedure lTrim(var s:string;c:char);
procedure rTrim(var s:string;c:char);
procedure convertChars(var s:string;FromChars,ToChars:string);
function _convertChars(s:string;FromChars,ToChars:string):string;
procedure InsertNChars(c:char;n:integer;var S:String;Index:integer);
function integer2BinStr(b:integer):string;
function NCharStr(c:char;count:integer):string;
function containsOnly(chrset:charSet;s:string):boolean;
function compareStr(s,match:string):boolean;
function FindChars(s,matchChars:string;start:integer):integer; //find the first char from the left that is one of...
function FindNonChars(s,notWantedChars:string;start:integer):integer; //find the first char from the left that isn't one of...
function ReverseStr(s:string):string;
function startsWith(const substr:string;const s:string):boolean;
function endsWith(const substr:string;const s:string):boolean;
function copyTillBeforeLastChar(c:char;s:string):string;
function toEnd(s:string;start:integer):string;

implementation
{$B-}

function startsWith;
begin
 result:=(pos(substr,s)=1);
end;

function endsWith; //4Aug1999: fixed to handle a case where pos returned -1 (not found) and endsWith returned "true"
var position:integer;
begin
 position:=pos(substr,s);
 result:=(position>0) and (position=(length(s)-length(substr)+1));
end;

function extractnum;
var s1:string;
    code:integer;
const numdigits=['0'..'9'];
begin
{ignore a sequence of spaces and/or tabs at s[start]}
while (start<length(s)) and (s[start] in [' ',#9]) do inc(start);
{go on}
s1:='';
inc(start);
while (start<=length(s)) and (s[start] in numdigits+['$']) do
 begin
 s1:=s1+s[start];
 inc(start);
 end;
if s1<>'' then val(s1,default,code);
extractnum:=default;
end;

function CharPos(s:string;c:char;start:integer;RightDir:boolean):integer;
var i:integer;
begin
 result:=0;
 if (start=0) or (start>length(s)) then exit;

 if rightDir then
  begin
  for i:=start to length(s) do
   if s[i]=c then
    begin
    result:=i;
    exit;
    end;
  end
 else
  for i:=start downto 1 do
   if s[i]=c then
    begin
    result:=i;
    exit;
    end;

end;

(*
function CharPos;assembler; //Turbo Pascal code, doesn't work in Delphi
asm
 push ds         {keep ds}
 lds si,s        {ds:si points to s[0]}

 xor al,al       {initially set return code to 0}

 mov bh,start    {bh=start}
 or bh,bh
 jz @exit        {if start=0 then goto @exit (with al=0)}

 xor ch,ch
 mov cl,bh       {cx=start}

 mov bl,[si]     {bl=length(s)}
 mov dl,bl       {dl=>>}
 sub bl,bh       {bl=length(s)-start}
 jc @exit        {if bl<0 [start>length(s)] then goto @exit (with al=0)}

 add si,cx       {ds:si points at s[start]}

 mov ah,RightDir
 or ah,ah
 std             {si-- ;LeftDir}
 jz @check       {if not rightDir then goto @check (with Flag(d)=1)}
 mov cl,bl       {cl=bl=length(s)-start}
 inc cl
 cld             {si++ ;RightDir}
@check:
 lodsb
 cmp al,c
 je @out
 loop @check
@out:
 mov al,cl
 or cl,cl
 jz @exit        {if cl=0 then goto @exit}
 or ah,ah
 jz @exit
 sub dl,al
 mov al,dl
 inc al
@exit:
 pop ds          {restore ds}
end;
*)

function Long2CommaStr;
var s:string;
    counter,len,i:integer;
begin
str(x,s);
len:=length(s);
counter:=Trunc(len/3);
if Frac(len/3)=0 then counter:=counter-1;
for i:=1 to counter do
 insert(',',s,len-3*i+1);
Long2CommaStr:=s;
end;

function int2str;
var s:string;
begin
str(x,s);
int2str:=s;
end;

function long2str;
var s:string;
begin
str(x,s);
long2str:=s;
end;

function real2str;
var s:string;
begin
str(x,s);
real2str:=s;
end;

function str2int;
var i,err:integer;
begin
val(s,i,err);
str2int:=i;
end;

function str2long;
var err:integer;
    i:longint;
begin
val(s,i,err);
str2long:=i;
end;

function str2real;
var err:integer;
    i:real;
begin
val(s,i,err);
str2real:=i;
end;

procedure InsertNChars;
var i:integer;
begin
for i:=1 to n do insert(c,s,index);
end;

procedure upString;
var i:integer;
begin
for i:=1 to length(s) do s[i]:=upcase(s[i]);
end;

function upStr;
begin
upString(s);
upStr:=s;
end;

function integer2BinStr;
var i:integer;
    s:string;
begin
s:='';
for i:=1 to 8 do
 begin
 if odd(b) then s:='1'+s else s:='0'+s;
 b:=b shr 1;
 end;
integer2BinStr:=s;
end;

function NCharStr;
var s:string;
begin
setLength(s,count);
fillchar(s[1],count,c);
NCharStr:=s;
end;

procedure lTrim;
var i:integer;
begin
 i:=1;
 while (i<=length(s)) and (s[i]=c) do inc(i); //i<=length must precede the s[i]=c check, in case i=0 at first loop
 s:=copy(s,i,length(s)-i+1);
end;

procedure rTrim;
var i:integer;
begin
 i:=length(s);
 while (i>0) and (s[i]=c) do dec(i); //i>0 check must precede the s[i]=c check, in case i=0 at first loop
 s:=copy(s,1,i);
end;

function rightPos(c:char;s:string):integer;
var i:integer;
begin
 for i:=length(s) downto 1 do
  if s[i]=c then
   begin
   result:=i;
   exit;
   end;
 result:=0;
end;

function containsOnly;
var i:integer;
begin
 containsonly:=FALSE;
 for i:=1 to length(s) do if not (s[i] in chrset) then exit;
 containsonly:=TRUE;
end;

function compareStr;
const wildcards:set of char=['*','?'];
var i:integer;
{$B-}
begin
if (s=match) then compareStr:=TRUE
 else begin
      compareStr:=FALSE; {!}
      for i:=1 to length(match) do
       if s[i]='*'
        then begin
             compareStr:=TRUE;
             exit;
             end
       else if (i>length(s))
             then break
             else if (s[i]<>match[i]) and (s[i]<>'?') then exit; {FALSE}
      {length(s)>length(match)}
      if containsOnly(wildcards,copy(s,length(match)+1,length(s)-length(match)))
       then compareStr:=TRUE; {! else compareStr:=FALSE !}
      end;
end;

procedure convertChars;
var i,p,ToCharsLen:integer;
    result:string;
begin
 result:='';
 ToCharsLen:=Length(ToChars);
 for i:=1 to length(s) do
  begin
  p:=pos(s[i],FromChars);
  if p=0 then
   result:=result+s[i]
  else
   if ToCharsLen=0 then continue {if ToChars='' the FromChars are striped}
   else
    begin
    if p>ToCharsLen then p:=length(ToChars);  {else are changed by same pos}
    result:=result+ToChars[p]; {char at ToChars or the last char of ToChars}
    end;
  end;
 s:=result;
end;

function _convertChars;
begin
convertChars(s,FromChars,ToChars);
_convertChars:=s;
end;

function FindChars;
var i:integer;
begin
 if start>0 then
  for i:=start to length(s) do
   if pos(s[i],matchChars)<>0 then
    begin
    FindChars:=i;
    exit;
    end;
 FindChars:=0;
end;

function FindNonChars;
var i:integer;
begin
 if start>0 then
  for i:=start to length(s) do
   if pos(s[i],notWantedChars)=0 then
    begin
    FindNonChars:=i;
    exit;
    end;
 FindNonChars:=0;
end;

function part;
begin
 part:=copy(s,first,last-first+1);
end;

function StringChar;
begin
 StringChar:=s[pos];
end;

function ReverseStr;
var i:integer;
begin
 result:='';
 for i:=length(s) downto 1 do result:=result+s[i];
end;

function copyTillBeforeLastChar;
var i:integer;
begin
 i:=rightPos(c,s);
 if (i>0) then result:=copy(s,1,i-1)
          else result:=s;
end;

function toEnd;
begin
 result:=part(s,start,length(s));
end;

end.


