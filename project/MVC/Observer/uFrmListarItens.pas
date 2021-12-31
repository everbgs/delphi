unit uFrmListarItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Controller.Observer.Interfaces, System.Classes, Controller.Interfaces;

type
  TFrmListarItens = class(TForm, IObserverItem)
    ListBox1: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FVenda: IControllerVenda;
  public
    function UpdateItem(Valor: TRecordItem): IObserverItem;
    procedure ExibirForm(Parent: IControllerVenda);
  end;

implementation


{$R *.dfm}

{ TForm1 }

procedure TFrmListarItens.ExibirForm(Parent: IControllerVenda);
begin
  FVenda := Parent;
  FVenda.ObserverItem.Add(Self);
  Self.Show;
end;

procedure TFrmListarItens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmListarItens.UpdateItem(Valor: TRecordItem): IObserverItem;
begin
  ListBox1.Items.add(Valor.Descricao + ' - ' +IntToStr(Valor.Quantidade) + ': '+FloatToStr(Valor.Valor));
end;

end.
