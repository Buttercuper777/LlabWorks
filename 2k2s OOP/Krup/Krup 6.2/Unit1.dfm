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
    object LabelDS: TLabel
      Left = 251
      Top = 22
      Width = 57
      Height = 26
      Caption = #1057#1082#1086#1088#1086#1089#1090#1100' ('#1075#1088#1072#1076'./'#1089#1077#1082')'
      WordWrap = True
    end
    object LabelSpeed: TLabel
      Left = 318
      Top = 6
      Width = 12
      Height = 13
      Caption = '45'
    end
    object Label1: TLabel
      Left = 251
      Top = 82
      Width = 54
      Height = 13
      Caption = #1055#1083#1072#1074#1085#1086#1089#1090#1100
      WordWrap = True
    end
    object Label2: TLabel
      Left = 318
      Top = 74
      Width = 6
      Height = 13
      Caption = '1'
    end
    object Label3: TLabel
      Left = 138
      Top = 29
      Width = 20
      Height = 13
      Caption = 'Max'
    end
    object Label4: TLabel
      Left = 138
      Top = 63
      Width = 16
      Height = 13
      Caption = 'Min'
    end
    object LEditRad: TLabeledEdit
      Left = 12
      Top = 25
      Width = 121
      Height = 21
      EditLabel.Width = 100
      EditLabel.Height = 13
      EditLabel.Caption = #1056#1072#1076#1080#1091#1089' '#1086#1082#1088#1091#1078#1085#1086#1089#1090#1080
      TabOrder = 0
      Text = '100'
      OnKeyPress = LEditRadKeyPress
    end
    object TrackBarSpeed: TTrackBar
      Left = 314
      Top = 26
      Width = 362
      Height = 45
      Max = 90
      Min = 1
      Position = 45
      TabOrder = 1
      OnChange = TrackBarSpeedChange
    end
    object ButtonMove: TButton
      Left = 12
      Top = 86
      Width = 69
      Height = 36
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100
      TabOrder = 2
      OnClick = ButtonMoveClick
    end
    object TrackBar1: TTrackBar
      Left = 318
      Top = 93
      Width = 362
      Height = 45
      Max = 20
      Min = 1
      Position = 1
      TabOrder = 3
      OnChange = TrackBarSpeedChange
    end
    object Button1: TButton
      Left = 87
      Top = 86
      Width = 67
      Height = 35
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 4
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 12
      Top = 59
      Width = 121
      Height = 21
      TabOrder = 5
      Text = '30'
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
