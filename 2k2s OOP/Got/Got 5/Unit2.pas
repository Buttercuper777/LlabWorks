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
    Edit4: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
  x1, y1: integer;
  lx, ly: integer;
  xs, ys: integer;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or (Edit4.Text = '') then
  begin
    ShowMessage('�� ��� ������ �������!');
    exit;
  end;

  Image1.Picture := nil;

  x1 := StrToInt(edit1.Text);
  y1 := StrToInt(edit2.Text);
  lx := StrToInt(edit3.Text);
  ly := StrToInt(edit4.Text);

      if(x1 + lx > Image1.Width) or (x1 < 0) then
  begin
    ShowMessage('������ ����� �� ����� ���������');
    exit;
  end;

  if(y1 > Image1.height) or (y1 < ly) then
  begin
    ShowMessage('������ ����� �� ����� ���������');
    exit;
  end;

  if(lx < 30) or (ly < 30) then
  begin
    Showmessage('������ ������ ������ ���� >= 30');
    exit
  end;


  rl := Rect(x1, y1, x1 + lx, y1-ly);

  Image1.Canvas.Pen.Color := clRed;
  Image1.Canvas.Rectangle(rl);

  xs := lx div 2;
  ys := ly div 2;

  IMage1.Canvas.Pen.Color := clGreen;
  IMage1.Canvas.MoveTo(x1, y1 - ys);
  IMage1.Canvas.LineTo(x1 + xs, y1 - ly);
  IMage1.Canvas.LineTo(x1 + lx, y1 - ys);
  IMage1.Canvas.LineTo(x1 + xs, y1);
  IMage1.Canvas.LineTo(x1 , y1 - ys);

  Image1.Canvas.Polyline([point(x1, y1 - ys), point(lx + x1, y1 - ys)]);

  Image1.Canvas.Brush.Color:= ColorRomb;
  Image1.Canvas.FloodFill(x1 + xs - 2, y1 - ys - 2, clGreen, fsBorder);

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
