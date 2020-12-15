unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Math;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Button4: TButton;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type
  pElem = ^Elem;
  Elem = record
    key: integer;
    next: pElem;
  end;

var
  Form1: TForm1;
  mas: array [0..1000] of pElem;
  mas2: array [0..1000] of integer;
  m, index: integer;

implementation

{$R *.dfm}

function h(k:integer):integer;
var x: integer;
    a: real;
begin
  a := (sqrt(5)-1)/2;
  x:=Floor(m*Abs(Floor(k*A)-k*A));
  h := x;
end;

procedure AddElem(key:integer);
var position:integer;
    p,table: pElem;
begin
    position := h(key) + 1;
    GetMem(p,sizeof(Elem));
    p^.key := key;
    p^.next := nil;
    table := mas[position];
    if table=nil then mas[position]:=p
    else
    begin
       while (table^.next<>nil) do
       begin
         table := table^.next;
       end;
       table^.next := p;
    end;
    if(Form1.StringGrid1.Cells[2,position]<>'') then
        Form1.StringGrid1.Cells[2,position] := Form1.StringGrid1.Cells[2,position]+','+inttostr(key)
    else Form1.StringGrid1.Cells[2,position] := Form1.StringGrid1.Cells[2,position]+inttostr(key);
    if Form1.StringGrid1.Cells[3,position] = '' then
       Form1.StringGrid1.Cells[3,position] := '1'
    else Form1.StringGrid1.Cells[3,position] := inttostr(strtoint(Form1.StringGrid1.Cells[3,position])+1);
end;

procedure DeleteElem(key:integer);
var position, i, j: integer;
    p,table: pElem;
    s, s2: string;
begin
   j := 0;
   position:=h(key) + 1;
   table := mas[position];
   while table <> nil do
   begin
     if table^.key = key then
     begin
       table^.key := -1;
       s:=Form1.StringGrid1.Cells[2,position];
       s2 := IntToStr(key);
       i := Length(s2) + 1;
       if Form1.StringGrid1.Cells[2,(Pos(IntToStr(key),Form1.StringGrid1.Cells[2,position])-1)] = ',' then
       delete(s,Pos(IntToStr(key),Form1.StringGrid1.Cells[2,position])-1,i)
       else delete(s,Pos(IntToStr(key),Form1.StringGrid1.Cells[2,position]),i);
       Form1.StringGrid1.Cells[2,position]:=s;
       Form1.StringGrid1.Cells[3,position] := IntToStr(StrToInt(Form1.StringGrid1.Cells[3,position])-1);
       repeat
       begin
         if mas2[j] = key then mas2[j] := -1;
         inc(j);
       end
       until mas2[j] <> key;
       break;
     end
     else
     table:=table^.next;
   end;
end;

procedure FindElem(key:integer);
var position: integer;
    table, p: pElem;
    find: boolean;
begin
    find:=false;
    position:=h(key) + 1;
    table := mas[position];
    while (find = false) and (table <> nil) do
    begin
      if table^.key = key then find:=true;
      table:=table^.next;
    end;
    if not find then  Form1.Label2.Caption:='������ �� �������'
    else Form1.Label2.Caption:= '������� � ������ '+ inttostr(position);
end;

procedure TForm1.Button1Click(Sender: TObject);
var ch, i: integer;
    flag: boolean;
begin
   flag := false;
   ch:=strtoint(Edit1.Text);
   for i := 0 to index do
   if mas2[i] = ch then flag := true;
   if flag = false then
   begin
     mas2[index] := ch;
     inc(index);
     AddElem(ch);
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   FindElem(strtoint(Edit2.Text));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  DeleteElem(strtoint(Edit3.Text));
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
   index := 0;
   m := 20;
   for i := 0 to m do
     begin
       StringGrid1.Cells[0,i]:=inttostr(i);
       StringGrid1.Cells[1,i+1]:=inttostr(i);
       StringGrid1.Cells[2,i]:='';
       StringGrid1.Cells[3,i]:='';
     end;
   StringGrid1.Cells[0,0]:='� ������';
   StringGrid1.Cells[1,0]:='�������� ���-�������';
   StringGrid1.Cells[2,0]:='�������� �����';
   StringGrid1.Cells[3,0]:='���������� ��������';
end;


end.
