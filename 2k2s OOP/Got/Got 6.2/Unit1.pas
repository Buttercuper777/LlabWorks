unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Math;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    LEditRad: TLabeledEdit;
    TrackBarSpeed: TTrackBar;
    LabelDS: TLabel;
    ButtonMove: TButton;
    LabelSpeed: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonMoveClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBarSpeedChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LEditRadKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
RadCircle:integer;
CenterX,CenterY:integer;
PointX,PointY:integer;
PointX1,PointY1:integer;
Angle,
StepPoint:real;
RadPoint:integer;
PointColor:TColor;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Image1.Picture := nil;
end;

procedure TForm1.ButtonMoveClick(Sender: TObject);
begin

  if((strtoint(LEditRad.Text) < 100)) then
  begin
    showmessage('������ ������ ���� �� ������ 100');
    exit;
  end;

  if (strtoint(LEditRad.Text) * 2 > Image1.Width) or (strtoint(LEditRad.Text) * 2 > Image1.Height) then
  begin
    showmessage('����� �� ������ �������� �� ������� ������� �����������');
    exit;
  end;

  if Timer1.Enabled then
  begin
    //Image1.picture := nil;
    ButtonMove.Caption := ' ���������';
    LEditRad.Enabled := true;
  end

  else begin
    RadCircle := StrToInt(LEditRad.Text);
    LEditRad.Enabled := false;
    ButtonMove.Caption := ' ����������';
  end;

  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Angle := 0;
  RadCircle := 100;
  RadPoint := 5;
  StepPoint := 20;
  CenterX := Image1.Width div 2;
  CenterY := Image1.Height div 2;
  PointX := CenterX + RadCircle;
  PointY := CenterY;
  PointColor := clRed;
  Image1.Canvas.Pen.Color := PointColor;
  Image1.Canvas.Brush.Color := PointColor;
  Image1.Canvas.Ellipse(PointX - radPoint,PointY - RadPoint,PointX + RadPoint, PointY + RadPoint);
  Timer1.Interval := Trunc(1000 * StepPoint / TrackBarSpeed.Position);
end;

procedure TForm1.LEditRadKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
  #8, '0'..'9':
 else
  Key := Chr(0);
 end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

  PointX := Trunc(RadCircle * cos(60 * (Angle)) + CenterX);
  PointY := Trunc(RadCircle * sin(60* (Angle)) + CenterY);
  Image1.Canvas.MoveTo(CenterX,CenterY);
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.FillRect(Rect(0,0,Width,height));
  Image1.Canvas.Pen.Color := clBlue;
  Image1.Canvas.LineTo(PointX,PointY);
  Image1.Canvas.LineTo(CenterX-(PointX-CenterX),CenterY-(PointY-CenterY));

{  Image1.Canvas.MoveTo(PointX, PointY);
  Image1.Canvas.LineTo(PointX-CenterX-PointX, PointY-CenterY-PointY);
    Image1.Canvas.Pen.Color := clBlue;
      Image1.Canvas.Brush.Color := clBlue;}




  //Image1.Canvas.Ellipse(PointX - RadPoint, PointY - RadPoint,PointX + RadPoint, PointY + RadPoint);
  Angle := Angle + StepPoint;
  if Angle >= 360 then
    Angle := 0;
end;

procedure TForm1.TrackBarSpeedChange(Sender: TObject);
begin
  StepPoint := 21 - TrackBar1.Position;
  label2.Caption := IntToStr(TrackBar1.Position);
  Timer1.Interval := Trunc(1000 * StepPoint / TrackBarSpeed.Position);
  LabelSpeed.Caption:= IntToStr(TrackBarSpeed.Position);
end;

end.
