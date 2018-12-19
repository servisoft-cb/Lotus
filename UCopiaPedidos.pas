unit UCopiaPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, RXDBCtrl, ExtCtrls, StdCtrls, Buttons,
  DBFilter, RXLookup;

type
  TfCopiaPedidos = class(TForm)
    RxDBGrid1: TRxDBGrid;
    tPedido2: TTable;
    dsPedido2: TDataSource;
    tPedido2Pedido: TIntegerField;
    tPedido2DtEmissao: TDateField;
    tPedido2CodCliente: TIntegerField;
    tPedido2CodTransp: TIntegerField;
    tPedido2CodRedespacho: TIntegerField;
    tPedido2CodCondPgto: TIntegerField;
    tPedido2TipoFrete: TStringField;
    tPedido2CodVendedor: TIntegerField;
    tPedido2PercComissao: TFloatField;
    tPedido2DtIniEmbarque: TDateField;
    tPedido2DtFinEmbarque: TDateField;
    tPedido2CodNatOper: TIntegerField;
    tPedido2Situacao: TIntegerField;
    tPedido2NumLote: TIntegerField;
    tPedido2QtdPares: TFloatField;
    tPedido2VlrTotal: TFloatField;
    tPedido2VlrMercadoria: TFloatField;
    tPedido2VlrDesconto: TFloatField;
    tPedido2GerarLote: TStringField;
    tPedido2Cancelado: TBooleanField;
    tPedido2NumNota: TFloatField;
    tPedido2DtNota: TDateField;
    tPedido2Suspenso: TBooleanField;
    tPedido2Impresso: TBooleanField;
    tPedido2PesoBruto: TFloatField;
    tPedido2PesoLiquido: TFloatField;
    tPedido2lkCliente: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tPedidoItem2: TTable;
    tPedidoItem2Pedido: TIntegerField;
    tPedidoItem2Item: TIntegerField;
    tPedidoItem2CodProduto: TIntegerField;
    tPedidoItem2CodCor: TIntegerField;
    tPedidoItem2CodGrade: TIntegerField;
    tPedidoItem2QtdPares: TFloatField;
    tPedidoItem2Preco: TFloatField;
    tPedidoItem2VlrTotal: TFloatField;
    tPedidoItem2CodCabedal1: TIntegerField;
    tPedidoItem2CodCabedal2: TIntegerField;
    tPedidoItem2CodCorForro: TIntegerField;
    tPedidoItem2CodCorSolado: TIntegerField;
    tPedidoItem2CodCorPalmilha: TIntegerField;
    tPedidoItem2Cancelado: TBooleanField;
    tPedidoMaterial2: TTable;
    dsPedidoitem2: TDataSource;
    dsPedidoMaterial2: TDataSource;
    tPedidoParc2: TTable;
    tPedidoParc2Pedido: TIntegerField;
    tPedidoParc2Item: TIntegerField;
    tPedidoParc2DtVencto: TDateField;
    tPedidoParc2Valor: TFloatField;
    dsPedidoParc: TDataSource;
    tPedidoDesconto2: TTable;
    dsPedidoDesconto2: TDataSource;
    tPedidoDesconto2Pedido: TIntegerField;
    tPedidoDesconto2Item: TIntegerField;
    tPedidoDesconto2PercDesconto: TFloatField;
    tPedidoDesconto2VlrDesconto: TFloatField;
    tPedidoGrade2: TTable;
    dsPedidoGrade2: TDataSource;
    tPedidoGrade2Pedido: TIntegerField;
    tPedidoGrade2ItemPed: TIntegerField;
    tPedidoGrade2CodGrade: TIntegerField;
    tPedidoGrade2Posicao: TIntegerField;
    tPedidoGrade2Qtd: TFloatField;
    tPedidoGrade2VlrUnitario: TFloatField;
    tPedidoGrade2VlrTotal: TFloatField;
    tProdutoMat2: TTable;
    dsProdutoMat2: TDataSource;
    tProdutoMat2CodProduto: TIntegerField;
    tProdutoMat2Item: TIntegerField;
    tProdutoMat2CodMaterial: TIntegerField;
    tProdutoMat2CodGrade: TIntegerField;
    tProdutoMat2CodCor: TIntegerField;
    tProdutoMat2Qtd: TFloatField;
    tProdutoMat2VlrUnitario: TFloatField;
    tProdutoMat2VlrTotal: TFloatField;
    tPedidoMaterial2Pedido: TIntegerField;
    tPedidoMaterial2ItemPed: TIntegerField;
    tPedidoMaterial2Ordem: TIntegerField;
    tPedidoMaterial2CodCor: TIntegerField;
    tPedidoMaterial2CodMaterial: TIntegerField;
    tPedidoMaterial2ConsumoPr: TFloatField;
    tPedidoItem2lkPesoBruto: TFloatField;
    tPedidoItem2lkPesoLiquido: TFloatField;
    tProdutoMat2CodCorProd: TIntegerField;
    tPedidoItem2QtdParesFat: TFloatField;
    tPedidoItem2QtdParesRest: TFloatField;
    tPedidoItem2Copiado: TBooleanField;
    tPedidoItem2Selecionado: TBooleanField;
    tPedidoItem2QtdParesCanc: TFloatField;
    tPedidoItem2CodForro: TIntegerField;
    tPedidoItem2CodEtiqueta: TIntegerField;
    tPedidoItem2VlrDesconto: TFloatField;
    tPedido2Selecionado: TBooleanField;
    tPedido2Copiado: TBooleanField;
    tPedido2PedidoCliente: TIntegerField;
    tPedido2Obs: TMemoField;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    tPedidoMaterial2CodPosicao: TIntegerField;
    tPedidoMaterial2ImpTalao: TStringField;
    tPedidoItem2CodSolado: TIntegerField;
    tPedidoItem2SitTrib: TSmallintField;
    tPedidoItem2QtdFatAut: TFloatField;
    tPedidoItem2QtdFatMan: TFloatField;
    tPedidoItem2CodTaloneira: TIntegerField;
    tPedidoItem2CodCorTaloneira: TIntegerField;
    tPedidoItem2CodPalmilha: TIntegerField;
    tPedidoItem2Invoice: TStringField;
    tPedidoItem2LoteGer: TBooleanField;
    tPedidoItem2Reposicao: TBooleanField;
    tPedidoItem2CodForma: TIntegerField;
    tPedidoItem2ObsLote: TStringField;
    tPedido2QtdParesCanc: TFloatField;
    tPedido2QtdParesFat: TFloatField;
    tPedido2QtdParesRest: TFloatField;
    tPedido2QtdFatAut: TFloatField;
    tPedido2QtdFatMan: TFloatField;
    tPedido2PedCliDif: TStringField;
    tPedido2ImpRotulo: TBooleanField;
    tPedido2ImpCalcLote: TBooleanField;
    tPedido2ObsRotulo: TMemoField;
    tPedido2Stock: TStringField;
    tPedido2LoteExp: TBooleanField;
    tPedido2Dolar: TBooleanField;
    tPedido2POCliente: TStringField;
    tPedido2Invoice: TStringField;
    tPedido2Carimbo: TStringField;
    tPedido2QtdParesRep: TFloatField;
    tPedido2VlrReposicao: TFloatField;
    tPedido2Caixinha: TStringField;
    tPedido2Mercado: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Copia_Pedido;
  public
    { Public declarations }
  end;

