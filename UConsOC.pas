unit UConsOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Db, DBTables, MemTable,
  Grids, DBGrids, RXDBCtrl, RzTabs, RxLookup, SMDBGrid, DBVGrids;

type
  TfConsOC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    mOC: TMemoryTable;
    mOCNumOC: TIntegerField;
    mOCDtEmissao: TDateField;
    mOCCodForn: TIntegerField;
    mOCVlrTotal: TFloatField;
    mOCVlrMercEntr: TFloatField;
    mOCVlrMercAberto: TFloatField;
    mOClkFornecedor: TStringField;
    mOCDtEntrega: TDateField;
    msOC: TDataSource;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    qOrdem: TQuery;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    qOrdemCodForn: TIntegerField;
    qOrdemNomeForn: TStringField;
    qOrdemNumOC: TIntegerField;
    qOrdemNomeCor: TStringField;
    qOrdemCodMaterial: TIntegerField;
    qOrdemNomeMaterial: TStringField;
    qOrdemCodCor: TIntegerField;
    qOrdemItem: TIntegerField;
    qOrdemQtd: TFloatField;
    qOrdemVlrUnitario: TFloatField;
    qOrdemDtEntrega: TDateField;
    qOrdemVlrTotal: TFloatField;
    qOrdemQtdEntregue: TFloatField;
    qOrdemQtdRestante: TFloatField;
    dsqOrdem: TDataSource;
    qOrdemclVlrRestante: TFloatField;
    Label3: TLabel;
    ComboBox2: TComboBox;
    Bevel1: TBevel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    qOrdemDtEmissao: TDateField;
    VDBGrid1: TVDBGrid;
    tOrdemCompraItemGrade: TTable;
    tOrdemCompraItemGradeCodigo: TIntegerField;
    tOrdemCompraItemGradeItem: TIntegerField;
    tOrdemCompraItemGradeCodGrade: TIntegerField;
    tOrdemCompraItemGradePosicao: TIntegerField;
    tOrdemCompraItemGradeQtd: TFloatField;
    tOrdemCompraItemGradeVlrUnitario: TFloatField;
    tOrdemCompraItemGradeVlrTotal: TFloatField;
    tOrdemCompraItemGradeQtdEntregue: TFloatField;
    tOrdemCompraItemGradeQtdRestante: TFloatField;
    tOrdemCompraItemGradelkTamanho: TStringField;
    dsOrdemCompraItemGrade: TDataSource;
    StaticText1: TStaticText;
    qOrdemFilial: TIntegerField;
    tOrdemCompraItemGradeFilial: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qOrdemCalcFields(DataSet: TDataSet);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQLOrdem;
  public
    { Public declarations }
  end;

var
  fConsOC: TfConsOC;

implementation

uses UDM1, URelOC2, UOrdemCompra;

{$R *.DFM}

