object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Krup 6'
  ClientHeight = 444
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 42
    Height = 14
    Caption = #1042#1099#1074#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 373
    Width = 60
    Height = 16
    Caption = #1043#1083#1091#1073#1080#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object TreeView1: TTreeView
    Left = 8
    Top = 28
    Width = 217
    Height = 329
    Indent = 19
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 399
    Width = 217
    Height = 37
    Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 74
    Top = 372
    Width = 151
    Height = 21
    NumbersOnly = True
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 231
    Top = 28
    Width = 178
    Height = 329
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
