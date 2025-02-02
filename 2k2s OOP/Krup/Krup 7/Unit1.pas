unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComObj, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Button_open: TButton;
    Button_close: TButton;
    OpenDialog1: TOpenDialog;
    Button_OpenFile: TButton;
    Edita11: TEdit;
    Edita21: TEdit;
    Edita31: TEdit;
    Edita12: TEdit;
    Edita22: TEdit;
    Edita32: TEdit;
    Edita13: TEdit;
    Edita23: TEdit;
    Edita33: TEdit;
    Editb1: TEdit;
    Editb2: TEdit;
    Editb3: TEdit;
    lbl1: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    StringGrid1: TStringGrid;
    Button_Solve: TButton;
    ButtonShow: TButton;
    ButtonFill: TButton;
    procedure Button_openClick(Sender: TObject);
    procedure Button_closeClick(Sender: TObject);
    procedure Button_OpenFileClick(Sender: TObject);
    procedure Button_SolveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edita11KeyPress(Sender: TObject; var Key: Char);
    procedure ButtonShowClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonFillClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
var
  Exc:Variant;
  closed:boolean;

{$R *.dfm}

procedure TForm1.Button_openClick(Sender: TObject);
begin
Exc:=CreateOleObject('Excel.Application');
Exc.Visible := true;
Exc.Workbooks.Add;
closed:=false;
end;

procedure TForm1.ButtonShowClick(Sender: TObject);
begin

  if Exc.Workbooks.Count = 0 then
  begin
    Exc.Visible:=False;
    Button_close.Enabled := False;
    ButtonShow.Caption := '�������� ����';
    Exc.Quit;
    closed:=true;
  end;

if closed then
   begin
     ShowMessage('Excel ������ (��������� ��� �� ������ ������� � ������� ������ "������")');
     exit;
   end;
  if Exc.Visible = true then
  begin
    ButtonShow.Caption:='�������� ����';
    Exc.Visible:=False;
  end
  else
  begin
    ButtonShow.Caption:='������ ����';
    Exc.Visible:=True;
  end;
end;

procedure TForm1.Button_closeClick(Sender: TObject);
begin
button_close.Enabled := False;
if not closed then
begin
ButtonShow.Caption:='�������� ����';
Exc.Visible:=False;
Exc.Quit;
closed:=true;
end;
end;

procedure TForm1.Button_OpenFileClick(Sender: TObject);
begin
if OpenDialog1.Execute then
Exc.Workbooks.Open(OpenDialog1.Filename);
end;

procedure TForm1.Button_SolveClick(Sender: TObject);
var
  path:string;
  i:Integer;
begin
button_close.Enabled := True;
if Edita11.Text='' then
   begin
     ShowMessage('������� �����');
     Edita11.SetFocus;
     exit;
   end
   else
if Edita12.Text='' then
   begin
     ShowMessage('������� �����');
     Edita12.SetFocus;
     exit;
   end
   else
if Edita13.Text='' then
   begin
     ShowMessage('������� �����');
     Edita13.SetFocus;
     exit;
   end
   else
if Editb1.Text='' then
   begin
     ShowMessage('������� �����');
     Editb1.SetFocus;
     exit;
   end
   else
if Edita21.Text='' then
   begin
     ShowMessage('������� �����');
     Edita21.SetFocus;
     exit;
   end
   else
if Edita22.Text='' then
   begin
     ShowMessage('������� �����');
     Edita22.SetFocus;
     exit;
   end
   else
if Edita23.Text='' then
   begin
     ShowMessage('������� �����');
     Edita23.SetFocus;
     exit;
   end
   else
if Editb2.Text='' then
   begin
     ShowMessage('������� �����');
     Editb2.SetFocus;
     exit;
   end
   else
 if Edita31.Text='' then
   begin
     ShowMessage('������� �����');
     Edita31.SetFocus;
     exit;
   end
   else
if Edita32.Text='' then
   begin
     ShowMessage('������� �����');
     Edita32.SetFocus;
     exit;
   end
   else
