unit uFrmGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, ImgList;

type
  TFrmGrid = class(TForm)
    cdsGrid: TClientDataSet;
    ds: TDataSource;
    cdsGridID: TIntegerField;
    cdsGridDS: TStringField;
    cdsGridVLR: TCurrencyField;
    cdsGridTP: TIntegerField;
    ImageList16: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure CriarGrid;
  public
    { Public declarations }
  end;

var
  FrmGrid: TFrmGrid;

implementation

uses
  cxGrid, cxGridLevel, cxGridDBTableView, cxImageComboBox;

{$R *.dfm}

procedure TFrmGrid.CriarGrid;
var
  oGrid: TcxGrid;
  oLevel: TcxGridLevel;
  oView: TcxGridDBTableView;
  oCombo: TcxImageComboBox;
  cbItems: TcxImageComboBoxItems;
begin
  oGrid := TcxGrid.Create(Self);
  oGrid.Parent := Self;
  oGrid.Align := alClient;
  oGrid.Name := 'grid';

  oLevel := oGrid.Levels.Add;
  oLevel.Name := 'level';

  oView := oGrid.CreateView(TcxGridDBTableView) as TcxGridDBTableView;
  oView.Name := 'view';
  oView.OptionsData.Deleting := False;
  oView.OptionsData.Editing := False;
  oView.OptionsData.Inserting := False;
  oView.OptionsView.ColumnAutoWidth := True;

  oLevel.GridView := oView;
  oView.DataController.DataSource := ds;
  oView.DataController.CreateAllItems;
  oView.ApplyBestFit;

  oCombo := TcxImageComboBox.Create(oView);
  oCombo.Properties.Images := ImageList16;
  cbItems := oCombo.Properties.Items;
  with cbItems.Add do
  begin
    Value := 0;
    Description := 'Erro';
    ImageIndex := 0;
  end;
  with cbItems.Add do
  begin
    Value := 1;
    Description := 'Confirmação';
    ImageIndex := 1;
  end;
  with cbItems.Add do
  begin
    Value := 2;
    Description := 'Aviso';
    ImageIndex := 2;
  end;
  with cbItems.Add do
  begin
    Value := 3;
    Description := 'Execução';
    ImageIndex := 3;
  end;
  with cbItems.Add do
  begin
    Value := 4;
    Description := 'Informação';
    ImageIndex := 4;
  end;
  with cbItems.Add do
  begin
    Value := 5;
    Description := 'Informação OK';
    ImageIndex := 5;
  end;
   with cbItems.Add do
  begin
    Value := 6;
    Description := 'Personalizado';
    ImageIndex := 6;
  end;
  oView.GetColumnByFieldName('TP').PropertiesClass := TcxImageComboBoxProperties;
  oView.GetColumnByFieldName('TP').Properties := oCombo.Properties;
end;

procedure TFrmGrid.FormCreate(Sender: TObject);
begin
  if (not cdsGrid.Active) then
    cdsGrid.CreateDataSet;

  CriarGrid;
end;

procedure TFrmGrid.FormShow(Sender: TObject);
begin
  cdsGrid.AppendRecord([1, 'Teste 1', 56894, 1]);
  cdsGrid.AppendRecord([2, 'Teste 2', 4654, 2]);
  cdsGrid.AppendRecord([3, 'Teste 3', 45, 3]);
  cdsGrid.AppendRecord([4, 'Teste 4', 12, 4]);
  cdsGrid.AppendRecord([5, 'Teste 5', 5, 5]);
  cdsGrid.AppendRecord([6, 'Teste 6', 7, 6]);


end;

end.
