unit UPrevRelProgramacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, RXCtrls, ExtCtrls, Buttons, Grids,
  DBGrids, RXDBCtrl, Db, DBTables, Mask, ToolEdit, CurrEdit, Menus, MemTable, DBCtrls, ALed, QuickRpt, RxLookup, DBClient;

type
  TfPrevRelProgramacao = class(TForm)
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    mItens: TMemoryTable;
    mItensNumLancamento: TIntegerField;
    mItensDtEmbarqueI: TDateTimeField;
    mItensPedido: TIntegerField;
    mItensItemPedido: TIntegerField;
    mItensCodCliente: TIntegerField;
    mItensCodProduto: TIntegerField;
    mItensCodCorProduto: TIntegerField;
    mItensCodCorSolado: TIntegerField;
    mItensDtCorteI: TDateTimeField;
    mItensDtCorteF: TDateTimeField;
    mItensDtCosturaI: TDateTimeField;
    mItensDtCosturaF: TDateTimeField;
    mItensDtPreI: TDateTimeField;
    mItensDtPreF: TDateTimeField;
    mItensDtMontagemI: TDateTimeField;
    mItensDtMontagemF: TDateTimeField;
    mItensDtEmbarqueF: TDateTimeField;
    mItensQtdPares: TFloatField;
    mItensOrdem: TIntegerField;
    mItensCarimbo: TStringField;
    mItensCodCompania: TIntegerField;
    mItensQtdDiaCorte: TFloatField;
    mItensQtdDiaCostura: TFloatField;
    mItensQtdDiaPre: TFloatField;
    mItensQtdDiaMontagem: TFloatField;
    mItensLote: TIntegerField;
    qQtdParRef: TQuery;
    qQtdParRefReferencia: TStringField;
    qQtdParRefQtdParesRest: TFloatField;
    qQtdParRefQtdParesFat: TFloatField;
    dsqQtdParRef: TDataSource;
    QRCompositeReport1: TQRCompositeReport;
    mItensCalcDtCorte: TBooleanField;
    mItensCalcDtCostura: TBooleanField;
    mItensCalcDtPre: TBooleanField;
    mItensCalcDtMontagem: TBooleanField;
    qVerPedido: TQuery;
    qVerPedidoPedido: TIntegerField;
    mSetorDatas: TClientDataSet;
    mSetorDatasCodSetor: TIntegerField;
    mSetorDatasData: TDateField;
    mSetorDatasQtd: TIntegerField;
    Query1: TQuery;
    Panel2: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    StaticText2: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    Edit1: TEdit;
    BitBtn9: TBitBtn;
    Panel5: TPanel;
    ALed5: TALed;
    ALed6: TALed;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    StaticText8: TStaticText;
    CurrencyEdit2: TCurrencyEdit;
    StaticText9: TStaticText;
    CurrencyEdit3: TCurrencyEdit;
    BitBtn12: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel4: TPanel;
    Label1: TLabel;
    DBText1: TDBText;
    BitBtn6: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    StaticText1: TStaticText;
    mItensSetor: TClientDataSet;
    mItensSetorItem: TIntegerField;
    mItensSetorCodProduto: TIntegerField;
    mItensSetorReferencia: TStringField;
    mItensSetorLote: TIntegerField;
    mItensSetorData1: TDateField;
    mItensSetorCodSetor1: TIntegerField;
    mItensSetorQtd1: TIntegerField;
    mItensSetorQtdRest1: TIntegerField;
    mItensSetorData2: TDateField;
    mItensSetorCodSetor2: TIntegerField;
    mItensSetorQtd2: TIntegerField;
    mItensSetorQtdRest2: TIntegerField;
    mItensSetorData3: TDateField;
    mItensSetorData4: TDateField;
    mItensSetorData5: TDateField;
    mItensSetorData6: TDateField;
    mItensSetorData7: TDateField;
    mItensSetorData8: TDateField;
    mItensSetorData9: TDateField;
    mItensSetorData10: TDateField;
    mItensSetorCodSetor3: TIntegerField;
    mItensSetorCodSetor4: TIntegerField;
    mItensSetorCodSetor5: TIntegerField;
    mItensSetorCodSetor6: TIntegerField;
    mItensSetorCodSetor7: TIntegerField;
    mItensSetorCodSetor8: TIntegerField;
    mItensSetorCodSetor9: TIntegerField;
    mItensSetorCodSetor10: TIntegerField;
    mItensSetorQtd3: TIntegerField;
    mItensSetorQtd4: TIntegerField;
    mItensSetorQtd5: TIntegerField;
    mItensSetorQtd6: TIntegerField;
    mItensSetorQtd7: TIntegerField;
    mItensSetorQtd8: TIntegerField;
    mItensSetorQtd9: TIntegerField;
    mItensSetorQtd10: TIntegerField;
    mItensSetorQtdRest3: TIntegerField;
    mItensSetorQtdRest4: TIntegerField;
    mItensSetorQtdRest5: TIntegerField;
    mItensSetorQtdRest6: TIntegerField;
    mItensSetorQtdRest7: TIntegerField;
    mItensSetorQtdRest8: TIntegerField;
    mItensSetorQtdRest9: TIntegerField;
    mItensSetorQtdRest10: TIntegerField;
    mSetorAux: TClientDataSet;
    mSetorAuxCodSetor: TIntegerField;
    mSetorAuxItem: TIntegerField;
    dsmItensSetor: TDataSource;
    mSetorDatasCapacidadeDia: TIntegerField;
    BitBtn13: TBitBtn;
    mItensSetorNomeSetor1: TStringField;
    mItensSetorNomeSetor2: TStringField;
    mItensSetorNomeSetor3: TStringField;
    mItensSetorNomeSetor4: TStringField;
    mItensSetorNomeSetor5: TStringField;
    mItensSetorNomeSetor6: TStringField;
    mItensSetorNomeSetor7: TStringField;
    mItensSetorNomeSetor8: TStringField;
    mItensSetorNomeSetor9: TStringField;
    mItensSetorNomeSetor10: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
  private
    { Private declarations }
    vItemSetor : Integer;
    vControleLinha : Integer;
    procedure Habilita;
    function Verifica_Data(Data : TDate) : TDate;
    procedure Le_Pedido;
    procedure Gera_tProgramacaoItens(NumLote, QtdPares : Integer ; Tipo : String); //E= Exportação   I= Interno

    procedure Grava_tProgramacaoItensData(CodSetor, QtdDias, CapacidadeDia : Integer);

    procedure Le_Produto;

    procedure Le_tProgramacaoItens;

  public
    { Public declarations }
  end;