if Edita33.Text='' then
   begin
     ShowMessage('������� �����');
     Edita33.SetFocus;
     exit;
   end
   else
   if Editb3.Text='' then
   begin
     ShowMessage('������� �����');
     Editb3.SetFocus;
     exit;
   end;
  if closed then
  begin
    Exc:=CreateOleObject('Excel.Application');
    Exc.Workbooks.Add;
  end;

  try
  
  Exc.Range['A1'] := Edita11.Text;
  Exc.Range['B1'] := Edita12.Text;
  Exc.Range['C1'] := Edita13.Text;
  Exc.Range['A2'] := Edita21.Text;
  Exc.Range['B2'] := Edita22.Text;
  Exc.Range['C2'] := Edita23.Text;
  Exc.Range['A3'] := Edita31.Text;
  Exc.Range['B3'] := Edita32.Text;
  Exc.Range['C3'] := Edita33.Text;
  Exc.Range['E1'] := Editb1.Text;
  Exc.Range['E2'] := Editb2.Text;
  Exc.Range['E3'] := Editb3.Text;
  Exc.Range['A5'].FormulaArray := '=������(A1:C3)';
  
  Except
    ShowMessage('� ��������� ��� ����� ���������� Exel � ������� ����� "�������" =)');
    Exc.Visible:=False;
    Button_close.Enabled := False;
    ButtonShow.Caption := '�������� ����';
    Exc.Quit;
    closed:=true;
    exit;

  end;

  if StrToFloat(Exc.Range['A5'])=0 then
  begin
    ShowMessage('������������ ����� ����');
    Exit;
  end;

  Exc.Range['C5:E7'].FormulaArray := '=����(A1:C3)';
  Exc.Range['G5:G7'].FormulaArray := '=������(C5:E7;E1:E3)';

  for i := 0 to 2 do
  begin
    path := 'G' + IntToStr(5+i);
    StringGrid1.Cells[i,1] := Exc.Range[path];
  end;

  closed:=False;
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if not closed then
Exc.Quit;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
StringGrid1.Cells[0,0]:='X';
StringGrid1.Cells[1,0]:='Y';
StringGrid1.Cells[2,0]:='Z';
closed:=true;
end;

procedure TForm1.Edita11KeyPress(Sender: TObject; var Key: Char);
begin
if Key=#13 then
   case (Sender as TComponent).Tag of
   1: if Edita11.Text='' then
   begin
     ShowMessage('������� �����');
     Edita11.SetFocus;
     exit;
   end
   else
    Edita12.SetFocus;
   2: if Edita12.Text='' then
   begin
     ShowMessage('������� �����');
     Edita12.SetFocus;
     exit;
   end
   else
   Edita13.SetFocus;
   3: if Edita13.Text='' then
   begin
     ShowMessage('������� �����');
     Edita13.SetFocus;
     exit;
   end
   else
   Editb1.SetFocus;
   4: if Editb1.Text='' then
   begin
     ShowMessage('������� �����');
     Editb1.SetFocus;
     exit;
   end
   else
   Edita21.SetFocus;
   5: if Edita21.Text='' then
   begin
     ShowMessage('������� �����');
     Edita21.SetFocus;
     exit;
   end
   else
   Edita22.SetFocus;
   6: if Edita22.Text='' then
   begin
     ShowMessage('������� �����');
     Edita22.SetFocus;
     exit;
   end
   else
   Edita23.SetFocus;
   7: if Edita23.Text='' then
   begin
     ShowMessage('������� �����');
     Edita23.SetFocus;
     exit;
   end
   else
   Editb2.SetFocus;
   8: if Editb2.Text='' then
   begin
     ShowMessage('������� �����');
     Editb2.SetFocus;
     exit;
   end
   else
   Edita31.SetFocus;
   9: if Edita31.Text='' then
   begin
     ShowMessage('������� �����');
     Edita31.SetFocus;
     exit;
   end
   else
   Edita32.SetFocus;
   10: if Edita32.Text='' then
   begin
     ShowMessage('������� �����');
     Edita32.SetFocus;
     exit;
   end
   else
   Edita33.SetFocus;
   11: if Edita33.Text='' then
   begin
     ShowMessage('������� �����');
     Edita33.SetFocus;
     exit;
   end
   else
   Editb3.SetFocus;
   12: if Editb3.Text='' then
   begin
     ShowMessage('������� �����');
     Editb3.SetFocus;
     exit;
   end
   else
   Button_Solve.SetFocus;
   end
else
    if Key in ['0'..'9','-', Chr(VK_BACK)] = False then Key := #0;
end;

procedure TForm1.ButtonFillClick(Sender: TObject);
var
i:integer;
begin
if closed=true then
begin
Exc:=CreateOleObject('Excel.Application');
Exc.Workbooks.Add;
end;
for i := 0 to 2 do
StringGrid1.Cells[i,1] := '';
Randomize;
Exc.Range['A1'] := IntToStr(Random(10));
Exc.Range['A2'] := IntToStr (Random(10));
Exc.Range['A1:A2'].AutoFill(Exc.Range['A1:A12'], 2);
closed:=false;
Edita11.Text := Exc.Range['A1'];
Edita21.Text := Exc.Range['A2'];
Edita31.Text := Exc.Range['A3'];
Edita12.Text := Exc.Range['A4'];
Edita22.Text := Exc.Range['A5'];
Edita32.Text := Exc.Range['A6'];
Edita13.Text := Exc.Range['A7'];
Edita23.Text := Exc.Range['A8'];
Edita33.Text := Exc.Range['A9'];
Editb1.Text := Exc.Range['A10'];
Editb2.Text := Exc.Range['A11'];
Editb3.Text := Exc.Range['A12'];
end;

end.
