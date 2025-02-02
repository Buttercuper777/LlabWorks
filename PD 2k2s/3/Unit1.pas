unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    Button1: TButton;
    Label1: TLabel;
    Image1: TImage;
    Memo1: TMemo;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


type
  Arr = array[0..2] of boolean;
var
  Form1: TForm1;

implementation
var
  mArr:Arr;

{$R *.dfm}

procedure Check(cl:real; ml:real; i:integer);
begin
  if (cl <= 300) and (ml <= 400) then
    mArr[i] := true
  else
    mArr[i] := false;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  p, c, m: real;
  i: integer;
begin
  if combobox1.ItemIndex = -1 then
  begin
    showmessage('�������� ������');
    combobox1.SetFocus();
    exit;
  end;

  memo1.Clear();

  memo1.lines.Add('-----------��� �1:-----------');
  memo1.lines.Add('a_02:');
  memo1.lines.Add('P: ' + stringgrid1.Cells[2,2]);
  memo1.lines.Add('C: ' + stringgrid1.Cells[3,2]);
  memo1.lines.Add('M: ' + stringgrid1.Cells[4,2]);

  //showmessage(stringgrid1.Cells[2,5]);

  memo1.lines.Add('-----------��� �2:-----------');
  p := strtofloat(stringgrid1.Cells[2,2]) * strtofloat(stringgrid1.Cells[2,5]);
  c := strtofloat(stringgrid1.Cells[3,2]) + strtofloat(stringgrid1.Cells[3,5]);
  m := strtofloat(stringgrid1.Cells[4,2]) + strtofloat(stringgrid1.Cells[4,5]);
  memo1.lines.Add('�����1: a_02-a_12:');
  memo1.lines.Add('P: ' + floattostr(p));
  memo1.lines.Add('C: ' + floattostr(c));
  memo1.lines.Add('M: ' + floattostr(m));

  memo1.Lines.Add('');

  p := strtofloat(stringgrid1.Cells[2,2]) * strtofloat(stringgrid1.Cells[2,4]);
  c := strtofloat(stringgrid1.Cells[3,2]) + strtofloat(stringgrid1.Cells[3,4]);
  m := strtofloat(stringgrid1.Cells[4,2]) + strtofloat(stringgrid1.Cells[4,4]);
  memo1.lines.Add('�����2: a_02-a_11:');
  memo1.lines.Add('P: ' + floattostr(p));
  memo1.lines.Add('C: ' + floattostr(c));
  memo1.lines.Add('M: ' + floattostr(m));

  memo1.lines.Add('-----------��� �3:-----------');


  p := strtofloat(stringgrid1.Cells[2,2]) * strtofloat(stringgrid1.Cells[2,5]) * strtofloat(stringgrid1.Cells[2,7]);
  c := strtofloat(stringgrid1.Cells[3,2]) + strtofloat(stringgrid1.Cells[3,5]) + strtofloat(stringgrid1.Cells[3,7]);
  m := strtofloat(stringgrid1.Cells[4,2]) + strtofloat(stringgrid1.Cells[4,5]) + strtofloat(stringgrid1.Cells[4,7]);
  memo1.lines.Add('�����1: a_02-a_12-a_21:');
  memo1.lines.Add('P: ' + floattostr(p));
  memo1.lines.Add('C: ' + floattostr(c));
  memo1.lines.Add('M: ' + floattostr(m));

  Check(c, m, 0);
  memo1.Lines.Add('');

  p := strtofloat(stringgrid1.Cells[2,2]) * strtofloat(stringgrid1.Cells[2,5]) * strtofloat(stringgrid1.Cells[2,8]);
  c := strtofloat(stringgrid1.Cells[3,2]) + strtofloat(stringgrid1.Cells[3,5]) + strtofloat(stringgrid1.Cells[3,8]);
  m := strtofloat(stringgrid1.Cells[4,2]) + strtofloat(stringgrid1.Cells[4,5]) + strtofloat(stringgrid1.Cells[4,8]);
  memo1.lines.Add('�����2: a_02-a_12-a_22:');
  memo1.lines.Add('P: ' + floattostr(p));
  memo1.lines.Add('C: ' + floattostr(c));
  memo1.lines.Add('M: ' + floattostr(m));

  Check(c, m, 1);
  memo1.Lines.Add('');

  p := strtofloat(stringgrid1.Cells[2,2]) * strtofloat(stringgrid1.Cells[2,4]) * strtofloat(stringgrid1.Cells[2,8]);
  c := strtofloat(stringgrid1.Cells[3,2]) + strtofloat(stringgrid1.Cells[3,4]) + strtofloat(stringgrid1.Cells[3,8]);
  m := strtofloat(stringgrid1.Cells[4,2]) + strtofloat(stringgrid1.Cells[4,4]) + strtofloat(stringgrid1.Cells[4,8]);
  memo1.lines.Add('�����3: a-02-a_11-a-22:');
  memo1.lines.Add('P: ' + floattostr(p));
  memo1.lines.Add('C: ' + floattostr(c));
  memo1.lines.Add('M: ' + floattostr(m));

  Check(c, m, 2);
  memo1.lines.Add('-----------�����: -----------');

  for i := 0 to 2 do
    if mArr[i] = True then
      memo1.Lines.Add('������' + inttostr(i+1) + ': ��������!')
    else
      memo1.Lines.Add('������' + inttostr(i+1) + ': �� ��������!')
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if combobox1.ItemIndex = 0 then
  begin
    stringgrid1.Cells[2,1] := '0,83';
    stringgrid1.Cells[2,2] := '0,82';

    stringgrid1.Cells[2,4] := '0,8';
    stringgrid1.Cells[2,5] := '0,85';

    stringgrid1.Cells[2,7] := '0,80';
    stringgrid1.Cells[2,8] := '0,85';


    stringgrid1.Cells[3,1] := '50';
    stringgrid1.Cells[3,2] := '50';

    stringgrid1.Cells[3,4] := '100';
    stringgrid1.Cells[3,5] := '180';

    stringgrid1.Cells[3,7] := '100';
    stringgrid1.Cells[3,8] := '120';


    stringgrid1.Cells[4,1] := '50';
    stringgrid1.Cells[4,2] := '100';

    stringgrid1.Cells[4,4] := '100';
    stringgrid1.Cells[4,5] := '100';

    stringgrid1.Cells[4,7] := '70';
    stringgrid1.Cells[4,8] := '80';
  end;

  if combobox1.ItemIndex = 1 then
  begin
    stringgrid1.Cells[2,1] := '0,82';
    stringgrid1.Cells[2,2] := '0,81';

    stringgrid1.Cells[2,4] := '0,79';
    stringgrid1.Cells[2,5] := '0,84';

    stringgrid1.Cells[2,7] := '0,79';
    stringgrid1.Cells[2,8] := '0,84';


    stringgrid1.Cells[3,1] := '40';
    stringgrid1.Cells[3,2] := '48';

    stringgrid1.Cells[3,4] := '900';
    stringgrid1.Cells[3,5] := '170';

    stringgrid1.Cells[3,7] := '95';
    stringgrid1.Cells[3,8] := '1100';


    stringgrid1.Cells[4,1] := '45';
    stringgrid1.Cells[4,2] := '90';

    stringgrid1.Cells[4,4] := '95';
    stringgrid1.Cells[4,5] := '96';

    stringgrid1.Cells[4,7] := '65';
    stringgrid1.Cells[4,8] := '75';
  end;

  if combobox1.ItemIndex = 2 then
  begin
    stringgrid1.Cells[2,1] := '0,83';
    stringgrid1.Cells[2,2] := '0,82';

    stringgrid1.Cells[2,4] := '0,8';
    stringgrid1.Cells[2,5] := '0,85';

    stringgrid1.Cells[2,7] := '0,8';
    stringgrid1.Cells[2,8] := '0,85';


    stringgrid1.Cells[3,1] := '55';
    stringgrid1.Cells[3,2] := '58';

    stringgrid1.Cells[3,4] := '95';
    stringgrid1.Cells[3,5] := '150';

    stringgrid1.Cells[3,7] := '110';
    stringgrid1.Cells[3,8] := '115';


    stringgrid1.Cells[4,1] := '55';
    stringgrid1.Cells[4,2] := '105';

    stringgrid1.Cells[4,4] := '105';
    stringgrid1.Cells[4,5] := '102';

    stringgrid1.Cells[4,7] := '75';
    stringgrid1.Cells[4,8] := '85';
  end;

  if combobox1.ItemIndex = 3 then
  begin
    stringgrid1.Cells[2,1] := '0,82';
    stringgrid1.Cells[2,2] := '0,81';

    stringgrid1.Cells[2,4] := '0,79';
    stringgrid1.Cells[2,5] := '0,84';

    stringgrid1.Cells[2,7] := '0,79';
    stringgrid1.Cells[2,8] := '0,84';


    stringgrid1.Cells[3,1] := '60';
    stringgrid1.Cells[3,2] := '65';

    stringgrid1.Cells[3,4] := '105';
    stringgrid1.Cells[3,5] := '140';

    stringgrid1.Cells[3,7] := '105';
    stringgrid1.Cells[3,8] := '110';


    stringgrid1.Cells[4,1] := '54';
    stringgrid1.Cells[4,2] := '100';

    stringgrid1.Cells[4,4] := '102';
    stringgrid1.Cells[4,5] := '104';

    stringgrid1.Cells[4,7] := '80';
    stringgrid1.Cells[4,8] := '80';
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  combobox1.ItemIndex := -1;

  stringgrid1.Cells[0,1] := '�0_��';
  stringgrid1.Cells[0,4] := '�1_��';
  stringgrid1.Cells[0,7] := '�2_��';

  stringgrid1.Cells[1,1] := '�01';
  stringgrid1.Cells[1,2] := '�02';

  stringgrid1.Cells[1,4] := '�_11';
  stringgrid1.Cells[1,5] := '�_12';

  stringgrid1.Cells[1,7] := '�_21';
  stringgrid1.Cells[1,8] := '�_22';

  stringgrid1.Cells[2,0] := 'P';
  stringgrid1.Cells[3,0] := 'C';
  stringgrid1.Cells[4,0] := 'M';
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
label2.caption:='['+IntTostr(ACol)+','+IntTostr(ARow)+']='
             +StringGrid1.Cells[ACol,ARow];
end;

end.
