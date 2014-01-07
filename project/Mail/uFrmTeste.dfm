object FrmTeste: TFrmTeste
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Envio de Email'
  ClientHeight = 646
  ClientWidth = 510
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 24
    Top = 146
    Width = 22
    Height = 13
    Caption = 'Para'
  end
  object Label7: TLabel
    Left = 24
    Top = 195
    Width = 51
    Height = 13
    Caption = 'FromName'
  end
  object Label8: TLabel
    Left = 24
    Top = 226
    Width = 36
    Height = 13
    Caption = 'Subject'
  end
  object btnVer: TSpeedButton
    Left = 455
    Top = 143
    Width = 26
    Height = 22
    Caption = 'V'
    OnClick = btnVerClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 473
    Height = 129
    Caption = 'Configura'#231#245'es Gerais'
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 21
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object Label2: TLabel
      Left = 320
      Top = 21
      Width = 26
      Height = 13
      Caption = 'Porta'
    end
    object Label3: TLabel
      Left = 16
      Top = 59
      Width = 60
      Height = 13
      Caption = 'Email Cliente'
    end
    object Label4: TLabel
      Left = 16
      Top = 96
      Width = 48
      Height = 13
      Caption = 'Username'
    end
    object Label5: TLabel
      Left = 231
      Top = 96
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object edPwd: TEdit
      Left = 283
      Top = 93
      Width = 174
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
    end
    object edPort: TEdit
      Left = 352
      Top = 18
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object edUser: TEdit
      Left = 82
      Top = 93
      Width = 143
      Height = 21
      TabOrder = 2
    end
    object edHost: TEdit
      Left = 140
      Top = 18
      Width = 165
      Height = 21
      TabOrder = 3
    end
    object edMailCli: TEdit
      Left = 82
      Top = 56
      Width = 375
      Height = 21
      TabOrder = 4
    end
    object cbkSSL: TCheckBox
      Left = 16
      Top = 20
      Width = 65
      Height = 17
      Caption = 'Usar SSL'
      TabOrder = 5
    end
  end
  object mFrom: TMemo
    Left = 90
    Top = 143
    Width = 359
    Height = 25
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object edFromName: TEdit
    Left = 90
    Top = 192
    Width = 375
    Height = 21
    TabOrder = 2
  end
  object edSubject: TEdit
    Left = 90
    Top = 219
    Width = 375
    Height = 21
    TabOrder = 3
  end
  object mBody: TMemo
    Left = 24
    Top = 256
    Width = 441
    Height = 329
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object btnEnviar: TButton
    Left = 406
    Top = 600
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 5
    OnClick = btnEnviarClick
  end
end
