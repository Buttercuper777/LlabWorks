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
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mainArr: array[1..10] of real = (5000, 1000, 500, 100, 50, 10, 5, 1, 0.5, 0.1);
  indexArr: array[1..10] of real;
  index2: integer;
  
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



procedure TForm1.CheckBox10Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox10.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox1.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox2.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox3.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox4.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox5.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox6.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;
procedure TForm1.CheckBox7Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox7.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox8.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;

procedure TForm1.CheckBox9Click(Sender: TObject);
var
  i: integer;
  MoneyVal, input: real;
Const
  {$WriteableConst On}
  index: integer = 0;
begin  
  input := strtofloat(Edit2.Text);
  MoneyVal := StrToFloat(CheckBox9.Caption);
  
  if CheckBox4.Checked = False then
  begin
      for i := 1 to 10 do begin
        if mainArr[i] = MoneyVal then
          begin
            mainArr[i] := input + 1;
            index := i;
          end;
      end;
  end
  else
   mainArr[index] := MoneyVal;
end;

end.
