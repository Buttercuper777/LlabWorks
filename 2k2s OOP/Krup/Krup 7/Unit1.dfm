object Form1: TForm1
  Left = 694
  Top = 210
  Caption = #1047#1072#1076#1072#1085#1080#1077' 7'
  ClientHeight = 242
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 208
    Top = 48
    Width = 22
    Height = 21
    Caption = 'X+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 208
    Top = 80
    Width = 22
    Height = 21
    Caption = 'X+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 208
    Top = 112
    Width = 22
    Height = 21
    Caption = 'X+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 288
    Top = 48
    Width = 22
    Height = 21
    Caption = 'Y+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 288
    Top = 80
    Width = 22
    Height = 21
    Caption = 'Y+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 288
    Top = 112
    Width = 22
    Height = 21
    Caption = 'Y+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 368
    Top = 48
    Width = 22
    Height = 21
    Caption = 'Z='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 368
    Top = 80
    Width = 22
    Height = 21
    Caption = 'Z='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 368
    Top = 112
    Width = 22
    Height = 21
    Caption = 'Z='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button_open: TButton
    Left = 40
    Top = 48
    Width = 89
    Height = 49
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 0
    Visible = False
    OnClick = Button_openClick
  end
  object Button_close: TButton
    Left = 568
    Top = 112
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Enabled = False
    TabOrder = 1
    OnClick = Button_closeClick
  end
  object Button_OpenFile: TButton
    Left = 40
    Top = 112
    Width = 89
    Height = 25
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
    TabOrder = 2
    Visible = False
    OnClick = Button_OpenFileClick
  end
  object Edita11: TEdit
    Tag = 1
    Left = 160
    Top = 48
    Width = 41
    Height = 21
    TabOrder = 3
    Text = '9'
    OnKeyPress = Edita11KeyPress
  end
  object Edita21: TEdit
    Tag = 5
    Left = 160
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 4
    Text = '2'
    OnKeyPress = Edita11KeyPress
  end
  object Edita31: TEdit
    Tag = 9
    Left = 160
    Top = 112
    Width = 41
    Height = 21
    TabOrder = 5
    Text = '-5'
    OnKeyPress = Edita11KeyPress
  end
  object Edita12: TEdit
    Tag = 2
    Left = 240
    Top = 48
    Width = 41
    Height = 21
    TabOrder = 6
    Text = '-12'
    OnKeyPress = Edita11KeyPress
  end
  object Edita22: TEdit
    Tag = 6
    Left = 240
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 7
    Text = '-19'
    OnKeyPress = Edita11KeyPress
  end
  object Edita32: TEdit
    Tag = 10
    Left = 240
    Top = 112
    Width = 41
    Height = 21
    TabOrder = 8
    Text = '-26'
    OnKeyPress = Edita11KeyPress
  end
  object Edita13: TEdit
    Tag = 3
    Left = 320
    Top = 48
    Width = 41
    Height = 21
    TabOrder = 9
    Text = '-33'
    OnKeyPress = Edita11KeyPress
  end
  object Edita23: TEdit
    Tag = 7
    Left = 320
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 10
    Text = '-40'
    OnKeyPress = Edita11KeyPress
  end
  object Edita33: TEdit
    Tag = 11
    Left = 320
    Top = 112
    Width = 41
    Height = 21
    TabOrder = 11
    Text = '-47'
    OnKeyPress = Edita11KeyPress
  end
  object Editb1: TEdit
    Tag = 4
    Left = 392
    Top = 48
    Width = 41
    Height = 21
    TabOrder = 12
    Text = '-54'
    OnKeyPress = Edita11KeyPress
  end
  object Editb2: TEdit
    Tag = 8
    Left = 392
    Top = 80
    Width = 41
    Height = 21
    TabOrder = 13
    Text = '-61'
    OnKeyPress = Edita11KeyPress
  end
  object Editb3: TEdit
    Tag = 12
    Left = 392
    Top = 112
    Width = 41
    Height = 21
    TabOrder = 14
    Text = '-68'
    OnKeyPress = Edita11KeyPress
  end
  object StringGrid1: TStringGrid
    Left = 448
    Top = 48
    Width = 201
    Height = 57
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    TabOrder = 15
  end
  object Button_Solve: TButton
    Left = 448
    Top = 112
    Width = 105
    Height = 25
    Caption = #1056#1077#1096#1080#1090#1100
    TabOrder = 16
    OnClick = Button_SolveClick
  end
  object ButtonShow: TButton
    Left = 448
    Top = 152
    Width = 105
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1082#1085#1086
    TabOrder = 17
    OnClick = ButtonShowClick
  end
  object ButtonFill: TButton
    Left = 352
    Top = 152
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100
    TabOrder = 18
    OnClick = ButtonFillClick
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.xlsx'
    Filter = '*.xlsx'
    Left = 64
    Top = 160
  end
end
