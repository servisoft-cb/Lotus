unit UConsMovTalao;

interface
            
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, RXDBCtrl, Db, DBTables, Buttons,
  DBFilter;

type
  TfConsMovTalao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    tPedido: TTable;
    dsPedido: TDataSource;
    tPedidoPedido: TIntegerField;
    tPedidoDtEmissao: TDateField;
    tPedidoDtIniEmbarque: TDateField;
    tPedidoDtFinEmbarque: TDateField;
    tPedidoNumLote: TIntegerField;
    tPedidoCancelado: TBooleanField;
    tPedidoSuspenso: TBooleanField;
    tPedidoPedidoCliente: TIntegerField;
    tPedidoPedCliDif: TStringField;
    tPedidoLoteExp: TBooleanField;
    tPedidoPOCliente: TStringField;
    tPedidolkCliente: TStringField;
    tPedidoCodCliente: TIntegerField;
    RxDBGrid1: TRxDBGrid;
    GroupBox2: TGroupBox;
    RxDBGrid2: TRxDBGrid;
    tLote: TTable;
    dsLote: TDataSource;
    BitBtn1: TBitBtn;
    tLoteLote: TIntegerField;
    tLoteQtdTaloes: TIntegerField;
    tLoteQtdPares: TFloatField;
    tLoteObs: TMemoField;
    tLoteImpCalcMaterial: TBooleanField;
    tLoteNroPedido: TIntegerField;
    RxDBFilter1: TRxDBFilter;
    GroupBox3: TGroupBox;
    RxDBGrid3: TRxDBGrid;
    tTalao: TTable;
    dsTalao: TDataSource;
    tTalaoLote: TIntegerField;
    tTalaoItem: TIntegerField;
    tTalaoCodProduto: TIntegerField;
    tTalaoCodCabedal1: TIntegerField;
    tTalaoCodCabedal2: TIntegerField;
    tTalaoCodCor: TIntegerField;
    tTalaoCodCorForro: TIntegerField;
    tTalaoCodCorPalmilha: TIntegerField;
    tTalaoCodCorSolado: TIntegerField;
    tTalaoQtdPar: TIntegerField;
    tTalaoCodForro: TIntegerField;
    tTalaoCodEtiqueta: TIntegerField;
    tTalaoCodSolado: TIntegerField;
    tTalaoCodTaloneira: TIntegerField;
    tTalaoCodCorTaloneira: TIntegerField;
    tTalaoCodPalmilha: TIntegerField;
    tTalaolkReferencia: TStringField;
    tTalaolkCorSolado: TStringField;
    tTalaolkCorForro: TStringField;
    GroupBox4: TGroupBox;
    RxDBGrid4: TRxDBGrid;
    tTalaoGrade: TTable;
    tTalaoGradeLote: TIntegerField;
    tTalaoGradeItem: TIntegerField;
    tTalaoGradeTalao: TIntegerField;
    tTalaoGradeCodGrade: TIntegerField;
    tTalaoGradePosicao: TIntegerField;
    tTalaoGradeQtdPar: TIntegerField;
    dsTalaoGrade: TDataSource;
    GroupBox5: TGroupBox;
    RxDBGrid5: TRxDBGrid;
    tTalaoMov: TTable;
    tTalaoMovLote: TIntegerField;
    tTalaoMovTalao: TIntegerField;
    tTalaoMovSetor: TIntegerField;
    tTalaoMovDataEnt: TDateField;
    tTalaoMovHoraEnt: TTimeField;
    tTalaoMovDataSaida: TDateField;
    tTalaoMovHoraSaida: TTimeField;
    tTalaoMovCodAtelier: TIntegerField;
    dsTalaoMov: TDataSource;
    tTalaoMovlkSetor: TStringField;
    tTalaoMovlkAtelier: TStringField;
    tGradeItem: TTable;
    tGradeItemCodGrade: TIntegerField;
    tGradeItemPosicao: TIntegerField;
    tGradeItemTamanho: TStringField;
    tTalaoGradelkTamanho: TStringField;
    BitBtn2: TBitBtn;
    tPedidoQtdPares: TFloatField;
    tTalaoInvoice: TStringField;
    tPedidoItem: TTable;
    dsPedidoItem: TDataSource;
    tPedidoItemPedido: TIntegerField;
    tPedidoItemItem: TIntegerField;
    tPedidoItemQtdPares: TFloatField;
    tPedidoItemCodProduto: TIntegerField;
    tPedidoItemCodCor: TIntegerField;
    tPedidoItemCodGrade: TIntegerField;
    tPedidoItemQtdParesFat: TFloatField;
    tPedidoItemQtdParesRest: TFloatField;
    tPedidoItemPreco: TFloatField;
    tPedidoItemVlrTotal: TFloatField;
    tPedidoItemCodCabedal1: TIntegerField;
    tPedidoItemCodCabedal2: TIntegerField;
    tPedidoItemCodCorForro: TIntegerField;
    tPedidoItemCodCorSolado: TIntegerField;
    tPedidoItemCodCorPalmilha: TIntegerField;
    tPedidoItemCancelado: TBooleanField;
    tPedidoItemCopiado: TBooleanField;
    tPedidoItemSelecionado: TBooleanField;
    tPedidoItemQtdParesCanc: TFloatField;
    tPedidoItemCodForro: TIntegerField;
    tPedidoItemCodEtiqueta: TIntegerField;
    tPedidoItemVlrDesconto: TFloatField;
    tPedidoItemCodSolado: TIntegerField;
    tPedidoItemSitTrib: TSmallintField;
    tPedidoItemQtdFatAut: TFloatField;
    tPedidoItemQtdFatMan: TFloatField;
    tPedidoItemCodTaloneira: TIntegerField;
    tPedidoItemCodCorTaloneira: TIntegerField;
    tPedidoItemCodPalmilha: TIntegerField;
    tPedidoItemInvoice: TStringField;
    tPedidoItemLoteGer: TBooleanField;
    tPedidoItemlkReferencia: TStringField;
    tPedidoItemlkCor: TStringField;
    tTalaolkNomeCor: TStringField;
    tPedidoQtdParesRep: TFloatField;
    tPedidoVlrReposicao: TFloatField;
    tPedidoStock: TStringField;
    tTalaolkDescMaterial: TStringField;
    tTalaoCodForma: TIntegerField;
    tLoteImpresso: TBooleanField;
    tLoteOCGerado: TBooleanField;
    tLoteItemPed: TIntegerField;
    tLoteNumMapaCompras: TIntegerField;
    tLoteDtEmbarque: TDateField;
    tLoteTipoTalao: TStringField;
    tTalaoMov2: TTable;
    dsTalaoMov2: TDataSource;
    tTalaoMov2Lote: TIntegerField;
    tTalaoMov2Talao: TIntegerField;
    tTalaoMov2Setor: TIntegerField;
    tTalaoMov2DataEnt: TDateField;
    tTalaoMov2HoraEnt: TTimeField;
    tTalaoMov2DataSaida: TDateField;
    tTalaoMov2HoraSaida: TTimeField;
    tTalaoMov2CodAtelier: TIntegerField;
    tTalaoMov2lkSetor: TStringField;
    tTalaoMov2lkAtelier: TStringField;
    GroupBox6: TGroupBox;
    RxDBGrid6: TRxDBGrid;
    tPedidoItemlkDescMaterial: TStringField;
    StaticText1: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBGrid5DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsMovTalao: TfConsMovTalao;

