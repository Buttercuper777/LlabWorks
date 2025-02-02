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
    LEditRad: TLabeledEdit;
    TrackBarSpeed: TTrackBar;
    ButtonMove: TButton;
    TrackBar1: TTrackBar;
    Button1: TButton;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
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
StepPoint:integer;

cChecker: boolean;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Image1.Picture := nil;
end;

procedure TForm1.ButtonMoveClick(Sender: TObject);
begin

  if((strtoint(LEditRad.Text) < 50)) then
  begin
    showmessage('Max ������ ������ ���� �� ������ 50');
    exit;
  end;

  if((strtoint(Edit1.Text) < 10) or (strtoint(Edit1.Text) > strtoint(LEditRad.Text)) ) then
  begin
    showmessage('Min ������ ������ ���� �� ������ 10 � �� ������ ���� ������ max �������');
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
    edit1.Enabled := true;
  end

  else begin
    RadCircle := StrToInt(Edit1.Text);
    LEditRad.Enabled := false;
    edit1.Enabled := false;
    ButtonMove.Caption := ' ����������';
  end;

  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RadCircle := 30;
  StepPoint := 20;
  cChecker := False;

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
  Image1.Canvas.Pen.Color := clBlue;
  //Image1.Canvas.Brush.Color := clBlue;

  if (RadCircle < strtoint(LEditRad.Text)) and (cChecker = False) then
  begin
    RadCircle := RadCircle + StepPoint;
    //Image1.Canvas.Brush.Color := clWhite;
    //Image1.Canvas.FloodFill(CenterX - RadCircle, CenterY - RadCircle, clBlue, fsSurface);
    //Image1.Canvas.Brush.Color := clBlue;
    Image1.Canvas.Brush.Color := clWhite;
    Image1.Canvas.FillRect(Rect(0,0,Width,height));
    Image1.Canvas.Brush.Color := clBlue;
    Image1.Canvas.Ellipse(CenterX - RadCircle, CenterY - RadCircle, CenterX + RadCircle, CenterY + RadCircle);
  end
  else if (RadCircle > strtoint(edit1.Text)) then
  begin
    cChecker := True;
    if (RadCircle > strtoint(Edit1.Text)) and (cChecker = True) then
    begin
      Image1.Canvas.Brush.Color := clWhite;
      Image1.Canvas.FillRect(Rect(0,0,Width,height));
      Image1.Canvas.Brush.Color := clBlue;
      //Image1.Picture := nil;
      RadCircle := RadCircle - StepPoint;
      Image1.Canvas.Ellipse(CenterX - RadCircle, CenterY - RadCircle, CenterX + RadCircle, CenterY + RadCircle);
      if (RadCircle <= strtoint(Edit1.Text)) and (cChecker = True) then
        cChecker := False;
    end

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
