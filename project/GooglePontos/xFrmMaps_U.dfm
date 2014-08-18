object xFrmMaps: TxFrmMaps
  Left = 0
  Top = 0
  Caption = 'Rotorizar'
  ClientHeight = 419
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    460
    419)
  PixelsPerInch = 96
  TextHeight = 13
  object btnRotorizar: TButton
    Left = 8
    Top = 112
    Width = 71
    Height = 25
    Caption = 'Rotorizar'
    TabOrder = 0
    OnClick = btnRotorizarClick
  end
  object mLog: TMemo
    Left = 8
    Top = 160
    Width = 444
    Height = 251
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 1
    ExplicitWidth = 524
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 217
    Height = 89
    Caption = 'Origem'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 56
      Width = 47
      Height = 13
      Caption = 'Longitude'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Latitude: TLabel
      Left = 8
      Top = 29
      Width = 39
      Height = 13
      Caption = 'Latitude'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edLatO: TEdit
      Left = 61
      Top = 26
      Width = 140
      Height = 21
      TabOrder = 0
    end
    object edLonO: TEdit
      Left = 61
      Top = 53
      Width = 140
      Height = 21
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 231
    Top = 8
    Width = 217
    Height = 89
    Caption = 'Destino'
    TabOrder = 3
    object Label3: TLabel
      Left = 8
      Top = 29
      Width = 39
      Height = 13
      Caption = 'Latitude'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 56
      Width = 47
      Height = 13
      Caption = 'Longitude'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edLatD: TEdit
      Left = 61
      Top = 26
      Width = 140
      Height = 21
      TabOrder = 0
    end
    object edLonD: TEdit
      Left = 61
      Top = 53
      Width = 140
      Height = 21
      TabOrder = 1
    end
  end
  object btnClear: TButton
    Left = 85
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 4
    OnClick = btnClearClick
  end
end
