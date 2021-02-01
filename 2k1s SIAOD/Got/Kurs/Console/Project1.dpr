program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
type

  // ----- Types for Array ------
  type_of_array_element = integer;
  
  parr = ^HeadArray;
  pelement = ^type_of_array_element;
  HeadArray = array[1..100000] of pelement;
 // ----------------------------- 


var

  // -------- Array -----------
  p:parr;                   
  n:integer;
  el:type_of_array_element;
  // --------------------------
  

  res, a, b:string;
  i, d: integer;

{------------------------------- For D-Arr -------------------------------------}

procedure FreeArray(var p:parr; var ArraySize : integer);
var i : integer;
begin
  for i:=1 to ArraySize do begin
    Dispose(p^[i]); {��������� ������, ���������� ��� �������� �������, �� ���������� � ������� }
    p^[i] := nil; {�������������, �� ������ ������������ ������, ������� � ���� ���������}
  end;
  FreeMem(p);
  ArraySize := 0; {������� }
end;

procedure PrinArray(p:parr; ArraySize : integer);
var i : integer;
begin
  WriteLn('���������� ������� (�� ��� ���������� ��������� � ������������ �������):');
  for i:=1 to ArraySize do
    if (p^[i]<>nil) then
      Write(p^[i]^,' ');
  WriteLn;
end;

{��������� ������ ����������� �� ��������� ��������}
procedure FillRandom(var p:parr; ArraySize : integer);
var i : integer;
begin
  for i:=1 to ArraySize do begin
     New(p^[i]);
     p^[i]^ := ArraySize - i + 1; {����� �� ���� �� 9.999999 ArraySize - i + 1 random(100)}                          // <----------
     //p^[i]^ := Round(100*p^[i]^)/100; {�������� �� �����}
  end;
end;

{-------------------------------------------------------------------------------}

function Selection(MainArr:parr; ArraySize:integer; AssType: char):integer;
var
  //MainArr: array of integer;
  max, id, i, j, z: integer;
  StepsVal, BOVal: integer;
begin
  //SetLength(MainArr, n);
  BOVal := 1;
  StepsVal := 1;
  {randomize;
  for i := 1 to n do begin
      MainArr[i] := random(100);
      //write(MainArr[i]:4)
  end;}

  j := ArraySize;

  while j > 1 do begin
  inc(BOVal);
  inc(StepsVal);
      id := 1;
      //writeln(inttostr(MainArr^[1]^));
      for i := 2 to j do
      begin
        //writeln(inttostr(MainArr^[i]^) + ' ' + inttostr(MainArr^[id]^));
        if MainArr^[i]^ > MainArr^[id]^ then
            id := i;
        BOVal := BOVal + 2; {��� +1 �� �������� O((N^2)/2), ��� 2 - ���������,
                                ��� �� ����������� ��� ������. �������}
        inc(StepsVal);
      end;

      max := MainArr^[id]^;
      MainArr^[id]^ := MainArr^[j]^;
      MainArr^[j]^ := max;
      j := j - 1; 


      {//write(inttostr(outval) + ': ');
      for z := 1 to ArraySize do
        write(MainArr^[z]^:4);
      writeln;}
  end;

   if AssType = 'o' then
      result := BOVal
   else
      result := StepsVal;
end;

{----------------------------------------------------------------------------}

function Insertion(MainArr:parr; ArraySize:integer; AssType: char):integer;
var
  //MainArr: array of integer;
  i, j, k, key, tempValue, z: integer;
  StepsVal, BOVal: integer;
  ifCheck: boolean;
