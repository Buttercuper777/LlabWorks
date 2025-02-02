library Project1;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes;

{$R *.res}
type

// ----- Types for Array ------
type_of_array_element = integer;

parr = ^HeadArray;
pelement = ^type_of_array_element;
HeadArray = array[1..100001] of pelement;
// -----------------------------


var

// -------- Array -----------
p:parr;
n:integer;
el:type_of_array_element;
// --------------------------



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

exports FreeArray;

{��������� ������ ����������� �� ��������� ��������}
procedure FillArray(var p:parr; ArraySize : integer; CaseType: char);
var i : integer;
begin
  for i:=1 to ArraySize do begin
     New(p^[i]);
     if CaseType = 'b' then
      p^[i]^ := ArraySize - i + 1 {����� �� ���� �� 9.999999 ArraySize - i + 1 random(100)}                          // <----------
     else if CaseType = 'g' then
      p^[i]^ := i
     else
      p^[i]^ := Random(70);
  end;
end;

exports FillArray;

function Selection(MainArr:parr; ArraySize:integer; AssType: char):integer;
var

  max, id, i, j, z: integer;
  StepsVal, BOVal: integer;
begin
  BOVal := 1;
  StepsVal := 1;

  j := ArraySize;

  while j > 1 do begin
  inc(BOVal);
  inc(StepsVal);
      id := 1;
      for i := 2 to j do
      begin
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

  end;

   if AssType = 'o' then
      result := BOVal
   else
      result := StepsVal;
end;

exports Selection;

{----------------------------------------------------------------------------}

function Insertion(MainArr:parr; ArraySize:integer; AssType: char):integer;
var
  i, j, k, key, tempValue, z: integer;
  StepsVal, BOVal: integer;
  ifCheck: boolean;
begin
  StepsVal := 1;
  BOVal := 1;
  writeln('Insertion');
  ifCheck := False;

  for i := 2 to ArraySize do
    begin
      StepsVal := StepsVal + 1;
      key := MainArr^[i]^;
      j := i;
      BOVal := BOVal + 1;
        while (j > 1) and (MainArr^[j - 1]^ > key) do
        begin
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

exports Insertion;

function SortCaller(ArrayPointer: parr; ArrSize:integer; AlgType: boolean; AssType: char {CaseType: char}):integer;  {
                                                                                  ������; ������ �������; ��� ���(1 - S, 0 - I);
                                                                                  ��� ������[�����(t), �������(s), ���������(o)];
                                                                                  }
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

      msTimeS := (format('%d',[ms]));
      secTimeS := (format('%d',[sec]));

      if AlgType = True then
        Selection(ArrayPointer, ArrSize, AssType)
      else
        Insertion(ArrayPointer, ArrSize, AssType);

      DecodeTime(Time,hr, min, sec, ms);


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

      result := secDelta * 1000 + msDelta;
    end
    else if AssType = 'o' then
      if AlgType = True then
        result := Selection(ArrayPointer, ArrSize, AssType)
      else
        result := Insertion(ArrayPointer, ArrSize, AssType)
end;

exports SortCaller;

begin
end.
