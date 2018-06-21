//28Feb1999 - modified getFirstToken to handle TABs as well
//          - now triming the remaining of s and the function return value in all functions
//          - adding the getFirstTokenUsingSeparators routine
//          - now getFirstToken is implemented a getFirstTokenUsingSeparators call (for SPACE and TAB) 

unit Tokenizer;

interface
 uses SysUtils;

 function GetFirstToken(var s:string):string;
 function checkFirst(const t:string):string;

 function GetFirstTokenUsingSeparator(var s:string;separator:char):string;
 function GetFirstTokenUsingSeparators(var s:string;separators:string):string;

 procedure ParsingError(e:Exception);
 var parseLine,parseToken:integer;

implementation
 uses Dialogs,ac_Strings;

 const TAB=#9;

 procedure ParsingError;
 begin
  ShowMessage('Parsing error at line: '+IntToStr(parseLine)+', token position: '+IntToStr(parseToken)+#13+'Message was: '+e.message);
 end;

 function checkFirst;
 var i:integer;
     s:string;
 begin
  s:=TrimLeft(t);
  i:=FindChars(s,' '+TAB,1); //s must be the 1st param
  if i=0 then result:=trim(s) else result:=trim(copy(s,1,i-1));
 end;

 function GetFirstTokenUsingSeparator;
 var i:integer;
 begin
  s:=TrimLeft(s); //maybe should be TrimLeftUsingSeparator(?) [or remove this, cause may eat up wanted control chars]
  inc(parseToken);
  i:=pos(separator,s);
  if i=0 then begin result:=trim(s); s:=''; end
  else begin result:=trim(copy(s,1,i-1)); s:=trim(copy(s,i+1,length(s)-i)); end;
 end;

 function GetFirstTokenUsingSeparators;
 var i:integer;
 begin
  s:=TrimLeft(s); //maybe should be TrimLeftUsingSeparator(?) [or remove this, cause may eat up wanted control chars]
  inc(parseToken);
  i:=FindChars(s,separators,1);
  if i=0 then begin result:=trim(s); s:=''; end
  else begin result:=trim(copy(s,1,i-1)); s:=trim(copy(s,i+1,length(s)-i)); end;
 end;

 function GetFirstToken;
 begin
  result:=GetFirstTokenUsingSeparators(s,' '+TAB);
 end;

end.