procedure TfConsOC.Monta_SQLOrdem;
begin
  qOrdem.Close;
  qOrdem.SQL.Clear;
  qOrdem.SQL.Add('SELECT Dbfornecedores.CodForn, Dbfornecedores.NomeForn, Dbordemcompra.Codigo NumOC, ');
  qOrdem.SQL.Add(' Dbcor.Nome NomeCor, Dbordemcompraitem.CodMaterial, Dbproduto.Nome NomeMaterial, ');
  qOrdem.SQL.Add(' Dbordemcompraitem.CodCor, Dbordemcompraitem.Item, Dbordemcompraitem.Qtd, Dbordemcompraitem.VlrUnitario, ');
  qOrdem.SQL.Add(' Dbordemcompraitem.DtEntrega, Dbordemcompraitem.VlrTotal, Dbordemcompraitem.QtdEntregue, Dbordemcompraitem.QtdRestante, ');
  qOrdem.SQL.Add(' dbOrdemCompra.DtEmissao, dbOrdemCompra.Filial ');
  qOrdem.SQL.Add(' FROM "dbOrdemCompra.DB" Dbordemcompra ');
  qOrdem.SQL.Add('    INNER JOIN "dbOrdemCompraItem.DB" Dbordemcompraitem ');
  qOrdem.SQL.Add('    ON  (Dbordemcompra.Codigo = Dbordemcompraitem.Codigo) ');
  qOrdem.SQL.Add('    INNER JOIN "dbFornecedores.DB" Dbfornecedores ');
  qOrdem.SQL.Add('    ON  (Dbordemcompra.CodFornecedor = Dbfornecedores.CodForn) ');
  qOrdem.SQL.Add('    INNER JOIN "dbMaterial.DB" Dbproduto ');
  qOrdem.SQL.Add('    ON  (Dbordemcompraitem.CodMaterial = Dbproduto.Codigo) ');
  qOrdem.SQL.Add('    FULL OUTER JOIN "Dbcor.DB" Dbcor ');
  qOrdem.SQL.Add('    ON  (Dbordemcompraitem.CodCor = Dbcor.Codigo) ');
  qOrdem.SQL.Add('WHERE (0=0)');

  if DateEdit1.Date > 0 then
    begin
      qOrdem.SQL.Add(' AND (Dbordemcompra.DtEmissao >= :DtEmissaoIni)');
      qOrdem.ParamByName('DtEmissaoIni').AsDate := DateEdit1.Date;
    end;
  if DateEdit2.Date > 0 then
    begin
      qOrdem.SQL.Add(' AND (Dbordemcompra.DtEmissao <= :DtEmissaoFin)');
      qOrdem.ParamByName('DtEmissaoFin').AsDate := DateEdit2.Date;
    end;

  if DateEdit3.Date > 0 then
    begin
      qOrdem.SQL.Add(' AND (DbordemcompraItem.DtEntrega >= :DtEntregaIni)');
      qOrdem.ParamByName('DtEntregaIni').AsDate := DateEdit3.Date;
    end;
  if DateEdit4.Date > 0 then
    begin
      qOrdem.SQL.Add(' AND (DbordemcompraItem.DtEntrega <= :DtEntregaFin)');
      qOrdem.ParamByName('DtEntregaFin').AsDate := DateEdit4.Date;
    end;
  case ComboBox1.ItemIndex of
    0 : qOrdem.SQL.Add('  AND (dbOrdemCompraItem.QtdRestante > 0)');
    1 : qOrdem.SQL.Add('  AND (dbOrdemCompraItem.QtdEntregue > 0)');
  end;
  case ComboBox2.ItemIndex of
    0 : qOrdem.SQL.Add('ORDER BY dbOrdemCompra.Codigo, dbOrdemCompraItem.Item');
    1 : qOrdem.SQL.Add('ORDER BY dbOrdemCompraItem.CodMaterial, dbOrdemCompraItem.DtEntrega');
    2 : qOrdem.SQL.Add('ORDER BY dbOrdemCompraItem.CodMaterial, dbOrdemCompra.DtEmissao');
    3 : qOrdem.SQL.Add('ORDER BY dbProduto.Nome, dbOrdemCompraItem.DtEntrega');
    4 : qOrdem.SQL.Add('ORDER BY dbProduto.Nome, dbOrdemCompra.DtEmissao');
    5 : qOrdem.SQL.Add('ORDER BY dbFornecedores.NomeForn, dbOrdemCompraItem.DtEntrega');
    6 : qOrdem.SQL.Add('ORDER BY dbFornecedores.NomeForn, dbOrdemCompra.DtEmissao');
    7 : qOrdem.SQL.Add('ORDER BY dbOrdemCompraItem.DtEntrega, dbProduto.Nome');
    8 : qOrdem.SQL.Add('ORDER BY dbOrdemCompraItem.DtEntrega, dbFornecedores.NomeForn');
  end;
  qOrdem.Open;
end;

procedure TfConsOC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qOrdem.Close;
  //dm1.GravaGrid(SMDBGrid1,Name);
  if Screen.FormCount < 3 then
    begin
      DM1.tOrdemCompra.Close;
      DM1.tOrdemCompraItem.Close;
      DM1.tFornecedores.Close;
    end;
  Action := Cafree;
end;

procedure TfConsOC.BitBtn2Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  DateEdit3.Clear;
  DateEdit4.Clear;
end;

procedure TfConsOC.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsOC.BitBtn1Click(Sender: TObject);
begin
  if not qOrdem.Active then
    begin
      ShowMessage('Não existe registro para imprimir!');
      exit;
    end;
  
  fRelOC2 := TfRelOC2.Create(Self);
  fRelOC2.RLReport1.Preview;
  FreeAndNil(fRelOC2);
end;

procedure TfConsOC.FormShow(Sender: TObject);
begin
  DM1.tOrdemCompra.Open;
  DM1.tOrdemCompraItem.Open;
  DM1.tFornecedores.Open;
  mOC.open;
end;

procedure TfConsOC.BitBtn4Click(Sender: TObject);
begin
  VDBGrid1.DataSource := nil;
  Monta_SqlOrdem;
  VDBGrid1.DataSource := dsOrdemCompraItemGrade;
end;

procedure TfConsOC.FormCreate(Sender: TObject);
begin
  //dm1.leGrid(SMDBGrid1,Name);
end;

procedure TfConsOC.qOrdemCalcFields(DataSet: TDataSet);
begin
  if qOrdemQtdRestante.AsFloat > 0 then
    qOrdemclVlrRestante.AsFloat := StrToFloat(FormatFloat('0.00',qOrdemVlrUnitario.AsFloat * qOrdemQtdRestante.AsFloat))
  else
    qOrdemclVlrRestante.AsFloat := 0;
end;

procedure TfConsOC.SMDBGrid1DblClick(Sender: TObject);
begin
  if DM1.tUsuarioOrdemCompra.AsBoolean then
    begin
      fOrdemCompra := TfOrdemCompra.Create(Self);
      fOrdemCompra.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

end.
