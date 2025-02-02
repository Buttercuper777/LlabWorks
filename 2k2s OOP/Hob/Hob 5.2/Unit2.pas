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
    Button1: TButton;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ColorDialog1: TColorDialog;
    Button2: TButton;
    Label2: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label3: TLabel;
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

function GetRandomColor: TColor;
begin
  Result := RGB(Random(255), Random(255), Random(255));
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  rl: TRect;
  x1, y1, x2, y2, x3, y3: integer;
  m1x, m1y, m2x, m2y, m3x, m3y: integer;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') or (Edit4.Text = '') or (Edit5.Text = '') or (Edit6.Text = '') then
  begin
    ShowMessage('�� ��� ����� �������');
    exit;
  end;

  Image1.Picture := nil;

  x1 := StrToInt(edit1.Text);
  y1 := StrToInt(edit2.Text);
  x2 := StrToInt(edit3.Text);
  y2 := StrToInt(edit4.Text);
  x3 := StrToInt(edit5.Text);
  y3 := StrToInt(edit6.Text);

  if (x1 > Image1.Width) or (x2 > Image1.Width) or (x2 > Image1.Width) then
  begin
    Showmessage('��������� ���������� �����');
    exit;
  end;

  if (y1 > Image1.Height - 2) or (y2 > Image1.Height - 2) or (y2 > Image1.Height - 2) then
  begin
    Showmessage('��������� ���������� �����');
    exit;
  end;

  IMage1.Canvas.Pen.Color := ColorRomb;
  IMage1.Canvas.Pen.Width := 5;

  IMage1.Canvas.MoveTo(x1, y1);
  IMage1.Canvas.LineTo(x2,y2);
  IMage1.Canvas.LineTo(x3,y3);
  IMage1.Canvas.LineTo(x1,y1);

  m3x:=(x1+x2)div 2;
  m3y:=(y1+y2)div 2;

  m2x:=(x1+x3)div 2;
  m2y:=(y1+y3)div 2;

  m1x:=(x2+x3)div 2;
  m1y:=(y2+y3)div 2;


  IMage1.Canvas.Pen.Color := GetRandomColor;
  IMage1.Canvas.Pen.Width := 1;
  IMage1.Canvas.Pen.Style := psDash;
  IMage1.Canvas.Polyline([Point(x1,y1), Point(m1x, m1y)]);

  IMage1.Canvas.Pen.Style := psDot;
  IMage1.Canvas.Pen.Color := GetRandomColor;
  IMage1.Canvas.Polyline([Point(x2,y2), Point(m2x, m2y)]);

  IMage1.Canvas.Pen.Style := psDashDot;
  IMage1.Canvas.Pen.Color := GetRandomColor;
  IMage1.Canvas.Polyline([Point(x3,y3), Point(m3x, m3y)]);

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
