unit UPrevCalcMaterialLote2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Variants, StdCtrls, Buttons, Mask,
  ToolEdit, CurrEdit, Db, DBTables, MemTable, DBFilter, RXCtrls, Menus, Grids, DBGrids, RXDBCtrl, DBVGrids, ALed, ComCtrls,
  DBClient, ShellApi;

  //inifiles, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, xmldom, XMLIntf, msxmldom,
  //XMLDoc, StdCtrls, oxmldom, Buttons, Mask, ToolEdit, DB, DBClient, IdIOHandler, IdIOHandlerSocket, IdBaseComponent,
  //IdComponent, IdTCPConnection, IdTCPClient, RzButton, RzSndMsg, RzTabs, ExtCtrls, IdCoder, IdCoder3to4, IdCoderMIME,
  //IdSSLOpenSSL, IdMessageClient, IdSMTP, IdMessage, JvComponent, JvMail, Mapi, , RLMetaFile, DBTables,
  //dbXPress, SqlExpr, UDMConsNotaEletronica;


type
  TfPrevCalcMaterialLote2 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    dsAuxCalcMaterial: TDataSource;
    tAuxItCalcMaterial: TTable;
    dsAuxItCalcMaterial: TDataSource;
    RxDBFilter1: TRxDBFilter;
    RxDBFilter2: TRxDBFilter;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    GroupBox1: TGroupBox;
    BitBtn3: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    BitBtn5: TBitBtn;
    tAuxCalcMaterialProd: TTable;
    dsAuxCalcMaterialProd: TDataSource;
    tAuxCalcMaterialProdCodProduto: TIntegerField;
    tAuxCalcMaterialProdQtdPares: TFloatField;
    tAuxCalcMaterialProdlkReferencia: TStringField;
    tAuxCalcMaterialProdlkNome: TStringField;
    mPrincipal: TMemoryTable;
    mPrincipalPrincipal: TIntegerField;
    qSetor: TQuery;
    qSetorCodSetor: TIntegerField;
    qSetorlkSetor: TStringField;
    msPrincipal: TDataSource;
    qsSetor: TDataSource;
    VDBGrid1: TVDBGrid;
    qAuxCalcMaterialProd: TQuery;
    qAuxCalcMaterialProdCodProduto: TIntegerField;
    qAuxCalcMaterialProdQtdPares: TFloatField;
    qAuxCalcMaterialProdNome: TStringField;
    qAuxCalcMaterialProdReferencia: TStringField;
    qsAuxCalcMaterialProd: TDataSource;
    BitBtn2: TBitBtn;
    qAuxCalcMaterial: TQuery;
    qAuxCalcMateriallkCor: TStringField;
    qsAuxCalcMaterial: TDataSource;
    qAuxCalcMaterialCodMaterial: TIntegerField;
    qAuxCalcMaterialCodCor: TIntegerField;
    qAuxCalcMaterialLargura: TStringField;
    qAuxCalcMaterialUnidade: TStringField;
    qAuxCalcMaterialQtdPares: TFloatField;
    qAuxCalcMaterialConsumo: TFloatField;
    qAuxCalcMaterialMaterial: TStringField;
    qAuxCalcMaterialCodForn: TIntegerField;
    qAuxCalcMaterialNomeForn: TStringField;
    qAuxItCalcMaterial: TQuery;
    qAuxItCalcMaterialCodMaterial: TIntegerField;
    qAuxItCalcMaterialCodCor: TIntegerField;
    qAuxItCalcMaterialLargura: TStringField;
    qAuxItCalcMaterialTamMaterial: TStringField;
    qAuxItCalcMaterialQtdPares: TFloatField;
    qsAuxItCalcMaterial: TDataSource;
    BitBtn4: TBitBtn;
    BitBtn7: TBitBtn;
    dsmTalao: TDataSource;
    tAuxCalcMaterialProdGrade: TTable;
    dsAuxCalcMaterialProdGrade: TDataSource;
    tAuxCalcMaterialProdGradeCodProduto: TIntegerField;
    tAuxCalcMaterialProdGradeCodGrade: TIntegerField;
    tAuxCalcMaterialProdGradePosicao: TIntegerField;
    tAuxCalcMaterialProdGradeQtdPar: TFloatField;
    tAuxCalcMaterialProdGradeTamanho: TStringField;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    qFornecedor: TQuery;
    dsqFornecedor: TDataSource;
    qFornecedorNomeForn: TStringField;
    qFornecedorCodForn: TIntegerField;
    BitBtn11: TBitBtn;
    RxDBFilter3: TRxDBFilter;
    dsmLote: TDataSource;
    tAuxCalcMaterialPed: TTable;
    tAuxCalcMaterialPedCodSetor: TIntegerField;
    tAuxCalcMaterialPedCodMaterial: TIntegerField;
    tAuxCalcMaterialPedCodCor: TIntegerField;
    tAuxCalcMaterialPedCodGrade: TIntegerField;
    dsAuxCalcMaterialPed: TDataSource;
    tCalcMaterial: TTable;
    tCalcMaterialNumOC: TIntegerField;
    tCalcMaterialItemOC: TIntegerField;
    tCalcMaterialCodMaterial: TIntegerField;
    tCalcMaterialCodCor: TIntegerField;
    tCalcMaterialQtdConsumo: TFloatField;
    tCalcMaterialQtdPares: TFloatField;
    tAuxCalcMaterialPedNumOC: TIntegerField;
    tCalcMaterialLote: TIntegerField;
    tAuxCalcMaterialPedLote: TIntegerField;
    mVerificaGrade: TClientDataSet;
    mVerificaGradeCodMaterial: TIntegerField;
    mVerificaGradeCodCor: TIntegerField;
    mVerificaGradeCodGrade: TIntegerField;
    mVerificaGradeTamanhos: TStringField;
    mLote: TClientDataSet;
    mLoteLote: TIntegerField;
    mTalao: TClientDataSet;
    mTalaoLote: TIntegerField;
    mTalaoTalao: TIntegerField;
    mVerificaMat: TClientDataSet;
    mVerificaMatPedido: TIntegerField;
    mVerificaMatItem: TIntegerField;
    mVerificaMatCodMat: TIntegerField;
    mVerificaMatCodCor: TIntegerField;
    mVerificaMatLargura: TStringField;
    mVerificaMatCodGrade: TIntegerField;
    tAuxCalcMaterial: TTable;
    tAuxCalcMaterialCodMaterial: TIntegerField;
    tAuxCalcMaterialCodCor: TIntegerField;
    tAuxCalcMaterialLargura: TStringField;
    tAuxCalcMaterialUnidade: TStringField;
    tAuxCalcMaterialQtdPares: TFloatField;
    tAuxCalcMaterialConsumo: TFloatField;
    tAuxCalcMaterialMaterial: TStringField;
    tAuxCalcMaterialCodForn: TIntegerField;
    tAuxCalcMaterialNumOC: TIntegerField;
    tAuxCalcMaterialData1: TDateField;
    tAuxCalcMaterialData2: TDateField;
    tAuxCalcMaterialData3: TDateField;
    tAuxCalcMaterialData4: TDateField;
    tAuxCalcMaterialNumLote: TIntegerField;
    tAuxCalcMaterialNumPedido: TIntegerField;
    tAuxCalcMaterialImpCalcMaterial: TBooleanField;
    tAuxCalcMaterialCodSetor: TIntegerField;
    tAuxCalcMaterialCodGrade: TIntegerField;
    tAuxCalcMaterialSelecionado: TBooleanField;
    tAuxCalcMaterialQtdNaoCortada: TFloatField;
    tAuxCalcMaterialQtdNaoCortadaConsumo: TFloatField;
    tAuxCalcMateriallkNomeSetor: TStringField;
    tAuxCalcMateriallkCor: TStringField;
    tAuxCalcMateriallkFornecedor: TStringField;
    tCalcMaterialMercado: TStringField;
    tAuxItCalcMaterialCodSetor: TIntegerField;
    tAuxItCalcMaterialCodMaterial: TIntegerField;
    tAuxItCalcMaterialCodCor: TIntegerField;
    tAuxItCalcMaterialCodGrade: TIntegerField;
    tAuxItCalcMaterialTamMaterial: TStringField;
    tAuxItCalcMaterialQtdPares: TFloatField;
    tAuxItCalcMaterialPosicao: TIntegerField;
    tAuxItCalcMaterialLargura: TStringField;
    tAuxCalcMaterialclUnitario: TFloatField;
    msVerificaMat: TDataSource;
    Panel2: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    StaticText1: TStaticText;
    Panel4: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn6: TBitBtn;
    CheckBox1: TCheckBox;
    DateEdit1: TDateEdit;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Label2: TLabel;
    tAuxCalcMaterialErro: TBooleanField;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label7: TLabel;
    tCalcMaterialNumPedido: TIntegerField;
    tAuxCalcMaterialQtdOC: TFloatField;
    tCalcMaterialQtdOC: TFloatField;
    qAuxCalcMaterialProdNomeModelo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure VDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure VDBGrid1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure tAuxCalcMaterialProdGradeNewRecord(DataSet: TDataSet);
    procedure tAuxItCalcMaterialNewRecord(DataSet: TDataSet);
    procedure tAuxCalcMaterialProdNewRecord(DataSet: TDataSet);
    procedure tAuxCalcMaterialCalcFields(DataSet: TDataSet);
    procedure tAuxCalcMaterialNewRecord(DataSet: TDataSet);
    procedure tAuxCalcMaterialBeforePost(DataSet: TDataSet);
    procedure tAuxCalcMaterialAfterPost(DataSet: TDataSet);
    procedure tAuxCalcMaterialBeforeDelete(DataSet: TDataSet);
  private

    vOCIni, vOCFin: Integer;
    vLote: Integer;
    vPedido : Integer;
    vOpcao: Integer;
    vMercado: string;

    linha, pagina, vQtdTotal, TotalPr: Integer;
    F: TextFile;
    vPreco: Real;
    vLancamento: Integer;
    texto, vUnidade, Nlotes: string;
    vCodProduto, vCodCorProd, vCodCombinacao, vCodSetor, vCodMaterial, vCodCorMat: Integer;
    vQtdPares, vConsumo: Real;
    vLargura, vTipo: string[1];
    vCodGrade: Integer;
    vPosicao : Integer;

    { Private declarations }
    procedure Le_Material;
    procedure Monta_Aux_Material;
    procedure Imprimir_Mapa;
    procedure Imprime_Cabecalho;
    procedure Imprime_Ref;
    procedure Imprime_CabSetor;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;
    procedure Grava_OC;
    procedure Grava_TabCalcMaterial;

    procedure Filtra_Pedido;
    procedure Filtra_LoteMI;
    procedure Filtra_LoteExp;
    procedure Grava_tAuxItCalcMaterial(CodGrade, Posicao, Qtd : Integer ; Tamanho : String);
    procedure Grava_tAuxCalcMaterialProd;
    procedure Grava_tAuxcalcMaterialProdGrade(CodGrade, Posicao, Qtd : Integer ; Tamanho : String);

  public
    { Public declarations }
    vCodFornecedorSel: Integer;
    
  end;

