unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Registry, Vcl.StdCtrls, ActiveX, ComObj, AboutSys,
  Vcl.Grids;

type
// ----- Types for Array ------
type_of_array_element = integer;

parr = ^HeadArray;
pelement = ^type_of_array_element;
HeadArray = array[1..100001] of pelement;
// -----------------------------

var

// -------- Array -----------
main_p:parr;
main_n:integer;
main_el:type_of_array_element;
// --------------------------



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
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Label1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  external '../../DLL/SortLib.dll';
procedure FreeArray(var p:parr; var ArraySize : integer);
  external '../../DLL/SortLib.dll';
function Selection(MainArr:parr; ArraySize:integer; AssType: char):integer;
  external '../../DLL/SortLib.dll';
function Insertion(MainArr:parr; ArraySize:integer; AssType: char):integer;
  external '../../DLL/SortLib.dll';
function SortCaller(ArrayPointer: parr; ArrSize:integer; AlgType: boolean; AssType: char):integer;
  external '../../DLL/SortLib.dll';

procedure TForm1.Button1Click(Sender: TObject); //��� ���(1 - S, 0 - I)
var
  ArrSize_l: integer;
begin
  ArrSize_l := strtoint(Edit2.Text);
  GetMem(main_p, ArrSize_l*sizeof(type_of_array_element));
  FillArray(main_p, ArrSize_l, 'g');
  memo1.Lines.Add(inttostr(SortCaller(main_p, ArrSize_l, True, 's')));
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  StringGrid1.Cells[1,0] := 'Big O';
  StringGrid2.Cells[1,0] := 'Big O';

  StringGrid1.Cells[2,0] := 't';
  StringGrid2.Cells[2,0] := 't';

  StringGrid1.Cells[3,0] := 'S (����)';
  StringGrid2.Cells[3,0] := 'S (����)';

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
