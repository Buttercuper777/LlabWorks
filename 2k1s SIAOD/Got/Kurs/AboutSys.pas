unit AboutSys;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ActiveX, ComObj;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
implementation

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
const
WbemUser            ='';
WbemPassword        ='';
WbemComputer        ='localhost';
wbemFlagForwardOnly = $00000020;
var
FSWbemLocator : OLEVariant;
FWMIService   : OLEVariant;
FWbemObjectSet: OLEVariant;
FWbemObject   : OLEVariant;
oEnum         : IEnumvariant;
iValue        : LongWord;
ArchCPU, TypeCPU:string;
begin;
FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
FWMIService   := FSWbemLocator.ConnectServer(WbemComputer, 'root\CIMV2', WbemUser, WbemPassword);
FWbemObjectSet:= FWMIService.ExecQuery('SELECT * FROM Win32_Processor','WQL',wbemFlagForwardOnly);
oEnum         := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
while oEnum.Next(1, FWbemObject, iValue) = 0 do
begin
case FWbemObject.Architecture of
0 :ArchCPU :='x86';
9: ArchCPU :='x64';
end;

case FWbemObject.ProcessorType of
1: TypeCPU :='������';
2: TypeCPU :='�����������';
3: TypeCPU :='����������� ���������';
4: TypeCPU :='�������������� ���������';
5: TypeCPU :='DSP ���������';
6: TypeCPU :='��������������';
end;
Memo1.Clear;
Memo1.Lines.Add(Format('���:                          %s',[String(FWbemObject.Name)]));// String
Memo1.Lines.Add(Format('�����������:                  %s',[ArchCPU]));// Uint16
Memo1.Lines.Add(Format('�������������:                %s',[String(FWbemObject.Manufacturer)]));// String
Memo1.Lines.Add(Format('��������:                     %s',[String(FWbemObject.Caption)]));// String
Memo1.Lines.Add(Format('���:                           %s',[TypeCPU]));// Uint16
Memo1.Lines.Add(Format('��� ������:                   %s',[String(FWbemObject.SocketDesignation)]));// String
Memo1.Lines.Add(Format('����� ����:                   %d',[Integer(FWbemObject.NumberOfCores)]));// Uint32
Memo1.Lines.Add(Format('����� ������������ ����:          %d',[Integer(FWbemObject.NumberOfEnabledCore)]));// Uint32
Memo1.Lines.Add(Format('����� ���������� �����������:     %d',[Integer(FWbemObject.NumberOfLogicalProcessors)]));// Uint32
Memo1.Lines.Add(Format('������:                           %s',[String(FWbemObject.Status)]));// String
Memo1.Lines.Add('');
FWbemObject :=Unassigned;
end;
end;

end.
