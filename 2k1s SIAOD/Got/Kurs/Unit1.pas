﻿unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Registry, Vcl.StdCtrls, ActiveX, ComObj, AboutSys, InsertionForm,
  SelectionForm, Vcl.Grids, Vcl.ExtCtrls;

type
// ----- Types for Array ------
type_of_array_element = integer;

parr = ^HeadArray;
pelement = ^type_of_array_element;
HeadArray = array[1..100001] of integer;

// -----------------------------

var

// -------- Array -----------

main_p:HeadArray;
main_n:integer;
main_el:type_of_array_element;
// --------------------------

ST:Boolean;
SS:char;
GrArr:array[1..2,1..30] of integer;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    StringGrid1: TStringGrid;
    Label4: TLabel;
    Label5: TLabel;
    StringGrid2: TStringGrid;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure Label1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Tester(SortType: boolean);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure FillArray(var p:parr; ArraySize : integer; CaseType: char);
  //external '../../DLL/SortLib.dll';
  external '../../DllLib/Win32/Debug/SortLib.dll';
procedure FreeArray(var p:parr; var ArraySize : integer);
  external '../../DllLib/Win32/Debug/SortLib.dll';
function Selection(MainArr:parr; ArraySize:integer; AssType: char):integer;
  external '../../DllLib/Win32/Debug/SortLib.dll';
function Insertion(MainArr:parr; ArraySize:integer; AssType: char):integer;
  external '../../DllLib/Win32/Debug/SortLib.dll';
function SortCaller(ArrayPointer: parr; ArrSize:integer; AlgType: boolean; AssType: char):integer;
  external '../../DllLib/Win32/Debug/SortLib.dll';

procedure TForm1.Tester(SortType: boolean);          //Тип алг(1 - S, 0 - I)
var
  i, ArrSize_l, testVal: integer;
  bestS, worstS, medS: integer;
  bestT, worstT, medT: integer; 
  SArr: array[1..100] of integer;
  TArr: array[1..100] of integer;
begin
  medS := 0;
  medT := 0;

  ArrSize_l := strtoint(Edit2.Text);
  testVal := strtoint(Edit1.Text);
  //GetMem(main_p, ArrSize_l*sizeof(type_of_array_element));

  FillArray(main_p, ArrSize_l, 'g');
  bestS := SortCaller(main_p, ArrSize_l, SortType, 's');
  bestT := SortCaller(main_p, ArrSize_l, SortType, 't');
  //FreeArray(main_p, ArrSize_l);

  FillArray(main_p, ArrSize_l, 'b');
  worstS := SortCaller(main_p, ArrSize_l, SortType, 's');
  worstT := SortCaller(main_p, ArrSize_l, SortType, 't');
  //FreeArray(main_p, ArrSize_l);
  
  FillArray(main_p, ArrSize_l, 'r');  // нет смысла помещать в цикл. ГПСЧ не очень.
  for i := 1 to testVal do
  begin
    SArr[i] := SortCaller(main_p, ArrSize_l, SortType, 's');
    medS := medS + SArr[i];
  end;

  for i := 1 to testVal do
  begin
    TArr[i] := SortCaller(main_p, ArrSize_l, SortType, 't');
    medT := medT + TArr[i];
  end;

  medS := trunc(medS / (testVal * 2)); // -2
  medT := trunc(medT / (testVal * 2)); // -2
  
  FreeArray(main_p, ArrSize_l);

  if SortType = True then
  begin
    StringGrid2.Cells[2,1] := inttostr(bestT);
    StringGrid2.Cells[3,1] := inttostr(bestS);
  
    StringGrid2.Cells[2,2] := inttostr(worstT);
    StringGrid2.Cells[3,2] := inttostr(worstS);

    StringGrid2.Cells[2,3] := inttostr(medT);
    StringGrid2.Cells[3,3] := inttostr(medS);

    StringGrid2.Cells[1,1] := 'O(n²)';
    StringGrid2.Cells[1,2] := 'O(n²)';
    StringGrid2.Cells[1,3] := 'O(n²)';
  end
  else begin
    StringGrid1.Cells[2,1] := inttostr(bestT);  
    StringGrid1.Cells[3,1] := inttostr(bestS);
  
    StringGrid1.Cells[2,2] := inttostr(worstT); 
    StringGrid1.Cells[3,2] := inttostr(worstS);  

    StringGrid1.Cells[2,3] := inttostr(medT);    
    StringGrid1.Cells[3,3] := inttostr(medS);

    StringGrid1.Cells[1,1] := 'O(n)';
    StringGrid1.Cells[1,2] := 'O(n²)';
    StringGrid1.Cells[1,3] := 'O(n²)';
  end;
end;

procedure TForm1.Button1Click(Sender: TObject); 
var
  ArrSize_l: integer;
begin
  Tester(False);
  Tester(True);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i,j, SCounter:integer;
begin
  SCounter := 0;
  if (RadioGroup1.ItemIndex or RadioGroup2.ItemIndex) = -1 then
    ShowMessage('Ошибка выбора');

  if RadioGroup1.ItemIndex = 0 then
    ST := False
  else if RadioGroup1.ItemIndex = 1 then
    ST := True;

  if RadioGroup2.ItemIndex = 0 then
    SS := 'g'
  else if RadioGroup2.ItemIndex = 1 then
    SS := 'b'
  else if RadioGroup2.ItemIndex = 2 then
    SS := 'r';

  GetMem(main_p, 150*sizeof(type_of_array_element));
  //FillArray(main_p, 100, SS);
  for i := 1 to 30 do
  begin
    FillArray(main_p, 150, SS);
    SCounter := SCounter + 5;
    GrArr[1,i] := SCounter;
    GrArr[2,i] := SortCaller(main_p, SCounter, ST, 'o');
  end;

  Form3.Show();
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form3.Show();
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  StringGrid1.Cells[1,0] := 'Big O';
  StringGrid2.Cells[1,0] := 'Big O';

  StringGrid1.Cells[2,0] := 't';
  StringGrid2.Cells[2,0] := 't';

  StringGrid1.Cells[3,0] := 'S (Шаги)';
  StringGrid2.Cells[3,0] := 'S (Шаги)';

  StringGrid1.Cells[0,1] := '1..n';
  StringGrid2.Cells[0,1] := '1..n';

  StringGrid1.Cells[0,2] := 'n..1';
  StringGrid2.Cells[0,2] := 'n..1';

  StringGrid1.Cells[0,3] := 'Random';
  StringGrid2.Cells[0,3] := 'Random';
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  Form2.Show();
end;

end.