var
  fPrevRelProgramacao: TfPrevRelProgramacao;
  vNumProgramacao, vPedido : Integer;
  vDtCorte, vDtCostura, vDtPre, vDtMontagem : TDate;
  vQtdCorte, vQtdCostura, vQtdPre, vQtdMontagem : Real;
  vDesfazPedido : Boolean;

implementation

uses UDM1, URelProgramacao, UDM2, UConsProgramacao, UProgramacaoOrdem, UAlteraProgItem, UCalculaDatas, UConsItemPed,
  UDMProg, UConsProgramacaoItens, uIntegracao;

{$R *.DFM}

procedure TfPrevRelProgramacao.Le_tProgramacaoItens;
var
  vItemAux : Integer;
  i : Integer;
begin
  mItensSetor.EmptyDataSet;
  mSetorAux.EmptyDataSet;
  DMProg.tProgramacaoItens.First;
  while not DMProg.tProgramacaoItens.Eof do
    begin
      vControleLinha := 0;

      DMProg.tProgramacaoItensData.First;
      while not DMProg.tProgramacaoItensData.Eof do
        begin
          if vControleLinha <> DMProg.tProgramacaoItensDataControleLinha.AsInteger then
            begin
              if mItensSetor.State in [dsInsert] then
                mItensSetor.Post;
              mItensSetor.Insert;
              mItensSetorItem.AsInteger       := DMProg.tProgramacaoItensOrdem.AsInteger;
              mItensSetorCodProduto.AsInteger := DMProg.tProgramacaoItensCodProduto.AsInteger;
              mItensSetorReferencia.AsString  := DMProg.tProgramacaoItenslkReferencia.AsString;
              mItensSetorLote.AsInteger       := DMProg.tProgramacaoItensLote.AsInteger;
            end;

          vItemAux := 0;
          if mSetorAux.FindKey([DMProg.tProgramacaoItensDataCodSetor.AsInteger]) then
            vItemAux := mSetorAuxItem.AsInteger
          else
          begin
            for i := 1 to 10 do
              begin
                if mItensSetor.FieldByName('CodSetor'+IntToStr(i)).AsInteger <= 0 then
                  vItemAux := i;
                if vItemAux > 0 then
                  Break;
              end;
            if vItemAux > 0 then
              begin
                mSetorAux.Insert;
                mSetorAuxCodSetor.AsInteger := DMProg.tProgramacaoItensDataCodSetor.AsInteger;
                mSetorAuxItem.AsInteger     := vItemAux;
                mSetorAux.Post;
              end;
          end;

          if vItemAux > 0 then
            begin
              mItensSetor.FieldByName('Data'+IntToStr(vItemAux)).AsDateTime    := DMProg.tProgramacaoItensDataDtInicio.AsDateTime;
              mItensSetor.FieldByName('CodSetor'+IntToStr(vItemAux)).AsInteger := DMProg.tProgramacaoItensDataCodSetor.AsInteger;
              mItensSetor.FieldByName('Qtd'+IntToStr(vItemAux)).AsInteger      := DMProg.tProgramacaoItensDataQtd.AsInteger;
              mItensSetor.FieldByName('NomeSetor'+IntToStr(vItemAux)).AsString := DMProg.tProgramacaoItensDatalkNomeSetor.AsString;
              mItensSetor.FieldByName('QtdRest'+IntToStr(vItemAux)).AsInteger  := 0;
            end;
          vControleLinha := DMProg.tProgramacaoItensDataControleLinha.AsInteger;

          DMProg.tProgramacaoItensData.Next;
        end;
      if mItensSetor.State in [dsInsert] then
        mItensSetor.Post;  

      DMProg.tProgramacaoItens.Next;
    end;
