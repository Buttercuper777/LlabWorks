object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 356
  ClientWidth = 479
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
  object Label1: TLabel
    Left = 45
    Top = 8
    Width = 6
    Height = 13
    Caption = 'X'
  end
  object Label2: TLabel
    Left = 11
    Top = 43
    Width = 47
    Height = 13
    Caption = #1058#1086#1095#1085#1086#1089#1090#1100
  end
  object Label3: TLabel
    Left = 288
    Top = 8
    Width = 90
    Height = 13
    Caption = #1063#1072#1089#1090#1080#1095#1085#1099#1077' '#1089#1091#1084#1084#1099
  end
  object Label4: TLabel
    Left = 8
    Top = 119
    Width = 29
    Height = 16
    Caption = 'Func'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 8
    Top = 141
    Width = 27
    Height = 16
    Caption = 'Sum'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 8
    Top = 163
    Width = 32
    Height = 16
    Caption = 'AbsE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label7: TLabel
    Left = 8
    Top = 185
    Width = 19
    Height = 16
    Caption = 'Kol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Edit1: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 64
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 11
    Top = 67
    Width = 174
    Height = 30
    Caption = #1056#1072#1089#1095#1080#1090#1072#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 288
    Top = 32
    Width = 177
    Height = 305
    TabOrder = 3
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 264
    Width = 185
    Height = 73
    Caption = #1042#1072#1088#1080#1072#1085#1090#1099': '
    Items.Strings = (
      #1054#1073#1097'. '#1079#1072#1076#1072#1085#1080#1077
      #1042#1072#1088#1080#1072#1085#1090' 1')
    TabOrder = 4
  end
end
