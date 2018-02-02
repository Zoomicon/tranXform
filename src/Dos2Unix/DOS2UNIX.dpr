{$APPTYPE CONSOLE}

Program Dos2Unix; {(C)opyright 2004 by George Birbilis / Agrinio Club}

const CR=#$0D;

var c:char;
begin
 while not eof do
  begin
  read(c);
  if (c<>CR) then write(c);
  end;
end.
