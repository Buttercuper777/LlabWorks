unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    Edit3: TEdit;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure printTab(TSize: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TArr = array of integer;

var
  Form1: TForm1;
  mainArr: TArr;
  valArr : TArr;
  N, TSize: integer;

implementation

{$R *.dfm}
procedure hashing(hArr: TArr; tabSz, hValue: integer);
var
  i, j, t, hv:integer;
begin
      hv := (hValue mod tabSz);
      if hArr[hv] = -1 then
        hArr[hv] := hValue
      else
        for j := 1 to tabSz do
        begin
          t := (hv + 3 * j + 4 * j * j) mod tabSz;
          if hArr[t] = -1 then
          begin
            hArr[t] := hValue;
            break;
          end;
        end;
end;

procedure TForm1.printTab(TSize: integer);
var 
  col: integer;
begin
   stringGrid1.Rows[1].Clear;
   stringGrid1.Cells[0,0] := 'Index';
   stringGrid1.Cells[0,1] := 'Value';

   stringGrid1.ColCount := TSize + 1;
   
    for col := 1 to TSize do
    begin
      stringGrid1.Cells[col,0] := inttostr(col);
      if mainArr[col] = -1 then
        continue
      else
        stringGrid1.Cells[col,1] := inttostr(mainArr[col]);
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, j, newVal:integer;
begin
  Randomize;

  Button2.Enabled := True;

  TSize := strtoint(Edit1.Text);
  setlength(mainArr, TSize);

  for i := 1 to TSize do
      mainArr[i] := -1;

  N := strtoint(edit3.Text);
  setlength(valArr, N);

  for j := 1 to N do
  begin
    newVal := 1 + Random(100);
    hashing(mainArr, TSize, newVal);
  end;

  printTab(TSize);

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  forAdd: integer;
begin
  forAdd := strtoint(edit2.Text);

  hashing(mainArr, TSize, forAdd);
  printTab(TSize);
end;

end.
