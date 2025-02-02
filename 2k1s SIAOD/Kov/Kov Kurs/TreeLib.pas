unit TreeLib;

interface

uses
  System.SysUtils,
   Vcl.Dialogs;

type
  TData = Integer;
  TPNode = ^TNode;

  TNode = record
    Data: TData;
    PLeft, PRight: TPNode;
  end;
  TreeArrT = array[0..100] of TData;

  TTree = class
    TreePointer: TPNode;
    Data: TData;
    OutData: string;

    Private
      LeftNode: TPNode;
      DataSaver: integer;
      Procedure FindLeft(Pointer: TPNode);
    Public
      procedure AddNode(var aPNode: TPNode; const aData: TData);
      function TreeWrite(const aPNode : TPNode; WriteType:char): string;
      procedure FillTree(ArraySize: integer; MainArray:TreeArrT; var Pointer: TPNode);

      procedure Find(const aPNode : TPNode; ForSearch: integer);
      procedure Add(var Pointer : TPNode; ForAdd: integer);
      Procedure Del(Pointer: TPNode; ForDel: Integer);

      constructor Create();
  end;


  Var
    Way: string;
    NodeSaver: TPNode;
implementation

constructor TTree.Create();
begin
  TreePointer := nil;
end;

Procedure TTree.FindLeft(Pointer: TPNode);
begin
  if Pointer^.PLeft = nil then
  begin
    LeftNode := Pointer;
    exit
  end
  else
    FindLeft(Pointer^.PLeft);
end;

procedure TTree.Del(Pointer: TPNode; ForDel: Integer);
Var
  LSave, RSave: TPNode;
begin
  if Pointer = nil then
    exit;

  if ForDel > Pointer^.Data then
  begin
    NodeSaver := Pointer;
    Del(Pointer^.PRight, ForDel);
  end

  else if ForDel < Pointer^.Data then
  begin
    NodeSaver := Pointer;
    Del(Pointer^.PLeft, ForDel);
  end

  else if ForDel = Pointer^.Data then
  begin
    if (Pointer^.PLeft = nil) and (Pointer^.PRight = nil) then
    begin
      if Pointer^.Data > NodeSaver^.Data then
        NodeSaver^.PRight := nil
      else if Pointer^.Data < NodeSaver^.Data then
        NodeSaver^.PLeft := nil;

      Dispose(Pointer);
    end
    else if (Pointer^.PLeft <> nil) and (Pointer^.PRight = nil) then
    begin
      if Pointer^.Data > NodeSaver^.Data then
      begin
        NodeSaver^.PRight := Pointer^.PLeft;
        Pointer := nil;
        Dispose(Pointer);
      end
      else if Pointer^.Data < NodeSaver^.Data then
      begin
        NodeSaver^.PLeft := Pointer^.PLeft;
        Pointer := nil;
        Dispose(Pointer);
      end;

    end
    else if (Pointer^.PLeft = nil) and (Pointer^.PRight <> nil) then
    begin
      if Pointer^.Data > NodeSaver^.Data then
      begin
        NodeSaver^.PRight := Pointer^.PRight;
        Pointer := nil;
        Dispose(Pointer);
      end
      else if Pointer^.Data < NodeSaver^.Data then
      begin
        NodeSaver^.PLeft := Pointer^.PRight;
        Pointer := nil;
        Dispose(Pointer);
      end;
    end
    else if (Pointer^.PLeft <> nil) and (Pointer^.PRight <> nil) then
    begin
      FindLeft(Pointer^.PRight);
      DataSaver := LeftNode^.Data;
      Del(Pointer, DataSaver);
      Pointer^.Data := DataSaver;
    end;                         
  end;
end;

procedure TTree.Add(var Pointer: TPNode; ForAdd: integer);
var
  AddPointer: TPNode;
begin
  if Pointer = nil then
  begin
    AddNode(Pointer, ForAdd);
    ShowMessage('���������: ' + inttostr(ForAdd));
    exit;
  end;

  if ForAdd > Pointer^.Data then
    Add(Pointer^.PRight, ForAdd)

  else if ForAdd < Pointer^.Data then
    Add(Pointer^.PLeft, ForAdd)

  else if ForAdd = Pointer^.Data then
    ShowMessage(('����� ������� ��� ����������!'));
end;

procedure TTree.Find(const aPNode: TPNode; ForSearch: integer);
begin
  if aPNode = nil then
  begin
    ShowMessage('���������� ���!');
    exit;
  end;

  if ForSearch > aPNode^.Data then
  begin
    Way := Way + ' -> ' + inttostr(aPNode^.Data);
    Find(aPNode^.PRight, ForSearch);
  end
  else if ForSearch < aPNode^.Data then
  begin
    Way := Way + ' -> ' + inttostr(aPNode^.Data);
    Find(aPNode^.PLeft, ForSearch);
  end
  else if ForSearch = aPNode^.Data then
    ShowMessage(('�������: ' + inttostr(ForSearch) + #13 + 'Tree' + Way + ' -> ' + inttostr(ForSearch)));
end;



procedure TTree.FillTree(ArraySize: integer; MainArray:TreeArrT; var Pointer: TPNode);
var
  i: integer;
begin
  for i := 0 to ArraySize - 1 do
    AddNode(Pointer, MainArray[i]);

end;


procedure TTree.AddNode(var aPNode: TPNode; const aData: TData);
begin
  if aPNode = nil then
  begin
    New(aPNode);
    aPNode^.Data := aData;
    aPNode^.PLeft := nil;
    aPNode^.PRight := nil;
  end

  else if aData <= aPNode^.Data then
    AddNode(aPNode^.PLeft, aData)

  else if aData > aPNode^.Data then
    AddNode(aPNode^.PRight, aData);

end;

function TTree.TreeWrite(const aPNode : TPNode; WriteType:char): string;
begin
  if aPNode = nil then
    exit;

  if WriteType = 's' then
  begin
    TreeWrite(aPNode^.PLeft, WriteType);
    OutData := OutData + ' ' + inttostr(aPNode^.Data);
    TreeWrite(aPNode^.PRight, WriteType);
  end
  else if WriteType = 'd' then
  begin
    OutData := OutData + ' ' + inttostr(aPNode^.Data);
    TreeWrite(aPNode^.PLeft, WriteType);
    TreeWrite(aPNode^.PRight, WriteType);
  end
  else if WriteType = 'r' then
  begin
    TreeWrite(aPNode^.PLeft, WriteType);
    TreeWrite(aPNode^.PRight, WriteType);
    OutData := OutData + ' ' + inttostr(aPNode^.Data);
  end
  else
    result := 'ERROR';

  result := OutData;
end;
procedure Prnt();
begin
  ShowMessage('ukhkjhkjhk');
end;
end.
