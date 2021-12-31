unit Controller.Vendas;

interface

uses
  Controller.Interfaces, Model.Venda, Model.Interfaces,
  Controller.Observer.Interfaces;

type

  TControllerVenda = class(TInterfacedObject, IControllerVenda)
  private
    FItem: IControllerItem;
    FModel: iModelVenda;
    FObserverItem: ISubjectItem;
  public
    constructor Create;
    function Item: IControllerItem;
    function Model: IModelVenda;
    function ObserverItem: ISubjectItem;
    class function New: IControllerVenda;
  end;




implementation

uses
  Controller.Item, Controller.Observer.Item;

{ TControllerVenda }

constructor TControllerVenda.Create;
begin
  FItem := TControllerItem.New(Self);
  FModel := TModelVenda.New;
  FObserverItem := TControllerObserverItem.New;
  FModel.ObserverItem(FObserverItem);
end;

function TControllerVenda.Item: IControllerItem;
begin
  Result := Self.FItem;
end;

function TControllerVenda.Model: IModelVenda;
begin
  Result := FModel;
end;

class function TControllerVenda.New: IControllerVenda;
begin
  Result := Self.Create;
end;

function TControllerVenda.ObserverItem: ISubjectItem;
begin
  Result := FObserverItem;
end;

end.
