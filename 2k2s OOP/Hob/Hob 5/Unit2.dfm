object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 435
  ClientWidth = 682
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
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 681
    Height = 329
  end
  object Label1: TLabel
    Left = 20
    Top = 335
    Width = 199
    Height = 13
    Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1074#1077#1088#1096#1080#1085#1099' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082#1072
  end
  object Label2: TLabel
    Left = 244
    Top = 335
    Width = 158
    Height = 13
    Caption = #1044#1083#1080#1085#1099' '#1089#1090#1086#1088#1086#1085' '#1087#1088#1103#1084#1086#1091#1075#1086#1083#1100#1085#1080#1082#1072
  end
  object Label3: TLabel
    Left = 244
    Top = 371
    Width = 6
    Height = 13
    Caption = 'X'
  end
  object Label4: TLabel
    Left = 244
    Top = 398
    Width = 6
    Height = 13
    Caption = 'Y'
  end
  object Label5: TLabel
    Left = 20
    Top = 398
    Width = 6
    Height = 13
    Caption = 'Y'
  end
  object Label6: TLabel
    Left = 20
    Top = 371
    Width = 6
    Height = 13
    Caption = 'X'
  end
  object Edit1: TEdit
    Left = 32
    Top = 368
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 32
    Top = 395
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit1KeyPress
  end
  object Edit3: TEdit
    Left = 256
    Top = 368
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = Edit1KeyPress
  end
  object Edit4: TEdit
    Left = 256
    Top = 395
    Width = 121
    Height = 21
    TabOrder = 3
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 548
    Top = 361
    Width = 126
    Height = 26
    Caption = #1053#1072#1088#1080#1089#1086#1074#1072#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 548
    Top = 393
    Width = 126
    Height = 26
    Caption = #1062#1074#1077#1090
    TabOrder = 5
    OnClick = Button2Click
  end
  object ColorDialog1: TColorDialog
    Left = 448
    Top = 368
  end
end
