object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 233
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 86
    Height = 13
    Caption = #1056#1072#1079#1084#1077#1088' '#1090#1072#1073#1083#1080#1094#1099':'
  end
  object Label2: TLabel
    Left = 232
    Top = 6
    Width = 54
    Height = 13
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100':'
  end
  object Label3: TLabel
    Left = 135
    Top = 9
    Width = 53
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1101#1083':'
  end
  object Edit1: TEdit
    Left = 8
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '20'
  end
  object Button1: TButton
    Left = 7
    Top = 52
    Width = 202
    Height = 30
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 232
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button2: TButton
    Left = 359
    Top = 25
    Width = 103
    Height = 21
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 88
    Width = 590
    Height = 134
    ColCount = 2
    DefaultColWidth = 20
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    TabOrder = 4
    ColWidths = (
      61
      20)
  end
  object Edit3: TEdit
    Left = 135
    Top = 25
    Width = 74
    Height = 21
    TabOrder = 5
    Text = '10'
  end
end
