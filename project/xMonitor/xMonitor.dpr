program xMonitor;

uses
  MidasLib,
  Forms,
  xMonitor_U in 'xMonitor_U.pas' {FrmMonitor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMonitor, FrmMonitor);
  Application.Run;
end.
