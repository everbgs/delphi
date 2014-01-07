unit uFrmTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmTeste = class(TForm)
    edPwd: TEdit;
    edPort: TEdit;
    edUser: TEdit;
    edHost: TEdit;
    edMailCli: TEdit;
    GroupBox1: TGroupBox;
    cbkSSL: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    mFrom: TMemo;
    Label6: TLabel;
    edFromName: TEdit;
    edSubject: TEdit;
    mBody: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    btnEnviar: TButton;
    btnVer: TSpeedButton;
    procedure btnVerClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTeste: TFrmTeste;

implementation

uses
  BgsMail;

{$R *.dfm}

procedure TFrmTeste.btnEnviarClick(Sender: TObject);
var
  I: Integer;
begin
  with TBgsMail.Create(nil) do
  try
    UseSSL := cbkSSL.Checked;
    Host := edHost.Text;
    Port := StrToIntDef(edPort.Text, 0);
    FromName := edFromName.Text;
    FromAddress := edMailCli.Text;
    UserName := edUser.Text;
    Password := edPwd.Text;
    Subject := edSubject.Text;
    for I := 0 to mFrom.Lines.Count - 1 do
      AddFromAddress(mFrom.Lines.Strings[I]);
    Body := mBody.Lines.Text;
    try
      Send;
      MessageDlg('Email enviado com sucesso', mtInformation, [mbOK], 0);
    except
      MessageDlg('Erro: ' + Exception(ExceptObject).Message, mtError, [mbOK], 0);
    end;
  finally
    Free;
  end;
end;

procedure TFrmTeste.btnVerClick(Sender: TObject);
begin
  ShowMessage(mFrom.Lines.Text);
end;

end.
