//Text file utilities
//(C)1999-2003 George Birbilis <birbilis@kagi.com>

//5Apr2002 - added "skipLines" procedure
//5Jun2002 - fixed "loadText" function to not skip empty lines inside the file neither at the end of the file
//1Jan2003 - added "writeText" procedure

unit ac_TextFileUtil;

interface
 function loadText(var f:text):string;
 procedure writeText(var f:text; content:string);
 function countNonBlankLines(var f:text):cardinal;
 procedure skipLines(var f:text; n:cardinal);

implementation

{$i-}

function loadText;
const CRLF=#13#10;
var s:string;
begin
 result:='';
 filemode:=0; //read-only
 reset(f);
 while (ioresult=0) and (not eof(f)) do //use "eof", not "seekeof" else empty lines will be skipped!
  begin
  read(f,s); //read text till end-of-line or end-of-file without reading the finishing marker
  result:=result+s;
  if(eoln(f) and (not eof(f))) then //if end-of-line marker (eoln also returns true if eof=true, so checking that this isn't that case)
   begin
   readln(f); //read the end-of-line marker
   result:=result+CRLF; //add a CRLF marker to the result
   end;
  end;
 close(f);
end;

procedure writeText;
begin
 filemode:=1;
 rewrite(f);
 write(f,content);
 close(f);
end;

function countNonBlankLines;
begin
 result:=0;
 filemode:=0; //read-only
 reset(f);
 while (ioresult=0) and (not seekeof(f)) do
  begin
  readln(f);
  inc(result);
  end;
 close(f);
end;

procedure skipLines;
var i:cardinal;
begin
 for i:=1 to n do //n times
  readln(f); //skip a line
end;

end.

