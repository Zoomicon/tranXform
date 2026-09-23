// DumpParams - writes each command-line parameter to the standard output stream.
// Usage: DumpParams parameter1 [parameter2 ...]
// The executable name (ParamStr(0)) is intentionally not included.
program DumpParams;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var i: integer;
begin
  try
    // Write one argument per line so the output can be consumed by text filters
    // or other command-line tools.
    for I := 1 to ParamCount do
      Writeln(ParamStr(i));
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
