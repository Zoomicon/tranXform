Unit ac_Strings; (* (C)opyright 1995-2002 George Birbilis / Agrinio Club *)

(************************************************************************
 History:
     ...    - ...
  28Feb1999 - added "startsWith" function
            - added "endsWith" function
   4Aug1999 - fixed a wrong-result case bug in 'endsWith' function
   6Aug1999 - added "RightPos" function
  26Sep1999 - added "toEnd" function
  14Mar2001 - added "lrTrim" procedure
            - added "removeChars" procedure
   5Apr2002 - added "isBlankStr" procedure
  11Apr2002 - added "tokenizeStr" function
   4Jun2002 - fixed "tokenizeStr" to work correctly when missing separator or
              when input doesn't have a separator char as its last character
            - added "upTo" function
            - added "replaceStr" function
  19Aug2002 - fixed "replaceStr", wound return an empty string instead of the
              input string if the string to be replaced wasn't found in the
              input string
   1Nov2002 - added "trimBefore", "trimAfter", "skipFirst", "skipLast" functions
  10Dec2002 - added "copyAfterChar" function

*************************************************************************)

interface
 uses SysUtils;

type charSet=set of char;

function NCharStr(c:char;count:integer):string;

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
function integer2BinStr(b:integer):string;

function ReverseStr(s:string):string;
function upStr(s:string):string;
procedure upString(var s:string);

procedure lTrim(var s:string;c:char);
procedure rTrim(var s:string;c:char);
procedure lrTrim(var s:string;c:char);

procedure InsertNChars(c:char;n:integer;var S:String;Index:integer);
procedure removeChars(var s:string;chrset:charSet);

procedure convertChars(var s:string;FromChars,ToChars:string);
function _convertChars(s:string;FromChars,ToChars:string):string;

function compareStr(s,match:string):boolean;
function FindChars(s,matchChars:string;start:integer):integer; //find the first char from the left that is one of...
function FindNonChars(s,notWantedChars:string;start:integer):integer; //find the first char from the left that isn't one of...
function containsOnly(chrset:charSet;s:string):boolean;
function startsWith(const substr:string;const s:string):boolean;
function endsWith(const substr:string;const s:string):boolean;

function part(s:string;first,last:integer):string;
function copyTillBeforeLastChar(c:char;s:string):string;
function copyAfterChar(c:char;s:string):string;
function toEnd(s:string;first:integer):string;
function upTo(s:string;last:integer):string;

function isBlankStr(s:string):boolean;

type strArray=array of string;
function tokenizeStr(s:string;separator:string):strArray;

function replaceStr(s, fromS, toS:String):string;

function trimBefore(substr:string;s:string):string;
function trimAfter(substr:string;s:string):string;

function skipFirst(s:string;count:integer):string;
function skipLast(s:string;count:integer):string;

(************************************************************************)

implementation
{$B-}

function startsWith;
begin
 result:=(pos(substr,s)=1);
end;

function endsWith; //4Aug1999: fixed to handle a case where pos returned -1 (not found) and endsWith returned "true" //not: strange comment I have here, Delphi's pos function returns 0 if the searched substring is not found
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

procedure lrTrim;
begin
 lTrim(s,c);
 rTrim(s,c);
end;

procedure removeChars;
var i:integer;
    ss:string;
begin
 ss:='';
 for i:=1 to length(s) do
  if not (s[i] in chrset) then ss:=ss+s[i];
 s:=ss;
end;

function rightPos;
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

function copyAfterChar(c:char;s:string):string;
begin
 result:=toEnd(s,pos(c,s)+1);
end;

function toEnd;
begin
 result:=part(s,first,length(s));
end;

function upTo;
begin
 result:=copy(s,1,last);
end;

function isBlankStr;
begin
 result:=length(trim(s))=0;
end;

function tokenizeStr;
var i,c,sepLength:integer;
begin
 setLength(result,0);
 c:=0;
 sepLength:=length(separator);
 i:=pos(separator,s);
 while i<>0 do
  begin
  setLength(result,c+1);
  result[c]:=part(s,1,i-1); //zero-based array
  inc(c);
  s:=toEnd(s,i+sepLength);
  i:=pos(separator,s);
  end;
 if s<>'' then
  begin
  setLength(result,c+1);
  result[c]:=s;
  end;
end;

function replaceStr;
var i,length_fromS:integer;
begin
 length_fromS:=length(fromS);
 result:='';
 i:=pos(fromS,s);
 while i>0 do
  begin
  result:=result + upTo(s,i-1) + toS;
  s:=toEnd(s,i+length_fromS);
  i:=pos(fromS,s);
  end;
 if i=0 then result:=result+s; //keep out of the while loop (else will fail
end;

//@version: 1Nov2002

function trimBefore(substr:string;s:string):string;
begin
 result:=toEnd(s,pos(substr,s)-1);
end;

//@version: 1Nov2002

function trimAfter(substr:string;s:string):string;
begin
 result:=upTo(s,pos(substr,s)+length(substr));
end;

//@version: 1Nov2002

function skipFirst(s:string;count:integer):string;
begin
 result:=toEnd(s,count+1);
end;

//@version: 1Nov2002

function skipLast(s:string;count:integer):string;
begin
 result:=upTo(s,length(s)-count);
end;

end.

