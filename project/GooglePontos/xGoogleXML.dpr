program xGoogleXML;

uses
  Forms,
  xFrmMaps_U in 'xFrmMaps_U.pas' {xFrmMaps};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TxFrmMaps, xFrmMaps);
  Application.Run;
end.
