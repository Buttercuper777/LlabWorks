unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Math, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RadioGroup1: TRadioGroup;
    Edit3: TEdit;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
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
  x, Eps, Func, Sum, Fact, ElemSeq, a: real;
  Kol: Integer;
begin

  memo1.Clear();

  if (edit1.text = '') or (edit2.text = '') then
  begin
    ShowMessage('������ �����! ��������� ���������� ����� �����!');
    exit
  end;

  if (strtofloat(edit2.Text) <= 0) or (strtofloat(edit2.Text) >= 1) then
  begin
    ShowMessage('���������� �������� ��� ��������: (0;1)');
    exit;
  end;

  if (edit3.Enabled = true) and (edit3.text <> '') then
    a := strtofloat(Edit3.Text)
  else if (edit3.Enabled = true) and (edit3.text = '') then
    showmessage('������� �������� A');

  x := strtofloat(Edit1.Text);
  Eps := strtofloat(Edit2.Text);

  if radiogroup1.ItemIndex = 0 then
    Func := Exp(x)
  else
    Func := power(a,x);

  label4.Caption := FloatToStr(Func);

  Memo1.Lines.Clear;
  Sum := 0;
  Fact := 1;
  Kol := 0;
  ElemSeq := Eps + 1;

  while ElemSeq > Eps do
  begin

    if radiogroup1.ItemIndex = 0 then
      ElemSeq := power(x, kol)/Fact
    else
      ElemSeq := Power(a * Ln(x), kol);

    Memo1.Lines.Add(FloatToStr(ElemSeq));
    Sum := Sum + ElemSeq;
    Inc(Kol);
    Fact := Fact * Kol;
  end;

  Label4.Caption := '�������� �������:' + floattostr(Func);
  Label4.Visible := True;

  Label5.Caption := '����� ����:' + floattostr(Sum);
  Label5.Visible := True;

  Label6.Caption := '�����������: ' + floattostr(Func - Sum);
  Label6.Visible := True;

  Label7.Caption := '���-�� ��������: ' + floattostr(kol);
  Label7.Visible := True;
end;


procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
case Key of
  #8, '0'..'9':;
  ',':
    begin
      if Pos(formatSETTINGS.DateSeparator, Edit1.Text) <> 0 then
        Key := Chr(0);
    end
 else
  Key := Chr(0);
 end;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then
    edit3.Enabled := true
  else
    edit3.Enabled := false;
end;

end.
