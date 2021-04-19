unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Label2: TLabel;
    Memo1: TMemo;
    memo: TLabel;
    Memo2: TMemo;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  KeyCounter: integer;

procedure TForm1.Button1Click(Sender: TObject);
var
  f: textfile;
  s: string;
begin
  if OpenDialog1.Execute then
    begin
      AssignFile(f, OpenDialog1.FileName);
      Reset(f);
    end

  else
    exit;

      Memo1.Lines.Clear();
      while not eof(f) do
      begin
        Readln(f, s);
        Memo1.Lines.Add(s);
      end;

      CloseFile(f);
      Edit1.SetFocus();

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i,j,kol,k: integer;
  nom: integer;
  s, sw: string;

var
  maxVal: integer;
  trySv: integer;
  sum: real;
begin
  memo2.Lines.Clear;
  sum := 0;
  if radiogroup1.ItemIndex = 0 then
    begin
    if Edit1.Text = '' then
    begin
      ShowMessage('������� ����� � ������ ������');
      exit;
    end

    else if Memo1.Lines[0] = '' then
    begin
      ShowMessage('����� �� ������');
      exit;
    end;

    Nom:= 0;
    for i := 0 to (Memo1.Lines.Count - 1) do
    begin
      s:= Memo1.Lines[i];
      if s = '' then continue;
      if AnsiUpperCase(s[1]) = AnsiUpperCase(Edit1.Text[1]) then
      begin
        nom:= nom + 1;
        Memo2.Lines.Add(IntToStr(nom) + '. ' + s);      end;      For j:= 1 to length(s) do      if s[j] = ' ' then
      begin
        for k:= 1 to length(sw) do
          if AnsiUpperCase(sw[k]) = AnsiUpperCase(Edit1.Text[1]) then
            begin
              kol:= kol + 1;
              break;
            end;
            sw:= '';
          end
        else
          sw:= sw + s[j];
     end;     label1.Caption:= '����� ' + Edit1.Text + ' �������� ' + #13 + IntToStr(kol) + ' ����';     label1.Visible:= true;    end    else begin      if Memo1.Lines[0] = '' then      begin
        ShowMessage('����� �� ������');
        exit;
      end;
        nom := memo1.Lines.Count;

        for i := 0 to nom - 1 do
        begin
          sw := memo1.Lines[i];
          j := length(sw);
          maxVal := 0;
            for k := 1 to j do
              try
                trySv := strtoint(sw[k]);
                if trySv > maxVal then
                  maxVal := trySv;
              except
                continue
              end;
            memo2.Lines.Add(inttostr(i + 1) + '. ' + inttostr(maxVal));
            sum := sum + maxVal;
        end;
        sum := sum/nom;
        label1.Caption := '��.�������: ' + #13 + floattostrf(sum, fffixed, 5,3);
    end;  end;procedure TForm1.FormShow(Sender: TObject);
begin
  radiogroup1.ItemIndex := 0;
end;

end.



