object Form1: TForm1
  Left = 556
  Top = 209
  Caption = 'Form1'
  ClientHeight = 515
  ClientWidth = 696
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
    Width = 696
    Height = 383
  end
  object Panel1: TPanel
    Left = 0
    Top = 389
    Width = 696
    Height = 126
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = -8
    object LabelDS: TLabel
      Left = 195
      Top = 22
      Width = 57
      Height = 26
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100' ('#1075#1088#1072#1076'./'#1089#1077#1082')'
      WordWrap = True
    end
    object LabelSpeed: TLabel
      Left = 270
      Top = 7
      Width = 12
      Height = 13
      Caption = '45'
    end
    object Label1: TLabel
      Left = 195
      Top = 82
      Width = 54
      Height = 13
      Caption = #1055#1083#1072#1074#1085#1086#1089#1090#1100
      WordWrap = True
    end
    object Label2: TLabel
      Left = 270
      Top = 66
      Width = 6
      Height = 13
      Caption = '1'
    end
    object Label3: TLabel
      Left = 12
      Top = 13
      Width = 95
      Height = 13
      Caption = #1057#1090#1086#1088#1086#1085#1072' '#1082#1074#1072#1076#1088#1072#1090#1072
    end
    object TrackBarSpeed: TTrackBar
      Left = 258
      Top = 23
      Width = 418
      Height = 45
      Max = 90
      Min = 1
      Position = 45
      TabOrder = 0
      OnChange = TrackBarSpeedChange
    end
    object ButtonMove: TButton
      Left = 12
      Top = 59
      Width = 142
      Height = 54
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100
      TabOrder = 1
      OnClick = ButtonMoveClick
    end
    object TrackBar1: TTrackBar
      Left = 255
      Top = 85
      Width = 425
      Height = 45
      Max = 20
      Min = 1
      Position = 1
      TabOrder = 2
      OnChange = TrackBarSpeedChange
    end
    object Edit1: TEdit
      Left = 12
      Top = 32
      Width = 142
      Height = 21
      TabOrder = 3
      Text = '250'
      OnKeyPress = LEditRadKeyPress
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 22
    OnTimer = Timer1Timer
    Left = 662
    Top = 380
  end
end
