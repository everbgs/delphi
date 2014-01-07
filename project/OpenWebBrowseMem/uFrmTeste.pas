unit uFrmTeste;

interface

uses
  Classes, Controls, OleCtrls, SHDocVw, Forms;


type
  TForm1 = class(TForm)
    WB: TWebBrowser;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ActiveX;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
const
  HTML = '<html>'+
           '<body>'+
            '<H1>T�tulo 1</H1>'+
            '<H2>T�tulo 2</H2>'+
            '<H3>T�tulo 3</H3>'+
            '<H4>T�tulo 4</H4>'+
            '<H5>T�tulo 5</H5>'+
            '<H6>T�tulo 6</H6>'+
           '</body>' +
         '</html>';
var
  intSi: IPersistStreamInit;
  oSa: IStream;
  oS: TStream;
begin
  WB.Navigate('about:blank');
  if (WB.Document.QueryInterface(IPersistStreamInit, intSi) = S_OK) then
  begin
    oS := TStringStream.Create(HTML);
    try
      oSa := TStreamAdapter.Create(oS);
      intSi.Load(oSa);
    finally
      oS.Free;
    end;
  end;
end;

end.