end;

function TfPrevRelProgramacao.Verifica_Data(Data : TDate) : TDate;
begin
  Data := Data + 1;
  if DayOfWeek(Data) = 1 then
    Data := Data + 1
  else
  if DayOfWeek(Data) = 7 then
    Data := Data + 2;
  Result := Data;
end;

procedure TfPrevRelProgramacao.Grava_tProgramacaoItensData(CodSetor, QtdDias, CapacidadeDia : Integer);
var
  vData : TDate;
  vQtdSetor : Integer;
  vFlag : Boolean;
  vCapacidade : Integer;
  vQtdAux : Integer;
  vExiste : Boolean;
begin
  vData     := DMProg.tProgramacaoDtInicial.AsDateTime;
  vQtdSetor := 0;
  vExiste   := False;
  if mSetorDatas.FindKey([CodSetor]) then
    begin
      vData     := mSetorDatasData.AsDateTime;
      vQtdSetor := mSetorDatasQtd.AsInteger;
      vExiste   := True;
    end
  else
    vData := DMProg.tProgramacaoDtInicial.AsDateTime + QtdDias;

  //vCapacidade := CapacidadeDia;
  vCapacidade := DMProg.tProgramacaoItensQtdPares.AsInteger;
  vFlag       := False;
  while not vFlag do
    begin
      vQtdAux := vCapacidade;
      if vCapacidade > CapacidadeDia then
        vQtdAux := CapacidadeDia;
      vItemSetor := vItemSetor + 1;
      DMProg.tProgramacaoItensData.Insert;
      DMProg.tProgramacaoItensDataNumLancamento.AsInteger := DMProg.tProgramacaoNumLancamento.AsInteger;
      DMProg.tProgramacaoItensDataOrdemItem.AsInteger     := DMProg.tProgramacaoItensOrdem.AsInteger;
      DMProg.tProgramacaoItensDataItem.AsInteger          := vItemSetor;
      DMProg.tProgramacaoItensDataControleLinha.AsInteger := vControleLinha;
      DMProg.tProgramacaoItensDataCodSetor.AsInteger      := CodSetor;
      DMProg.tProgramacaoItensDataDtInicio.AsDateTime     := vData;
      dmprog.tProgramacaoItensDataQtd.AsInteger           := vQtdAux;
      DMProg.tProgramacaoItensData.Post;
      vCapacidade := vCapacidade - vQtdAux;

      if mSetorDatas.FindKey([CodSetor,vData]) then
        mSetorDatas.Edit
      else
        begin
          mSetorDatas.Insert;
          mSetorDatasCodSetor.AsInteger      := CodSetor;
          mSetorDatasData.AsDateTime         := vData;
          mSetorDatasCapacidadeDia.AsInteger := CapacidadeDia;
        end;
      mSetorDatasQtd.AsInteger := mSetorDatasQtd.AsInteger + vQtdAux;
      mSetorDatas.Post;

      if vCapacidade <= 0 then
        vFlag := True
      else
        vData := Verifica_Data(vData);
      vControleLinha := vControleLinha + 1;
    end;
end;

procedure TfPrevRelProgramacao.Le_Produto;
begin
  if not DM1.tProduto.FindKey([DMProg.tProgramacaoItensCodProduto.AsInteger]) then
    begin
      ShowMessage('Produto não encontrado ' + DMProg.tProgramacaoItensCodProduto.AsString);
      exit;
    end;
  DM1.tProdutoSetor.First;
  while not DM1.tProdutoSetor.Eof do
    begin
      vControleLinha := 1;
      if DM1.tProdutoSetorlkImpProgramacao.AsBoolean then
        Grava_tProgramacaoItensData(DM1.tProdutoSetorCodSetor.AsInteger,DM1.tProdutoSetorlkQtdDias.AsInteger,DM1.tProdutoSetorCapacidadeDia.AsInteger);
      DM1.tProdutoSetor.Next;
    end;

  DM1.tProdutoSetorAux.First;
  while not DM1.tProdutoSetorAux.Eof do
    begin
      vControleLinha := 1;
      if DM1.tProdutoSetorAuxlkImpProgramacao.AsBoolean then
        Grava_tProgramacaoItensData(DM1.tProdutoSetorAuxCodSetor.AsInteger,DM1.tProdutoSetorAuxlkQtdDias.AsInteger,DM1.tProdutoSetorAuxCapacidadeDia.AsInteger);
      DM1.tProdutoSetorAux.Next;
    end;
end;

procedure TfPrevRelProgramacao.Gera_tProgramacaoItens(NumLote, QtdPares : Integer ; Tipo : String); //E= Exportação   I= Interno
var
  vItemAux : Integer;