var
  fCopiaPedidos: TfCopiaPedidos;
  vNumPedido : Integer;
implementation

uses UDM1, UPedido, UAgendaTelef;

{$R *.DFM}

procedure TfCopiaPedidos.Copia_Pedido;
begin
  DM1.tPedidoCodCliente.AsInteger     := tPedido2CodCliente.AsInteger;
  DM1.tPedidoCodCondPgto.AsInteger    := tPedido2CodCondPgto.AsInteger;
  DM1.tPedidoCodTransp.AsInteger      := tPedido2CodTransp.AsInteger;
  DM1.tPedidoCodRedespacho.AsInteger  := tPedido2CodRedespacho.AsInteger;
  DM1.tPedidoCodVendedor.AsInteger    := tPedido2CodVendedor.AsInteger;
  DM1.tPedidoPercComissao.AsFloat     := tPedido2PercComissao.AsFloat;
  DM1.tPedidoCodNatOper.AsInteger     := tPedido2CodNatOper.AsInteger;
  DM1.tPedidoDtIniEmbarque.AsDateTime := tPedido2DtIniEmbarque.AsDateTime;
  DM1.tPedidoDtFinEmbarque.AsDateTime := tPedido2DtFinEmbarque.AsDateTime;
  DM1.tPedidoSituacao.AsInteger       := tPedido2Situacao.AsInteger;
  DM1.tPedidoTipoFrete.AsString       := tPedido2TipoFrete.AsString;
  DM1.tPedidoQtdPares.AsFloat         := tPedido2QtdPares.AsFloat;
  DM1.tPedidoQtdParesRep.AsFloat      := tPedido2QtdParesRep.AsFloat;
  DM1.tPedidoVlrReposicao.AsFloat     := tPedido2VlrReposicao.AsFloat;
  DM1.tPedidoVlrDesconto.AsFloat      := tPedido2VlrDesconto.AsFloat;
  tPedidoItem2.First;
  while not tPedidoItem2.EOF do
    begin
      if tPedidoItem2Cancelado.AsBoolean <> True then
        begin
          DM1.tPedidoItem.Insert;
          DM1.tPedidoItemPedido.AsInteger         := DM1.tPedidoPedido.AsInteger;
          DM1.tPedidoItemItem.AsInteger           := tPedidoItem2Item.AsInteger;
          DM1.tPedidoItemCodProduto.AsInteger     := tPedidoItem2CodProduto.AsInteger;
          DM1.tPedidoItemCodCor.AsInteger         := tPedidoItem2CodCor.AsInteger;
          DM1.tPedidoItemCancelado.AsBoolean      := tPedidoItem2Cancelado.AsBoolean;
