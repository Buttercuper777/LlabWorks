unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mainArr: array[1..10] of real = (5000, 1000, 500, 100, 50, 10, 5, 1, 0.5, 0.1);

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
    a, i:integer;
    s, input: real;
begin
    input := strtofloat(Edit2.Text);
    s := strtofloat(Edit1.Text);
    input := input - s;
    memo1.Lines.Add('--- ' + floattostr(input) + ' ---');

    i := 1;
    while (input > 0) do
    begin
      a := trunc((input / mainArr[i]) + 0.1);
      //memo1.Lines.Add(inttostr(a) + ' ' + floattostr(mainArr[i]));
      input := input - (a * mainArr[i]);

      if(a > 0) then
        memo1.Lines.Add(FloatToStr(mainArr[i])+ ' �' + ' - ' + IntToStr(a));
      i := i + 1;
    end;
        memo1.Lines.Add('---------');

end;

end.