begin
  DMProg.tProgramacaoItens.Refresh;
  DMProg.tProgramacaoItens.Last;
  vItemAux := DMProg.tProgramacaoItensOrdem.AsInteger; 
  DMProg.tProgramacaoItens.Insert;
  DMProg.tProgramacaoItensNumLancamento.AsInteger := DMProg.tProgramacaoNumLancamento.AsInteger;
  DMProg.tProgramacaoItensOrdem.AsInteger         := vItemAux + 1;
  DMProg.tProgramacaoItensPedido.AsInteger        := DM1.tPedidoPedido.AsInteger;
  DMProg.tProgramacaoItensLote.AsInteger          := NumLote;
  DMProg.tProgramacaoItensItemPedido.AsInteger    := DM1.tPedidoItemItem.AsInteger;
  DMProg.tProgramacaoItensCodCliente.AsInteger    := DM1.tPedidoCodCliente.AsInteger;
  DMProg.tProgramacaoItensCodProduto.AsInteger    := DM1.tPedidoItemCodProduto.AsInteger;
  DMProg.tProgramacaoItensCodCorProduto.AsInteger := DM1.tPedidoItemCodCor.AsInteger;
  DMProg.tProgramacaoItensQtdPares.AsInteger      := QtdPares;
  DMProg.tProgramacaoItensDtEmbarque.AsDateTime   := DM1.tLoteDtEmbarque.AsDateTime;
  DMProg.tProgramacaoItens.Post;

  if Tipo = 'E' then
  begin
    DM1.tLote.Edit;
    DM1.tLoteNumProgramacao.AsInteger := DMProg.tProgramacaoNumLancamento.AsInteger;
    DM1.tLote.Post;
    Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);
  end;

end;

procedure TfPrevRelProgramacao.Habilita;
begin
  DBNavigator1.Enabled   := not(DBNavigator1.Enabled);
  BitBtn1.Enabled        := not(BitBtn1.Enabled);
  BitBtn2.Enabled        := not(BitBtn2.Enabled);
  BitBtn3.Enabled        := not(BitBtn3.Enabled);
  BitBtn4.Enabled        := not(BitBtn4.Enabled);
  BitBtn5.Enabled        := not(BitBtn5.Enabled);
  BitBtn6.Enabled        := not(BitBtn6.Enabled);
  RxSpeedButton1.Enabled := not(RxSpeedButton1.Enabled);
  Panel3.Enabled         := not(Panel3.Enabled);
end;

procedure TfPrevRelProgramacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMProg.tProgramacaoDatas.Close;
  DMProg.tProgramacaoItensData.Close;
  DMProg.tProgramacaoItens.Close;
  DMProg.tProgramacao.Close;
  DM1.tPedidoItem.Close;
  DM1.tPedido.Close;
  DM1.tLote.Close;

  if DMProg.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMProg);

  Action := Cafree;
end;

procedure TfPrevRelProgramacao.BitBtn1Click(Sender: TObject);
var
  vNumAux : Integer;
begin
  if DM1.tUsuarioInsProgramacao.AsBoolean then
    begin
      DMProg.tProgramacao.Refresh;
      DMProg.tProgramacao.Last;
      vNumAux := DMProg.tProgramacaoNumLancamento.AsInteger;

      DMProg.tProgramacao.Insert;
      DMProg.tProgramacaoNumLancamento.AsInteger := vNumAux + 1;
      DMProg.tProgramacao.Post;
      DMProg.tProgramacao.Edit;
      Habilita;
      BitBtn2.Tag := 0;
    end
  else
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ' não autorizado a fazer inserção!');
end;

procedure TfPrevRelProgramacao.BitBtn2Click(Sender: TObject);
begin
  if not DMProg.tProgramacao.IsEmpty then
    begin
      if DM1.tUsuarioAltProgramacao.AsBoolean then
        begin
          mItens.EmptyTable;
          DMProg.tProgramacao.Edit;
          DMProg.tProgramacaoItens.First;
          while not DMProg.tProgramacaoItens.Eof do
            begin
              mItens.Insert;
              mItensNumLancamento.AsInteger := DMProg.tProgramacaoItensNumLancamento.AsInteger;
              mItensOrdem.AsInteger         := DMProg.tProgramacaoItensOrdem.AsInteger;
              mItensPedido.AsInteger        := DMProg.tProgramacaoItensPedido.AsInteger;
              mItensItemPedido.AsInteger    := DMProg.tProgramacaoItensItemPedido.AsInteger;
              mItensLote.AsInteger          := DMProg.tProgramacaoItensLote.AsInteger;
              mItensCodCliente.AsInteger    := DMProg.tProgramacaoItensCodCliente.AsInteger;
              mItensCodProduto.AsInteger    := DMProg.tProgramacaoItensCodProduto.AsInteger;
              mItensCodCorProduto.AsInteger := DMProg.tProgramacaoItensCodCorProduto.AsInteger;
              mItensQtdPares.AsFloat        := DMProg.tProgramacaoItensQtdPares.AsFloat;
              mItens.Post;
              DMProg.tProgramacaoItens.Next;
            end;
          BitBtn2.Tag          := 1;
          Habilita;
        end
      else
        ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ' não autorizado a fazer alteração!');
    end
  else
    ShowMessage('Não há registro para ser alterado!');
