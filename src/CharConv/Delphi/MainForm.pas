//Description: Text converter
//Author: George Birbilis (birbilis@kagi.com)
//Version: 30Aug2006

unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, SynEdit, SynMemo;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    txtFrom: TEdit;
    Label1: TLabel;
    txtTo: TEdit;
    Button1: TButton;
    Button2: TButton;
    txtSource: TSynMemo;
    txtTarget: TSynMemo;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  protected
    procedure msgDifferentLayout;
    procedure msgNonReversibleMapping(const cFrom,cTo,cOther:WideChar);
  public
    procedure UpdateMapping;
    procedure Convert;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Messages//

procedure TForm1.msgDifferentLayout;
begin
 ShowMessage('Source and Target must have identical layout to resync the mapping');
end;

procedure TForm1.msgNonReversibleMapping(const cFrom,cTo,cOther:WideChar);
begin
 ShowMessage('Char ['+cTo+'] is already in "To" field, but mapped to char ['+cOther+'] at the "From" field. Added again to map to ['+cFrom+']. This is a non reversible (1-1) mapping');
end;

//Actions//

procedure TForm1.UpdateMapping;

 procedure UpdateWideCharMapping(const cFrom,cTo:WideChar);
 var
  p:integer;
 begin
  if pos(cFrom,txtFrom.Text)=0 then
   begin
   txtFrom.Text:=txtFrom.Text+cFrom;
   p:=pos(cTo,txtTo.Text);
   if (p<>0) then
    msgNonReversibleMapping(cFrom,cTo,WideChar(txtFrom.Text[p]));
   txtTo.Text:=txtTo.Text+cTo;
   end;
 end;

 var
 i:integer;
 s1,s2:WideString;
begin
 s1:=txtSource.Text;
 s2:=txtTarget.Text;

 if (txtSource.Lines.Count<>txtTarget.Lines.Count) or
    (length(s1)<>length(s2)) then
  MsgDifferentLayout
 Else
  for i:=1 to length(s1) do
   updateWideCharMapping(s1[i],s2[i]);
end;

function convertWideChars(const s,fromChars,toChars:WideString):string;
var
 i,p:integer;
 c:WideChar;
begin
 result:='';
 for i:=1 to length(s) do
  begin
  c:=s[i];
  p:=pos(c,fromChars);
  if p=0 then
   result:=result+c
  else
   result:=result+toChars[p];
  end;
end;

procedure TForm1.Convert;
begin
 txtTarget.text:=convertWideChars(txtSource.text,txtFrom.Text,txtTo.Text);
end;

//Event handlers//

procedure TForm1.Button2Click(Sender: TObject);
begin
 UpdateMapping;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Convert;
end;

end.

