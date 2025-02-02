﻿unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Label3: TLabel;
    SaveDialog1: TSaveDialog;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Rasstanovka = array[1..8] of integer;

var
  Form1: TForm1;
  N, outC: integer;
  X, outArr: Rasstanovka;
  output: string;
implementation

{$R *.dfm}

function P(var X:Rasstanovka; k,y:integer):boolean;
var
  i:integer;
begin
 i:=1;
 while (i<k)and(y<>X[i])and(abs(k-i)<>abs(y-X[i])) do inc(i);
 P:=i=k;
end;

procedure Backtracking(k:integer);
 var i,y:integer;
begin
 for y:=1 to N do
 begin
   if P(X,k,y) then
    begin
    //Form1.Memo1.Lines.Add('1');
     X[k]:=y;
     if k=N then
       begin
       //Form1.Memo1.Lines.Add('2');
         for i:=1 to N do begin
           output := output + ' ' + inttostr(X[i]);
           //Form1.Memo1.Lines.Add(inttostr(X[i]));
           if outC = 1 then
            outArr[i] := X[i];
         end;
         Form1.Memo1.Lines.Add(inttostr(outC) + ': ' + output);
         output := '';
         outC := outC + 1;
       end;
     Backtracking(k+1);
    end;
 end;
  Form1.label2.Caption := inttostr(outC - 1);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, j: integer;
begin
  Backtracking(1);
  button2.Enabled := True;
  //stringgrid1.Cells[0, 1] := '*';
  for i := 1 to 8 do
    stringgrid1.Cells[i - 1, outArr[i] - 1] := '●';

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  F: TextFile;
  i: integer;
begin
  if SaveDialog1.Execute then
  begin
    AssignFile(F, SaveDialog1.FileName);
    Rewrite(F);
    for i:=0 to Memo1.Lines.Count-1 do
      writeln(f,Memo1.Lines[i]);
    closefile(f);

  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  N := 8;
  outC := 1;
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
  var
    i, j: integer;
begin
  StringGrid1.Canvas.Brush.Color:=clBlack;
  if (ACol+ARow) mod 2 = 0 then
  begin
    StringGrid1.Canvas.FillRect(Rect);
    StringGrid1.Canvas.TextOut(Rect.Left, Rect.Top, StringGrid1.Cells[ACol, ARow]);
  end;
end;

end.