begin
  //SetLength(MainArr, n);
  StepsVal := 1;
  BOVal := 1;
  writeln('Insertion');
  ifCheck := False;
  
  for i := 2 to ArraySize do
    begin
      StepsVal := StepsVal + 1;
      //BOVal := BOVal - 1;
      key := MainArr^[i]^;
      j := i;
      BOVal := BOVal + 1;
        while (j > 1) and (MainArr^[j - 1]^ > key) do
        begin
            {����� ���������}
            ifCheck := True;
            StepsVal := StepsVal + 1;
            tempValue :=  MainArr^[j]^;
            MainArr^[j]^ := MainArr^[j - 1]^;
            MainArr^[j - 1]^ := tempValue;
            j := j - 1;
        end;
        
      if ifCheck = true then
      begin  
        BOVal := i;
        BOVal := BOVal * ArraySize;
      end;

        
      MainArr^[j]^ := key;
      write(inttostr(BOVal) + ': ');
      for z := 1 to ArraySize do
        write(inttostr(MainArr^[z]^) + ' - ' + booltostr(ifCheck));
      writeln;
    end;

    if AssType = 'o' then
      result := BOVal
    else 
      result := StepsVal;
end;

function SortCaller(ArrayPointer: parr; ArrSize:integer; AlgType: boolean; AssType: char {CaseType: char}):integer;  {
                                                                                  ������; ������ �������; ��� ���(1 - S, 0 - I); ��� ������[�����(t), �������(s), ���������(o)];
                                                                                  ���� ������ = nil, �� ������ ������ � ��������. ���.��������} 
var
  ms_i_S, ms_i_F, sec_i_S, sec_i_F, secDelta, msDelta: integer;
  msTimeS, msTimeF, secTimeS, secTimeF: string;
  year, month, day, hr, min, sec, ms: Word;

  resVal: integer;
begin
    if AssType = 's' then
      if AlgType = True then
        result := Selection(ArrayPointer, ArrSize, AssType)
      else
        result := Insertion(ArrayPointer, ArrSize, AssType)
    else if AssType = 't' then
    begin
      DecodeTime(Time,hr, min, sec, ms);
      //writeln(format('%d' + 's, ' + '%d' + 'ms',[sec, ms]));
      msTimeS := (format('%d',[ms]));
      secTimeS := (format('%d',[sec]));
      //writeln(delta);

      Selection(ArrayPointer, ArrSize, AssType);
      //write(Insertion(10000,'b'));writeln;

      DecodeTime(Time,hr, min, sec, ms);
      //writeln(format('%d' + 's, ' + '%d' + 'ms',[sec, ms]));

      msTimeF := (format('%d',[ms]));
      secTimeF := (format('%d',[sec]));

      ms_i_S := strtoint(msTimeS);
      ms_i_F := strtoint(msTimeF);

      sec_i_S := strtoint(secTimeS);
      sec_i_F := strtoint(secTimeF);

      if ms_i_F < ms_i_S then
        msDelta := (1000 - ms_i_S) + ms_i_F
      else
        msDelta := ms_i_F - ms_i_S;

      if sec_i_F < sec_i_S then
        secDelta := (60 - sec_i_S) + sec_i_F
      else
        secDelta := sec_i_F - sec_i_S;


      //writeln(inttostr(secDelta) + 's; ' + inttostr(msDelta) + 'ms');
      result := secDelta * 1000 + msDelta;
    end
    else if AssType = 'o' then
      if AlgType = True then
        result := Selection(ArrayPointer, ArrSize, AssType)
      else
        result := Insertion(ArrayPointer, ArrSize, AssType)
end;

{-----------------------------------Main Block----------------------------------}
begin
  {for i := 1 to 10 do
  begin
  
   DecodeTime(Time,hr, min, sec, ms);
   a := (format('%d',[ms]));

   Insertion(10000,'m');
    //write(Insertion(10000,'b'));writeln;

   DecodeTime(Time,hr, min, sec, ms);
   b := (format('%d',[ms]));
   
   if b < a then
    d := (1000 - strtoint(a)) + strtoint(b)
   else
    d := strtoint(b) - strtoint(a);
    
   writeln(d);
  end;  }

  WriteLn('������� ����������� �������: ');
  ReadLn(n);
  
  GetMem(p, n*sizeof(type_of_array_element));
  FillRandom(p, n);
  
  //PrinArray(p, n);
  write(SortCaller(p, n, False, 's'));      //��� ���(1 - S, 0 - I)
  FreeArray(p,n);
  
  readln;
  readln;
end.
