{$APPTYPE CONSOLE}

Program Unix2Dos; {(C)opyright 1997-2002 by George Birbilis / Agrinio Club}

const CR=#$0D;
      LF=#$0A;

var c:char;
    lastc:char;
begin
lastc:=CR; {in case first char read is an LF}
 while not eof do
  begin
  read(c);
  if (c=LF) and (lastc<>CR) then write(CR);
  write(c);
  lastc:=c;
  end;
end.
