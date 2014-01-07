unit BgsMail;

interface

uses
  Classes, IdMessage, IdSMTP, IdSSLOpenSSL;

type

  TBgsMail = class(TComponent)
  private
    FFromName: string;
    FFromAddress: string;
    FSubject: string;
    FHost: string;
    FPort: Integer;
    FPassword: string;
    FUserName: string;
    FBody: string;
    FIdMessage: TIdMessage;
    FUseSSL: Boolean;
  public
    procedure Send;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddFromAddress(sEmail: string);
    property FromAddress: string read FFromAddress write FFromAddress;
    property Subject: string read FSubject write FSubject;
    property Body: string read FBody write FBody;
    property Host: string read FHost write FHost;
    property Port: Integer read FPort write FPort;
    property Password: string read FPassword write FPassword;
    property UserName: string read FUserName write FUserName;
    property FromName: string read FFromName write FFromName;
    property UseSSL: Boolean read FUseSSL write FUseSSL;
  end;

implementation

uses
  SysUtils, IdGlobal, IdExplicitTLSClientServerBase;

{ TBgsMail }

procedure TBgsMail.AddFromAddress(sEmail: string);
begin
  with FIdMessage.Recipients.Add do
    Address := sEmail;
end;

constructor TBgsMail.Create(AOwner: TComponent);
begin
  inherited;
  FIdMessage := TIdMessage.Create(nil);
end;

destructor TBgsMail.Destroy;
begin
  if Assigned(FIdMessage) then
    FreeAndNil(FIdMessage);
  inherited;
end;

procedure TBgsMail.Send;
var
  oIdSMTP: TIdSMTP;
  IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  inherited;
  IdSSLIOHandlerSocketOpenSSL := nil;
  oIdSMTP := TIdSMTP.Create(nil);
  try
    FIdMessage.Body.Append(FBody);
    FIdMessage.Subject := FSubject;
    FIdMessage.From.Name := FFromName;
    FIdMessage.From.Address := FFromAddress;
    FIdMessage.ContentType := 'text/html';
    FIdMessage.Priority := mpNormal;

    oIdSMTP.Host := FHost;
    oIdSMTP.Port := FPort;
    oIdSMTP.Password := FPassword;
    oIdSMTP.Username := FUserName;


    if (FUseSSL) then
    begin
      IdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      try
        IdSSLIOHandlerSocketOpenSSL.Destination := FHost + ':' + IntToStr(FPort);
        IdSSLIOHandlerSocketOpenSSL.Host := FHost;
        IdSSLIOHandlerSocketOpenSSL.MaxLineAction := maException;
        IdSSLIOHandlerSocketOpenSSL.Port := FPort;
        IdSSLIOHandlerSocketOpenSSL.DefaultPort := 0;
        IdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvTLSv1;
        IdSSLIOHandlerSocketOpenSSL.SSLOptions.Mode := sslmUnassigned;
        IdSSLIOHandlerSocketOpenSSL.SSLOptions.VerifyMode := [];
        IdSSLIOHandlerSocketOpenSSL.SSLOptions.VerifyDepth := 0;
        oIdSMTP.IOHandler := IdSSLIOHandlerSocketOpenSSL;
      except
        IdSSLIOHandlerSocketOpenSSL.Free;
        raise
      end;
      oIdSMTP.UseTLS := utUseExplicitTLS;
    end;
    oIdSMTP.Connect;
    oIdSMTP.Send(FIdMessage);
    oIdSMTP.Disconnect;
  finally
    oIdSMTP.Free;
    if Assigned(IdSSLIOHandlerSocketOpenSSL) then
      IdSSLIOHandlerSocketOpenSSL.Free;
  end;
end;

end.
