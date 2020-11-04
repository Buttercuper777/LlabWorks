unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    Button1: TButton;
    Label4: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TData = Integer;
  TPNode = ^TNode;

  TNode = record
    Data:   TData;  // data
    PLeft:  TPNode; // left
    PRight: TPNode; // right
  end;

var
  Form1: TForm1;

  PTree : TPNode;

implementation

{$R *.dfm}


procedure TForm1.FormShow(Sender: TObject);
begin
   PTree := nil;
end;

end.
