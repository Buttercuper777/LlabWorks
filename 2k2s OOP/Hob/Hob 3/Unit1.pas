unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button3: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i, j:integer;
begin

  if edit1.text = '' then
    begin
      ShowMessage('������� ���������� ��������.');
      edit1.SetFocus();
      exit;
    end;

  if edit2.text = '' then
    begin
      ShowMessage('������� ���������� �����.');
      edit2.SetFocus();
      exit;
    end;

  stringGrid1.ColCount := strtoint(edit1.text);
  stringGrid1.RowCount := strtoint(edit2.text);

  Randomize;
  for i := 0 to stringgrid1.ColCount - 1 do
    for j := 0 to stringgrid1.RowCount - 1 do
      stringgrid1.Cells[i,j] := inttostr(100-Random(200));

  button2.Enabled := True;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i,j:integer;
begin

  stringGrid2.ColCount := strtoint(edit1.text);
  stringGrid2.RowCount := strtoint(edit2.text);

  if CheckBox1.Checked = false then
  begin
    for i := 0 to stringgrid1.ColCount - 1 do
      for j := 0 to stringgrid1.RowCount - 1 do
        if StrToInt(stringgrid1.Cells[i, j]) < 0 then
          stringgrid2.Cells[i,j] := '0'
        else
          stringgrid2.Cells[i,j] := stringgrid1.Cells[i,j];
  end

  else begin
    for i := 0 to stringgrid1.ColCount - 1 do
        for j := 0 to stringgrid1.RowCount - 1 do
          if (i = j) or (i > j) then
          begin
            stringgrid2.Cells[i,j] := stringgrid1.Cells[i,j];
          end
          else
            stringgrid2.Cells[i,j] := '0';
  end;

  edit3.Enabled := true;
  button3.Enabled := true;
      
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  numCol, sum, i: integer;
begin

  try
    numCol := strtoint(edit3.Text) - 1;
  except
    Showmessage('������� ��������');
    edit3.SetFocus();
    exit;
  end;

  sum := 0;

  if (numCol > StringGrid2.ColCount - 1) or (numCol < 0) then
    begin
      showmessage('�������� ����� �������');
      exit;
    end;

  if CheckBox1.Checked = false then
    begin
    try
      for i := 0 to stringgrid2.RowCount - 1 do
        sum := sum + strtoint(stringgrid2.Cells[numCol, i]);
    except
      showmessage('������ � �������.');
      label4.Caption := '�����: ������.';
      exit;
    end;
    label4.Caption := '�����: ' + inttostr(sum);
  end

  else begin
    try
      for i := 0 to stringgrid2.RowCount - 1 do
        if (strtoint(stringgrid2.Cells[numCol, i]) mod 2) <> 0 then
          sum := sum + strtoint(stringgrid2.Cells[numCol, i]);
    except
      showmessage('������ � �������.');
      label4.Caption := '�����: ������.';
      exit;
    end;
    label4.Caption := '�����: ' + inttostr(sum);
  end;

end;

procedure TForm1.CheckBox1Click(Sender: TObject);
var
  i, j: integer;
begin
  for i := 0 to stringgrid2.ColCount - 1 do
    for j := 0 to stringgrid2.RowCount - 1 do
      stringgrid2.Cells[i, j] := '';
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
case Key of
  #8, '0'..'9':
 else
  Key := Chr(0);
 end;
end;

end.
