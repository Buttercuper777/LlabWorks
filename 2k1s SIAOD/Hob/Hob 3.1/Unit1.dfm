object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 193
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 431
    Top = 95
    Width = 123
    Height = 13
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1093#1077#1096'-'#1092#1091#1085#1082#1094#1080#1080':'
  end
  object Label3: TLabel
    Left = 575
    Top = 95
    Width = 4
    Height = 14
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 98
    Width = 29
    Height = 13
    Caption = #1042#1074#1086#1076':'
  end
  object Button1: TButton
    Left = 8
    Top = 144
    Width = 177
    Height = 33
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' '#1090#1072#1073#1083#1080#1080#1094#1091
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 117
    Width = 177
    Height = 21
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 617
    Height = 81
    ColCount = 10
    DefaultColWidth = 40
    RowCount = 2
    TabOrder = 2
    RowHeights = (
      24
      24)
  end
end
