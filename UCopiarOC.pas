unit UCopiarOC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, ToolEdit, CurrEdit, DB, DBTables,
  Buttons, Grids, DBGrids, SMDBGrid, RXCtrls;

type
  TfCopiarOC = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    SMDBGrid1: TSMDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qOC: TQuery;
    dsqOC: TDataSource;
    RxLabel1: TRxLabel;
    qOCCodigo: TIntegerField;
    qOCCodFornecedor: TIntegerField;
    qOCDtEmissao: TDateField;
    qOCVlrTotal: TFloatField;
    qOCReferencia: TStringField;
    qOCCouro: TBooleanField;
    qOCNomeForn: TStringField;
    qOCTel1Forn: TStringField;
    SMDBGrid2: TSMDBGrid;
    tOrdemCompraItem: TTable;
    dsOrdemCompraItem: TDataSource;
    tOrdemCompraItemCodigo: TIntegerField;
    tOrdemCompraItemItem: TIntegerField;
    tOrdemCompraItemCodMaterial: TIntegerField;
    tOrdemCompraItemCodCor: TIntegerField;
    tOrdemCompraItemQtd: TFloatField;
    tOrdemCompraItemVlrUnitario: TFloatField;
    tOrdemCompraItemAliqIPI: TFloatField;
    tOrdemCompraItemVlrIPI: TFloatField;
    tOrdemCompraItemDtEntrega: TDateField;
    tOrdemCompraItemVlrTotal: TFloatField;
    tOrdemCompraItemCodGrade: TIntegerField;
    tOrdemCompraItemQtdEntregue: TFloatField;
    tOrdemCompraItemQtdRestante: TFloatField;
    tOrdemCompraItemUnidade: TStringField;
    tOrdemCompraItemlkNomeMaterial: TStringField;
    tOrdemCompraItemlkNomeCor: TStringField;
    BitBtn3: TBitBtn;
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
    qOCCodCondPgto: TIntegerField;
    qOCCodTransp: TIntegerField;
    qOCObs: TMemoField;
    qOCCodProd: TIntegerField;
    tMaterial2: TTable;
    tCor2: TTable;
    tMaterial2Codigo: TIntegerField;
    tMaterial2Nome: TStringField;
    tCor2Codigo: TIntegerField;
    tCor2Nome: TStringField;
    tOrdemCompraItemFilial: TIntegerField;
    qOCFilial: TIntegerField;
    tOrdemCompraItemGradeFilial: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Monta_SQL;
    procedure Copiar_OC;
  public
    { Public declarations }
  end;

var
  fCopiarOC: TfCopiarOC;

implementation

uses UDM1, UDM2, UOrdemCompra;

{$R *.dfm}

procedure TfCopiarOC.Copiar_OC;
begin
  DM1.tOrdemCompraCodFornecedor.AsInteger := qOCCodFornecedor.AsInteger;
  DM1.tOrdemCompraCodCondPgto.AsInteger   := qOCCodCondPgto.AsInteger;
  DM1.tOrdemCompraCodTransp.AsInteger     := qOCCodTransp.AsInteger;
  DM1.tOrdemCompraCodProd.AsInteger       := qOCCodProd.AsInteger;
  DM1.tOrdemCompraObs.AsString            := qOCObs.AsString;
  DM1.tOrdemCompraCouro.AsBoolean         := qOCCouro.AsBoolean;
  tOrdemCompraItem.First;
  while not tOrdemCompraItem.Eof do
    begin
      if tOrdemCompraItemCodMaterial.AsInteger > 0 then
        begin
          fOrdemCompra.Edit1.Text                := tOrdemCompraItemCodMaterial.AsString;
          fOrdemCompra.RxDBLookupCombo8.KeyValue := tOrdemCompraItemCodMaterial.AsInteger;
          fOrdemCompra.Query1.Close;
          fOrdemCompra.Query1.Params[0].AsInteger := tOrdemCompraItemCodMaterial.AsInteger;
          fOrdemCompra.Query1.Open;
          if tOrdemCompraItemCodCor.AsInteger > 0 then
            fOrdemCompra.RxDBLookupCombo6.KeyValue := tOrdemCompraItemCodCor.AsInteger
          else
            fOrdemCompra.RxDBLookupCombo6.ClearValue;
          fOrdemCompra.CurrencyEdit1.Value := tOrdemCompraItemQtd.AsFloat;
          fOrdemCompra.Edit3.Text          := tOrdemCompraItemUnidade.AsString;
          fOrdemCompra.CurrencyEdit2.Value := tOrdemCompraItemVlrUnitario.AsFloat;
          fOrdemCompra.CurrencyEdit4.Value := tOrdemCompraItemAliqIPI.AsFloat;
          fOrdemCompra.CurrencyEdit5.Value := tOrdemCompraItemVlrIPI.AsFloat;
          if DM1.tOrdemCompraDtEmissao.AsDateTime > 0 then
            fOrdemCompra.DateEdit1.Date      := DM1.tOrdemCompraDtEmissao.AsDateTime
          else
            fOrdemCompra.DateEdit1.Date      := Date;
          fOrdemCompra.tAuxOrdemCompra.First;
          while not fOrdemCompra.tAuxOrdemCompra.EOF do
            fOrdemCompra.tAuxOrdemCompra.Delete;
          fOrdemCompra.tAuxOrdemCompra.Refresh;
          if tOrdemCompraItemCodGrade.AsInteger > 0 then
            begin
              DM1.tGrade.IndexFieldNames := 'Codigo';
              DM1.tGrade.FindKey([tOrdemCompraItemCodGrade.AsInteger]);
            end;
          tOrdemCompraItemGrade.First;
          while not tOrdemCompraItemGrade.EOF do
            begin
              fOrdemCompra.tAuxOrdemCompra.Insert;
              fOrdemCompra.tAuxOrdemCompraCodGrade.AsInteger  := tOrdemCompraItemGradeCodGrade.AsInteger;
              fOrdemCompra.tAuxOrdemCompraPosicao.AsInteger   := tOrdemCompraItemGradePosicao.AsInteger;
              fOrdemCompra.tAuxOrdemCompraQtd.asFloat         := tOrdemCompraItemGradeQtd.AsFloat;
              fOrdemCompra.tAuxOrdemCompraVlrUnitario.asFloat := tOrdemCompraItemGradeVlrUnitario.AsFloat;
              fOrdemCompra.tAuxOrdemCompraVlrTotal.asFloat    := tOrdemCompraItemGradeVlrUnitario.AsFloat * tOrdemCompraItemGradeQtd.AsFloat;
              fOrdemCompra.tAuxOrdemCompra.Post;
              tOrdemCompraItemGrade.Next;
            end;
          fOrdemCompra.tAuxOrdemCompra.Refresh;
          fOrdemCompra.BitBtn7Click(fOrdemCompra);
        end;
      tOrdemCompraItem.Next;
    end;
