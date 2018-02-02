{$APPTYPE CONSOLE}

program CleanTextFilter;
uses SysUtils;

function isValidChar(c:char):boolean;
begin
 result:=(c>=' ');
end;

function filter(c:char):char;
begin
 case c of
  #9: begin beep; result:=' '; end;
  #10: begin beep; result:=' '; writeln; end;
  #13: begin beep; result:=' '; writeln; end;
  else
   if isValidChar(c)
    then result:=c
    else begin
         beep;
         result:=' ';
         end;
 end;
end;

var c:char;
begin
 while not eof do
  begin
  read(c);
  write(filter(c));
  end;
end.

