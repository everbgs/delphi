unit Controller.Item;

interface

uses
  Controller.Interfaces;

type

  TControllerItem = class(TInterfacedObject, IControllerItem)
  private
    [Weak]
    FParent: IControllerVenda;
    FCodigo: Integer;
  public
    constructor Create(Parent: IControllerVenda);
    function Codigo(Value: Integer): IControllerItem;
    function Vender: IControllerItem;
    function &End: IControllerVenda;
    class function New(Parent: IControllerVenda): IControllerItem;
  end;

implementation

{ TControllerItem }

function TControllerItem.Codigo(Value: Integer): IControllerItem;
begin
  Self.FCodigo := Value;
  Result := Self;
end;

constructor TControllerItem.Create(Parent: IControllerVenda);
begin
  Self.FParent := Parent;
end;

function TControllerItem.&End: IControllerVenda;
begin
  Result := Self.FParent;
end;

class function TControllerItem.New(Parent: IControllerVenda): IControllerItem;
begin
  Result := Self.Create(Parent);
end;

function TControllerItem.Vender: IControllerItem;
begin
  Result := Self;
  FParent
    .Model
      .Item
      .Codigo(FCodigo)
      .Vender;
end;

end.