var
  fPrevCalcMaterialLote2: TfPrevCalcMaterialLote2;


implementation

uses UDM1, UEscImpressora, UDM2, UConsLote, UEscFornecedor,
  UConsCalcMaterialPed, URelCalcMaterialLote, rsDBUtils;

{$R *.DFM}

procedure TfPrevCalcMaterialLote2.Filtra_LoteExp;
begin
  if (CurrencyEdit1.AsInteger <= 0) or (CurrencyEdit2.AsInteger <= 0) then
  begin
    ShowMessage('Lote inicial e final não foram informados!');
    exit;
  end;

  vLancamento   := 0;
  Screen.Cursor := crHourglass;
  vQtdPares     := 0;

  DM1.tLote.Filtered := False;
  DM1.tLote.Filter := 'Lote >= ''' + CurrencyEdit1.Text + ''' and Lote <= ''' + CurrencyEdit2.Text + '''';
  DM1.tLote.Filtered := True;

  ProgressBar1.Max      := DM1.tLote.RecordCount;
  ProgressBar1.Position := 0;

  DM1.tPedido.IndexFieldNames     := 'Pedido';
  DM1.tPedidoItem.IndexFieldNames := 'Pedido;Item';

  DM1.tLote.First;
  while not DM1.tLote.EOF do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    //if DM1.tLoteNumOCIni.AsInteger > 0 then
    //  ShowMessage('Lote ' + DM1.tLoteLote.AsString + ', já foi gerado OC!');
    if DM1.tPedido.FindKey([DM1.tLoteNroPedido.AsInteger]) then
    begin
    //AQUI FALTA LER O tPedidoItem
      if DM1.tPedidoItem.FindKey([DM1.tLoteNroPedido.AsInteger,DM1.tLoteItemPed.AsInteger]) then
      begin
       //aqui alterar para and  27/09/2014
        //if (DM1.tPedidoItemQtdParesRest.AsInteger > 0) or not(DM1.tPedidoItemCancelado.AsBoolean) then
        if (DM1.tPedidoItemQtdParesRest.AsInteger > 0) and not(DM1.tPedidoItemCancelado.AsBoolean) then
        begin
          DM1.tTalao.First;
          while not DM1.tTalao.Eof do
          begin
            vCodProduto    := DM1.tTalaoCodProduto.AsInteger;
            vCodCorProd    := DM1.tTalaoCodCor.AsInteger;
            vCodCombinacao := 0;
            vQtdPares      := DM1.tTalaoQtdPar.AsFloat;
            DM1.tTalaoGrade.First;
            vLargura       := DM1.tTalaoGradelkLargura.AsString;
            vCodGrade      := DM1.tTalaoGradeCodGrade.AsInteger;
            vTipo          := 'E';
            vLote          := DM1.tLoteLote.AsInteger;
            vPedido        := DM1.tPedidoPedido.AsInteger;
            Le_Material;

            DM1.tTalao.Next;
          end;

          vQtdPares := vQtdPares + DM1.tLoteQtdPares.AsInteger;
          TotalPr := TotalPr + DM1.tLoteQtdPares.AsInteger;
          if Nlotes = '' then
            NLotes := DM1.tLoteLote.AsString
          else
            NLotes := NLotes + ', ' + DM1.tLoteLote.AsString;
        end;
      end;
    end;
    DM1.tLote.Next;
  end;

  DM1.tLote.Filtered := False;

  Screen.Cursor := crDefault;
end;

procedure TfPrevCalcMaterialLote2.Grava_TabCalcMaterial;
begin
  DM1.tCalcMaterial.Refresh;
  DM1.tCalcMaterial.First;
  while not DM1.tCalcMaterial.Eof do
    DM1.tCalcMaterial.Delete;
  DM1.tCalcMaterial.Refresh;
  tAuxCalcMaterialPed.First;
  while not tAuxCalcMaterialPed.Eof do
  begin
    DM1.tCalcMaterial.Insert;
      //DM1.tCalcMaterialFilial.AsInteger      := DM1.tOrdemCompraItemFilial.AsInteger;
    DM1.tCalcMaterialNumOC.AsInteger := DM1.tOrdemCompraItemCodigo.AsInteger;
    DM1.tCalcMaterialItemOC.AsInteger := DM1.tOrdemCompraItemItem.AsInteger;
    DM1.tCalcMaterialMercado.AsString := vMercado;
    //11/07/2014
    if RadioGroup2.ItemIndex = 0 then
      DM1.tCalcMaterialNumPedido.AsInteger := tAuxCalcMaterialPedLote.AsInteger
    else
      DM1.tCalcMaterialLote.AsInteger := tAuxCalcMaterialPedLote.AsInteger;
    DM1.tCalcMaterialCodMaterial.AsInteger := DM1.tOrdemCompraItemCodMaterial.AsInteger;
    DM1.tCalcMaterialCodCor.AsInteger := DM1.tOrdemCompraItemCodCor.AsInteger;
    //11/07/2014
    DM1.tCalcMaterialQtdOC.AsFloat    := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat));
    DM1.tCalcMaterial.Post;
    tAuxCalcMaterialPed.Next;
  end;
end;

procedure TfPrevCalcMaterialLote2.Grava_OC;
var
  vNumOC: Integer;
  vCodForn: Integer;
  vItem: Integer;
begin
  DM1.tMaterial.IndexFieldNames     := 'Codigo';
  DM1.tOrdemCompra.IndexFieldNames  := 'Filial;Codigo';
  tAuxCalcMaterial.IndexFieldNames  := 'CodForn';
  DM1.tFornecedores.IndexFieldNames := 'CodForn';
  DM1.tGrade.IndexFieldNames        := 'Codigo';
  vCodForn := 0;
  vItem    := 0;
  tAuxCalcMaterial.First;
  while not tAuxCalcMaterial.Eof do
  begin
    if not tAuxCalcMaterialErro.AsBoolean then
    begin
      Dm1.tMaterial.SetKey;
      Dm1.tMaterialCodigo.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
      if (Dm1.tMaterial.GotoKey) and ((Dm1.tMateriallkGeraOC.AsBoolean) or (DM1.tMaterialGeraOC.AsBoolean)) then
      begin
        if (tAuxCalcMaterialCodForn.AsInteger > 0) and (tAuxCalcMaterialNumOC.AsInteger < 1) then
        begin
          if vCodForn <> tAuxCalcMaterialCodForn.AsInteger then
          begin
            if DM1.tOrdemCompra.State in [dsEdit] then
              DM1.tOrdemCompra.Post;
            DM1.tOrdemCompra.Last;
            vNumOC := DM1.tOrdemCompraCodigo.AsInteger + 1;
            if vOCIni = 0 then
              vOCIni := vNumOC;
            vOCFin := vNumOC;
            DM1.tOrdemCompra.Insert;
            DM1.tOrdemCompraCodigo.AsInteger        := vNumOC;
            DM1.tOrdemCompraEntregue.AsBoolean      := False;
            DM1.tOrdemCompraDtEmissao.AsDateTime    := Date;
            DM1.tOrdemCompraCodFornecedor.AsInteger := tAuxCalcMaterialCodForn.AsInteger;
            DM1.tFornecedores.SetKey;
            DM1.tFornecedoresCodForn.AsInteger := tAuxCalcMaterialCodForn.AsInteger;
            if DM1.tFornecedores.GotoKey then
              DM1.tOrdemCompraCodCondPgto.AsInteger := DM1.tFornecedoresCodCondPgto.AsInteger;
            DM1.tOrdemCompraVlrTotal.AsFloat := 0;
            if tAuxCalcMaterialProd.RecordCount > 0 then
            begin
              tAuxCalcMaterialProd.First;
              DM1.tOrdemCompraCodProd.AsInteger := tAuxCalcMaterialProdCodProduto.AsInteger;
            end;

            DM1.tOrdemCompra.Post;
            DM1.tOrdemCompra.Edit;
            vItem := 0;
          end;
          inc(vItem);
                //Grava os Materiais
          DM1.tOrdemCompraItem.Insert;
          DM1.tOrdemCompraItemCodigo.AsInteger := DM1.tOrdemCompraCodigo.AsInteger;
          DM1.tOrdemCompraItemItem.AsInteger := vItem;
          DM1.tOrdemCompraItemCodMaterial.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
          DM1.tOrdemCompraItemCodCor.AsInteger := tAuxCalcMaterialCodCor.AsInteger;
          DM1.tOrdemCompraItemCodGrade.AsInteger := tAuxCalcMaterialCodGrade.AsInteger;
          DM1.tOrdemCompraItemQtd.AsFloat := tAuxCalcMaterialConsumo.AsFloat;
          DM1.tOrdemCompraItemUnidade.AsString := tAuxCalcMaterialUnidade.AsString;
          DM1.tOrdemCompraItemQtdRestante.AsFloat := DM1.tOrdemCompraItemQtd.AsFloat;
          DM1.tOrdemCompraItemQtdEntregue.AsFloat := 0;
          DM1.tMaterial.SetKey;
          DM1.tMaterialCodigo.AsInteger := DM1.tOrdemCompraItemCodMaterial.AsInteger;
          if DM1.tMaterial.GotoKey then
          begin
            if DM1.tMaterialPrecoCor.AsBoolean then
            begin
              if DM1.tMaterialCor.Locate('CodMaterial;CodCor', VarArrayOf([DM1.tMaterialCodigo.AsInteger, DM1.tOrdemCompraItemCodCor.AsInteger]), [locaseinsensitive]) then
                DM1.tOrdemCompraItemVlrUnitario.AsFloat := DM1.tMaterialCorPrCusto.AsFloat;
            end
            else
              DM1.tOrdemCompraItemVlrUnitario.AsFloat := DM1.tMaterialPrCusto.AsFloat;
            DM1.tOrdemCompraItemAliqIpi.AsFloat := DM1.tMaterialIPI.AsFloat;
          end;
          DM1.tOrdemCompraItemDtEntrega.AsDateTime := tAuxCalcMaterialData1.AsDateTime;
          if DM1.tOrdemCompraItemDtEntrega.AsDateTime < 10 then
          begin
            if DateEdit1.Date > 10 then
              DM1.tOrdemCompraItemDtEntrega.AsDateTime := DateEdit1.Date
            else
              DM1.tOrdemCompraItemDtEntrega.Clear;
          end;
          if DM1.tOrdemCompraItemAliqIPI.AsFloat > 0 then
            DM1.tOrdemCompraItemVlrIpi.AsFloat := StrToFloat(FormatFloat('0.00', (DM1.tOrdemCompraItemQtd.AsFloat * DM1.tOrdemCompraItemVlrUnitario.AsFloat) *
              DM1.tOrdemCompraItemAliqIPI.AsFloat / 100));
          DM1.tOrdemCompraItemVlrTotal.AsFloat := StrToFloat(FormatFloat('0.00', (DM1.tOrdemCompraItemQtd.AsFloat * DM1.tOrdemCompraItemVlrUnitario.AsFloat)));

          DM1.tOrdemCompraVlrTotal.AsFloat := StrToFloat(FormatFloat('0.00', DM1.tOrdemCompraVlrTotal.AsFloat +
            DM1.tOrdemCompraItemVlrTotal.AsFloat));
          if DateEdit1.Text <> '  /  /    ' then
            DM1.tOrdemCompraDtEntrega.AsDateTime := DateEdit1.Date
          else
            DM1.tOrdemCompraDtEntrega.AsDateTime := DM1.tOrdemCompraItemDtEntrega.AsDateTime;

          DM1.tOrdemCompraItem.Post;
          tAuxItCalcMaterial.First;
          while not tAuxItCalcMaterial.Eof do
          begin
            if tAuxItCalcMaterialPosicao.AsInteger > 0 then
            begin
              if DM1.tOrdemCompraItemGrade.FindKey([1,DM1.tOrdemCompraCodigo.AsInteger,DM1.tOrdemCompraItemItem.AsInteger,tAuxItCalcMaterialCodGrade.AsInteger,tAuxItCalcMaterialPosicao.AsInteger]) then
                DM1.tOrdemCompraItemGrade.Edit
              else
              begin
                DM1.tOrdemCompraItemGrade.Insert;
                DM1.tOrdemCompraItemGradeCodigo.AsInteger   := DM1.tOrdemCompraCodigo.AsInteger;
                DM1.tOrdemCompraItemGradeItem.AsInteger     := DM1.tOrdemCompraItemItem.AsInteger;
                DM1.tOrdemCompraItemGradeCodGrade.AsInteger := tAuxItCalcMaterialCodGrade.AsInteger;
                DM1.tOrdemCompraItemGradePosicao.AsInteger  := tAuxItCalcMaterialPosicao.AsInteger;
              end;
              DM1.tOrdemCompraItemGradeQtd.AsFloat         := DM1.tOrdemCompraItemGradeQtd.AsFloat + tAuxItCalcMaterialQtdPares.AsInteger;
              DM1.tOrdemCompraItemGradeQtdRestante.AsFloat := DM1.tOrdemCompraItemGradeQtdRestante.AsFloat + tAuxItCalcMaterialQtdPares.AsInteger;
              DM1.tOrdemCompraItemGradeQtdEntregue.AsFloat := 0;
              DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat := 0;
              DM1.tOrdemCompraItemGradeVlrTotal.AsFloat := 0;
              DM1.tOrdemCompraItemGrade.Post;
            end
            else
              tAuxItCalcMaterial.Last;
            tAuxItCalcMaterial.Next;
          end;
          tAuxCalcMaterial.Edit;
          tAuxCalcMaterialNumOC.AsInteger := DM1.tOrdemCompraCodigo.AsInteger;
          tAuxCalcMaterial.Post;
          Grava_TabCalcMaterial;
          vCodForn := tAuxCalcMaterialCodForn.AsInteger;
        end;
      end;
    end;
    tAuxCalcMaterial.Next;
  end;
  if DM1.tOrdemCompra.State in [dsEdit] then
    DM1.tOrdemCompra.Post;
  tAuxCalcMaterial.IndexFieldNames := 'CodSetor;CodMaterial;CodCor;Largura';
end;

procedure TfPrevCalcMaterialLote2.Le_Material;
begin
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := vCodProduto;
  if DM1.tProduto.GotoKey then
  begin

    //*** Grava a tabela auxiliar das referências
    Grava_tAuxCalcMaterialProd;

    ProgressBar2.Max      := DM1.tPedidoMaterial.RecordCount;
    ProgressBar2.Position := 0;

    //****************
    DM1.tPedidoMaterial.First;
    while not DM1.tPedidoMaterial.Eof do
    begin
      ProgressBar2.Position := ProgressBar2.Position + 1;
      if (RadioGroup2.ItemIndex = 1) and (DM1.tPedidoMaterialPedido.AsInteger <> DM1.tTalaoMINumPedido.AsInteger) then
        ShowMessage('Pedido diferente do talão, verificar!')
      else
      if DM1.tPedidoMaterialPedido.AsInteger <> DM1.tPedidoPedido.AsInteger then
        ShowMessage('Pedido diferente do talão, verificar!');
      if DM1.tPedidoMateriallkCalcMaterial.AsBoolean then
      begin
        vUnidade     := DM1.tPedidoMateriallkUnidade.AsString;
        vConsumo     := DM1.tPedidoMaterialConsumoPr.AsFloat;
        vCodSetor    := 0;
        vCodMaterial := DM1.tPedidoMaterialCodMaterial.AsInteger;
        vCodCorMat   := DM1.tPedidoMaterialCodCor.AsInteger;
        Monta_Aux_Material;
      end;
      DM1.tPedidoMaterial.Next;
    end;
  end;
end;

procedure TfPrevCalcMaterialLote2.Monta_Aux_Material;
var
  vTamMaterial: string[3];
  vLarguraAux: string[1];
  vCodGradeAux, vPosicaoAux: Integer;
  vTextoTam: string;
  vNumAux : Integer;
  vItemAux : Integer;
begin
  vTamMaterial := '';
  vCodGradeAux := 0;
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  DM1.tMaterial.FindKey([vCodMaterial]);

  //Le a tabela tMaterialGradeNum para achar a grade do material
  if DM1.tMaterialCodGrade.AsInteger > 0 then
  begin
    if DM1.tMaterialGradeNum.Locate('CodMaterial;CodGrade', VarArrayOf([vCodMaterial, vCodGrade]), [locaseinsensitive]) then
      vCodGradeAux := DM1.tMaterialGradeNumCodGradeMat.AsInteger
    else
    begin
      //Verifica a grade dentro do material
      vCodGradeAux := vCodGrade;
      DM1.tGrade.IndexFieldNames := 'Codigo';
      DM1.tGrade.FindKey([vCodGrade]);
      vTextoTam := '';
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
      begin
        vTextoTam := vTextoTam + DM1.tGradeItemTamanho.AsString;
        DM1.tGradeItem.Next;
      end;
      if mVerificaGrade.Locate('CodMaterial;CodCor;Tamanhos', VarArrayOf([vCodMaterial, vCodCorMat, vTextoTam]), [locaseinsensitive]) then
        vCodGradeAux := mVerificaGradeCodGrade.AsInteger
      else
      begin
        mVerificaGrade.Insert;
        mVerificaGradeCodMaterial.AsInteger := vCodMaterial;
        mVerificaGradeCodCor.AsInteger      := vCodCorMat;
        mVerificaGradeCodGrade.AsInteger    := vCodGrade;
        mVerificaGradeTamanhos.AsString     := vTextoTam;
        mVerificaGrade.Post;
      end;
    end;
  end;

  vLarguraAux := vLargura;
  if DM1.tMaterialCodGrade.AsInteger < 1 then
    vLarguraAux := '';
  tAuxCalcMaterial.indexFieldNames := 'CodSetor;CodMaterial;CodCor;Largura';
  tAuxCalcMaterial.SetKey;
  tAuxCalcMaterialCodSetor.AsInteger    := vCodSetor;
  tAuxCalcMaterialCodMaterial.AsInteger := vCodMaterial;
  tAuxCalcMaterialCodCor.AsInteger      := vCodCorMat;
  tAuxCalcMaterialLargura.AsString      := vLarguraAux;
  if not tAuxCalcMaterial.GotoKey then
  begin
    tAuxCalcMaterial.Insert;

    tAuxCalcMaterialCodSetor.AsInteger        := vCodSetor;
    tAuxCalcMaterialCodMaterial.AsInteger     := vCodMaterial;
    tAuxCalcMaterialCodCor.AsInteger          := vCodCorMat;
    tAuxCalcMaterialCodGrade.AsInteger        := vCodGradeAux;
    tAuxCalcMaterialLargura.AsString          := vLarguraAux;
    tAuxCalcMaterialUnidade.AsString          := DM1.tMaterialUnidade.AsString;
    tAuxCalcMaterialQtdPares.AsFloat          := vQtdPares;
    tAuxCalcMaterialConsumo.AsFloat           := vQtdPares * vConsumo;
    tAuxCalcMaterialMaterial.AsString         := DM1.tMaterialNome.AsString;
    tAuxCalcMaterialCodForn.AsInteger         := DM1.tMaterialFornecedor.AsInteger;
    tAuxCalcMaterialImpCalcMaterial.AsBoolean := DM1.tMaterialImpCalcMaterial.AsBoolean;
    tAuxCalcMaterial.Post;
  end
  else
    begin // Encontra material e soma quantidade
      tAuxCalcMaterial.Edit;
      case RadioGroup2.ItemIndex of
        0: begin
            if not mVerificaMat.Locate('Pedido;Item;CodMat;CodCor;Largura', VarArrayOf([DM1.tPedidoPedido.AsInteger, DM1.tPedidoItemItem.AsInteger, vCodMaterial, vCodCorMat, vLarguraAux]), [locaseinsensitive]) then
              tAuxCalcMaterialQtdPares.AsFloat := tAuxCalcMaterialQtdPares.AsFloat + vQtdPares;
          end;
        1: begin
            if not mVerificaMat.Locate('Pedido;Item;CodMat;CodCor;Largura', VarArrayOf([DM1.tLoteMILote.AsInteger, DM1.tTalaoMIItem.AsInteger, vCodMaterial, vCodCorMat, vLarguraAux]), [locaseinsensitive]) then
              tAuxCalcMaterialQtdPares.AsFloat := tAuxCalcMaterialQtdPares.AsFloat + vQtdPares;
          end;
        2: begin
            if not mVerificaMat.Locate('Pedido;Item;CodMat;CodCor;Largura', VarArrayOf([DM1.tLoteLote.AsInteger, DM1.tTalaoItem.AsInteger, vCodMaterial, vCodCorMat, vLarguraAux]), [locaseinsensitive]) then
              tAuxCalcMaterialQtdPares.AsFloat      := tAuxCalcMaterialQtdPares.AsFloat + vQtdPares;
          end;
      end;
      tAuxCalcMaterialConsumo.AsFloat              := tAuxCalcMaterialConsumo.AsFloat + (vQtdPares * vConsumo);
      tAuxCalcMaterial.Post;
    end;

  if DM1.tMaterialCodGrade.AsInteger > 0 then
  begin // Verifica se material tem grade
    if RadioGroup2.ItemIndex = 0 then
    begin
      DM1.tPedidoGrade.First;
      while not DM1.tPedidoGrade.EOF do
      begin
        if DM1.tPedidoGradeQtd.AsInteger > 0 then
          Grava_tAuxItCalcMaterial(DM1.tPedidoGradeCodGrade.AsInteger,DM1.tPedidoGradePosicao.AsInteger,DM1.tPedidoGradeQtd.AsInteger,DM1.tPedidoGradelkTamanho.AsString);
        DM1.tPedidoGrade.Next
      end;
    end
    else
    if RadioGroup2.ItemIndex = 1 then
    begin
      DM1.tTalaoGradeMI.First;
      while not DM1.tTalaoGradeMI.EOF do
      begin
        if DM1.tTalaoGradeMIQtdPar.AsInteger > 0 then
          Grava_tAuxItCalcMaterial(DM1.tTalaoGradeMICodGrade.AsInteger,DM1.tTalaoGradeMIPosicao.AsInteger,DM1.tTalaoGradeMIQtdPar.AsInteger,DM1.tTalaoGradeMIlkTamanho.AsString);
        DM1.tTalaoGradeMI.Next;
      end;
    end
    else
    if RadioGroup2.ItemIndex = 2 then
    begin
      DM1.tTalaoGrade.First;
      while not DM1.tTalaoGrade.EOF do
      begin
        if DM1.tTalaoGradeQtdPar.AsInteger > 0 then
          Grava_tAuxItCalcMaterial(DM1.tTalaoGradeCodGrade.AsInteger,DM1.tTalaoGradePosicao.AsInteger,DM1.tTalaoGradeQtdPar.AsInteger,DM1.tTalaoGradelkTamanho.AsString);
        DM1.tTalaoGrade.Next;
      end;
    end;
  end;

  vNumAux  := 0;
  vItemAux := 0;
  if RadioGroup2.ItemIndex = 0 then
  begin
    vNumAux  := DM1.tPedidoPedido.AsInteger;
    vItemAux := DM1.tPedidoItemItem.AsInteger;
  end
  else
  if RadioGroup2.ItemIndex = 1 then
  begin
    vNumAux  := DM1.tLoteMILote.AsInteger;
    vItemAux := DM1.tTalaoMIItem.AsInteger;
  end
  else
  if RadioGroup2.ItemIndex = 2 then
  begin
    vNumAux  := DM1.tLoteLote.AsInteger;
    vItemAux := DM1.tTalaoItem.AsInteger;
  end;

  if not mVerificaMat.Locate('Pedido;Item;CodMat;CodCor;Largura', VarArrayOf([vNumAux,vItemAux, vCodMaterial, vCodCorMat, vLarguraAux]), [locaseinsensitive]) then
  begin
    mVerificaMat.Insert;
    mVerificaMatPedido.AsInteger   := vNumAux;
    mVerificaMatItem.AsInteger     := vItemAux;
    mVerificaMatCodMat.AsInteger   := vCodMaterial;
    mVerificaMatCodCor.AsInteger   := vCodCorMat;
    mVerificaMatLargura.AsString   := vLarguraAux;
    mVerificaMatCodGrade.AsInteger := vCodGradeAux;
    mVerificaMat.Post;
  end;
end;

procedure TfPrevCalcMaterialLote2.Imprimir_Mapa;
var
  i: Integer;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha := 99;
  pagina := 0;
  AssignFile(F, DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F, #15);

  vQtdPares := 0;
  Imprime_Cabecalho;
  //*** Imprime as referências
  Writeln(F, 'Referencia  Nome                              Pares');
  Writeln(F, '------------------------------------------------------------------------------------------------------------------------------------');
  Linha := Linha + 2;
  qAuxCalcMaterialProd.First;
  while not qAuxCalcMaterialProd.Eof do
  begin
    Imprime_Ref;
    vQtdPares := vQtdPares + qAuxCalcMaterialProdQtdPares.AsFloat;
    qAuxCalcMaterialProd.Next;
  end;
  Writeln(F, '            --------------------------------------');
  texto := FormatFloat('###,###,##0', vQtdPares);
  for i := 1 to 11 - Length(texto) do
    texto := ' ' + texto;
  texto := '            ...........Total Geral==>  ' + texto;
  Writeln(F, texto);
  linha := linha + 2;

  //*** Imprime os materiais
  vCodSetor := 0;
  tAuxCalcMaterial.IndexFieldNames := 'CodSetor;Material';
  tAuxCalcMaterial.Refresh;
  tAuxCalcMaterial.First;
  while not tAuxCalcMaterial.EOF do
  begin
    if linha > 61 then
    begin
      Imprime_Cabecalho;
      Imprime_CabSetor;
    end
    else
      if vCodSetor <> tAuxCalcMaterialCodSetor.AsInteger then
      begin
        if Linha > 59 then
          Imprime_Cabecalho;
        Imprime_CabSetor;
      end;
    Imprime_Detalhe;
    vCodSetor := tAuxCalcMaterialCodSetor.AsInteger;
    tAuxCalcMaterial.Next;
  end;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //07/04/2015  trocado o comando para mostrar a impressão em texto
    //WinExec(PChar(Texto), SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfPrevCalcMaterialLote2.Imprime_Cabecalho;
var
  i: Integer;
  texto1: string;
begin
  pagina := pagina + 1;
  if Pagina > 1 then
  begin
    while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
  end;

  texto1 := copy(DM1.tEmpresaEmpresa.AsString, 1, 52);
  for i := 1 to 53 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'RELACAO DO CALCULO DOS MATERIAIS PARA COMPRAS               Pagina.: ' + IntToStr(Pagina);
  Writeln(F, Texto1);

  texto1 := '';
  if RadioGroup2.ItemIndex = 0 then
    texto1 := 'Pedido: ' + Edit1.Text + ' a ' + Edit2.Text
  else
    if RadioGroup2.ItemIndex = 1 then
      texto1 := 'Lote: ' + CurrencyEdit1.Text + ' a ' + CurrencyEdit2.Text;

  for i := 1 to 113 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Emissao: ' + DateToStr(Date);
  Writeln(F, Texto1);
  Writeln(F, '------------------------------------------------------------------------------------------------------------------------------------');

  linha := 3;
end;

procedure TfPrevCalcMaterialLote2.Imprime_Ref;
var
  i: Integer;
  texto1, texto2, texto3, texto4: string;
begin
  texto1 := qAuxCalcMaterialProdReferencia.AsString;
  for i := 1 to 8 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := ' ' + texto1 + '   ';

  texto2 := copy(qAuxCalcMaterialProdNome.AsString, 1, 30);
  for i := 1 to 30 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '  ';

  texto2 := FormatFloat('###,##0', qAuxCalcMaterialProdQtdPares.AsFloat);
  for i := 1 to 7 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F, texto1);

  linha := linha + 1;

  tAuxCalcMaterialProdGrade.Filtered := False;
  tAuxCalcMaterialProdGrade.Filter := 'CodProduto = ''' + qAuxCalcMaterialProdCodProduto.AsString + '''';
  tAuxCalcMaterialProdGrade.Filtered := True;
  if not tAuxCalcMaterialProdGrade.IsEmpty then
  begin
    Texto2 := '';
    Texto3 := '        Tam:';
    Texto4 := '        Qtd:';
    tAuxCalcMaterialProdGrade.First;
    while not tAuxCalcMaterialProdGrade.EOF do
    begin
      if tAuxCalcMaterialProdGradeQtdPar.AsFloat > 0 then
      begin
        Texto2 := '';
        Texto2 := tAuxCalcMaterialProdGradeTamanho.AsString;
        for i := 1 to 4 - length(Texto2) do
          texto2 := ' ' + texto2;
        Texto3 := Texto3 + ' ' + Texto2;
        Texto2 := tAuxCalcMaterialProdGradeQtdPar.AsString;
        for i := 1 to 4 - length(tAuxCalcMaterialProdGradeQtdPar.AsString) do
          Texto2 := ' ' + texto2;
        texto4 := texto4 + ' ' + texto2;
      end;
      tAuxCalcMaterialProdGrade.Next;
    end;
    Writeln(F, texto3);
    Writeln(F, texto4);
    Linha := Linha + 2;
  end;
end;

procedure TfPrevCalcMaterialLote2.Imprime_CabSetor;
var
  texto1: string;
begin
  Writeln(F, '====================================================================================================================================');
  texto1 := '  ' + tAuxCalcMaterialCodSetor.AsString + ' - ' + tAuxCalcMateriallkNomeSetor.AsString;
  Writeln(F, texto1);
  Writeln(F, '-Codigo-Material---------------------------------Cor--------------Pares-------Consumo--Un---Fornecedor------------------------------');
  Linha := Linha + 3;
end;

procedure TfPrevCalcMaterialLote2.Imprime_Detalhe;
var
  texto1, texto2, texto3, texto5: string;
  i: Integer;
  vQtdAux: Real;
begin
  texto2 := tAuxCalcMaterialCodMaterial.AsString;
  for i := 1 to 7 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto2 + ' ';
  texto2 := copy(tAuxCalcMaterialMaterial.AsString, 1, 40);
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := tAuxCalcMateriallkCor.AsString;
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('###,##0', tAuxCalcMaterialQtdPares.AsFloat);
  for i := 1 to 7 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('###,##0.0000', tAuxCalcMaterialConsumo.AsFloat);
  for i := 1 to 12 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '  ';
  texto2 := tAuxCalcMaterialUnidade.AsString;
  for i := 1 to 3 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '  ';
  texto2 := tAuxCalcMateriallkFornecedor.AsString;
  if texto2 <> '' then
  begin
    for i := 1 to 40 - Length(texto2) do
      texto2 := texto2 + ' ';
  end
  else
  begin
    for i := 1 to 40 - Length(texto2) do
      texto2 := texto2 + '_';
  end;
  texto1 := texto1 + texto2;
  Writeln(F, texto1);
  linha := linha + 1;

  //*** Imprime a grade do material
  if tAuxItCalcMaterial.RecordCount > 0 then
  begin
    vQtdAux := 0;
    texto2 := '          Tam: ';
    if (tAuxCalcMaterialLargura.AsString <> '') and (tAuxCalcMaterialLargura.AsString <> ' ') then
      texto2 := ' Larg: ' + tAuxCalcMaterialLargura.AsString + '  Tam: ';
    texto3 := '          Qtd: ';
    tAuxItCalcMaterial.First;
    while not tAuxItCalcMaterial.EOF do
    begin
      if tAuxItCalcMaterialQtdPares.AsInteger > 0 then
      begin
        texto5 := tAuxItCalcMaterialTamMaterial.AsString;
        for i := 1 to 5 - length(texto5) do
          texto5 := ' ' + texto5;
        texto2 := texto2 + texto5 + ' ';
        texto5 := tAuxItCalcMaterialQtdPares.AsString;
        for i := 1 to 5 - length(tAuxItCalcMaterialQtdPares.AsString) do
          texto5 := ' ' + texto5;
        texto3 := texto3 + texto5 + ' ';
      end;
      vQtdAux := vQtdAux + tAuxItCalcMaterialQtdPares.AsFloat;
      tAuxItCalcMaterial.Next
    end;
    texto2 := texto2 + ' | Total';
    texto5 := FloatToStr(vQtdAux);
    for i := 1 to 5 - length(texto5) do
      texto5 := ' ' + texto5;
    texto3 := texto3 + ' | ' + texto5;
    writeln(F, texto2);
    writeln(F, texto3);
    linha := linha + 2;
  end;
end;

procedure TfPrevCalcMaterialLote2.Imprime_Rodape;
begin
  Writeln(F, '------------------------------------------------------------------------------------------------------------------------------------');
  Linha := Linha + 1;
  while linha < 66 do
  begin
    Linha := Linha + 1;
    Writeln(F);
  end;
end;

procedure TfPrevCalcMaterialLote2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM1.tParametrosUsuarioMapaCompras.AsString = DM1.tUsuarioUsuario.AsString then
  begin
    DM1.tParametros.Edit;
    DM1.tParametrosUsuarioMapaCompras.AsString := '';
    DM1.tParametros.Post;
  end;
  DM1.tParametros.Refresh;
  DM1.tParametros.Close;
  DM1.tParametros.Open;

  DM1.tPedido.IndexFieldNames := 'Pedido';
  DM1.tPedido.Filtered        := False;
  DM1.tPedidoItem.Filtered    := False;
  DM1.tLoteMI.Filtered        := False;
  oDBUtils.OpenTables(False, Self);
  Action := Cafree;
end;

procedure TfPrevCalcMaterialLote2.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
    Close;
end;

procedure TfPrevCalcMaterialLote2.Imprimir1Click(Sender: TObject);
begin
  if tAuxCalcMaterial.RecordCount < 1 then
  begin
    ShowMessage('Não foi gerado o auxiliar!');
    BitBtn3.SetFocus;
  end
  else
  begin
    if RadioGroup1.ItemIndex = 0 then
      Imprimir_Mapa;
    BitBtn1.SetFocus;
  end;
end;

procedure TfPrevCalcMaterialLote2.BitBtn3Click(Sender: TObject);
begin
  vMercado := '';
  case RadioGroup2.ItemIndex of
    1: vMercado := 'I';
    2: vMercado := 'E';
  end;
  mVerificaGrade.EmptyDataSet;
  vOpcao := 9;
  Label1.Caption := '';
  tAuxCalcMaterial.IndexFieldNames := 'CodSetor;CodMaterial;CodCor;Largura';
  if ((RadioGroup2.ItemIndex = 0) and (Edit2.Text = '')) or
    ((RadioGroup2.ItemIndex = 1) and (CurrencyEdit2.AsInteger < 1)) then
    ShowMessage('Falta informar o documento final (lote ou pedido)!')
  else
  begin
    ProgressBar1.Position := 0;
    vOpcao := RadioGroup2.ItemIndex;
    RxDBFilter3.Active := False;
    Screen.Cursor := crHourglass;
    RxDBGrid1.DataSource := nil;
    VDBGrid1.DataSource := nil;
    //*** Exclui os arquivos auxiliares
    while not tAuxCalcMaterial.Eof do
    begin
      tAuxItCalcMaterial.First;
      while not tAuxItCalcMaterial.Eof do
        tAuxItCalcMaterial.Delete;
      tAuxCalcMaterial.Delete;
    end;
    tAuxCalcMaterialProd.First;
    while not tAuxCalcMaterialProd.Eof do
      tAuxCalcMaterialProd.Delete;
    tAuxCalcMaterialProdGrade.First;
    while not tAuxCalcMaterialProdGrade.Eof do
      tAuxCalcMaterialProdGrade.Delete;
    mVerificaMat.EmptyDataSet;

    DM1.tPedido.Filtered     := False;
    DM1.tPedidoItem.Filtered := False;
    DM1.tLoteMI.Filtered     := False;
    if RadioGroup2.ItemIndex = 0 then
      Filtra_Pedido
    else
    if RadioGroup2.ItemIndex = 1 then
      Filtra_LoteMI
    else
    if RadioGroup2.ItemIndex = 2 then
      Filtra_LoteExp;

    RxDBGrid1.DataSource := dsAuxCalcMaterial;
    VDBGrid1.DataSource := dsAuxItCalcMaterial;
    Screen.Cursor := crDefault;
    tAuxCalcMaterial.IndexFieldNames := 'CodSetor;Material';
    Screen.Cursor := crDefault;
  end;
  //11/07/2014
  //BitBtn4.Enabled := (vOpcao > 0);
  BitBtn4.Enabled := True;
end;

procedure TfPrevCalcMaterialLote2.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  DM1.tParametros.Refresh;
  DM1.tParametros.Close;
  DM1.tParametros.Open;

  Tag := 0;
  if (DM1.tParametrosUsuarioMapaCompras.AsString <> '') and
    (DM1.tUsuarioUsuario.AsString <> DM1.tParametrosUsuarioMapaCompras.AsString) then
  begin
    ShowMessage('Usuário ' + DM1.tParametrosUsuarioMapaCompras.AsString + ' está usando esta tela!');
    close;
    Tag := 1;
    exit;
  end;

  DM1.tParametros.Edit;
  DM1.tParametrosUsuarioMapaCompras.AsString := DM1.tUsuarioUsuario.AsString;
  DM1.tParametros.Post;
  DM1.tParametros.Refresh;

  tAuxCalcMaterial.IndexFieldNames := 'CodSetor;CodMaterial;CodCor;Largura';
  tAuxCalcMaterial.First;
  while not tAuxCalcMaterial.EOF do
  begin
    tAuxItCalcMaterial.First;
    while not tAuxItCalcMaterial.EOF do
      tAuxItCalcMaterial.Delete;
    tAuxCalcMaterial.Delete;
  end;
  tAuxCalcMaterialProd.First;
  while not tAuxCalcMaterialProd.EOF do
    tAuxCalcMaterialProd.Delete;
  tAuxCalcMaterialProdGrade.First;
  while not tAuxCalcMaterialProdGrade.Eof do
    tAuxCalcMaterialProdGrade.Delete;
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
  mLote.EmptyDataSet;
  mTalao.EmptyDataSet;
end;

procedure TfPrevCalcMaterialLote2.RxDBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
  if Key = Vk_F3 then
  begin
    fConsCalcMaterialPed := TfConsCalcMaterialPed.Create(Self);
    fConsCalcMaterialPed.ShowModal;
  end;
end;

procedure TfPrevCalcMaterialLote2.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_F2 then
  begin
    fConsLote := TfConsLote.Create(Self);
    fConsLote.ShowModal;
  end;
end;

procedure TfPrevCalcMaterialLote2.PopupMenu1Popup(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0: PopupMenu1.Items.Items[1].Enabled := False;
    1: PopupMenu1.Items.Items[1].Enabled := True;
  end;
end;

procedure TfPrevCalcMaterialLote2.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 0 then
  begin
    CurrencyEdit1.Enabled := False;
    CurrencyEdit2.Enabled := False;
    Edit1.Enabled := True;
    Edit2.Enabled := True;
  end
  else
    if RadioGroup2.ItemIndex = 1 then
    begin
      CurrencyEdit1.Enabled := True;
      CurrencyEdit2.Enabled := True;
      Edit1.Enabled := False;
      Edit2.Enabled := False;
    end;
end;

procedure TfPrevCalcMaterialLote2.BitBtn5Click(Sender: TObject);
begin
  if tAuxCalcMaterial.RecordCount > 0 then
  begin
    RxDBFilter3.Filter.Clear;
      //RxDBFilter3.Filter.Add('Selecionado = True');
    RxDBFilter3.Filter.Add('Selecionado = True and ImpCalcMaterial = True');
    RxDBFilter3.Active := True;
    case RadioGroup1.ItemIndex of
      0: Imprimir_Mapa;
      1: begin
          qAuxCalcMaterialProd.Close;
          qAuxCalcMaterialProd.Open;
          qSetor.Close;
          qSetor.Open;
          fRelCalcMaterialLote := TfRelCalcMaterialLote.Create(Self);
          fRelCalcMaterialLote.QuickRep1.Preview;
          fRelCalcMaterialLote.QuickRep1.Free;
          tAuxCalcMaterial.Filtered := False;
          tAuxCalcMaterialProdGrade.Filtered := False;
        end;
    end;
    RxDBFilter3.Active := False;
  end
  else
    ShowMessage('Não existe material para imprimir!');
end;

procedure TfPrevCalcMaterialLote2.BitBtn2Click(Sender: TObject);
begin
  RxDBFilter3.Filter.Clear;
  //RxDBFilter3.Filter.Add('Selecionado = True');
  RxDBFilter3.Filter.Add('Selecionado = True and ImpCalcMaterial = True');
  RxDBFilter3.Active := True;
  qAuxCalcMaterial.Close;
  qAuxCalcMaterial.Open;
  qAuxItCalcMaterial.Close;
  qAuxItCalcMaterial.Open;
  fRelCalcMaterialLote := TfRelCalcMaterialLote.Create(Self);
  fRelCalcMaterialLote.QuickRep2.Preview;
  fRelCalcMaterialLote.QuickRep2.Free;
  tAuxCalcMaterial.Filtered := False;
  RxDBFilter3.Active := False;
end;

procedure TfPrevCalcMaterialLote2.BitBtn4Click(Sender: TObject);
var
  vGravarOC: Boolean;
  vObs : String;
begin
  if DateEdit1.Date < 10 then
  begin
    ShowMessage('Data Entrega Geral não informada!');
    DateEdit1.SetFocus;
    exit;
  end;

  try
    //11/07/2014  vai gravar pedido também
    //if (RadioGroup2.ItemIndex = 0) then
    //  ShowMessage('Só vai gerar OC quando a opção for por lote!')
    //else
      if MessageDlg('Deseja gerar as ordens de compra?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
      begin
        RxDBFilter3.Active := False;
        RxDBFilter3.Filter.Clear;
        //RxDBFilter3.Filter.Add('Selecionado = True');
        RxDBFilter3.Filter.Add('Selecionado = True and ImpCalcMaterial = True');
        RxDBFilter3.Active := True;
        vOCIni := 0;
        vOCFin := 0;
        if tAuxCalcMaterial.RecordCount > 0 then
        begin
          if tAuxItCalcMaterial.State in [dsEdit] then
            tAuxItCalcMaterial.Post;
          if tAuxCalcMaterial.State in [dsEdit] then
            tAuxCalcMaterial.Post;
          tAuxCalcMaterial.Refresh;
          tAuxItCalcMaterial.Refresh;
          vGravarOC := True;
          vObs      := '';
          tAuxCalcMaterial.First;
          while not tAuxCalcMaterial.Eof do
          begin
            tAuxItCalcMaterial.First;
            while not tAuxItCalcMaterial.Eof do
            begin
              if tAuxItCalcMaterialPosicao.AsInteger < 1 then
              begin
                if Trim(vObs) = '' then
                  vObs := '    *** Materiais com ERRO ***';
                vObs := vObs + #13 + '(Material = ' + tAuxCalcMaterialCodMaterial.AsString + ' - ' + tAuxCalcMaterialMaterial.AsString + ')';
                //ShowMessage('Material ' + tAuxCalcMaterialCodMaterial.AsString + ' - ' + tAuxCalcMaterialMaterial.AsString + #13 +
                //  'está com problema na digitação da grade da referência!');
                vGravarOC := False;
                tAuxItCalcMaterial.Last;
              end;
              tAuxItCalcMaterial.Next;
            end;
            if not vGravarOC then
            begin
              vGravarOC := True;
              tAuxCalcMaterial.Edit;
              tAuxCalcMaterialErro.AsBoolean := True;
              tAuxCalcMaterial.Post;
              //tAuxCalcMaterial.Last;
            end;
            tAuxCalcMaterial.Next;
          end;

          if vGravarOC then
          begin
            Grava_OC;
            Label1.Caption := 'Ordens de Compras Geradas: ' + IntToStr(vOCIni) + ' até ' + IntToStr(vOCFin);
            if Trim(vObs) <> '' then
              ShowMessage(vObs);
          end
          else
            ShowMessage('Não foram geradas as OC, para gerar devem ser ajustados os materiais!');
        end
        else
          ShowMessage('Falta gerar os dados!');
      end;
  except
    on E: Exception do
      ShowMessage('Erro, ' + E.Message + #13 +
                  'Tente novamente!');
  end;

  DM1.tPedido.Filtered := False;
  DM1.tLoteMI.Filtered := False;
  RxDBFilter3.Active   := False;
end;

procedure TfPrevCalcMaterialLote2.BitBtn6Click(Sender: TObject);
begin
  if MessageDlg('Excluir o material?', mtConfirmation, [mbOk, mbNo], 0) = mrOk then
  begin
    tAuxItCalcMaterial.First;
    while not tAuxItCalcMaterial.Eof do
      tAuxItCalcMaterial.Delete;
    tAuxCalcMaterial.Delete;
  end;
end;

procedure TfPrevCalcMaterialLote2.VDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfPrevCalcMaterialLote2.BitBtn9Click(Sender: TObject);
begin
  tAuxCalcMaterial.First;
  while not tAuxCalcMaterial.Eof do
  begin
    tAuxCalcMaterial.Edit;
    tAuxCalcMaterialSelecionado.AsBoolean := True;
    tAuxCalcMaterial.Post;
    tAuxCalcMaterial.Next;
  end;
end;

procedure TfPrevCalcMaterialLote2.RxDBGrid1GetCellParams(Sender: TObject; Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if tAuxCalcMaterialErro.AsBoolean then
    Background := clRed
  else
  if tAuxCalcMaterialNumOC.AsInteger > 0 then
    Background := clAqua
  else
  if tAuxCalcMaterialSelecionado.AsBoolean then
  begin
    AFont.Color := clWhite;
    Background := clTeal;
  end;
end;

procedure TfPrevCalcMaterialLote2.BitBtn10Click(Sender: TObject);
begin
  qFornecedor.Close;
  qFornecedor.Open;
  fEscFornecedor := TfEscFornecedor.Create(Self);
  fEscFornecedor.ShowModal;
  if vCodFornecedorSel > 0 then
  begin
    tAuxCalcMaterial.First;
    while not tAuxCalcMaterial.Eof do
    begin
      if tAuxCalcMaterialCodForn.AsInteger = vCodFornecedorSel then
      begin
        tAuxCalcMaterial.Edit;
        tAuxCalcMaterialSelecionado.AsBoolean := not (tAuxCalcMaterialSelecionado.AsBoolean);
        tAuxCalcMaterial.Post;
      end;
      tAuxCalcMaterial.Next;
    end;
    tAuxCalcMaterial.Locate('CodForn', vCodFornecedorSel, [loCaseInsensitive]);
  end;
end;

procedure TfPrevCalcMaterialLote2.BitBtn11Click(Sender: TObject);
begin
  tAuxCalcMaterial.First;
  while not tAuxCalcMaterial.Eof do
  begin
    tAuxCalcMaterial.Edit;
    tAuxCalcMaterialSelecionado.AsBoolean := False;
    tAuxCalcMaterial.Post;
    tAuxCalcMaterial.Next;
  end;
end;

procedure TfPrevCalcMaterialLote2.RxDBGrid1DblClick(Sender: TObject);
begin
  if (tAuxCalcMaterialCodMaterial.AsInteger > 0) and (tAuxCalcMaterialNumOC.AsInteger < 1) then
  begin
    tAuxCalcMaterial.Edit;
    tAuxCalcMaterialSelecionado.AsBoolean := not (tAuxCalcMaterialSelecionado.AsBoolean);
    tAuxCalcMaterial.Post;
  end;
end;

procedure TfPrevCalcMaterialLote2.VDBGrid1Exit(Sender: TObject);
var
  vQtdAux: Real;
begin
  if tAuxItCalcMaterial.RecordCount > 0 then
  begin
    vQtdAux := 0;
    tAuxItCalcMaterial.First;
    while not tAuxItCalcMaterial.Eof do
    begin
      vQtdAux := vQtdAux + tAuxItCalcMaterialQtdPares.AsFloat;
      tAuxItCalcMaterial.Next;
    end;
    if FormatFloat('0.00000', vQtdAux) <> FormatFloat('0.00000', tAuxCalcMaterialConsumo.AsFloat) then
    begin
      ShowMessage('Quantidade informada na grade diferente do consumo geral!');
      VDBGrid1.SetFocus;
    end;
  end;
end;

procedure TfPrevCalcMaterialLote2.FormCreate(Sender: TObject);
begin
  DM1.tParametros.Open;
  oDBUtils.OpenTables(True, Self);
  oDBUtils.ActiveDataSet(True, DM1.tLoteMI, Name);
  oDBUtils.ActiveDataSet(True, DM1.tTalaoMI, Name);
  oDBUtils.ActiveDataSet(True, DM1.tTalaoGradeMI, Name);
  oDBUtils.ActiveDataSet(True, DM1.tLote, Name);
  oDBUtils.ActiveDataSet(True, DM1.tTalao, Name);
  oDBUtils.ActiveDataSet(True, DM1.tTalaoGrade, Name);
  oDBUtils.ActiveDataSet(True, DM1.tTalaoMovMI, Name);
  oDBUtils.ActiveDataSet(True, DM1.tProduto, Name);
  oDBUtils.ActiveDataSet(True, DM1.tProdutoCor, Name);
  oDBUtils.ActiveDataSet(True, DM1.tProdutoMat, Name);
  oDBUtils.ActiveDataSet(True, DM1.tPedidoMaterial, Name);
  oDBUtils.ActiveDataSet(True, DM1.tGrade, Name);
  oDBUtils.ActiveDataSet(True, DM1.tGradeItem, Name);
  oDBUtils.ActiveDataSet(True, DM1.tPedido, Name);
  oDBUtils.ActiveDataSet(True, DM1.tPedidoItem, Name);
  oDBUtils.ActiveDataSet(True, DM1.tPedidoGrade, Name);
  oDBUtils.ActiveDataSet(True, DM1.tMaterial, Name);
  oDBUtils.ActiveDataSet(True, DM1.tMaterialCor, Name);
  oDBUtils.ActiveDataSet(True, DM1.tMaterialGradeNum, Name);
  oDBUtils.ActiveDataSet(True, DM1.tOrdemCompra, Name);
  oDBUtils.ActiveDataSet(True, DM1.tOrdemCompraItem, Name);
  oDBUtils.ActiveDataSet(True, DM1.tOrdemCompraItemGrade, Name);
  oDBUtils.ActiveDataSet(True, DM1.tCalcMaterial, Name);
end;

procedure TfPrevCalcMaterialLote2.FormPaint(Sender: TObject);
begin
  if Tag = 1 then
    Close;
end;

procedure TfPrevCalcMaterialLote2.RxDBGrid1Enter(Sender: TObject);
begin
  DM1.tFornecedores2.IndexFieldNames := 'NomeForn';
end;

procedure TfPrevCalcMaterialLote2.Filtra_Pedido;
begin
  DM1.tPedido.IndexFieldNames := 'PedidoCliente';
  DM1.tPedido.Filtered        := False;
  DM1.tPedido.Filter          := 'PedidoCliente >= ''' + Edit1.Text + ''' and PedidoCliente <= ''' + Edit2.Text + ''' and Cancelado <> True and Suspenso <> True';
  DM1.tPedido.Filtered        := True;
  DM1.tPedido.First;
  ProgressBar1.Max := DM1.tPedido.RecordCount;
  while not DM1.tPedido.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if DM1.tPedidoCodMaterial.AsInteger > 0 then
    begin
      vLote := 0;
      tAuxCalcMaterial.IndexFieldNames := 'CodSetor;CodMaterial;CodCor;Largura';
      tAuxCalcMaterial.SetKey;
      tAuxCalcMaterialCodSetor.AsInteger    := 0;
      tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoCodMaterial.AsInteger;
      tAuxCalcMaterialCodCor.AsInteger      := 0;
      tAuxCalcMaterialLargura.AsString      := '';
      if tAuxCalcMaterial.GotoKey then
        tAuxCalcMaterial.Edit
      else
      begin
        tAuxCalcMaterial.Insert;
        tAuxCalcMaterialCodCor.AsInteger := 0;
        DM1.tMaterial.IndexFieldNames := 'Codigo';
        DM1.tMaterial.SetKey;
        DM1.tMaterialCodigo.AsInteger := DM1.tPedidoCodMaterial.AsInteger;
        if DM1.tMaterial.GotoKey then
        begin
          if DM1.tMaterialFornecedor.AsInteger > 0 then
            tAuxCalcMaterialCodForn.AsInteger := DM1.tMaterialFornecedor.AsInteger;
          tAuxCalcMaterialMaterial.AsString := DM1.tMaterialNome.AsString;
          tAuxCalcMaterialUnidade.AsString := DM1.tMaterialUnidade.AsString;
        end;
        tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoCodMaterial.AsInteger;
        tAuxCalcMaterialCodSetor.AsInteger    := 0;
        tAuxCalcMaterialLargura.AsString      := '';
        tAuxCalcMaterialCodGrade.AsInteger    := 0;
        tAuxCalcMaterialImpCalcMaterial.AsBoolean := DM1.tMaterialImpCalcMaterial.AsBoolean;
      end;
      tAuxCalcMaterialConsumo.AsFloat := tAuxCalcMaterialConsumo.AsFloat + DM1.tPedidoQtdPares.AsFloat;
      tAuxCalcMaterialQtdPares.AsFloat := tAuxCalcMaterialQtdPares.AsFloat + DM1.tPedidoQtdPares.AsFloat;
      tAuxCalcMaterial.Post;
    end;
    ProgressBar2.Max := DM1.tPedidoItem.RecordCount;
    ProgressBar2.Position := 0;
    DM1.tPedidoItem.First;
    while not DM1.tPedidoItem.Eof do
    begin
      ProgressBar2.Position := ProgressBar2.Position + 1;
      if (DM1.tPedidoItemCancelado.AsBoolean <> True) and (DM1.tPedidoItemReposicao.AsBoolean <> True) then
      begin
        vCodProduto    := DM1.tPedidoItemCodProduto.AsInteger;
        vCodCorProd    := DM1.tPedidoItemCodCor.AsInteger;
        vCodCombinacao := 0;
        vQtdPares      := DM1.tPedidoItemQtdPares.AsFloat;
        vLargura       := DM1.tPedidoItemlkLargura.AsString;
        vCodGrade      := DM1.tPedidoItemCodGrade.AsInteger;
        vTipo          := 'P';
        vLote          := 0;
        vPedido        := DM1.tPedidoPedido.AsInteger;
        Le_Material;
      end;
      DM1.tPedidoItem.Next;
    end;
    DM1.tPedido.Next;
  end;
end;

procedure TfPrevCalcMaterialLote2.Filtra_LoteMI;
var
  vGeraTalao: Boolean;
  i: Integer;
begin
  mLote.EmptyDataSet;
  i := CurrencyEdit1.AsInteger;
  while i <= CurrencyEdit2.AsInteger do
  begin
    mLote.Insert;
    mLoteLote.AsInteger := i;
    mLote.Post;
    inc(i);
  end;
  ProgressBar1.Max                := mLote.RecordCount;
  ProgressBar1.Position           := 0;
  DM1.tLoteMI.IndexFieldNames     := 'Lote';
  DM1.tPedido.IndexFieldNames     := 'Pedido';
  DM1.tPedidoItem.IndexFieldNames := 'Pedido;Item';
  mLote.First;
  while not mLote.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    DM1.tLoteMI.SetKey;
    DM1.tLoteMILote.AsInteger := mLoteLote.AsInteger;
    if DM1.tLoteMI.GotoKey then
    begin
      ProgressBar2.Max := DM1.tTalaoMI.RecordCount;
      ProgressBar2.Position := 0;
      DM1.tTalaoMI.First;
      while not DM1.tTalaoMI.Eof do
      begin
        ProgressBar2.Position := ProgressBar2.Position + 1;
        vGeraTalao := True;
        if vGeraTalao then
        begin
          Label1.Caption := Label1.Caption + ' ' + DM1.tTalaoMIItem.AsString + ',';
          DM1.tPedido.IndexFieldNames := 'Pedido';
          if not DM1.tPedido.FindKey([DM1.tTalaoMINumPedido.AsInteger]) then
            vGeraTalao := False;
          if (vGeraTalao) and (DM1.tPedidoCodMaterial.AsInteger > 0) then
          //if (DM1.tPedido.GotoKey) and (DM1.tPedidoCodMaterial.AsInteger > 0) then
          begin
            vLote   := DM1.tLoteMILote.AsInteger;
            vPedido := DM1.tPedidoPedido.AsInteger;
            tAuxCalcMaterial.IndexFieldNames := 'CodSetor;CodMaterial;CodCor;Largura';
            tAuxCalcMaterial.SetKey;
            tAuxCalcMaterialCodSetor.AsInteger    := 0;
            tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoCodMaterial.AsInteger;
            tAuxCalcMaterialCodCor.AsInteger      := 0;
            tAuxCalcMaterialLargura.AsString      := '';
            if tAuxCalcMaterial.GotoKey then
              tAuxCalcMaterial.Edit
            else
            begin
              tAuxCalcMaterial.Insert;
              tAuxCalcMaterialCodCor.AsInteger := 0;
              DM1.tMaterial.IndexFieldNames    := 'Codigo';
              DM1.tMaterial.SetKey;
              DM1.tMaterialCodigo.AsInteger := DM1.tPedidoCodMaterial.AsInteger;
              if DM1.tMaterial.GotoKey then
              begin
                if DM1.tMaterialFornecedor.AsInteger > 0 then
                  tAuxCalcMaterialCodForn.AsInteger := DM1.tMaterialFornecedor.AsInteger;
                tAuxCalcMaterialMaterial.AsString := DM1.tMaterialNome.AsString;
                tAuxCalcMaterialUnidade.AsString := DM1.tMaterialUnidade.AsString;
              end;
              tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoCodMaterial.AsInteger;
              tAuxCalcMaterialCodSetor.AsInteger    := 0;
              tAuxCalcMaterialLargura.AsString      := '';
              tAuxCalcMaterialCodGrade.AsInteger    := 0;
              tAuxCalcMaterialImpCalcMaterial.AsBoolean := DM1.tMaterialImpCalcMaterial.AsBoolean;
            end;
            tAuxCalcMaterialConsumo.AsFloat  := tAuxCalcMaterialConsumo.AsFloat + DM1.tTalaoMIQtdPar.AsFloat;
            tAuxCalcMaterialQtdPares.AsFloat := tAuxCalcMaterialQtdPares.AsFloat + DM1.tTalaoMIQtdPar.AsFloat;
            tAuxCalcMaterial.Post;
          end;
          if vGeraTalao then
          begin
            if not DM1.tPedidoItem.FindKey([DM1.tPedidoPedido.AsInteger, DM1.tTalaoMIItemPedido.AsInteger]) then
              vGeraTalao := False
            else
            if (DM1.tPedidoItemCancelado.AsBoolean) or (DM1.tPedidoItemReposicao.AsBoolean) then
              vGeraTalao := False;
          end;

          if vGeraTalao then
          begin
            vCodProduto    := DM1.tTalaoMICodProduto.AsInteger;
            vCodCorProd    := DM1.tTalaoMICodCor.AsInteger;
            vCodCombinacao := 0;
            vQtdPares      := DM1.tTalaoMIQtdPar.AsFloat;
            DM1.tTalaoGradeMI.First;
            vLargura       := DM1.tTalaoGradeMIlkLargura.AsString;
            vCodGrade      := DM1.tTalaoGradeMICodGrade.AsInteger;
            vTipo          := 'T';
            vLote          := DM1.tLoteMILote.AsInteger;
            vPedido        := DM1.tPedidoPedido.AsInteger;
            Le_Material;
          end;
        end;
        DM1.tTalaoMI.Next;
      end;
    end;
    mLote.Next;
  end;
end;

procedure TfPrevCalcMaterialLote2.tAuxCalcMaterialProdGradeNewRecord(
  DataSet: TDataSet);
begin
  tAuxCalcMaterialProdGradeQtdPar.AsFloat := 0;
end;

procedure TfPrevCalcMaterialLote2.tAuxItCalcMaterialNewRecord(
  DataSet: TDataSet);
begin
  tAuxItCalcMaterialQtdPares.AsInteger := 0;
end;

procedure TfPrevCalcMaterialLote2.Grava_tAuxItCalcMaterial(CodGrade, Posicao, Qtd : Integer ; Tamanho : String);
var
  vTamMaterial : String;
  vPosicaoAux     : Integer;
  vCodGradeAux : Integer;
  vConsAux : Integer;
begin
  vTamMaterial := '';
  vPosicaoAux     := 0;
  DM1.tMaterialGradeNum.SetKey;
  DM1.tMaterialGradeNumCodMaterial.AsInteger := vCodMaterial;
  DM1.tMaterialGradeNumCodGrade.AsInteger    := CodGrade;
  DM1.tMaterialGradeNumPosicao.AsInteger     := Posicao;
  if not DM1.tMaterialGradeNum.GotoKey then
  begin
    vTamMaterial := Tamanho;
    vPosicaoAux  := Posicao;
    vCodGradeAux := CodGrade;
  end
  else
  begin
    vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString;
    vPosicaoAux  := DM1.tMaterialGradeNumPosicaoMat.AsInteger;
    vCodGradeAux := DM1.tMaterialGradeNumCodGradeMat.AsInteger;
  end;
  tAuxItCalcMaterial.SetKey;
  tAuxItCalcMaterialCodSetor.AsInteger    := tAuxCalcMaterialCodSetor.AsInteger;
  tAuxItCalcMaterialCodMaterial.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
  tAuxItCalcMaterialCodCor.AsInteger      := tAuxCalcMaterialCodCor.AsInteger;
  //tAuxItCalcMaterialCodGrade.AsInteger    := tAuxCalcMaterialCodGrade.AsInteger;
  tAuxItCalcMaterialLargura.AsString      := tAuxCalcMaterialLargura.AsString;
  tAuxItCalcMaterialTamMaterial.AsString  := vTamMaterial;
  if tAuxItCalcMaterial.GotoKey then
    tAuxItCalcMaterial.Edit
  else
  begin // Não encontra material na posição da grade e insere
    tAuxItCalcMaterial.Insert;
    tAuxItCalcMaterialCodSetor.AsInteger    := tAuxCalcMaterialCodSetor.AsInteger;
    tAuxItCalcMaterialCodMaterial.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
    tAuxItCalcMaterialCodCor.AsInteger      := tAuxCalcMaterialCodCor.AsInteger;
    tAuxItCalcMaterialCodGrade.AsInteger    := vCodGradeAux;
    tAuxItCalcMaterialLargura.AsString      := tAuxCalcMaterialLargura.AsString;
    tAuxItCalcMaterialTamMaterial.AsString  := vTamMaterial;
    tAuxItCalcMaterialPosicao.AsInteger     := vPosicaoAux;
  end;
  vConsAux := StrToInt(FormatFloat('0',vConsumo));
  if vConsAux <= 0 then
    vConsAux := 1;
  tAuxItCalcMaterialQtdPares.AsInteger := tAuxItCalcMaterialQtdPares.AsInteger + (Qtd * vConsAux);
  tAuxItCalcMaterial.Post;
end;

procedure TfPrevCalcMaterialLote2.Grava_tAuxCalcMaterialProd;
begin
  tAuxCalcMaterialProd.SetKey;
  tAuxCalcMaterialProdCodProduto.AsInteger := vCodProduto;
  if tAuxCalcMaterialProd.GotoKey then
    tAuxCalcMaterialProd.Edit
  else
  begin
    tAuxCalcMaterialProd.Insert;
    tAuxCalcMaterialProdCodProduto.AsInteger := vCodProduto;
  end;
  tAuxCalcMaterialProdQtdPares.AsFloat := tAuxCalcMaterialProdQtdPares.AsFloat + vQtdPares;
  tAuxCalcMaterialProd.Post;

  //*** Grava a tabela auxiliar das grades que pertencem as referências
  if vTipo = 'P' then
  begin
    DM1.tPedidoGrade.First;
    while not DM1.tPedidoGrade.Eof do
    begin
      if DM1.tPedidoGradeQtd.AsFloat > 0 then
        Grava_tAuxcalcMaterialProdGrade(DM1.tPedidoGradeCodGrade.AsInteger,DM1.tPedidoGradePosicao.AsInteger,DM1.tPedidoGradeQtd.AsInteger,DM1.tPedidoGradelkTamanho.AsString);
      DM1.tPedidoGrade.Next;
    end;
  end
  else
  if vTipo = 'T' then
  begin
    DM1.tTalaoGradeMI.First;
    while not DM1.tTalaoGradeMI.Eof do
    begin
      if DM1.tTalaoGradeMIQtdPar.AsFloat > 0 then
        Grava_tAuxcalcMaterialProdGrade(DM1.tTalaoGradeMICodGrade.AsInteger,DM1.tTalaoGradeMIPosicao.AsInteger,DM1.tTalaoGradeMIQtdPar.AsInteger,DM1.tTalaoGradeMIlkTamanho.AsString);
      DM1.tTalaoGradeMI.Next;
    end;
  end
  else
  //Lote Exportação
  if vTipo = 'E' then
  begin
    DM1.tTalaoGrade.First;
    while not DM1.tTalaoGrade.Eof do
    begin
      if DM1.tTalaoGradeQtdPar.AsFloat > 0 then
        Grava_tAuxcalcMaterialProdGrade(DM1.tTalaoGradeCodGrade.AsInteger,DM1.tTalaoGradePosicao.AsInteger,DM1.tTalaoGradeQtdPar.AsInteger,DM1.tTalaoGradelkTamanho.AsString);
      DM1.tTalaoGrade.Next;
    end;
  end;

end;

procedure TfPrevCalcMaterialLote2.tAuxCalcMaterialProdNewRecord(
  DataSet: TDataSet);
begin
  tAuxCalcMaterialProdQtdPares.AsFloat := 0;
end;

procedure TfPrevCalcMaterialLote2.Grava_tAuxcalcMaterialProdGrade(CodGrade,
  Posicao, Qtd: Integer; Tamanho: String);
begin
  tAuxCalcMaterialProdGrade.SetKey;
  tAuxCalcMaterialProdGradeCodProduto.AsInteger := vCodProduto;
  tAuxCalcMaterialProdGradeCodGrade.AsInteger   := CodGrade;
  tAuxCalcMaterialProdGradePosicao.AsInteger    := Posicao;
  if tAuxCalcMaterialProdGrade.GotoKey then
    tAuxCalcMaterialProdGrade.Edit
  else
  begin
    tAuxCalcMaterialProdGrade.Insert;
    tAuxCalcMaterialProdGradeCodProduto.AsInteger := vCodProduto;
    tAuxCalcMaterialProdGradeCodGrade.AsInteger   := CodGrade;
    tAuxCalcMaterialProdGradePosicao.AsInteger    := Posicao;
    tAuxCalcMaterialProdGradeTamanho.AsString     := Tamanho;
  end;
  tAuxCalcMaterialProdGradeQtdPar.AsFloat := tAuxCalcMaterialProdGradeQtdPar.AsFloat + Qtd;
  tAuxCalcMaterialProdGrade.Post;
end;

procedure TfPrevCalcMaterialLote2.tAuxCalcMaterialCalcFields(
  DataSet: TDataSet);
begin
  if (tAuxCalcMaterialConsumo.AsFloat > 0) and (tAuxCalcMaterialQtdPares.AsFloat > 0) then
    tAuxCalcMaterialclUnitario.AsFloat := tAuxCalcMaterialConsumo.AsFloat / tAuxCalcMaterialQtdPares.AsFloat;
end;

procedure TfPrevCalcMaterialLote2.tAuxCalcMaterialNewRecord(
  DataSet: TDataSet);
begin
  tAuxCalcMaterialQtdNaoCortada.AsFloat        := 0;
  tAuxCalcMaterialQtdNaoCortadaConsumo.AsFloat := 0;
  tAuxCalcMaterialQtdPares.AsFloat             := 0;
  tAuxCalcMaterialConsumo.AsFloat              := 0;
  tAuxCalcMaterialSelecionado.AsBoolean        := False;
  tAuxCalcMaterialNumOC.AsInteger              := 0;
  tAuxCalcMaterialErro.AsBoolean               := False;
end;

procedure TfPrevCalcMaterialLote2.tAuxCalcMaterialBeforePost(
  DataSet: TDataSet);
begin
  if vLote > 0 then
  begin
    if (tAuxCalcMaterialNumOC.AsInteger < 1) and (tCalcMaterial.Locate('CodMaterial;CodCor;Mercado;Lote', VarArrayOf([tAuxCalcMaterialCodMaterial.AsInteger, tAuxCalcMaterialCodCor.AsInteger, vMercado, vLote]), [locaseinsensitive])) then
    begin
      tAuxCalcMaterialNumOC.AsInteger := tCalcMaterialNumOC.AsInteger;
      tAuxCalcMaterialQtdOC.AsFloat   := StrToFloat(FormatFloat('0.00000',tCalcMaterialQtdOC.AsFloat));
    end;
    if (tAuxCalcMaterialNumOC.AsInteger <= 0) and (tCalcMaterial.Locate('CodMaterial;CodCor;NumPedido', VarArrayOf([tAuxCalcMaterialCodMaterial.AsInteger, tAuxCalcMaterialCodCor.AsInteger, vPedido]), [locaseinsensitive])) then
    begin
      tAuxCalcMaterialNumOC.AsInteger := tCalcMaterialNumOC.AsInteger;
      tAuxCalcMaterialQtdOC.AsFloat   := StrToFloat(FormatFloat('0.00000',tCalcMaterialQtdOC.AsFloat));
    end;
  end
  else
  if vPedido > 0 then
  begin
    if (tAuxCalcMaterialNumOC.AsInteger < 1) and (tCalcMaterial.Locate('CodMaterial;CodCor;Mercado;NumPedido', VarArrayOf([tAuxCalcMaterialCodMaterial.AsInteger, tAuxCalcMaterialCodCor.AsInteger, vMercado, vPedido]), [locaseinsensitive])) then
    begin
      tAuxCalcMaterialNumOC.AsInteger := tCalcMaterialNumOC.AsInteger;
      tAuxCalcMaterialQtdOC.AsFloat   := StrToFloat(FormatFloat('0.00000',tCalcMaterialQtdOC.AsFloat));
    end;
  end;
end;

procedure TfPrevCalcMaterialLote2.tAuxCalcMaterialAfterPost(
  DataSet: TDataSet);
begin
  if vLote > 0 then
  begin
    if not tAuxCalcMaterialPed.Locate('Lote', vLote, [loCaseInsensitive]) then
    begin
      tAuxCalcMaterialPed.Insert;
      tAuxCalcMaterialPedCodSetor.AsInteger := tAuxCalcMaterialCodSetor.AsInteger;
      tAuxCalcMaterialPedCodMaterial.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
      tAuxCalcMaterialPedCodCor.AsInteger := tAuxCalcMaterialCodCor.AsInteger;
      tAuxCalcMaterialPedCodGrade.AsInteger := tAuxCalcMaterialCodGrade.AsInteger;
      tAuxCalcMaterialPedLote.AsInteger := vLote;
      tAuxCalcMaterialPedNumOC.AsInteger := tAuxCalcMaterialNumOC.AsInteger;
      tAuxCalcMaterialPed.Post;
    end;
  end
  else
  if vPedido > 0 then
  begin
    if not tAuxCalcMaterialPed.Locate('Lote', vPedido, [loCaseInsensitive]) then
    begin
      tAuxCalcMaterialPed.Insert;
      tAuxCalcMaterialPedCodSetor.AsInteger    := tAuxCalcMaterialCodSetor.AsInteger;
      tAuxCalcMaterialPedCodMaterial.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
      tAuxCalcMaterialPedCodCor.AsInteger      := tAuxCalcMaterialCodCor.AsInteger;
      tAuxCalcMaterialPedCodGrade.AsInteger    := tAuxCalcMaterialCodGrade.AsInteger;
      tAuxCalcMaterialPedLote.AsInteger        := vPedido;
      tAuxCalcMaterialPedNumOC.AsInteger       := tAuxCalcMaterialNumOC.AsInteger;
      tAuxCalcMaterialPed.Post;
    end;
  end;
end;

procedure TfPrevCalcMaterialLote2.tAuxCalcMaterialBeforeDelete(
  DataSet: TDataSet);
begin
  tAuxCalcMaterialPed.First;
  while not tAuxCalcMaterialPed.Eof do
    tAuxCalcMaterialPed.Delete;
end;

end.

