program VendaTeste;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmPrincipal},
  Controller.Interfaces in 'Controller.Interfaces.pas',
  Controller.Vendas in 'Controller.Vendas.pas',
  Controller.Item in 'Controller.Item.pas',
  Model.Venda in 'Model.Venda.pas',
  Model.Item in 'Model.Item.pas',
  Model.Interfaces in 'Model.Interfaces.pas',
  Controller.Observer.Interfaces in 'Controller.Observer.Interfaces.pas',
  Controller.Observer.Item in 'Controller.Observer.Item.pas',
  uFrmListarItens in 'uFrmListarItens.pas' {FrmListarItens};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
