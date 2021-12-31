unit Controller.Observer.Interfaces;

interface

type
  TRecordItem = record
    Descricao: string;
    Quantidade: Integer;
    Valor: Currency;
  end;

  IObserverItem = interface
    ['{842342C4-A005-4A95-8353-DE570A9A4C2D}']
    function UpdateItem(Valor: TRecordItem): IObserverItem;
  end;

  ISubjectItem = interface
    ['{19D061E5-35B3-4E3C-A12A-E9D286A62714}']
    function Add(Value: IObserverItem): ISubjectItem;
    function Notify(Value: TRecordItem): ISubjectItem;
  end;

implementation

end.
