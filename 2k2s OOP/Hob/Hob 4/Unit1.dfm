object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 405
  ClientWidth = 654
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
  object Label1: TLabel
    Left = 8
    Top = 193
    Width = 60
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090': '
  end
  object Label2: TLabel
    Left = 128
    Top = 8
    Width = 83
    Height = 13
    Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1090#1077#1082#1089#1090
  end
  object memo: TLabel
    Left = 375
    Top = 8
    Width = 95
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1087#1086#1080#1089#1082#1072':'
  end
  object Button1: TButton
    Left = 8
    Top = 131
    Width = 75
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 162
    Width = 75
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 104
    Width = 75
    Height = 21
    TabOrder = 2
  end
  object Memo1: TMemo
    Left = 128
    Top = 27
    Width = 233
    Height = 350
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object Memo2: TMemo
    Left = 375
    Top = 27
    Width = 242
    Height = 350
    TabOrder = 4
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 8
    Width = 113
    Height = 81
    Caption = #1042#1072#1088#1080#1072#1085#1090
    Items.Strings = (
      #1054#1073#1097#1080#1081' '#1074#1072#1088#1080#1072#1085#1090
      #1042#1072#1088#1080#1072#1085#1090' 1')
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 352
  end
end
