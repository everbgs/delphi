unit xMonitor_U;

interface

uses
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox, Menus,
  ImgList, Controls, Classes, ActnList, RibbonLunaStyleActnCtrls, ActnMan,
  DBClient, ToolWin, ActnCtrls, ComCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ExtCtrls, Messages, Forms, Windows, StdCtrls;


  
const
  CM_XSERVERUPDATE = WM_USER + $1000;
  CM_XSERVERRESTART = CM_XSERVERUPDATE + 1;
  WM_REGISTERMONITOR = CM_XSERVERUPDATE + 2;
  WM_UNREGISTERMONITOR = CM_XSERVERUPDATE + 3;

type
  TFrmMonitor = class(TForm)
    cdsMsg: TClientDataSet;
    cdsMsgTipo: TIntegerField;
    cdsMsgBOClass: TStringField;
    cdsMsgMethod: TStringField;
    cdsMsgMsg: TStringField;
    dsMsg: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Tipo: TcxGridDBColumn;
    cxGrid1DBTableView1BOClass: TcxGridDBColumn;
    cxGrid1DBTableView1Method: TcxGridDBColumn;
    cxGrid1DBTableView1Msg: TcxGridDBColumn;
    Panel1: TPanel;
    cdsMsgData: TDateTimeField;
    cxGrid1DBTableView1Data: TcxGridDBColumn;
    StatusBar1: TStatusBar;
    ActionManager1: TActionManager;
    actLimpar: TAction;
    actSair: TAction;
    ImageList16: TImageList;
    MainMenu1: TMainMenu;
    mnArquivo: TMenuItem;
    mnSair: TMenuItem;
    ActionToolBar1: TActionToolBar;
    actParar: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnSairClick(Sender: TObject);
    procedure actLimparExecute(Sender: TObject);
    procedure actPararExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
  private
    // handler da janela do AppServer
    FAppServer: HWND;
    FReceberMsg: Boolean;

    procedure TratarMensagem(sMsg: string);
    procedure ConfigDataSet;
    procedure LimparMsg;
    procedure PararMsg;
    procedure Sair;
    function EnumWindowsProc(Wnd: HWND; memo: TMemo): BOOL; stdcall;
  protected
    procedure WMCopyData(var message: TWMCopyData); message WM_CopyData;
  public
    procedure RegisterMonitor;
    procedure UnRegisterMonitor;
  end;

var
  FrmMonitor: TFrmMonitor;

implementation

uses
  Types, SysUtils, HTTPUtil, Dialogs;



{$R *.dfm}

{ TForm1 }

procedure TFrmMonitor.actLimparExecute(Sender: TObject);
begin
  LimparMsg;
end;

procedure TFrmMonitor.actPararExecute(Sender: TObject);
begin
  PararMsg;
end;

procedure TFrmMonitor.actSairExecute(Sender: TObject);
begin
  Sair;
end;

procedure TFrmMonitor.ConfigDataSet;
begin
  if not cdsMsg.Active then
    cdsMsg.CreateDataSet;
  cdsMsg.LogChanges := False;
end;


function TFrmMonitor.EnumWindowsProc(Wnd: HWND; memo: TMemo): BOOL;
begin

end;

procedure TFrmMonitor.FormCreate(Sender: TObject);
begin
  FReceberMsg := True;

  // ConfigDataSet cria o cdsMsg, então deve ser o primeiro método
  ConfigDataSet;

  RegisterMonitor;
end;

procedure TFrmMonitor.FormDestroy(Sender: TObject);
begin
  UnRegisterMonitor;
end;

procedure TFrmMonitor.LimparMsg;
begin
  cdsMsg.EmptyDataSet;
end;

procedure TFrmMonitor.mnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMonitor.PararMsg;
begin
  FReceberMsg := not actParar.Checked;
end;

procedure TFrmMonitor.RegisterMonitor;
var
  iLen: Integer;
  sCaption: string;
  oMemo: TMemo;
begin
  FAppServer := FindWindow('TxFrmServerMain', nil);


  EnumWindows(@EnumWindowsProc, lParam(oMemo));


  iLen := GetWindowTextLength(FAppServer) + 1;
  SetLength(sCaption, iLen);
  GetWindowText(FAppServer,  PChar(sCaption), iLen);

  ShowMessage(sCaption);


  if FAppServer <= 0 then
  begin
    FAppServer := FindWindow(nil, 'EXTREMECODE Servidor de Aplicação');
    if FAppServer <= 0 then
      FAppServer := FindWindow(nil, 'ATSLOG Servidor de Aplicação');
  end;

  if FAppServer > 0 then
    SendMessage(FAppServer, WM_REGISTERMONITOR, Self.Handle, 0);
end;

procedure TFrmMonitor.Sair;
begin
  Application.Terminate;
end;

procedure TFrmMonitor.TratarMensagem(sMsg: string);
var
  i: integer;
  oDados: TStringDynArray;
begin
  // flag para parar de receber msgs
  if not FReceberMsg then
    exit;

  if sMsg = EmptyStr then
    exit;

  cdsMsg.Append;
  oDados := StringToStringArray(sMsg, '$');
  for i := low(oDados) to high(oDados) do
  begin
    // sempre na mesma ordem
    case i of
      0: cdsMsgBOClass.AsString := oDados[i];
      1: cdsMsgMethod.AsString := oDados[i];
      2: cdsMsgMsg.AsString := oDados[i];
      3: cdsMsgTipo.AsInteger := StrToIntDef(oDados[i], 0);
    end;
    cdsMsgData.AsDateTime := Now;
  end;
  cdsMsg.Post;
end;

procedure TFrmMonitor.UnRegisterMonitor;
begin
  if FAppServer > 0 then
    SendMessage(FAppServer, WM_UNREGISTERMONITOR, Self.Handle, 0);
end;

procedure TFrmMonitor.WMCopyData(var message: TWMCopyData);
var
  sStr: string;
begin
  // obtendo a mensagem
  sStr := PChar(message.CopyDataStruct.lpData);
  TratarMensagem(sStr);
end;

end.