end;

procedure TfCopiarOC.Monta_SQL;
begin
  qOC.Close;
  qOC.SQL.Clear;
  qOC.SQL.Add('SELECT Dbordemcompra.Codigo, Dbordemcompra.CodFornecedor, Dbordemcompra.DtEmissao, Dbordemcompra.VlrTotal, Dbordemcompra.Referencia, Dbordemcompra.Couro, Dbfornecedores.NomeForn, Dbfornecedores.Tel1Forn, ');
  qOC.SQL.Add(' dbOrdemCompra.CodCondPgto, dbOrdemCompra.CodTransp, Dbordemcompra.Obs, Dbordemcompra.CodProd, dbOrdemCompra.Filial');
  qOC.SQL.Add('FROM "dbOrdemCompra.DB" Dbordemcompra');
  qOC.SQL.Add('   INNER JOIN "dbFornecedores.DB" Dbfornecedores');
  qOC.SQL.Add('   ON  (Dbordemcompra.CodFornecedor = Dbfornecedores.CodForn)');
  qOC.SQL.Add('WHERE (0=0)');
  if RxDBLookupCombo1.Text <> '' then
    begin
      qOC.SQL.Add('  AND (dbOrdemCompra.CodFornecedor = :CodFornecedor)');
      qOC.ParamByName('CodFornecedor').AsInteger := RxDBLookupCombo1.KeyValue;
    end
  else
  if Edit1.Text <> '' then
    qOC.SQL.Add(' AND dbFornecedor.NomeForn LIKE ''%' + Edit1.Text + '%''');
  if CurrencyEdit1.AsInteger > 0 then
    begin
      qOC.SQL.Add('  AND (dbOrdemCompra.Codigo = :Codigo)');
      qOC.ParamByName('Codigo').AsInteger := CurrencyEdit1.AsInteger;
    end;
  qOC.SQL.Add('ORDER BY Dbfornecedores.NomeForn, Dbordemcompra.Codigo');
  qOC.Open;
end;

procedure TfCopiarOC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qOC.Close;
  Action := Cafree;
end;

procedure TfCopiarOC.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfCopiarOC.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfCopiarOC.BitBtn1Click(Sender: TObject);
begin
  SMDBGrid2.DataSource := Nil;
  if RxDBLookupCombo1.Text <> '' then
    Edit1.Clear;
  Monta_SQL;
  SMDBGrid2.DataSource := dsOrdemCompraItem;
end;

procedure TfCopiarOC.BitBtn3Click(Sender: TObject);
begin
  if (qOC.Active) and (qOCCodigo.AsInteger > 0) then
    begin
      if MessageDlg('Deseja Copiar a OC: ' + qOCCodigo.AsString + ' ?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          Copiar_OC;
          Close;
        end;
    end;
end;

procedure TfCopiarOC.FormShow(Sender: TObject);
begin
  tOrdemCompraItem.Refresh;
  tOrdemCompraItemGrade.Refresh;
end;

end.
