unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ColorDialog1: TColorDialog;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
var
  ColorRomb : TColor;

procedure TForm2.Button1Click(Sender: TObject);
var
  rl: TRect;
  x1, y1, i: integer;
  lx, ly: integer;
  xs, ys: integer;

  u,r : real;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') then
  begin
    ShowMessage('�� ��� ������ �������!');
    exit;
  end;

  Image1.Picture := nil;

  x1 := StrToInt(edit1.Text);
  y1 := StrToInt(edit2.Text);
  lx := StrToInt(edit3.Text);

  if (lx < 10) then
  begin
    showmessage('������ ������ ���� >= 10');
    exit
  end;

  if(x1 + lx > Image1.Width) or (x1 < lx)then
  begin
    ShowMessage('��������� ���� ���������');
    exit;
  end;

  if(y1 + lx > Image1.height) or (y1 < lx)then
  begin
    ShowMessage('��������� ���� ���������');
    exit;
  end;

  IMage1.Canvas.Pen.Color := clGreen;

  u := pi/2;
  r := lx/2/sin(pi/3);
  IMage1.Canvas.MoveTo(x1 + round(r * cos(u)), y1 - round(r * sin(u)));

  Image1.Canvas.Brush.Color:= clRed;
  Image1.Canvas.Ellipse(x1 - trunc(r), y1 - trunc(r), x1 + trunc(r), y1 + trunc(r));

  for i := 1 to 4 do
  begin
    IMage1.Canvas.LineTo(x1 + round(r * cos(u)), y1 - round(r * sin(u)));
    u:= u+2*pi/3;
  end;

  Image1.Canvas.Brush.Color:= ColorRomb;
  Image1.Canvas.FloodFill(x1, y1, clGreen, fsBorder);

end;

procedure TForm2.Button2Click(Sender: TObject);
  begin
  if ColorDialog1.Execute then
   begin
     ColorRomb := ColorDialog1.Color;
     Button1.Click;
   end;
end;

procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
case Key of
  #8, '0'..'9':
 else
  Key := Chr(0);
 end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ColorRomb := clGreen;
end;

end.
