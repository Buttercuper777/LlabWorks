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
procedure hashing(hArr: TArr; tabSz: integer; vArr: TArr; vtSz: integer);
var
  i, j, t, hv:integer;
begin
    for i := 0 to TSize - 1 do
      mainArr[i] := -1;
      
    for i := 0 to vtSz - 1 do
    begin
      hv := (vArr[i] mod tabSz);
      if hArr[hv] = -1 then
        hArr[hv] := vArr[i]
      else
        for j := 0 to tabSz - 1 do
        begin
          t := (hv + j * j) mod tabSz;
          if hArr[t] = -1 then
          begin
            hArr[t] := vArr[i];
            break;
          end;
        end;
    end;
end;

procedure printTab(TSize: integer);
var 
  col: integer;
begin
   Form1.stringGrid1.Rows[1].Clear;
   Form1.stringGrid1.Cells[0,0] := 'Index';
   Form1.stringGrid1.Cells[0,1] := 'Value';

   Form1.stringGrid1.ColCount := TSize + 1;
   
    for col := 0 to TSize - 1 do
    begin
      Form1.stringGrid1.Cells[col + 1,0] := inttostr(col);
      if mainArr[col] = -1 then
        continue
      else
        Form1.stringGrid1.Cells[col + 1,1] := inttostr(mainArr[col]);
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, j, t:integer;
begin
  Randomize;

  
  Button2.Enabled := True;

  TSize := strtoint(Edit1.Text);
  setlength(mainArr, TSize);

  N := strtoint(edit3.Text);
  setlength(valArr, N);

  for j := 0 to N - 1 do
    valArr[j] := 1 + Random(100);

  hashing(mainArr, TSize, valArr, N);
  printTab(TSize);

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  forAdd, i , j: integer;
  sArr: TArr;
begin
  Form1.stringGrid1.Rows[1].Clear;
  setlength(sArr, N);
  
  for i := 0 to N - 1 do
  begin
    sArr[i] := valArr[i];
  end;

  N := N + 1;
  setlength(valArr, N);
  
  for i := 0 to N - 1 do
  begin
    valArr[i] := sArr[i];
  end;
    
  forAdd := strtoint(edit2.Text);
  valArr[N - 1] := forAdd;
  
  hashing(mainArr, TSize, valArr, N);
  printTab(TSize);
end;

end.