implementation

uses UDM1, UConsMovTalaoD, UAgendaTelef;

{$R *.DFM}

procedure TfConsMovTalao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tCliente.Close;
      DM1.tCor.Close;
      DM1.tProduto.Close;
      DM1.tMaterial.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      DM1.tSetor.Close;
      DM1.tAtelier.Close;
    end;
  Action := Cafree;
end;

procedure TfConsMovTalao.Edit1Change(Sender: TObject);
begin
  try
    tPedido.IndexFieldNames := 'PedidoCliente';
    tPedido.FindNearest([Edit1.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfConsMovTalao.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsMovTalao.BitBtn2Click(Sender: TObject);
begin
  Screen.Cursor  := crHourGlass;
  fConsMovTalaoD := TfConsMovTalaoD.Create(Self);
  if tLoteTipoTalao.AsString = 'T' then
    begin
      //qLote
      fConsMovTalaoD.qLote.Active := False;
      fConsMovTalaoD.qLote.SQL.Clear;
      fConsMovTalaoD.qLote.SQL.ADD('SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) QtdPar');
      fConsMovTalaoD.qLote.SQL.ADD('FROM "dbTalaoMov.db" Dbtalaomov');
      fConsMovTalaoD.qLote.SQL.ADD('   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde');
      fConsMovTalaoD.qLote.SQL.ADD('   ON  (Dbtalaomov.Lote = Dbtalaograde.Lote)');
      fConsMovTalaoD.qLote.SQL.ADD('   AND  (Dbtalaomov.Talao = Dbtalaograde.Talao)');
      fConsMovTalaoD.qLote.SQL.ADD('   INNER JOIN "dbSetor.DB" Dbsetor');
      fConsMovTalaoD.qLote.SQL.ADD('   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
      fConsMovTalaoD.qLote.SQL.ADD('   INNER JOIN "dbTalao.DB" Dbtalao');
      fConsMovTalaoD.qLote.SQL.ADD('   ON  (Dbtalaograde.Lote = Dbtalao.Lote)');
      fConsMovTalaoD.qLote.SQL.ADD('   AND  (Dbtalaograde.Item = Dbtalao.Item)');
      fConsMovTalaoD.qLote.SQL.ADD('   INNER JOIN "dbLote.DB" Dblote');
      fConsMovTalaoD.qLote.SQL.ADD('   ON  (Dbtalao.Lote = Dblote.Lote)');
      fConsMovTalaoD.qLote.SQL.ADD('WHERE   (Dblote.NroPedido = :Pedido)');
      fConsMovTalaoD.qLote.SQL.ADD('   AND  (Dblote.Lote = :Lote)');
      fConsMovTalaoD.qLote.SQL.ADD('   AND  (Dbtalao.Item = :Item)');
      fConsMovTalaoD.qLote.SQL.ADD('   AND  (Dbtalaomov.DataSaida IS NOT NULL)');
      fConsMovTalaoD.qLote.SQL.ADD('GROUP BY Dbtalaomov.Setor');
      //qFatura
      fConsMovTalaoD.qFatura.Active := False;
      fConsMovTalaoD.qFatura.SQL.Clear;
      fConsMovTalaoD.qFatura.SQL.ADD('SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) QtdPar');
      fConsMovTalaoD.qFatura.SQL.ADD('FROM "dbTalaoMov.db" Dbtalaomov');
      fConsMovTalaoD.qFatura.SQL.ADD('   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde');
      fConsMovTalaoD.qFatura.SQL.ADD('   ON  (Dbtalaomov.Lote = Dbtalaograde.Lote)');
      fConsMovTalaoD.qFatura.SQL.ADD('   AND  (Dbtalaomov.Talao = Dbtalaograde.Talao)');
      fConsMovTalaoD.qFatura.SQL.ADD('   INNER JOIN "dbSetor.DB" Dbsetor');
      fConsMovTalaoD.qFatura.SQL.ADD('   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
      fConsMovTalaoD.qFatura.SQL.ADD('   INNER JOIN "dbTalao.DB" Dbtalao');
      fConsMovTalaoD.qFatura.SQL.ADD('   ON  (Dbtalaograde.Lote = Dbtalao.Lote)');
      fConsMovTalaoD.qFatura.SQL.ADD('   AND  (Dbtalaograde.Item = Dbtalao.Item)');
      fConsMovTalaoD.qFatura.SQL.ADD('   INNER JOIN "dbLote.DB" Dblote');
      fConsMovTalaoD.qFatura.SQL.ADD('   ON  (Dbtalao.Lote = Dblote.Lote)');
      fConsMovTalaoD.qFatura.SQL.ADD('WHERE   (Dblote.NroPedido = :Pedido)');
      fConsMovTalaoD.qFatura.SQL.ADD('   AND  (DbLote.ItemPed = :Item)');
      fConsMovTalaoD.qFatura.SQL.ADD('   AND  (Dbtalaomov.DataSaida IS NOT NULL)');
      fConsMovTalaoD.qFatura.SQL.ADD('GROUP BY Dbtalaomov.Setor');
      //qPedido
      fConsMovTalaoD.qPedido.Active := False;
      fConsMovTalaoD.qPedido.SQL.Clear;
      fConsMovTalaoD.qPedido.SQL.ADD('SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalaograde.QtdPar ) QtdPar');
      fConsMovTalaoD.qPedido.SQL.ADD('FROM "dbTalaoMov.db" Dbtalaomov');
      fConsMovTalaoD.qPedido.SQL.ADD('   INNER JOIN "dbTalaoGrade.DB" Dbtalaograde');
      fConsMovTalaoD.qPedido.SQL.ADD('   ON  (Dbtalaomov.Lote = Dbtalaograde.Lote)');
      fConsMovTalaoD.qPedido.SQL.ADD('   AND  (Dbtalaomov.Talao = Dbtalaograde.Talao)');
      fConsMovTalaoD.qPedido.SQL.ADD('   INNER JOIN "dbSetor.DB" Dbsetor');
      fConsMovTalaoD.qPedido.SQL.ADD('   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
      fConsMovTalaoD.qPedido.SQL.ADD('   INNER JOIN "dbTalao.DB" Dbtalao');
      fConsMovTalaoD.qPedido.SQL.ADD('   ON  (Dbtalaograde.Lote = Dbtalao.Lote)');
      fConsMovTalaoD.qPedido.SQL.ADD('   AND  (Dbtalaograde.Item = Dbtalao.Item)');
      fConsMovTalaoD.qPedido.SQL.ADD('   INNER JOIN "dbLote.DB" Dblote');
      fConsMovTalaoD.qPedido.SQL.ADD('   ON  (Dbtalao.Lote = Dblote.Lote)');
      fConsMovTalaoD.qPedido.SQL.ADD('WHERE   (Dblote.NroPedido = :Pedido)');
      fConsMovTalaoD.qPedido.SQL.ADD('   AND  (Dbtalaomov.DataSaida IS NOT NULL)');
      fConsMovTalaoD.qPedido.SQL.ADD('GROUP BY Dbtalaomov.Setor');
    end
  else
  if tLoteTipoTalao.AsString = 'R' then
    begin
      //qLote
      fConsMovTalaoD.qLote.Active := False;
      fConsMovTalaoD.qLote.SQL.Clear;
      fConsMovTalaoD.qLote.SQL.ADD('SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalao.QtdPar ) QtdPar');
      fConsMovTalaoD.qLote.SQL.ADD('FROM "dbTalaoMov.db" Dbtalaomov');
      fConsMovTalaoD.qLote.SQL.ADD('   INNER JOIN "dbTalao.DB" Dbtalao');
      fConsMovTalaoD.qLote.SQL.ADD('   ON  (Dbtalaomov.Lote = Dbtalao.Lote)');
      fConsMovTalaoD.qLote.SQL.ADD('   AND  (Dbtalaomov.Talao = Dbtalao.Item)');
      fConsMovTalaoD.qLote.SQL.ADD('   INNER JOIN "dbSetor.DB" Dbsetor');
      fConsMovTalaoD.qLote.SQL.ADD('   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
      fConsMovTalaoD.qLote.SQL.ADD('   INNER JOIN "dbLote.DB" Dblote');
      fConsMovTalaoD.qLote.SQL.ADD('   ON  (Dbtalao.Lote = Dblote.Lote)');
      fConsMovTalaoD.qLote.SQL.ADD('WHERE   (Dblote.NroPedido = :Pedido)');
      fConsMovTalaoD.qLote.SQL.ADD('   AND  (Dblote.Lote = :Lote)');
      fConsMovTalaoD.qLote.SQL.ADD('   AND  (Dbtalao.Item = :Item)');
      fConsMovTalaoD.qLote.SQL.ADD('   AND  (Dbtalaomov.DataSaida IS NOT NULL)');
      fConsMovTalaoD.qLote.SQL.ADD('GROUP BY Dbtalaomov.Setor');
      //qFatura
      fConsMovTalaoD.qFatura.Active := False;
      fConsMovTalaoD.qFatura.SQL.Clear;
      fConsMovTalaoD.qFatura.SQL.ADD('SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalao.QtdPar ) QtdPar');
      fConsMovTalaoD.qFatura.SQL.ADD('FROM "dbTalaoMov.db" Dbtalaomov');
      fConsMovTalaoD.qFatura.SQL.ADD('   INNER JOIN "dbTalao.DB" Dbtalao');
      fConsMovTalaoD.qFatura.SQL.ADD('   ON  (Dbtalaomov.Lote = Dbtalao.Lote)');
      fConsMovTalaoD.qFatura.SQL.ADD('   AND  (Dbtalaomov.Talao = Dbtalao.Item)');
      fConsMovTalaoD.qFatura.SQL.ADD('   INNER JOIN "dbSetor.DB" Dbsetor');
      fConsMovTalaoD.qFatura.SQL.ADD('   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
      fConsMovTalaoD.qFatura.SQL.ADD('   INNER JOIN "dbLote.DB" Dblote');
      fConsMovTalaoD.qFatura.SQL.ADD('   ON  (Dbtalao.Lote = Dblote.Lote)');
      fConsMovTalaoD.qFatura.SQL.ADD('WHERE   (Dblote.NroPedido = :Pedido)');
      fConsMovTalaoD.qFatura.SQL.ADD('   AND  (DbLote.ItemPed = :Item)');
      fConsMovTalaoD.qFatura.SQL.ADD('   AND  (Dbtalaomov.DataSaida IS NOT NULL)');
      fConsMovTalaoD.qFatura.SQL.ADD('GROUP BY Dbtalaomov.Setor');
      //qPedido
      fConsMovTalaoD.qPedido.Active := False;
      fConsMovTalaoD.qPedido.SQL.Clear;
      fConsMovTalaoD.qPedido.SQL.ADD('SELECT DISTINCT Dbtalaomov.Setor, SUM( Dbtalao.QtdPar ) QtdPar');
      fConsMovTalaoD.qPedido.SQL.ADD('FROM "dbTalaoMov.db" Dbtalaomov');
      fConsMovTalaoD.qPedido.SQL.ADD('   INNER JOIN "dbTalao.DB" Dbtalao');
      fConsMovTalaoD.qPedido.SQL.ADD('   ON  (Dbtalaomov.Lote = Dbtalao.Lote)');
      fConsMovTalaoD.qPedido.SQL.ADD('   AND  (Dbtalaomov.Talao = Dbtalao.Item)');
      fConsMovTalaoD.qPedido.SQL.ADD('   INNER JOIN "dbSetor.DB" Dbsetor');
      fConsMovTalaoD.qPedido.SQL.ADD('   ON  (Dbsetor.Codigo = Dbtalaomov.Setor)');
      fConsMovTalaoD.qPedido.SQL.ADD('   INNER JOIN "dbLote.DB" Dblote');
      fConsMovTalaoD.qPedido.SQL.ADD('   ON  (Dbtalao.Lote = Dblote.Lote)');
      fConsMovTalaoD.qPedido.SQL.ADD('WHERE   (Dblote.NroPedido = :Pedido)');
      fConsMovTalaoD.qPedido.SQL.ADD('   AND  (Dbtalaomov.DataSaida IS NOT NULL)');
      fConsMovTalaoD.qPedido.SQL.ADD('GROUP BY Dbtalaomov.Setor');
    end;
  fConsMovTalaoD.qSetores.Params[0].AsInteger := tLoteLote.AsInteger;
  fConsMovTalaoD.qSetores.Active              := True;
  fConsMovTalaoD.qLote.Params[0].AsInteger    := tPedidoPedido.AsInteger;
  fConsMovTalaoD.qLote.Params[1].AsInteger    := tLoteLote.AsInteger;
  fConsMovTalaoD.qLote.Params[2].AsInteger    := tTalaoItem.AsInteger;
  fConsMovTalaoD.qLote.Active                 := True;
  fConsMovTalaoD.qFatura.Params[0].AsInteger  := tPedidoPedido.AsInteger;
  fConsMovTalaoD.qFatura.Params[1].AsInteger  := tPedidoItemItem.AsInteger;
  fConsMovTalaoD.qFatura.Active               := True;
  fConsMovTalaoD.qPedido.Params[0].AsInteger  := tPedidoPedido.AsInteger;
  fConsMovTalaoD.qPedido.Active               := True;
  Screen.Cursor                               := crDefault;
  fConsMovTalaoD.ShowModal;
end;

procedure TfConsMovTalao.RxDBGrid5DblClick(Sender: TObject);
begin
  if RxDBGrid5.DataSource = dsTalaoMov then
    begin
      RxDBGrid5.DataSource := dsTalaoMov2;
      GroupBox5.Caption    := 'MOVIMENTOS DOS TALÕES   (POR REFERENCIA)';
    end
  else
    begin
      RxDBGrid5.DataSource := dsTalaoMov;
      GroupBox5.Caption    := 'MOVIMENTOS DOS TALÕES   (POR GRADE)';
    end;
end;

procedure TfConsMovTalao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfConsMovTalao.FormShow(Sender: TObject);
begin
  DM1.tCliente.Open;
  DM1.tCor.Open;
  DM1.tProduto.Open;
  DM1.tMaterial.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tSetor.Open;
  DM1.tAtelier.Open;
end;

end.
