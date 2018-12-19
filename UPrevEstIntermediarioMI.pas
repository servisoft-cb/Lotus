unit UPrevEstIntermediarioMI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, Buttons, Db,
  DBTables, MemTable, DBFilter, Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, CurrEdit;

type
  TfPrevEstIntermediarioMI = class(TForm)
    BitBtn1: TBitBtn;
    qEstoque: TQuery;
    mEstoque: TMemoryTable;
    mEstoqueReferencia: TStringField;
    mEstoqueSetor1: TIntegerField;
    mEstoqueEstoque1: TIntegerField;
    mEstoqueSetor2: TIntegerField;
    mEstoqueEstoque2: TIntegerField;
    mEstoqueSetor3: TIntegerField;
    mEstoqueEstoque3: TIntegerField;
    mEstoqueSetor4: TIntegerField;
    RxDBGrid1: TRxDBGrid;
    mEstoqueNome1: TStringField;
    mEstoqueNome2: TStringField;
    mEstoqueNome3: TStringField;
    mEstoqueNome4: TStringField;
    qEstoqueSetor: TIntegerField;
    mEstoqueSetor5: TIntegerField;
    mEstoqueSetor6: TIntegerField;
    mEstoqueEstoque5: TIntegerField;
    mEstoqueEstoque4: TIntegerField;
    mEstoqueNome5: TStringField;
    mEstoqueNome6: TStringField;
    qEstoquelkNomeSetor: TStringField;
    mEstoqueCodProduto: TIntegerField;
    qsEstoque: TDataSource;
    msEstoque: TDataSource;
    ProgressBar1: TProgressBar;
    tOrdImpTalao: TTable;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label2: TLabel;
    Bevel3: TBevel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    RxDBGrid2: TRxDBGrid;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    qsLoteRef: TDataSource;
    qEstoqueCodigo: TIntegerField;
    qEstoqueReferencia: TStringField;
    qEstoqueQtdPar: TFloatField;
    qEstoqueLote: TIntegerField;
    qLoteRef: TQuery;
    qLoteRefLote: TIntegerField;
    qLoteRefNome: TStringField;
    qLoteRefTalao: TIntegerField;
    qLoteRefDataEnt: TDateField;
    qLoteRefDataSaida: TDateField;
    qLoteRefCodProduto: TIntegerField;
    qLoteReflkReferencia: TStringField;
    qLoteRefQtdPar: TIntegerField;
    tOrdImpTalaoOrdem: TIntegerField;
    tOrdImpTalaoCodSetor: TIntegerField;
    tOrdImpTalaoCodAtelier: TIntegerField;
    tPedidoItem: TTable;
    tPedidoItemPedido: TIntegerField;
    tPedidoItemItem: TIntegerField;
    tPedidoItemCodProduto: TIntegerField;
    tPedidoItemCodCor: TIntegerField;
    tPedidoItemCodGrade: TIntegerField;
    tPedidoItemQtdPares: TFloatField;
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
    tPedidoItemReposicao: TBooleanField;
    tPedidoItemCodForma: TIntegerField;
    tPedidoItemObsLote: TStringField;
    qEstoqueNumPedido: TIntegerField;
    qEstoqueItemPedido: TIntegerField;
    Label5: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure mEstoqueNewRecord(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vReferencia : String;
    qSQL : String;
    procedure Verifica_Memo;
    procedure prc_Montar_qEstoque;
  public
    { Public declarations }
  end;

var
  fPrevEstIntermediarioMI: TfPrevEstIntermediarioMI;

implementation

uses UDM1, URelEstIntermediarioMI;

{$R *.DFM}

procedure TfPrevEstIntermediarioMI.Verifica_Memo;
var
  i, i2 : Integer;
  vExcluir : Boolean;
begin
  if mEstoque.Locate('Referencia',vReferencia,[loCaseInsensitive]) then
    begin
      vExcluir := True;
      i2 := DM1.tOrdImpTalao.RecordCount - 1;
      mEstoque.Edit;
      mEstoqueEstoque1.AsInteger := mEstoqueSetor1.AsInteger - mEstoqueSetor2.AsInteger;
      mEstoqueEstoque2.AsInteger := mEstoqueSetor2.AsInteger - mEstoqueSetor3.AsInteger;
      mEstoqueEstoque3.AsInteger := mEstoqueSetor3.AsInteger - mEstoqueSetor4.AsInteger;
      if i2 > 4 then
        mEstoqueEstoque4.AsInteger := mEstoqueSetor4.AsInteger - mEstoqueSetor5.AsInteger;
      if i2 > 5 then
        mEstoqueEstoque5.AsInteger := mEstoqueSetor5.AsInteger - mEstoqueSetor6.AsInteger;
      mEstoque.Post;

      //for i := 1 to i2 do
      //  if mEstoque.FieldByName('Estoque'+IntToStr(i)).AsInteger > 0 then
      //    vExcluir := False;
      for i := 1 to i2 do
        if mEstoque.FieldByName('Setor'+IntToStr(i)).AsInteger > 0 then
          vExcluir := False;

      if vExcluir then
        mEstoque.Delete;
    end;
end;

procedure TfPrevEstIntermediarioMI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tOrdImpTalao.Close;
  DM1.tProduto.Close;
  DM1.tProdutoSetor.Close;
  DM1.tSetor.Close;
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  DM1.tLoteMI.Close;
  DM1.tLotePedidoMI.Close;
  DM1.tTalaoMI.Close;
  DM1.tTalaoMovMI.Close;
  DM1.tCor.Close;
  qLoteRef.Filtered := False;
  qEstoque.Filtered := False;
  qLoteRef.Close;
  qEstoque.Close;
  Action := Cafree;
end;

procedure TfPrevEstIntermediarioMI.BitBtn1Click(Sender: TObject);
var
  i : Integer;
  vQtd : Integer;
  vContador : Integer;
begin
  if CurrencyEdit2.Value < CurrencyEdit1.Value then
    ShowMessage('Lote final não pode ser menor que inicial!')
  else
  if (CurrencyEdit1.Value > 0) and  (CurrencyEdit2.Value > 0) then
    begin
      Screen.Cursor  := crHourGlass;
      Label2.Caption := '...Aguarde...';
      fPrevEstIntermediarioMI.Refresh;
      mEstoque.EmptyTable;
      prc_Montar_qEstoque;
      //qEstoque.Close;
      //qEstoque.Open;
      qLoteRef.Filtered := False;
      qLoteRef.Close;
      qLoteRef.Open;
      Screen.Cursor := crDefault;
      vReferencia := qEstoqueReferencia.AsString;
      {qEstoque.Filtered := False;
      qEstoque.Filter   := 'Lote >= '''+CurrencyEdit1.Text+''' and Lote <= '''+CurrencyEdit2.Text+'''';
      qEstoque.Filtered := True;}
      ProgressBar1.Position := 0;
      ProgressBar1.Max      := qEstoque.RecordCount;
      vContador             := 0;
      Label8.Caption        := FormatFloat('0',qEstoque.RecordCount);
      qEstoque.First;
      while not qEstoque.Eof do
        begin
          vContador := vContador + 1;
          Label10.Caption := FormatFloat('0',vContador);
          Label8.Refresh;
          Label10.Refresh;
          i := 6;
          ProgressBar1.Position := ProgressBar1.Position + 1;
          if DM1.tOrdImpTalao.Locate('CodSetor',qEstoqueSetor.AsInteger,[loCaseInsensitive]) then
            i := DM1.tOrdImpTalaoOrdem.AsInteger;
          if vReferencia <> qEstoqueReferencia.AsString then
            Verifica_Memo;
          if mEstoque.Locate('Referencia',qEstoqueReferencia.AsString,[loCaseInsensitive]) then
            mEstoque.Edit
          else
            mEstoque.Insert;
          mEstoqueCodProduto.AsInteger := qEstoqueCodigo.AsInteger;
          mEstoqueReferencia.AsString  := qEstoqueReferencia.AsString;
          //Verifica se o pedido já foi faturado
          vQtd := qEstoqueQtdPar.AsInteger;
          tPedidoItem.SetKey;
          tPedidoItemPedido.AsInteger := qEstoqueNumPedido.AsInteger;
          tPedidoItemItem.AsInteger   := qEstoqueItemPedido.AsInteger;
          if tPedidoItem.GotoKey then
            if tPedidoItemQtdParesRest.AsFloat <= 0 then
              vQtd := 0;
          //mEstoque.FieldByName('Setor'+IntToStr(i)).AsInteger := mEstoque.FieldByName('Setor'+IntToStr(i)).AsInteger + qEstoqueQtdPar.AsInteger;
          mEstoque.FieldByName('Setor'+IntToStr(i)).AsInteger := mEstoque.FieldByName('Setor'+IntToStr(i)).AsInteger + vQtd;
          mEstoque.FieldByName('Nome'+IntToStr(i)).AsString   := qEstoquelkNomeSetor.AsString;
          vReferencia := qEstoqueReferencia.AsString;
          qEstoque.Next;
        end;
      if mEstoque.RecordCount > 0 then
        Verifica_Memo;
      mEstoque.First;
      Label2.Caption := '...Arquivo Gerado...';
      fPrevEstIntermediarioMI.Refresh;
      fRelEstIntermediarioMI := TfRelEstIntermediarioMI.Create(self);
      fRelEstIntermediarioMI.qrLotes.Caption := 'Lote Inicial: ' + CurrencyEdit1.Text + ' Lote Final: ' + CurrencyEdit2.Text; 
      fRelEstIntermediarioMI.QuickRep1.Preview;
      fRelEstIntermediarioMI.QuickRep1.Free;
      qEstoque.Filtered := False;
    end;
end;

procedure TfPrevEstIntermediarioMI.mEstoqueNewRecord(DataSet: TDataSet);
begin
  mEstoqueSetor1.AsInteger := 0;
  mEstoqueSetor2.AsInteger := 0;
  mEstoqueSetor3.AsInteger := 0;
  mEstoqueSetor4.AsInteger := 0;
  mEstoqueSetor5.AsInteger := 0;
  mEstoqueSetor6.AsInteger := 0;
end;

procedure TfPrevEstIntermediarioMI.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevEstIntermediarioMI.BitBtn3Click(Sender: TObject);
begin
  if not qEstoque.IsEmpty then
    begin
      Screen.Cursor  := crHourGlass;
      Label2.Caption := '....Aguarde....';
      qLoteRef.Close;
      qLoteRef.Params[0].AsInteger := qEstoqueCodigo.AsInteger;
      qLoteRef.Open;
      qLoteRef.Filtered := False;
      qLoteRef.Filter   := 'Lote >= '''+CurrencyEdit1.Text+''' and Lote <= '''+CurrencyEdit2.Text+'''';
      qLoteRef.Filtered := True;
      Screen.Cursor   := crDefault;
      Label2.Caption := '....Pedidos Gerados....';
    end
  else
    ShowMessage('Referência não selecionada!');
  {if not qEstoque.IsEmpty then
    begin
      vFlag := True;
      qLoteRef.Filtered    := False;
      qLoteRef.Filter      := 'Codigo = '''+qEstoqueCodigo.AsString+'''';
      qLoteRef.Filtered    := True;
      RxDBGrid2.DataSource := qsLoteRef;
    end;}
end;

procedure TfPrevEstIntermediarioMI.FormShow(Sender: TObject);
begin
  DM1.tOrdImpTalao.Open;
  DM1.tProduto.Open;
  DM1.tProdutoSetor.Open;
  DM1.tSetor.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tLoteMI.Open;
  DM1.tLotePedidoMI.Open;
  DM1.tTalaoMI.Open;
  DM1.tTalaoMovMI.Open;
  DM1.tCor.Open;
  Label2.Caption := '';
  mEstoque.Open;
  qSQL := qEstoque.SQL.Text;
end;

procedure TfPrevEstIntermediarioMI.prc_Montar_qEstoque;
var
  i : Integer;
  vComandoAux, vComandoAux2 : String;
  vComando : String;
begin
  {qEstoque.Close;
  i := PosEx('GROUP',qSQL,0);
  vComandoAux  := copy(qSQL,i,Length(qSQL) - i + 1);
  vComandoAux2 := copy(qSQL,1,i-1);
  vComando := ' AND Dbtalaomovmi.Lote >= ' + CurrencyEdit1.Text + ' AND <= ' + CurrencyEdit2.Text;}

  qEstoque.Close;
  qEstoque.ParamByName('LoteIni').AsInteger := CurrencyEdit1.AsInteger;
  qEstoque.ParamByName('LoteFin').AsInteger := CurrencyEdit2.AsInteger;
  qEstoque.Open;
end;

end.