end;

procedure TfPrevRelProgramacao.Le_Pedido;
begin
// boca Ler pedido de inicio a fim?
  DM1.tPedido.IndexFieldNames := 'Pedido';
  DM1.tPedido.SetKey;
  DM1.tPedidoPedido.AsInteger := DMProg.tProgramacaoItensPedido.AsInteger;
  if DM1.tPedido.GotoKey then
    begin
      if DM1.tPedidoLoteExp.AsBoolean then
        begin
          DM1.tLote.IndexFieldNames := 'Lote';
          DM1.tLote.SetKey;
          DM1.tLoteLote.AsInteger   := DMProg.tProgramacaoItensLote.AsInteger;
          if DM1.tLote.GotoKey then
            begin
              DM1.tLote.Edit;
              DM1.tLoteNumProgramacao.AsInteger := vNumProgramacao;
              DM1.tLote.Post;
              Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);
            end;
        end
      else
        begin
          if not vDesfazPedido then
            begin
              qVerPedido.Close;
              qVerPedido.Params[0].AsInteger := DMProg.tProgramacaoItensPedido.AsInteger;
              qVerPedido.Open;
              if qVerPedido.IsEmpty then
                vDesfazPedido := True;
            end;
          if vDesfazPedido then
            begin
              DM1.tPedido.Edit;
              DM1.tPedidoNumProgramacao.AsInteger := vNumProgramacao;
              DM1.tPedido.Post;
            end;
        end;
    end;
end;

procedure TfPrevRelProgramacao.BitBtn3Click(Sender: TObject);
begin
  RxDBGrid1.DataSource := nil;

  DMProg.tProgramacaoItens.First;
  while not DMProg.tProgramacaoItens.Eof do
    begin
      vDesfazPedido := True;
      vNumProgramacao := 0;
      Le_Pedido;
      if BitBtn2.Tag = 1 then
        DMProg.tProgramacaoItens.Delete
      else
        DMProg.tProgramacaoItens.Next;
    end;

  if BitBtn2.Tag = 1 then
    begin
      //*** Le a memory para gravar na tabela dbProgramacaoItens
      mItens.First;
      while not mItens.Eof do
        begin
          DMProg.tProgramacaoItens.Insert;
          DMProg.tProgramacaoItensNumLancamento.AsInteger := mItensNumLancamento.AsInteger;
          DMProg.tProgramacaoItensOrdem.AsInteger         := mItensOrdem.AsInteger;
          DMProg.tProgramacaoItensPedido.AsInteger        := mItensPedido.AsInteger;
          DMProg.tProgramacaoItensItemPedido.AsInteger    := mItensItemPedido.AsInteger;
          DMProg.tProgramacaoItensLote.AsInteger          := mItensLote.AsInteger;
          DMProg.tProgramacaoItensCodCliente.AsInteger    := mItensCodCliente.AsInteger;
          DMProg.tProgramacaoItensCodProduto.AsInteger    := mItensCodProduto.AsInteger;
          DMProg.tProgramacaoItensCodCorProduto.AsInteger := mItensCodCorProduto.AsInteger;
          DMProg.tProgramacaoItensQtdPares.AsFloat       := mItensQtdPares.AsFloat;
          DMProg.tProgramacaoItens.Post;
          vNumProgramacao := mItensNumLancamento.AsInteger;
          Le_Pedido;
          mItens.Delete;
        end;
      DMProg.tProgramacaoItens.Refresh;
      //*** Monta o sql para gravar o número da programacao na tabela de pedidos
      DMProg.tProgramacao.Cancel;
    end
  else
    begin
      DMProg.tProgramacaoItens.First;
      while not DMProg.tProgramacaoItens.Eof do
        begin
          DMProg.tProgramacaoItensData.First;
          while not DMProg.tProgramacaoItensData.Eof do
            DMProg.tProgramacaoItensData.Delete;
          DMProg.tProgramacaoItens.Delete;
        end;
      DMProg.tProgramacaoDatas.First;
      while not DMProg.tProgramacaoDatas.Eof do
        DMProg.tProgramacaoDatas.Delete;
      DMProg.tProgramacao.Delete;
    end;
  mItens.EmptyTable;
  RxDBGrid1.DataSource := DMProg.dsProgramacaoItens;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfPrevRelProgramacao.BitBtn4Click(Sender: TObject);
