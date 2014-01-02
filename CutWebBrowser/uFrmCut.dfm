object FrmCut: TFrmCut
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cut Web Browser'
  ClientHeight = 501
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WB: TWebBrowser
    Left = 0
    Top = 0
    Width = 428
    Height = 402
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 217
    ExplicitHeight = 657
    ControlData = {
      4C0000003C2C00008C2900000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 402
    Width = 428
    Height = 99
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      428
      99)
    object Label1: TLabel
      Left = 112
      Top = 6
      Width = 52
      Height = 13
      Caption = 'PageWidth'
    end
    object Label2: TLabel
      Left = 112
      Top = 48
      Width = 66
      Height = 13
      Caption = 'HeaderHeight'
    end
    object Label3: TLabel
      Left = 208
      Top = 6
      Width = 69
      Height = 13
      Caption = 'ScrollbarWidth'
    end
    object Label4: TLabel
      Left = 208
      Top = 49
      Width = 63
      Height = 13
      Caption = 'FooterHeight'
    end
    object btnNavigate: TButton
      Left = 338
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Navigate'
      TabOrder = 0
      OnClick = btnNavigateClick
    end
    object btnCut: TButton
      Left = 6
      Top = 61
      Width = 75
      Height = 25
      Caption = 'CUT'
      TabOrder = 1
      OnClick = btnCutClick
    end
    object edWiki: TEdit
      Left = 112
      Top = 22
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '2'
    end
    object edHead: TEdit
      Left = 112
      Top = 65
      Width = 57
      Height = 21
      TabOrder = 3
      Text = '2'
    end
    object edScroll: TEdit
      Left = 208
      Top = 22
      Width = 57
      Height = 21
      TabOrder = 4
      Text = '560'
    end
    object edFoo: TEdit
      Left = 208
      Top = 65
      Width = 57
      Height = 21
      TabOrder = 5
      Text = '500'
    end
    object btnSair: TButton
      Left = 338
      Top = 61
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Sair'
      TabOrder = 6
      OnClick = btnSairClick
    end
  end
end
