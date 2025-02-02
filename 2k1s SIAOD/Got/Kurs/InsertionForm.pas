unit InsertionForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls, VCLTee.Series;
type
  ArrT = Array[1..2,1..30] of integer;
type
  TForm3 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
{$R *.dfm}
uses
  Unit1;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Series1.Clear;
end;

procedure TForm3.FormShow(Sender: TObject);
var
  i:integer;
begin
  Series1.XValues.Order := loNone;
  for i := 1 to 30 do
   Series1.AddXY(Unit1.GrArr[1,i],Unit1.GrArr[2,i],'',clred);
end;
end.