begin
  if not DMProg.tProgramacao.IsEmpty then
    begin
      if DM1.tUsuarioExcProgramacao.AsBoolean then
        begin
          if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
            begin
              DMProg.tProgramacaoItens.First;
              while not DMProg.tProgramacaoItens.Eof do
                begin
                  vDesfazPedido := True;
                  vNumProgramacao := 0;
                  Le_Pedido;

                  DMProg.tProgramacaoItensData.First;
                  while not DMProg.tProgramacaoItensData.Eof do
                    DMProg.tProgramacaoItensData.Delete;

                  DMProg.tProgramacaoItens.Delete;
                end;
              DMProg.tProgramacaoDatas.First;
              while not DMProg.tProgramacaoDatas.Eof do
                DMProg.tProgramacaoDatas.Delete;
              DMProg.tProgramacao.Delete;
            end;
        end
      else
        ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ' não autorizado a fazer exclusão!');
    end
  else
    ShowMessage('Não há registro para ser excluído!');
end;

procedure TfPrevRelProgramacao.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelProgramacao.BitBtn6Click(Sender: TObject);
var
  vDataAux : TDate;
  vDataInicial, vDataFinal : TDate;
begin
  //*** Grava a tabela das datas "dbProgramacaoDatas"
  DMProg.tProgramacaoDatas.First;
  while not DMProg.tProgramacaoDatas.Eof do
    DMProg.tProgramacaoDatas.Delete;

  vDataInicial := 0;
  vDataFinal   := 0;
  DMProg.tProgramacaoItens.First;
  while not DMProg.tProgramacaoItens.Eof do
    begin
      DMProg.tProgramacaoItens.Next;
    end;

  //vDataAux := DMProg.tProgramacaoItensDtCorteI.AsDateTime;
  vDataAux := vDataInicial;
  while not(vDataAux > vDataFinal) do
    begin
      DMProg.tProgramacaoDatas.SetKey;
      DMProg.tProgramacaoDatasNumLancamento.AsInteger := DMProg.tProgramacaoNumLancamento.AsInteger;
      DMProg.tProgramacaoDatasData.AsDateTime         := vDataAux;
      if DMProg.tProgramacaoDatas.GotoKey then
        DMProg.tProgramacaoDatas.Edit
      else
        begin
          DMProg.tProgramacaoDatas.Insert;
          DMProg.tProgramacaoDatasNumLancamento.AsInteger := DMProg.tProgramacaoNumLancamento.AsInteger;
          DMProg.tProgramacaoDatasData.AsDateTime         := vDataAux;
        end;
      vDataAux   := vDataAux + 1;
      vData      := vDataAux;
      vDataAux   := vData;
    end;
  //************************
  DMProg.tProgramacao.Post;
  mItens.EmptyTable;
  Habilita;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfPrevRelProgramacao.BitBtn8Click(Sender: TObject);
var
  vDtCorte, vDtCostura, vDtPre, vDtMontagem : TDate;
  vQtdCorte, vQtdCostura, vQtdPre, vQtdMontagem : Real;
  vGerar : Boolean;
begin
  vGerar := False;
  if not DMProg.tProgramacaoItens.IsEmpty then
    begin
      vGerar := True;
      if DMProg.tProgramacaoDatas.RecordCount > 0 then
        begin
          if MessageDlg('                                  ATENÇÃO'
                        +#13#13+
                        'Já foram geradas as datas, se confimar o sistema assumirá'+#13+
                        'o cálculo das datas como o primeiro!',mtInformation, [mbOK,mbNO],0) = mrOK then
            vGerar := True
          else
            vGerar := False;
        end;
    end
  else
    ShowMessage('Deve haver itens na programação para gerar datas!');

  if vGerar then
    begin
      mSetorDatas.EmptyDataSet;
      DM1.tProduto.IndexFieldNames := 'Codigo';

      DMProg.tProgramacaoItens.First;
      while not DMProg.tProgramacaoItens.Eof do
        begin
          vItemSetor := 0;
          Le_Produto;

          DMProg.tProgramacaoItens.Next;
        end;
      //Le auxiliar mSetorDatas
      DMProg.tProgramacaoDatas.First;
      while not DMProg.tProgramacaoDatas.Eof do
        DMProg.tProgramacaoDatas.Delete;
      mSetorDatas.First;
      while not mSetorDatas.Eof do
        begin
          DMProg.tProgramacaoDatas.Insert;
          DMProg.tProgramacaoDatasNumLancamento.AsInteger := DMProg.tProgramacaoNumLancamento.AsInteger;
          DMProg.tProgramacaoDatasCodSetor.AsInteger      := mSetorDatasCodSetor.AsInteger;
          DMProg.tProgramacaoDatasData.AsDateTime         := mSetorDatasData.AsDateTime;
          DMProg.tProgramacaoDatasQtdProducao.AsInteger   := mSetorDatasQtd.AsInteger;
          DMProg.tProgramacaoDatas.Post;
          mSetorDatas.Next;
        end;
    end;
end;

