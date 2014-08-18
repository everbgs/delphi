unit xFrmMaps_U;

interface

uses Controls, StdCtrls, Classes, Forms;

type
  TxFrmMaps = class(TForm)
    btnRotorizar: TButton;
    mLog: TMemo;
    Latitude: TLabel;
    edLatO: TEdit;
    Label1: TLabel;
    edLonO: TEdit;
    edLatD: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edLonD: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btnClear: TButton;
    procedure btnRotorizarClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Publc declarations }
  end;

var
  xFrmMaps: TxFrmMaps;

implementation

uses
  IdURI, IdHTTP, SysUtils;

{$R *.dfm}

procedure TxFrmMaps.btnRotorizarClick(Sender: TObject);
var
  oHttp: TIdHTTP;
  s, sUrl: string;
begin
  oHttp := TIdHTTP.Create(nil);
  try
    oHttp.ConnectTimeout := 3000;
    oHttp.ReadTimeout := 10000;

    {with oHttp.ProxyParams.Create do
    begin
      ProxyServer := '';
      ProxyPort := ;
      ProxyUsername := '';
      ProxyPassword := '';
      BasicAuthentication := ;
    end;}

    sUrl := 'http://maps.google.com/maps/api/directions/xml';
    sUrl := sUrl + '?origin='+edLatO.Text+','+edLonO.Text;
    sUrl := sUrl + '&destination='+edLatD.Text+','+edLonD.Text+'&sensor=false';

    sUrl := TIdURI.URLEncode(sUrl);
    s := oHttp.Get(sUrl);
    try
      mLog.Lines.Clear;
      mLog.Lines.Append(s);
    except
      mLog.Lines.Add('*** ERRO FATAL ***');
      mLog.Lines.Add(Exception(ExceptObject).Message);
    end;
  finally
    oHttp.Disconnect;
    oHttp.Free;
  end;
end;

procedure TxFrmMaps.btnClearClick(Sender: TObject);
begin
  mLog.Lines.Clear;
end;

end.