//          DM1.tPedidoItemCodCabedal1.AsInteger    := tPedidoItem2CodCabedal1.AsInteger;
//          DM1.tPedidoItemCodCabedal2.AsInteger    := tPedidoItem2CodCabedal2.AsInteger;
//          DM1.tPedidoItemCodCorForro.AsInteger    := tPedidoItem2CodCorForro.AsInteger;
//          DM1.tPedidoItemCodForro.AsInteger       := tPedidoItem2CodForro.AsInteger;
//          DM1.tPedidoItemCodPalmilha.AsInteger    := tPedidoItem2CodPalmilha.AsInteger;
//          DM1.tPedidoItemCodCorPalmilha.AsInteger := tPedidoItem2CodCorPalmilha.AsInteger;
//          DM1.tPedidoItemCodCorSolado.AsInteger   := tPedidoItem2CodCorSolado.AsInteger;
//          DM1.tPedidoItemCodEtiqueta.AsInteger    := tPedidoItem2CodEtiqueta.AsInteger;
          DM1.tPedidoItemCodGrade.AsInteger       := tPedidoItem2CodGrade.AsInteger;
          DM1.tPedidoItemPreco.AsFloat            := tPedidoItem2Preco.AsFloat;
          DM1.tPedidoItemVlrDesconto.AsFloat      := tPedidoItem2VlrDesconto.AsFloat;
          DM1.tPedidoItemQtdPares.AsFloat         := tPedidoItem2QtdPares.AsFloat;
          DM1.tPedidoItemQtdParesFat.AsFloat      := 0;
          DM1.tPedidoItemQtdParesRest.AsFloat     := DM1.tPedidoItemQtdPares.AsFloat;
          DM1.tPedidoItemReposicao.AsBoolean      := tPedidoItem2Reposicao.AsBoolean;
          DM1.tPedidoItemVlrTotal.AsFloat         := tPedidoItem2VlrTotal.AsFloat;
          DM1.tPedidoItemCopiado.AsBoolean        := False;
          DM1.tPedidoItemSelecionado.AsBoolean    := False;
          DM1.tPedidoVlrTotal.AsFloat             := DM1.tPedidoVlrTotal.AsFloat +
                                                     tPedidoItem2VlrTotal.AsFloat;
          DM1.tPedidoVlrMercadoria.AsFloat        := DM1.tPedidoVlrMercadoria.AsFloat +
                                                     (tPedidoItem2Preco.AsFloat * tPedidoItem2QtdPares.AsInteger);
          DM1.tPedidoPesoBruto.AsFloat            := DM1.tPedidoPesoBruto.AsFloat +
                                                     tPedidoItem2lkPesoBruto.AsFloat * tPedidoItem2QtdPares.AsFloat;
          DM1.tPedidoPesoLiquido.AsFloat          := DM1.tPedidoPesoLiquido.AsFloat +
                                                     tPedidoItem2lkPesoLiquido.AsFloat * tPedidoItem2QtdPares.AsFloat;
          tPedidoGrade2.First;
          while not tPedidoGrade2.EOF do
            begin
              DM1.tPedidoGrade.Insert;
              DM1.tPedidoGradePedido.AsInteger    := DM1.tPedidoPedido.AsInteger;
              DM1.tPedidoGradeItemPed.AsInteger   := tPedidoGrade2ItemPed.AsInteger;
              DM1.tPedidoGradeCodGrade.AsInteger  := tPedidoGrade2CodGrade.AsInteger;
              DM1.tPedidoGradePosicao.AsInteger   := tPedidoGrade2Posicao.AsInteger;
              DM1.tPedidoGradeQtd.AsFloat         := tPedidoGrade2Qtd.AsFloat;
              DM1.tPedidoGradeVlrTotal.AsFloat    := tPedidoGrade2VlrTotal.AsFloat;
              DM1.tPedidoGradeVlrUnitario.AsFloat := tPedidoGrade2VlrUnitario.AsFloat;
              DM1.tPedidoGrade.Post;
              tPedidoGrade2.Next;
            end;
          tPedidoMaterial2.First;
          while not tPedidoMaterial2.EOF do
            begin
              DM1.tPedidoMaterial.Insert;
              DM1.tPedidoMaterialPedido.AsInteger      := DM1.tPedidoPedido.AsInteger;
              DM1.tPedidoMaterialCodCor.AsInteger      := tPedidoMaterial2CodCor.AsInteger;
              DM1.tPedidoMaterialCodMaterial.AsInteger := tPedidoMaterial2CodMaterial.AsInteger;
              DM1.tPedidoMaterialConsumoPr.AsFloat     := tPedidoMaterial2ConsumoPr.AsFloat;
              DM1.tPedidoMaterialItemPed.AsInteger     := tPedidoMaterial2ItemPed.AsInteger;
              DM1.tPedidoMaterialOrdem.AsInteger       := tPedidoMaterial2Ordem.AsInteger;
              DM1.tPedidoMaterialCodPosicao.AsInteger  := tPedidoMaterial2CodPosicao.AsInteger;
              DM1.tPedidoMaterialImpTalao.AsString     := tPedidoMaterial2ImpTalao.AsString;
              DM1.tPedidoMaterial.Post;
              tPedidoMaterial2.Next;
            end;
          DM1.tPedidoItem.Post;
        end;
      tPedidoItem2.Next;
    end;
  tPedidoDesconto2.First;
  while not tPedidoDesconto2.EOF do
    begin
      DM1.tPedidoDesconto.Insert;
      DM1.tPedidoDescontoPedido.AsInteger     := DM1.tPedidoPedido.AsInteger;
      DM1.tPedidoDescontoItem.AsInteger       := tPedidoDesconto2Item.AsInteger;
      DM1.tPedidoDescontoPercDesconto.AsFloat := tPedidoDesconto2PercDesconto.AsFloat;
      DM1.tPedidoDescontoVlrDesconto.AsFloat  := tPedidoDesconto2VlrDesconto.AsFloat;
      DM1.tPedidoDesconto.Post;
      tPedidoDesconto2.Next;
    end;
  tPedidoParc2.First;
  while not tPedidoParc2.EOF do
    begin
      DM1.tPedidoParc.Insert;
      DM1.tPedidoParcPedido.AsInteger    := DM1.tPedidoPedido.AsInteger;
      DM1.tPedidoParcDtVencto.AsDateTime := tPedidoParc2DtVencto.AsDateTime;
      DM1.tPedidoParcItem.AsInteger      := tPedidoParc2Item.AsInteger;
      DM1.tPedidoParcValor.AsFloat       := tPedidoParc2Valor.AsFloat;
      DM1.tPedidoParc.Post;
      tPedidoParc2.Next;
    end;