procedure TfPrevRelProgramacao.Imprimir1Click(Sender: TObject);
begin
  qQtdParRef.Active := False;
  qQtdParRef.Params[0].AsInteger := DMProg.tProgramacaoNumLancamento.AsInteger;
  qQtdParRef.Active := True;
  fRelProgramacao := TfRelProgramacao.Create(Self);
  QRCompositeReport1.Print;
end;

procedure TfPrevRelProgramacao.Visualizar1Click(Sender: TObject);
begin
  qQtdParRef.Active := False;
  qQtdParRef.Params[0].AsInteger := DMProg.tProgramacaoNumLancamento.AsInteger;
  qQtdParRef.Active := True;
  fRelProgramacao := TfRelProgramacao.Create(Self);
  QRCompositeReport1.Preview;
end;

procedure TfPrevRelProgramacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DMProg.tProgramacao.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve confirmar ou cancelar este registro antes de fechar o formulário!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfPrevRelProgramacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) and (DMProg.tProgramacao.State in [dsBrowse]) then
    begin
      fConsProgramacao := TfConsProgramacao.Create(Self);
      fConsProgramacao.ShowModal;
    end;
  if Key = Vk_F3 then
    begin
      fProgramacaoOrdem := TfProgramacaoOrdem.Create(Self);
      fProgramacaoOrdem.CurrencyEdit1.Visible := False;
      fProgramacaoOrdem.Edit2.Visible         := False;
      fProgramacaoOrdem.CurrencyEdit2.Visible := False;
      fProgramacaoOrdem.CurrencyEdit3.Visible := False;
      fProgramacaoOrdem.BitBtn7.Visible       := False;
      fProgramacaoOrdem.RxLabel5.Visible      := False;
      fProgramacaoOrdem.RxLabel6.Visible      := False;
      fProgramacaoOrdem.RxLabel7.Visible      := False;
      fProgramacaoOrdem.ShowModal;
    end;
  if (Key = Vk_F5) and (DMProg.tProgramacao.State in [dsEdit]) and (CurrencyEdit1.AsInteger > 0) then
    begin
      DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
      DM1.tPedido.SetKey;
      DM1.tPedidoPedidoCliente.AsInteger := CurrencyEdit1.AsInteger;
      DM1.tPedidoPedCliDif.AsString      := Edit1.Text;
      if DM1.tPedido.GotoKey then
        begin
          fConsItemPed := TfConsItemPed.Create(Self);
          fConsItemPed.ShowModal;
        end
      else
        ShowMessage('Pedido não cadastrado');
    end;
end;

