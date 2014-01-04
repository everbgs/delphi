program CutWB;

uses
  Forms,
  uFrmCut in 'uFrmCut.pas' {FrmCut};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmCut, FrmCut);
  Application.Run;
end.
