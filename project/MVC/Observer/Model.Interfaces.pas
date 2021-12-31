unit Model.Interfaces;

interface

uses
  Controller.Observer.Interfaces;

type
  IModelItem = interface;

  IModelVenda = interface
    ['{17B6934F-E163-440F-AACD-7FCFCAABEAA1}']
    function Item: IModelItem;
    function ObserverItem(Value: ISubjectItem): IModelVenda; overload;
    function ObserverItem: ISubjectItem; overload;
  end;

  IModelItem = interface
    ['{BA202B18-2138-4F1B-9756-A8C911592F5B}']
    function Codigo(Value: Integer): IModelItem;
    function Vender: IModelItem;
    function &End: IModelVenda;
  end;


implementation

end.
