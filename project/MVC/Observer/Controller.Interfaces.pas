unit Controller.Interfaces;

interface

uses
  Model.Interfaces, Controller.Observer.Interfaces;

type
  IControllerItem = interface;

  IControllerVenda = interface
    ['{2C110DE9-CA42-4D8A-9E9D-EF1F75B4F521}']
    function Item: IControllerItem;
    function Model: IModelVenda;
    function ObserverItem: ISubjectItem;
  end;

  IControllerItem = interface
    ['{81CE57FA-CD45-4E3D-92AC-1BEF3E2DF7A6}']
    function Codigo(Value: Integer): IControllerItem;
    function Vender: IControllerItem;
    function &End: IControllerVenda;
  end;


implementation

end.
