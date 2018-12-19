unit UPrevEstIntermediario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask, ToolEdit, Buttons, Db,
  DBTables, MemTable, DBFilter, Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, Variants;

type
  TfPrevEstIntermediario = class(TForm)
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
    qEstoqueCodigo: TIntegerField;
    qEstoqueReferencia: TStringField;
    qEstoqueQtdPar: TFloatField;
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
    tProdutoSetor: TTable;
    tProdutoSetorCodProduto: TIntegerField;
    tProdutoSetorItem: TIntegerField;
    tProdutoSetorCodSetor: TIntegerField;
    tProdutoSetorCodAtelier: TIntegerField;
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
    qLoteRef: TQuery;
    qLoteRefLote: TIntegerField;
    qLoteRefNroPedido: TIntegerField;
    qLoteRefItemPed: TIntegerField;
    qLoteRefNome: TStringField;
    qLoteRefTalao: TIntegerField;
    qLoteRefDataEnt: TDateField;
    qLoteRefDataSaida: TDateField;
    qsLoteRef: TDataSource;
    qLoteRefCodProduto: TIntegerField;
    qLoteReflkReferencia: TStringField;
    qLoteRefQtdPar: TIntegerField;
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
    qEstoqueNroPedido: TIntegerField;
    qEstoqueItemPed: TIntegerField;
    qLoteReflkQtdRestante: TIntegerField;
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
    procedure Verifica_Memo;
  public
    { Public declarations }
  end;

var
  fPrevEstIntermediario: TfPrevEstIntermediario;

implementation

uses UDM1, URelEstIntermediario;

{$R *.DFM}

procedure TfPrevEstIntermediario.Verifica_Memo;
var
  i, i2 : Integer;
  vExcluir : Boolean;
begin
  if mEstoque.Locate('Referencia',vReferencia,[loCaseInsensitive]) then
    begin
      vExcluir := True;
      DM1.tProduto.IndexFieldNames := 'Codigo';
      DM1.tProduto.SetKey;
      DM1.tProdutoCodigo.AsInteger := mEstoqueCodProduto.AsInteger;
      if DM1.tProduto.GotoKey then
        begin
          i2 := DM1.tProdutoSetor.RecordCount - 1;
          mEstoque.Edit;
          mEstoqueEstoque1.AsInteger := mEstoqueSetor1.AsInteger - mEstoqueSetor2.AsInteger;
          mEstoqueEstoque2.AsInteger := mEstoqueSetor2.AsInteger - mEstoqueSetor3.AsInteger;
          mEstoqueEstoque3.AsInteger := mEstoqueSetor3.AsInteger - mEstoqueSetor4.AsInteger;
          if i2 > 4 then
            mEstoqueEstoque4.AsInteger := mEstoqueSetor4.AsInteger - mEstoqueSetor5.AsInteger;
          if i2 > 5 then
            mEstoqueEstoque5.AsInteger := mEstoqueSetor5.AsInteger - mEstoqueSetor6.AsInteger;
          mEstoque.Post;

          for i := 1 to i2 do
            begin
              if mEstoque.FieldByName('Estoque'+IntToStr(i)).AsInteger > 0 then
                vExcluir := False;
            end;

          if vExcluir then
            mEstoque.Delete;
        end;
    end;
end;

procedure TfPrevEstIntermediario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tSetor.Close;
  DM1.tProduto.Close;
  DM1.tProdutoSetor.Close;
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  qLoteRef.Close;
  qEstoque.Close;
  Action := Cafree;
end;

procedure TfPrevEstIntermediario.BitBtn1Click(Sender: TObject);
var
  i : Integer;
  vQtd : Integer;
  vContador : Integer; 
begin
  Screen.Cursor  := crHourGlass;
  Label2.Caption := '...Aguarde...';
  fPrevEstIntermediario.Refresh;
  mEstoque.EmptyTable;
  qEstoque.Close;
  qEstoque.Open;
  qEstoque.First;
  qLoteRef.Close;
  qLoteRef.Open;
  Screen.Cursor   := crDefault;
  ProgressBar1.Position := 0;
  ProgressBar1.Max      := qEstoque.RecordCount;
  vReferencia := qEstoqueReferencia.AsString;
  Label8.Caption := FormatFloat('0',qEstoque.RecordCount);
  vContador := 0;
  while not qEstoque.Eof do
    begin
      vContador := vContador + 1;
      Label10.Caption := FormatFloat('0',vContador);
      Label8.Refresh;
      Label10.Refresh;
      i := 6;
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if tProdutoSetor.Locate('CodProduto;CodSetor',VarArrayOf([qEstoqueCodigo.AsInteger,qEstoqueSetor.AsInteger]),[locaseinsensitive]) then
        i := tProdutoSetorItem.AsInteger;
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
      tPedidoItemPedido.AsInteger := qEstoqueNroPedido.AsInteger;
      tPedidoItemItem.AsInteger   := qEstoqueItemPed.AsInteger;
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
  fPrevEstIntermediario.Refresh;
  fRelEstIntermediario := TfRelEstIntermediario.Create(self);
  fRelEstIntermediario.QuickRep1.Preview;
  fRelEstIntermediario.QuickRep1.Free;
end;

procedure TfPrevEstIntermediario.mEstoqueNewRecord(DataSet: TDataSet);
begin
  mEstoqueSetor1.AsInteger := 0;
  mEstoqueSetor2.AsInteger := 0;
  mEstoqueSetor3.AsInteger := 0;
  mEstoqueSetor4.AsInteger := 0;
  mEstoqueSetor5.AsInteger := 0;
  mEstoqueSetor6.AsInteger := 0;
end;

procedure TfPrevEstIntermediario.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevEstIntermediario.BitBtn3Click(Sender: TObject);
begin
  if not qEstoque.IsEmpty then
    begin
      Screen.Cursor  := crHourGlass;
      Label2.Caption := '....Aguarde....';
      qLoteRef.Close;
      qLoteRef.Params[0].AsInteger := qEstoqueCodigo.AsInteger;
      qLoteRef.Open;
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

procedure TfPrevEstIntermediario.FormShow(Sender: TObject);
begin
  DM1.tSetor.Open;
  DM1.tProduto.Open;
  DM1.tProdutoSetor.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  Label2.Caption := '';
  mEstoque.Open;
end;

end.
