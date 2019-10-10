//C2PasFilter: (C)1999-2001 George Birbilis <birbilis@kagi.com>

(* HISTORY:
 ???????? - birbilis: first versions
 8Oct2001 - birbilis: fixed the support for pointers
 8Nov2001 - birbilis: now "void* x" is converted to "var x", instead of the erroneous "var x:"
          - birbilis: added "funcs+external" button to convert some funcs,
                      then put them on the clipboard (for pasting in the interface section of a unit),
                      then do the action to create the "external" forms (for use in the implementation section of a unit)
          - birbilis: made form elements autoresizable when form resizes
*)

unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    btnVarDecl: TButton;
    btnParamList: TButton;
    btnFunc: TButton;
    btnExternal: TButton;
    edModifiers: TEdit;
    Label1: TLabel;
    btnFuncs: TButton;
    btnFCCmacro: TButton;
    btnFCC: TButton;
    btnFuncsAndExternal: TButton;
    procedure btnVarDeclClick(Sender: TObject);
    procedure btnParamListClick(Sender: TObject);
    procedure btnFuncClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExternalClick(Sender: TObject);
    procedure btnFuncsClick(Sender: TObject);
    procedure btnFCCmacroClick(Sender: TObject);
    procedure btnFCCClick(Sender: TObject);
    procedure btnFuncsAndExternalClick(Sender: TObject);
  private
    { Private declarations }
   procedure done;
  public
    { Public declarations }
   procedure AppDeactivated(Sender: TObject);
   function SourceInput:string;
  end;

var
  Form1: TForm1;

implementation
 uses Tokenizer,ac_Strings,clipbrd;

{$R *.DFM}

function convertStructFieldList(s:string):string; //use for var lists, not struct lists, unless , has been changed into ; in them
var tok1,tok2:string;
begin
 tok1:=GetFirstToken(s);
 //tok2:=GetFirstToken(s);
 //tok2:=s; //get the rest of the line
 tok2:=GetFirstTokenUsingSeparator(s,';'); //if , not found will get till the rest of the line, using this to cut off comments
 rTrim(tok2,';');
 result:=TrimRight(tok2)+':'+tok1+'; '+trim(s); //TrimRight tok2 in case after removing the ";" has spaces on the right side
end;

function convertPtr(s:string):string;
begin
 if s<>'' then
  //if s[1]='T' then s[1]:='P' else //Txxx * -> Pxxx
   if s='void' then s:='pointer' else //void * -> pointer
    s:=s+'Ptr';               //xxx * -> xxxPtr
 result:=s;
end;

function convertParamList(s:string):string;
var tok1,tok2:string;
begin
 result:='';

 s:=trim(s);
 rtrim(s,';');
 rtrim(s,')');
 ltrim(s,'(');

 while(true) do
  begin
  tok1:=GetFirstToken(s);
  if tok1='const' then
   begin
   tok1:=GetFirstToken(s);
   result:=result+'const ';
   end;
  tok2:=trim(GetFirstTokenUsingSeparator(s,',')); //must trim for spaces, tabs etc.
  if tok2='' then break;
  if tok2[1]<>'*'
   then result:=result+tok2+':'+tok1+';'
   else
    begin
    result:=result+'var '+trim(copy(tok2,2,length(tok2)-1));
    if tok1<>'void' then //tok1:=convertPtr(tok1); //don't use "convertPtr", using "var" instead
     result:=result+':'+tok1; //user may change the "var" to "out" judging from comments in the file
    result:=result+';';
    end;
  end;
 rTrim(result,';'); //remove any last ";"
 result:=trim(result);
 if result<>'' then result:='('+result+')'; //an empty param list of the form () isn't supported by Delphi3
end;

function convertFunc(s:string):string;
var procName:string;
    i:integer;
begin
 result:='';
 procName:=checkFirst(s);
 if startsWith('EXTERN',procName) then //a func with EXTERN
  begin
  getFirstTokenUsingSeparator(s,'('); //skip EXTERN(
  result:=':'+getFirstTokenUsingSeparator(s,')'); //trimed by Tokenizer, else we won't be able to compare with ':void' later on
  procName:=getFirstToken(s);
  end
 else procName:=getFirstToken(s); //OK, get it

 if s='' then exit; //s will have been trimmed by now
 if s[1]<>'(' then //a normal func with no EXTERN
  begin
  result:=':'+procName;
  procName:=getFirstToken(s);
  end;

 result:=trim(result);
 if (result<>'') and (result[length(result)]='*') then
  result:=convertPtr(copy(result,1,length(result)-1)); //check if ending in * and convert to Pxxx or xxxPtr or "pointer"

 i:=charPos(s,')',1,true);
 if i<>0 then s:=copy(s,1,i); //crop any TWO_WORD_INLINE or other macros following the proc def (all procs have param lists, () is used by empty ones)

 if (result=':void')
  then result:='procedure '+procName+convertParamList(s)+';'
  else result:='function '+procName+convertParamList(s)+result+';';
