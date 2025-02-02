unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Math;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Image1: TImage;
    Panel1: TPanel;
    LabelDS: TLabel;
    LabelSpeed: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    TrackBarSpeed: TTrackBar;
    ButtonMove: TButton;
    TrackBar1: TTrackBar;
    Edit1: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonMoveClick(Sender: TObject);
    procedure TrackBarSpeedChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LEditRadKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
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
CenterX,CenterY, PointX, PointY:integer;
StepPoint, x1, y1,
x2, y2, xp, yp, lng, Mode:integer;
angle: real;
cChecker: boolean;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Image1.Picture := nil;
end;

procedure TForm1.ButtonMoveClick(Sender: TObject);
begin
  if (xp = x1) and (yp = y1) or (lng <> strtoint(edit1.Text)) then begin
    Image1.Picture := nil;
    lng := strtoint(edit1.Text);
    x1 := CenterX - Trunc(lng / 2);
    xp := x1;
    y1 := CenterY - Trunc(lng / 2);
    x2 := CenterX + Trunc(lng / 2);
    y2 := CenterY + Trunc(lng / 2);
    yp := y1;
    //Image1.Canvas.Rectangle(x1,y1,x2,y2);
  end;

  if(lng > (Image1.Width)) or (lng > (Image1.Height)) then
  begin
    showmessage('������ �������� ������ ��� ������� ���������');
    exit;
  end;

  if Timer1.Enabled then
  begin
    ButtonMove.Caption := ' ���������';
    edit1.Enabled := true;
    edit1.Enabled := true;
  end

  else begin
    edit1.Enabled := false;
    edit1.Enabled := false;
    ButtonMove.Caption := ' ����������';
  end;

  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RadCircle := 10;
  StepPoint := 20;
  cChecker := False;
  Mode := 0;

  CenterX := Image1.Width div 2;
  CenterY := Image1.Height div 2;

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
Image1.Canvas.Brush.Color := clWhite;
Image1.Canvas.FillRect(Rect(0,0,Width,height));
//Image1.Canvas.Rectangle(x1,y1,x2,y2);
Image1.Canvas.Brush.Color := clBlue;
 case Mode of
    0:begin
      Image1.Canvas.Ellipse(xp - RadCircle,yp - RadCircle, xp + RadCircle , yp + RadCircle);
      if (xp < x2) then
        xp := xp + StepPoint
      else
        Mode := 1;
    end;

    1:begin
      Image1.Canvas.Ellipse(xp - RadCircle,yp - RadCircle, xp + RadCircle , yp + RadCircle);
      if(yp < y2) then
        yp := yp + stepPoint
      else
        Mode := 2;
    end;

    2:begin
      Image1.Canvas.Ellipse(xp - RadCircle,yp - RadCircle, xp + RadCircle , yp + RadCircle);
      if(xp > x1) then
        xp := xp - StepPoint
      else
        Mode := 3;
    end;

    3:begin
      Image1.Canvas.Ellipse(xp - RadCircle,yp - RadCircle, xp + RadCircle , yp + RadCircle);
      if(yp > y1) then
        yp := yp - StepPoint
      else
        Mode := 0;
    end;

 end;
end;

procedure TForm1.TrackBarSpeedChange(Sender: TObject);
begin
  StepPoint := 21 - TrackBar1.Position;
  label2.Caption := IntToStr(TrackBar1.Position);
  Timer1.Interval := Trunc(1000 * StepPoint / TrackBarSpeed.Position);
  LabelSpeed.Caption:= IntToStr(TrackBarSpeed.Position);
end;

end.
