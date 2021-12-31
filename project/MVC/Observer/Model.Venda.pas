unit Model.Venda;

interface


uses
  Model.Interfaces, Controller.Observer.Interfaces;

type

  TModelVenda = class(TInterfacedObject, IModelVenda)
  private
    FItem: IModelItem;
    FObserverItem: ISubjectItem;
  public
    constructor Create;
    function Item: IModelItem;
    function ObserverItem(Value: ISubjectItem): IModelVenda; overload;
    function ObserverItem: ISubjectItem; overload;
    class function New: IModelVenda;
  end;




implementation

uses
  Model.Item;

{ TModelVenda }

constructor TModelVenda.Create;
begin
  FItem := TModelItem.New(Self);
end;

function TModelVenda.Item: IModelItem;
begin
  Result := Self.FItem;
end;

class function TModelVenda.New: IModelVenda;
begin
  Result := Self.Create;
end;

function TModelVenda.ObserverItem: ISubjectItem;
begin
  Result := FObserverItem;
end;

function TModelVenda.ObserverItem(Value: ISubjectItem): IModelVenda;
begin
 FObserverItem := Value;
end;

end.