end;

function convertToExternal(s:string;extfile:string):string;
var tok1:string;
begin
 tok1:=UpperCase(checkFirst(s));
 if (tok1<>'FUNCTION') and (tok1<>'PROCEDURE')
  then result:=s //return string as is (for comments etc.)
  else
   if pos('(',s)<>0 //check if we have a param list
    then result:=getFirstTokenUsingSeparator(s,'(')+'; cdecl; external '''+extfile+''';'
    else result:=getFirstTokenUsingSeparators(s,';:')+'; cdecl; external '''+extfile+''';'; //if we are a function we have a ":" first else a ";"
end;

////////////////

function convertFCC(s:string):string;
const sd='''';
begin
 ltrim(s,'''');
  rtrim(s,'''');
 result:='(((ord('+sd+s[1]+sd+') shl 8 +ord('+sd+s[2]+sd+'))shl 8 +ord('+sd+s[3]+sd+'))shl 8 +ord('+sd+s[4]+sd+'))';
end;

function convertFOUR_CHAR_CODE(s:string):string;
var fcc:string;
begin
 if Uppercase(getFirstTokenUsingSeparator(s,'('))='FOUR_CHAR_CODE' then //don't upcase s, cause the FCC is case-sensitive
  begin
  fcc:=getFirstTokenUsingSeparator(s,')');
  result:=convertFCC(fcc)+' {'+fcc+'}';
  end;
end;

////////////////////

procedure TForm1.FormCreate(Sender: TObject);
begin
 Application.OnDeactivate:=AppDeactivated;
end;

procedure TForm1.AppDeactivated(Sender: TObject);
begin
 activeControl:=memo1;
end;

////////////////

function TForm1.SourceInput:string;
begin
{ if memo1.SelLength<>0 //if there's a selection...
  then result:=memo1.selText //...use the selected text
  else} result:=memo1.text; //...else use the whole text
end;

procedure TForm1.done;
begin
{ if memo1.selLength<>0 //if there's a selection...
  then memo1.selText:='' //...clear just the selection (input was just the selection)
  else} memo1.text:=''; //...else the whole text (input was the whole text)
 memo2.setFocus;
end;

procedure TForm1.btnVarDeclClick(Sender: TObject); //fix this to not just work line-per-line
var i:integer;
begin
 with memo1.lines do
  for i:=0 to count-1 do
   memo2.lines.append(convertStructFieldList(strings[i]));
 done;
end;

procedure TForm1.btnParamListClick(Sender: TObject);
begin
 memo2.lines.append(convertParamList(sourceInput));
 done;
end;

procedure TForm1.btnFuncClick(Sender: TObject);
begin
 memo2.lines.append(convertFunc(sourceInput)+edModifiers.text);
 done;
end;

procedure TForm1.btnExternalClick(Sender: TObject);
var i:integer;
    s:string;
begin
if InputQuery('Param','External module filename (give the extension too, needed in WinNT',s) then
 with memo1.lines do
  for i:=0 to count-1 do
   memo2.lines.append(convertToExternal(strings[i],s));
 done;
end;

procedure TForm1.btnFuncsClick(Sender: TObject);
var proc:string;
    line:integer;
begin
 line:=0;
 with memo1.lines do
  while line<count do
   begin
   if strings[line]<>'' then proc:=proc+strings[line]
   else
    begin
    if proc<>'' then memo2.lines.append(' '+convertFunc(proc)+edModifiers.text);
    proc:='';
    end;
   inc(line);
   end;
 done;
end;

procedure TForm1.btnFCCmacroClick(Sender: TObject);
begin
 memo2.lines.append(convertFOUR_CHAR_CODE(sourceInput));
 done;
end;

procedure TForm1.btnFCCClick(Sender: TObject);
begin
 memo2.lines.append(convertFCC(sourceInput));
 done;
end;

procedure TForm1.btnFuncsAndExternalClick(Sender: TObject);
begin
 btnFuncs.click;
 clipboard.asText:=memo2.text;
 memo1.text:=memo2.text;
 btnExternal.click;
end;

end.