procedure TfPrevRelProgramacao.BitBtn9Click(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger <= 0 then
    begin
      ShowMessage('Pedido não foi informado!');
      exit;
    end;

  DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
  DM1.tPedido.SetKey;
  DM1.tPedidoPedidoCliente.AsInteger := CurrencyEdit1.AsInteger;
  DM1.tPedidoPedCliDif.AsString      := Edit1.Text;
  if (DM1.tPedido.GotoKey) and
     (not DM1.tPedidoCancelado.AsBoolean) and (DM1.tPedidoQtdParesFat.AsInteger < 1) and
     (not DM1.tPedidoSuspenso.AsBoolean) then
    begin
      DM1.tPedidoItem.Filtered := False;
      DM1.tPedidoItem.Filter   := 'QtdParesRest > 0';
      DM1.tPedidoItem.Filtered := True;
      DM1.tPedidoItem.First;
      while not DM1.tPedidoItem.Eof do
        begin
          if (not DM1.tPedidoItemCancelado.AsBoolean) and (DM1.tPedidoItemQtdParesFat.AsInteger < 1) and
             ((CurrencyEdit2.AsInteger = 0) or
             ((CurrencyEdit2.AsInteger > 0) and (CurrencyEdit2.AsInteger = DM1.tPedidoItemItem.AsInteger))) then
            begin
              //*** Gera o pedido quando o lote for exportação
              if DM1.tPedidoLoteExp.AsBoolean then
                begin
                  DM1.tLote.Filtered := False;
                  DM1.tLote.Filter   := 'NroPedido = '''+DM1.tPedidoItemPedido.AsString+''' and ItemPed = '''+DM1.tPedidoItemItem.AsString+'''';
                  DM1.tLote.Filtered := True;
                  DM1.tLote.First;
                  while not DM1.tLote.Eof do
                    begin
                      if (DM1.tLoteNumProgramacao.AsInteger < 1) and
                         ((CurrencyEdit3.AsInteger = 0) or ((CurrencyEdit3.AsInteger > 0) and
                         (CurrencyEdit3.AsInteger = DM1.tLoteLote.AsInteger))) then
                        Gera_tProgramacaoItens(DM1.tLoteLote.AsInteger,DM1.tLoteQtdPares.AsInteger, 'E');
                      DM1.tLote.Next;
                    end;
                  DM1.tLote.Filtered := False;
                end
              else
              //*** Gera o pedido quando o lote for mercado interno
              if DM1.tPedidoNumProgramacao.AsInteger < 1 then
                Gera_tProgramacaoItens(DM1.tPedidoNumLote.AsInteger,DM1.tPedidoItemQtdParesRest.AsInteger, 'I');
            end;
          DM1.tPedidoItem.Next;
        end;
      if (DM1.tPedidoItem.RecordCount > 0) and not(DM1.tPedidoLoteExp.AsBoolean) then
        begin
          DM1.tPedido.Edit;
          DM1.tPedidoNumProgramacao.AsInteger := DMProg.tProgramacaoNumLancamento.AsInteger;
          DM1.tPedido.Post;
        end;
      DM1.tPedidoItem.Filtered := False;
    end
  else
    ShowMessage('Pedido não pode ser incluído na programação');

  CurrencyEdit1.Clear;
  Edit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit1.SetFocus;
end;

procedure TfPrevRelProgramacao.BitBtn7Click(Sender: TObject);
begin
  fProgramacaoOrdem := TfProgramacaoOrdem.Create(Self);
  fProgramacaoOrdem.CurrencyEdit1.Visible := True;
  fProgramacaoOrdem.Edit2.Visible         := True;
  fProgramacaoOrdem.BitBtn7.Visible       := True;
  fProgramacaoOrdem.RxLabel5.Visible      := True;
  fProgramacaoOrdem.ShowModal;
end;

procedure TfPrevRelProgramacao.BitBtn10Click(Sender: TObject);
begin
  if DMProg.tProgramacaoDatas.RecordCount > 0 then
    begin
      fAlteraProgItem := TfAlteraProgItem.Create(Self);
      fAlteraProgItem.ShowModal;
    end
  else
    ShowMessage('Não foram geradas as datas!');
end;

procedure TfPrevRelProgramacao.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  {if not(DMProg.tProgramacaoItenslkQtdRestante.AsFloat > 0) then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
  if DMProg.tProgramacaoItenslkQtdFaturado.AsFloat > 0 then
    begin
      Background  := clAqua;
      AFont.Color := clWhite;
    end}
end;

procedure TfPrevRelProgramacao.QRCompositeReport1AddReports(
  Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(fRelProgramacao.QuickRep1);
  QRCompositeReport1.Reports.Add(fRelProgramacao.QuickRep2);
end;

procedure TfPrevRelProgramacao.BitBtn11Click(Sender: TObject);
begin
  if DM1.tUsuarioExcProgramacao.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir o item da programação?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin

          vDesfazPedido   := False;
          vNumProgramacao := 0;
          Le_Pedido;

          DMProg.tProgramacaoItensData.First;
          while not DMProg.tProgramacaoItensData.Eof do
            DMProg.tProgramacaoItensData.Delete;

          DMProg.tProgramacaoItens.Delete;
        end;
    end;
end;

procedure TfPrevRelProgramacao.RxDBGrid1DblClick(Sender: TObject);
begin
  if (DMProg.tProgramacao.State in [dsEdit,dsInsert]) and (DMProg.tProgramacaoItensOrdem.AsInteger > 0) then
    begin
      fCalculaDatas := TfCalculaDatas.Create(Self);
      fCalculaDatas.ShowModal;
    end;
end;

procedure TfPrevRelProgramacao.BitBtn12Click(Sender: TObject);
begin
  {if DM1.tUsuarioExcProgramacao.AsBoolean then
    begin
      vPedido := DMProg.tProgramacaoItensPedido.AsInteger;
      if MessageDlg('Deseja realmente excluir o PEDIDO ' + DMProg.tProgramacaoItenslkPedido.AsString + ' da programação?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          DMProg.tProgramacaoItens.First;
          while not DMProg.tProgramacaoItens.Eof do
            begin
              if DMProg.tProgramacaoItensPedido.AsInteger = vPedido then
                begin
                  vDesfazPedido   := True;
                  vNumProgramacao := 0;
                  Le_Pedido;
                  DMProg.tProgramacaoItens.Delete
                end
              else
                DMProg.tProgramacaoItens.Next;
            end;
        end;
    end
  else
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ' não autorizado a fazer exclusão!');}
end;

procedure TfPrevRelProgramacao.FormShow(Sender: TObject);
begin
  DMProg.tProgramacao.Open;
  DMProg.tProgramacaoItens.Open;
  DMProg.tProgramacaoItensData.Open;
  DMProg.tProgramacaoDatas.Open;
  DM1.tFabrica.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tLote.Open;
  DM1.tProduto.Open;
  DM1.tProdutoSetor.Open;
  DM1.tProdutoSetorAux.Open;
end;

procedure TfPrevRelProgramacao.FormCreate(Sender: TObject);
begin
  DMProg := TDMProg.Create(Self);
end;

procedure TfPrevRelProgramacao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFabrica.IndexFieldNames := 'Nome';
end;

procedure TfPrevRelProgramacao.BitBtn13Click(Sender: TObject);
begin
  Le_tProgramacaoItens;
  fConsProgramacaoItens := TfConsProgramacaoItens.Create(Self);
  fConsProgramacaoItens.ShowModal;
end;

end.