end;

procedure TfCopiaPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
  tPedido2.IndexFieldNames := 'Pedido';
end;

procedure TfCopiaPedidos.BitBtn2Click(Sender: TObject);
begin
  tPedido2.Filtered := False;
  Close;
end;

procedure TfCopiaPedidos.FormShow(Sender: TObject);
begin
  vNumPedido := 0;
  vNumPedido := DM1.tPedidoPedido.AsInteger;
  tPedido2.Filtered := False;
  tPedido2.Filter   := 'Pedido <> '''+IntToStr(vNumPedido)+'''';
  tPedido2.Filtered := True;
end;

procedure TfCopiaPedidos.BitBtn1Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente copiar o pedido selecionado?',mtWarning,[mbOK,mbNO],0) = mrOK then
    begin
      Copia_Pedido;
      fPedido.RxDBLookupCombo9Exit(Sender);
      BitBtn2.Click;
    end;
end;

procedure TfCopiaPedidos.BitBtn3Click(Sender: TObject);
begin
  tPedido2.SetKey;
  tPedido2Pedido.AsInteger := StrToInt(Edit1.Text);
  if tPedido2.GotoKey then
    Edit1.SetFocus
  else
    begin
      ShowMessage('Não existe "Pedido" c/ este nº.!');
      Edit1.SetFocus;
    end;
end;

procedure TfCopiaPedidos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
