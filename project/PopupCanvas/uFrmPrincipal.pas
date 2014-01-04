unit uFrmPrincipal;

interface

uses
  StdCtrls, Classes, Controls, ExtCtrls, Forms, dxGDIPlusClasses;

type
  TFrmPrincipal = class(TForm)
    img1: TImage;
    Label1: TLabel;
    procedure img1MouseEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FCreated: Boolean;
    procedure DoMouseLeave(Sender: TObject);
    procedure DoPaint(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  Types, Graphics, Windows;

{$R *.dfm}

procedure TFrmPrincipal.DoMouseLeave(Sender: TObject);
begin
  if (Sender is TForm) then
    TForm(Sender).Close;
end;

procedure TFrmPrincipal.DoPaint(Sender: TObject);
var
  oFrm: TForm;
  oRect: TRect;
begin
  oFrm := TForm(Sender);

  oRect.Left := 1;
  oRect.Top := 20;
  oRect.Bottom := oFrm.Height;
  oRect.Right := oFrm.Width - 10;
  oFrm.Canvas.Brush.Color := clWhite;
  oFrm.Canvas.FillRect(oRect);

  oFrm.Canvas.TextOut(10, 25, 'Carregando...');

  {oRect.Left := 1;
  oRect.Top := 20;
  oRect.Bottom := oFrm.Height;
  oRect.Right := oFrm.Width - 10;
  oFrm.Canvas.Brush.Color := clWhite;
  oFrm.Canvas.FillRect(oRect);}

  oFrm.Canvas.Pen.Color := clBlack;

  oFrm.Canvas.MoveTo(1, 20);
  oFrm.Canvas.LineTo(30, 20);

  oFrm.Canvas.MoveTo(60, 20);
  oFrm.Canvas.LineTo(oFrm.Width - 10, 20);

  oFrm.Canvas.MoveTo(oFrm.Width - 10, 20);
  oFrm.Canvas.LineTo(oFrm.Width - 10, oFrm.Height);

  oFrm.Canvas.MoveTo(1, 20);
  oFrm.Canvas.LineTo(1, oFrm.Height);

  oFrm.Canvas.MoveTo(1, oFrm.Height - 1);
  oFrm.Canvas.LineTo(oFrm.Width - 10, oFrm.Height - 1);

  //seta
  oFrm.Canvas.Pen.Width := 1;
  oFrm.Canvas.MoveTo(30, 20);
  oFrm.Canvas.LineTo(45, 1);
  oFrm.Canvas.MoveTo(60, 20);
  oFrm.Canvas.LineTo(45, 1);

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FCreated := False;
end;

procedure TFrmPrincipal.img1MouseEnter(Sender: TObject);
var
  oForm: TForm;
  oPt: TPoint;
begin
  if (FCreated) then
    Exit;

  FCreated := True;
  oForm := TForm.Create(nil);
  try
    oForm.FormStyle := fsNormal;
    oForm.BorderStyle := bsNone;

    GetCursorPos(oPt);
    oPt := oForm.ScreenToClient(oPt);
    oForm.Top := oPt.Y + 5;
    //oForm.Top := img1.Top + img1.Height + 5;
    oForm.Left := oPt.X - 25;
    oForm.OnPaint := DoPaint;
    oForm.OnMouseLeave := DoMouseLeave;
    oForm.Height := 400;
    oForm.Width := 300;
    oForm.ShowModal;
  finally
    oForm.Free;
    FCreated := False;
  end;
end;

end.
