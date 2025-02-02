unit MainLib;

interface
uses
  System.SysUtils,
  Vcl.Dialogs;


Type
  //TIndex = Integer; { ��� ��������� �� ����. }
  TPItem = ^TItem; { ��� ���� ������. }

  IndexList = array[1..50] of integer;
  TreeType = array[1..100] of TPItem;

  TItem = record
    Index: Integer; { ���� (�������� ������) ���� ������. }
    IndexPointer: IndexList; { ��������� �� ����� � ������ ����. }
end;

var
  PTree: TreeType;
  visit: array [1..100] of boolean;
  out_arr: array of integer;
  C: array[1..100] of array[1..100] of integer;
  C_BFS: array[1..100] of array[1..100] of integer;
  i :integer;

procedure BFS(v:integer; n:integer; LTree: TreeType);
procedure Prim(out Way, Wght:string; n:integer);
//procedure AddNode(var aPNode: TPNode; const aData: TData);
Procedure NewNode(val: integer; List:IndexList);
implementation

procedure nullTree(LTree: TreeType);
var i: integer;
begin
  for i := 1 to 100 do
    LTree[i] := nil;
end;

Procedure NewNode(val: integer; List:IndexList);
var
  ForNew: TPItem;
  i: integer;
  CheckStr: string;
begin
  New(ForNew);
  ForNew.Index := val;
  CheckStr := inttostr(ForNew.Index) + ': ';
  for i := 1 to 10 do
  begin
    ForNew.IndexPointer[i] := List[i];
    CheckStr := CheckStr + ' ' + inttostr(ForNew.IndexPointer[i]);
  end;
  //CheckStr := inttostr(ForNew.IndexPointer[1]) + ' ' + inttostr(ForNew.IndexPointer[2]);
  //showMessage(CheckStr);
  PTree[val] := ForNew;
end;

procedure Prim(out Way, Wght:string; n:integer);
  var
  visited: array[1..10] of integer;  //������ ����������/������������ ������
  cost: array[1..10, 1..10] of integer;  //������� ���������
  a, b, u, v, i, j, ne, min, path_index, mincost:integer;
  ti, tj:integer;
  outStr : String;
  path: array[1..100] of integer;
begin
  outStr := '1, ';
  path_index := 1;
  ne := 1;
  min := maxint; // ���� �������� ��� integer. 4 ����� ~ 43*10^8.
                  {��� ��� ��� ��� ������, ������� ����� �������
                  ������ � ������ ����������� ����. ��� ����� ���� ������ � ����}
  mincost := 0;

  for i := 1 to 10 do  // ������ ���� �������� ���������� ��������� � 0
    visited[i] := 0;

  for i := 1 to n do
    for j := 1 to n do  // ��������� ��� �� ������� �� ����� � �������-��������� ������
    begin
      cost[i,j] := C[i,j];
      if (cost[i,j] = 0) then
        cost[i, j] := maxint;
    end;

    visited[1] := 1;   // �������� ������ �������

    while (ne < n) do  // ���������� ���� �� ������� ��� �������
    begin
      min := maxint;
      for i := 1 to n do
      begin
        for j := 1 to n do
          if cost[i,j] < min then  // ���� ������ ����������
            if visited[i] <> 0 then   // ��������� �������� ������� ��� ���. ���� ��, �� ��� ��� ���� ���������� ��� ��� ����
            begin
              min := cost[i,j];
              u := i;
              a := u;

              v := j;
              b := v;
            end;
      end;
        if (visited[u] = 0) or (visited[v] = 0) then  // ��������� �������� ������� ab ��� ba
        begin
          path[path_index] := b;   // ��������� ������� �� �����
          path_index := path_index + 1;
          ne := ne + 1;  // ���, ����� while �� ������ ����������. �������
          mincost := mincost + min; // ��������� ���������
          visited[b] := 1;   // ��������� �������
        end;
        cost[b,a] := maxint;   // ��� ������ ���
        cost[a,b] := cost[b,a];  //��� ����
      end;

        for i := 1 to n-1 do   // ��� �������� ������ � �������. Outstr - ������ ������� ����� ���� � memo
        begin
          outStr := OutStr + inttostr(path[i]);  // ��������� ������ �� �����
          if (i < n - 1) then   // ��������� ����� �� ���� � ������ ����� ���������� '--> n ' �����-�� �����
            outStr := outStr + ', '; // ���� ��, �� � �������� ����������� ������ -->
        end;

        Way := outStr; // ��� �������� ����
        Wght := inttostr(mincost);  // ��� �������� ��� }
end;

procedure BFS(v:integer; n:integer; LTree: TreeType);
  var
  Q: array [1..100] of integer;
  Un,Uk: integer;
  j, add_out, l_cl: integer;

  NodeVal, SaveToCheck, c1, c2: integer;
  inArr: IndexList;
begin
NullTree(LTree);
Un:=0; Uk:=0;
Uk:=Uk+1; Q[Uk]:=v;
add_out := 0;
Visit[v]:=false;
setlength(out_arr, n);
c1:= 1;
SaveToCheck := 1;

for j := 1 to 50 do
  inArr[j] := 0;

while Un < Uk do
begin
  Un:=Un+1; v:=Q[Un];
  inc(add_out);
  SaveToCheck := 0;
  out_arr[add_out] := v;
  for j:=0 to n do
  begin
    if (C_BFS[v,j]=1) and (Visit[j]) then
    begin
      Uk:=Uk+1; Q[Uk]:=j;
      Visit[j]:=false;
      inArr[c1] := j;
      c1 := c1 + 1;
      SaveToCheck := v;
    end;
  end;
  if SaveToCheck = 0 then
    continue
  else begin
    NewNode(SaveToCheck, inArr);

    for l_cl := 1 to 50 do
      inArr[l_cl] := 0;

    c1 := 1;
  end;

  end;
end;
end.
