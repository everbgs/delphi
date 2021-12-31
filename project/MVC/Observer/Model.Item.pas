unit Model.Item;

interface

uses
  Model.Interfaces;

type

  TModelItem = class(TInterfacedObject, IModelItem)
  private
    [Weak]
    FParent: IModelVenda;
    FCodigo: Integer;
  public
    constructor Create(Parent: IModelVenda);
    function Codigo(Value: Integer): IModelItem;
    function Vender: IModelItem;
    function &End: IModelVenda;
    class function New(Parent: IModelVenda): IModelItem;
  end;

implementation

uses
  Controller.Observer.Interfaces;

{ TModelItem }

function TModelItem.Codigo(Value: Integer): IModelItem;
begin
  Self.FCodigo := Value;
  Result := Self;
end;

constructor TModelItem.Create(Parent: IModelVenda);
begin
  Self.FParent := Parent;
end;

function TModelItem.&End: IModelVenda;
begin
  Result := Self.FParent;
end;

class function TModelItem.New(Parent: IModelVenda): IModelItem;
begin
  Result := Self.Create(Parent);
end;

function TModelItem.Vender: IModelItem;
var
  lVenda: TRecordItem;
begin
  Result := Self;

  lVenda.Quantidade := 1;
  lVenda.Valor := 25;
  case FCodigo of
    1: lVenda.Descricao := 'Feijão';
    2: lVenda.Descricao := 'Arroz Branco';
    3: lVenda.Descricao := 'Macarrao';
    4: lVenda.Descricao := 'Carne';
  end;
  FParent.ObserverItem.Notify(lVenda);
end;

end.
