unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ComCtrls;

const
   tab_s = 8;
type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Button1: TButton;
    procedure BFS( v:integer);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  n, v : integer;

  visit: array [1..100] of boolean;
  C: array[1..100] of array[1..100] of integer;
  out_mas: array[1..tab_s] of integer;

implementation

{$R *.dfm}

procedure TForm1.BFS( v:integer);
  var Q: array [1..100] of integer;
  Un,Uk: integer;
  j, add_out: integer;

  newnode : TTreeNode;
begin
Un:=0; Uk:=0;
Uk:=Uk+1; Q[Uk]:=v;
add_out := 1;

Visit[v]:=false;
  while Un < Uk do
  begin
  Un:=Un+1; v:=Q[Un];

  out_mas[add_out] := v;
  inc(add_out);

  for j:=0 to n do
    if (C[v,j]=1) and (Visit[j]) then
    begin
      Uk:=Uk+1; Q[Uk]:=j;
      Visit[j]:=false;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j:integer;
begin

 for i:=1 to 100 do
  visit[i] := true;

 for i := 1 to n do
  for j := 1 to n do
    C[i, j] := strtoint(stringgrid1.Cells[i, j]);

 v := 1;
 BFS(v);

 for i := 1 to tab_s do
   Memo1.Lines.Add(inttostr(out_mas[i]));

end;

procedure TForm1.FormShow(Sender: TObject);
var
  tab_i, tab_j:integer;
begin

  n := tab_s;

  for tab_i := 0 to tab_s + 1 do
  begin
    stringgrid1.Cells[0, tab_i] := inttostr(tab_i);
    stringgrid1.Cells[tab_i, 0] := inttostr(tab_i);
  end;

  for tab_i := 1 to tab_s do
    for tab_j := 1 to tab_s do
      stringgrid1.Cells[tab_i, tab_j] := '0';

  stringgrid1.Cells[1, 2] := '1';
  stringgrid1.Cells[1, 8] := '1';

  stringgrid1.Cells[2, 1] := '1';
  stringgrid1.Cells[2, 3] := '1';

  stringgrid1.Cells[3, 2] := '1';
  stringgrid1.Cells[3, 4] := '1';
  stringgrid1.Cells[3, 6] := '1';
  stringgrid1.Cells[3, 8] := '1';

  stringgrid1.Cells[4, 3] := '1';
  stringgrid1.Cells[4, 5] := '1';

  stringgrid1.Cells[5, 4] := '1';
  stringgrid1.Cells[5, 6] := '1';

  stringgrid1.Cells[6, 5] := '1';
  stringgrid1.Cells[6, 3] := '1';
  stringgrid1.Cells[6, 8] := '1';
  stringgrid1.Cells[6, 7] := '1';

  stringgrid1.Cells[7, 8] := '1';
  stringgrid1.Cells[7, 6] := '1';

  stringgrid1.Cells[8, 6] := '1';
  stringgrid1.Cells[8, 3] := '1';
  stringgrid1.Cells[8, 1] := '1';
  stringgrid1.Cells[8, 7] := '1';
end;

end.
