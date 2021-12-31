unit Controller.Observer.Item;

interface

uses
  Controller.Observer.Interfaces, System.Generics.Collections;

type
  TControllerObserverItem = class(TInterfacedObject, ISubjectItem)
  private
    FList: TList<IObserverItem>;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(Value: IObserverItem): ISubjectItem;
    function Notify(Value: TRecordItem): ISubjectItem;
    class function New: ISubjectItem;
  end;


implementation

uses
  System.SysUtils;

{ TControllerObserverItem }

function TControllerObserverItem.Add(Value: IObserverItem): ISubjectItem;
begin
  Result := Self;
  FList.Add(Value);
end;

constructor TControllerObserverItem.Create;
begin
  FList := TList<IObserverItem>.Create
end;

destructor TControllerObserverItem.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

class function TControllerObserverItem.New: ISubjectItem;
begin
  Result := Self.Create;
end;

function TControllerObserverItem.Notify(Value: TRecordItem): ISubjectItem;
var
  I: Integer;
begin
  Result := Self;
  for I := 0 to Pred(FList.Count) do
    FList[I].UpdateItem(Value);
end;

end.
