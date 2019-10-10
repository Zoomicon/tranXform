program C2PasFilter;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form1},
  Tokenizer in 'Tokenizer.pas',
  ac_STRINGS in 'ac_strings.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
