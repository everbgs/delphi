unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Controller.Interfaces,
  Controller.Observer.Interfaces;

type
  TFrmPrincipal = class(TForm, IObserverItem)
    edCodigoProduto: TEdit;
    ListBox1: TListBox;
    btnAbrirForm: TButton;
    Label1: TLabel;
    procedure edCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnAbrirFormClick(Sender: TObject);
  private
    FVenda: IControllerVenda;
    procedure VenderItem;
  public
    function UpdateItem(Valor: TRecordItem): IObserverItem;
    { Public declarations }

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  Controller.Vendas, uFrmListarItens;

{$R *.dfm}

procedure TFrmPrincipal.btnAbrirFormClick(Sender: TObject);
var
  lFrm: TFrmListarItens;
begin
  lFrm := TFrmListarItens.Create(Self);
  lFrm.ExibirForm(FVenda);
end;

procedure TFrmPrincipal.edCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    VenderItem;

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FVenda := TControllerVenda.New;
  FVenda.ObserverItem.Add(Self);
end;

function TFrmPrincipal.UpdateItem(Valor: TRecordItem): IObserverItem;
begin
  ListBox1.Items.Add(Valor.Descricao);
end;

procedure TFrmPrincipal.VenderItem;
begin
  FVenda
    .Item
    .Codigo(StrToInt(edCodigoProduto.Text))
    .Vender;

end;

end.
