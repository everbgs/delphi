object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Venda Caixa'
  ClientHeight = 232
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    549
    232)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 31
    Width = 142
    Height = 13
    Caption = 'Insira um c'#243'digo e tecle enter'
  end
  object edCodigoProduto: TEdit
    Left = 8
    Top = 8
    Width = 434
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnKeyDown = edCodigoProdutoKeyDown
  end
  object ListBox1: TListBox
    Left = 8
    Top = 48
    Width = 434
    Height = 176
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object btnAbrirForm: TButton
    Left = 448
    Top = 6
    Width = 73
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Listar Itens'
    TabOrder = 2
    OnClick = btnAbrirFormClick
  end
end
