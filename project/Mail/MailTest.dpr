program MailTest;

uses
  Forms,
  uFrmTeste in 'uFrmTeste.pas' {FrmTeste},
  BgsMail in 'BgsMail.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmTeste, FrmTeste);
  Application.Run;
end.
