unit uFrmCut;

//Fonte http://www.delphigl.com/forum/viewtopic.php?t=6745

interface

uses
  StdCtrls, Controls, ExtCtrls, Classes, OleCtrls, SHDocVw, Forms;

type
  TFrmCut = class(TForm)
    WB: TWebBrowser;
    Panel1: TPanel;
    btnNavigate: TButton;
    btnCut: TButton;
    edWiki: TEdit;
    edHead: TEdit;
    edScroll: TEdit;
    edFoo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnSair: TButton;
    procedure btnNavigateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnCutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  var
    FrmCut: TFrmCut;

implementation

uses
  ActiveX, Types, Graphics, SysUtils;

{$R *.dfm}

procedure TFrmCut.btnCutClick(Sender: TObject);
var
  WikipediaWidth: Integer;
  ScrollbarWidth: Integer;
  HeaderHeight: Integer;
  FooterHeight: Integer;

  oViewObj: IViewObject;
  oRect: TRect;
  oBittmap: TBitmap;
  oFrm: TForm;
begin
  WikipediaWidth := StrToInt(edWiki.Text); //160
  ScrollbarWidth := StrToInt(edScroll.Text); //20
  HeaderHeight := StrToInt(edHead.Text); //50
  FooterHeight := StrToInt(edFoo.Text); //176

  if WB.Width < ScrollbarWidth then
    ScrollbarWidth := 0;
  if WB.Height < FooterHeight then
    FooterHeight := 0;



  if Assigned(WB.Document) then
  begin
    WB.Document.QueryInterface(IViewObject, oViewObj) ;
    if Assigned(oViewObj) then
    begin
      try
        oBittmap := TBitmap.Create;
        try
          oRect := Rect(0, 0, WB.Width, WB.Height) ;

          oBittmap.Height := WB.Height;
          oBittmap.Width := WB.Width;


          oViewObj.Draw(DVASPECT_CONTENT, 1, nil, nil, Application.Handle, oBittmap.Canvas.Handle, @oRect, nil, nil, 0) ;

           { Crop out the left-hand side Wikipedia banner, header, scrollbar and footer... }
          oBittmap.Canvas.CopyRect (Rect (0,0,WB.Width - (WikipediaWidth + ScrollbarWidth),WB.Height - (HeaderHeight + FooterHeight)),oBittmap.Canvas,Rect (WikipediaWidth,HeaderHeight,WB.Width - ScrollbarWidth,WB.Height - FooterHeight));
          oBittmap.Width := WB.Width - (WikipediaWidth + ScrollBarWidth);
          oBittmap.Height := WB.Height - (HeaderHeight + FooterHeight);


          oFrm := TForm.Create(nil);
          try

            oFrm.WindowState := wsMaximized;
            with TImage.Create(oFrm) do
            begin
              Parent := oFrm;
              Align := alClient;
              AutoSize := True;
              Center := True;
              Picture.Assign(oBittmap);
            end;
            oFrm.Visible := False;
            oFrm.ShowModal;
          finally
            oFrm.Free;
          end;
        finally
          oBittmap.Free;
        end;
      finally
        oViewObj._Release;
      end;
    end;
  end;
end;

procedure TFrmCut.btnNavigateClick(Sender: TObject);
begin
  WB.Navigate ('http://en.wikipedia.org/wiki/GitHub');
end;

procedure TFrmCut.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCut.FormShow(Sender: TObject);
begin
  btnNavigate.Click;
end;

end.
