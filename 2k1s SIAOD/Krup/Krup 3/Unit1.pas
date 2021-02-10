unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Math, HobLibrary;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  out_pos_add: integer;

implementation

{$R *.dfm}

{function h(k:integer):integer;
var x: integer;
    a: real;
begin
  a := (sqrt(5)-1)/2;
  x:=Floor(m*Abs(Floor(k*A)-k*A));
  h := x;
end; }

procedure AddElemForm(pos_l, key_l: integer);
begin
    if(Form1.StringGrid1.Cells[2,pos_l] <> '') then
      Form1.StringGrid1.Cells[2,pos_l] := Form1.StringGrid1.Cells[2,pos_l]+','+inttostr(key_l)
    else Form1.StringGrid1.Cells[2,pos_l] := Form1.StringGrid1.Cells[2,pos_l]+inttostr(key_l);
    if Form1.StringGrid1.Cells[3,pos_l] = '' then
      Form1.StringGrid1.Cells[3,pos_l] := '1'
    else Form1.StringGrid1.Cells[3,pos_l] := inttostr(strtoint(Form1.StringGrid1.Cells[3,pos_l])+1);
end;

procedure DeleteElem(key:integer);
var position, i, j: integer;
    p,table: pElem;
    s, s2: string;
begin
   j := 0;
   position := h(t_val, u_val, G, key, M) + 1;
   table := mas[position];
   while table <> nil do
   begin
     if table^.key = key then
     begin

       s:=Form1.StringGrid1.Cells[2,position];
       s2 := IntToStr(key);
       i := Length(s2) + 1;
       if Form1.StringGrid1.Cells[2,(Pos(IntToStr(key),Form1.StringGrid1.Cells[2,position])-1)] = ',' then
        delete(s,Pos(IntToStr(key),Form1.StringGrid1.Cells[2,position])-1,i)
       else delete(s,Pos(IntToStr(key),Form1.StringGrid1.Cells[2,position]),i);
        Form1.StringGrid1.Cells[2,position]:=s;
       Form1.StringGrid1.Cells[3,position] := IntToStr(StrToInt(Form1.StringGrid1.Cells[3,position])-1);

       table^.key := -1;
       repeat
         begin
           if mas2[j] = key then
            mas2[j] := -1;
           inc(j);
         end
       until mas2[j] <> key;
       break;
     end
     else
     table:=table^.next;
   end;
end;


procedure TForm1.Button1Click(Sender: TObject);                                   //<-------------------------
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
         AddElem(out_pos_add, ch);
       end;
   AddElemForm(out_pos_add, ch);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   showmessage(FindElem(strtoint(Edit1.Text)));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  DeleteElem(strtoint(Edit1.Text));
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
   index := 0;
  t_val := randomrange(1,G);
  u_val := randomrange(1,G);
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
