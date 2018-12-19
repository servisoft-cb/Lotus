unit ULoteExp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB, DBTables, DBIProcs,
  DBFilter, RXLookup, MemTable, ComCtrls, Mask, ToolEdit, CurrEdit,
  DBClient;

type
  TfLoteExp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
    tLoteIns: TTable;
    tLoteInsLote: TIntegerField;
    tLoteInsQtdTaloes: TIntegerField;
    tLoteInsQtdPares: TFloatField;
    tLoteInsObs: TMemoField;
    tTalaoIns: TTable;
    tTalaoInsLote: TIntegerField;
    tTalaoInsCodProduto: TIntegerField;
    tTalaoInsCodCabedal1: TIntegerField;
    tTalaoInsCodCabedal2: TIntegerField;
    tTalaoInsCodCor: TIntegerField;
    tTalaoInsCodCorForro: TIntegerField;
    tTalaoInsCodCorPalmilha: TIntegerField;
    tTalaoInsCodCorSolado: TIntegerField;
    tTalaoInsQtdPar: TIntegerField;
    RxDBFilter1: TRxDBFilter;
    RadioGroup1: TRadioGroup;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    tTalaoInsCodForro: TIntegerField;
    tTalaoInsCodEtiqueta: TIntegerField;
    tTalaoInsCodSolado: TIntegerField;
    tTalaoInsItem: TIntegerField;
    tTalaoInsCodTaloneira: TIntegerField;
    tTalaoInsCodCorTaloneira: TIntegerField;
    tTalaoGrade: TTable;
    tTalaoGradeLote: TIntegerField;
    tTalaoGradeItem: TIntegerField;
    tTalaoGradeTalao: TIntegerField;
    tTalaoGradeCodGrade: TIntegerField;
    tTalaoGradePosicao: TIntegerField;
    tTalaoGradeQtdPar: TIntegerField;
    StatusBar1: TStatusBar;
    StaticText1: TStaticText;
    Edit1: TEdit;
    StaticText2: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    StaticText3: TStaticText;
    Memo1: TMemo;
    RxDBGrid1: TRxDBGrid;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    RxDBGrid2: TRxDBGrid;
    StaticText4: TStaticText;
    CurrencyEdit2: TCurrencyEdit;
    Panel4: TPanel;
    BitBtn2: TBitBtn;
    mSetorAux: TMemoryTable;
    mSetorAuxOrdem: TIntegerField;
    mSetorAuxCodSetor: TIntegerField;
    dsSetorAux: TDataSource;
    mSetorAuxlkNomeSetor: TStringField;
    mSetorAuxCodAtelier: TIntegerField;
    mSetorAuxlkNomeAtelier: TStringField;
    mSetorAuxAtelier: TBooleanField;
    StaticText5: TStaticText;
    DateEdit1: TDateEdit;
    dsAuxTalaoGradeExp: TDataSource;
    RadioGroup2: TRadioGroup;
    mSetorAuxlkOpcaoTalaoAuxiliar: TStringField;
    qLote: TQuery;
    qTalao: TQuery;
    qTalaoGrade: TQuery;
    tAuxTalaoGradeExp: TClientDataSet;
    tAuxTalaoGradeExpLote: TIntegerField;
    tAuxTalaoGradeExpCodGrade: TIntegerField;
    tAuxTalaoGradeExpPosicao: TIntegerField;
    tAuxTalaoGradeExpItem: TIntegerField;
    tAuxTalaoGradeExpQtd: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure tTalaoGradeAfterPost(DataSet: TDataSet);
    procedure Edit1Enter(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }

    vTalao, vQtdParTalao : Integer;
    LotesGerados : String;

    procedure Habilita;
    procedure Insere_Lote;
    procedure Gera_Taloes;
    procedure Grava_Talao;
    procedure Grava_TalaoGrade;
    procedure Grava_LotePedido;
    procedure Grava_LoteSetor;
    procedure Monta_Setores;
    procedure Grava_TalaoAuxiliar(Talao, CodGrade, Posicao, Qtd : Integer ; Tamanho : String);
  public
    { Public declarations }
  end;

var
  fLoteExp: TfLoteExp;

implementation

uses UDM1, ULoteSetor, uIntegracao;

{$R *.DFM}

procedure TfLoteExp.Grava_TalaoAuxiliar(Talao, CodGrade, Posicao, Qtd : Integer ; Tamanho : String);
begin
  if DM1.tTalaoAuxiliar.FindKey([qLote.FieldByName('Lote').AsInteger,qLote.FieldByName('CodSetor').AsInteger,qTalao.FieldByName('Item').AsInteger,Talao]) then
    DM1.tTalaoAuxiliar.Edit
  else
    begin
      DM1.tTalaoAuxiliar.Insert;
      DM1.tTalaoAuxiliarLote.AsInteger       := qLote.FieldByName('Lote').AsInteger;
      DM1.tTalaoAuxiliarCodSetor.AsInteger   := qLote.FieldByName('CodSetor').AsInteger;
      DM1.tTalaoAuxiliarItemTalao.AsInteger  := qTalao.FieldByName('Item').AsInteger;
      DM1.tTalaoAuxiliarTalao.AsInteger      := Talao;
      DM1.tTalaoAuxiliarCodProduto.AsInteger := qTalao.FieldByName('CodProduto').AsInteger;
      DM1.tTalaoAuxiliarCodCor.AsInteger     := qTalao.FieldByName('CodCor').AsInteger;
    end;
  DM1.tTalaoAuxiliarQtdPares.AsInteger      := Qtd;
  DM1.tTalaoAuxiliarCodGrade.AsInteger      := CodGrade;
  DM1.tTalaoAuxiliarPosicao.AsInteger       := Posicao;
  DM1.tTalaoAuxiliarTamanho.AsString        := Tamanho;
  DM1.tTalaoAuxiliarCodCliente.AsInteger    := DM1.tPedidoCodCliente.AsInteger;
  DM1.tTalaoAuxiliarPedido.AsInteger        := DM1.tPedidoPedido.AsInteger;
  DM1.tTalaoAuxiliarItemPedido.AsInteger    := DM1.tPedidoItemItem.AsInteger;
  DM1.tTalaoAuxiliarCodAtelier.AsInteger    := 0;
  DM1.tTalaoAuxiliarOpcaoLoteTalao.AsString := DM1.tSetorOpcaoTalaoAuxiliar.AsString;
  DM1.tTalaoAuxiliar.Post;

  if Talao <= 0 then
    begin
      qTalaoGrade.First;
      while not qTalaoGrade.Eof do
        begin
          if DM1.tTalaoAuxiliarGrade.FindKey([qLote.FieldByName('Lote').AsInteger,qLote.FieldByName('CodSetor').AsInteger,qTalaoGrade.FieldByName('CodGrade').AsInteger,qTalaoGrade.FieldByName('Posicao').AsInteger]) then
            DM1.tTalaoAuxiliarGrade.Edit
          else
            begin
              DM1.tTalaoAuxiliarGrade.Insert;
              DM1.tTalaoAuxiliarGradeLote.AsInteger := qLote.FieldByName('Lote').AsInteger;
              DM1.tTalaoAuxiliarGradeCodSetor.AsInteger := qLote.FieldByName('CodSetor').AsInteger;
              DM1.tTalaoAuxiliarGradeCodGrade.AsInteger := qTalaoGrade.FieldByName('CodGrade').AsInteger;
              DM1.tTalaoAuxiliarGradePosicao.AsInteger  := qTalaoGrade.FieldByName('Posicao').AsInteger;
              DM1.tTalaoAuxiliarGradeTamanho.AsString := qTalaoGrade.FieldByName('Tamanho').AsString;
            end;
          DM1.tTalaoAuxiliarGradeQtd.AsInteger    := DM1.tTalaoAuxiliarGradeQtd.AsInteger + qTalaoGrade.FieldByName('QtdPar').AsInteger;
          DM1.tTalaoAuxiliarGrade.Post;
          qTalaoGrade.Next;
        end;
    end;
end;

procedure TfLoteExp.Habilita;
begin
  Panel2.Enabled  := not(Panel2.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn6.Enabled := not(BitBtn6.Enabled);
end;

procedure TfLoteExp.Monta_Setores;
var
 vOrdem : Integer;
begin
  mSetorAux.EmptyTable;
  vOrdem := 0;
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.SetKey;
  DM1.tProdutoCodigo.AsInteger := DM1.tPedidoItemCodProduto.AsInteger;
  if DM1.tProduto.GotoKey then
    begin
      DM1.tProdutoSetor.First;
      while not DM1.tProdutoSetor.Eof do
        begin
          //if DM1.tProdutoSetorCodSetor.AsInteger > 8 then
          if not DM1.tProdutoSetorlkImpTalao.AsBoolean then
            ShowMessage('Este setor não esta liberado para gravar no lote')
          else
            begin
              mSetorAux.Insert;
              inc(vOrdem);
              mSetorAuxCodSetor.AsInteger   := DM1.tProdutoSetorCodSetor.AsInteger;
              mSetorAuxOrdem.AsInteger      := vOrdem;
              mSetorAuxAtelier.AsBoolean    := DM1.tProdutoSetorlkAtelier.AsBoolean;
              mSetorAuxCodAtelier.AsInteger := DM1.tProdutoSetorCodAtelier.AsInteger;
              mSetorAux.Post;
            end;
          DM1.tProdutoSetor.Next;
        end;
    end;
end;

procedure TfLoteExp.Grava_Talao;
begin
  DM1.tTalao.Insert;
  DM1.tTalaoLote.AsInteger            := DM1.tLoteLote.AsInteger;
  DM1.tTalaoItem.AsInteger            := 1;
  DM1.tTalaoCodProduto.AsInteger      := DM1.tPedidoItemCodProduto.AsInteger;
  DM1.tTalaoCodCabedal1.AsInteger     := DM1.tPedidoItemCodCabedal1.AsInteger;
  DM1.tTalaoCodCabedal2.AsInteger     := DM1.tPedidoItemCodCabedal2.AsInteger;
  DM1.tTalaoCodcor.AsInteger          := DM1.tPedidoItemCodCor.AsInteger;
  DM1.tTalaoCodCorForro.AsInteger     := DM1.tPedidoItemCodCorForro.AsInteger;
  DM1.tTalaoCodCorPalmilha.AsInteger  := DM1.tPedidoItemCodCorPalmilha.AsInteger;
  DM1.tTalaoCodCorSolado.AsInteger    := DM1.tPedidoItemCodCorSolado.AsInteger;
  DM1.tTalaoQtdPar.AsInteger          := tAuxTalaoGradeExpQtd.AsInteger;
  DM1.tTalaoCodForro.AsInteger        := DM1.tPedidoItemCodForro.AsInteger;
  DM1.tTalaoCodEtiqueta.AsInteger     := DM1.tPedidoItemCodEtiqueta.AsInteger;
  DM1.tTalaoCodSolado.AsInteger       := DM1.tPedidoItemCodSolado.AsInteger;
  DM1.tTalaoCodTaloneira.AsInteger    := DM1.tPedidoItemCodTaloneira.AsInteger;
  DM1.tTalaoCodCorTaloneira.AsInteger := DM1.tPedidoItemCodCorTaloneira.AsInteger;
  DM1.tTalaoCodPalmilha.AsInteger     := DM1.tPedidoItemCodPalmilha.AsInteger;
  DM1.tTalaoInvoice.AsString          := DM1.tPedidoItemInvoice.AsString;
  DM1.tTalaoCodForma.AsInteger        := DM1.tPedidoItemCodForma.AsInteger;
  DM1.tTalaoQtdPar.AsInteger          := 0;
end;

procedure TfLoteExp.Grava_TalaoGrade;
begin
  vTalao := vTalao + 1;
  DM1.tTalaoGrade.Insert;
  DM1.tTalaoGradeLote.AsInteger     := DM1.tTalaoLote.AsInteger;
  DM1.tTalaoGradeItem.AsInteger     := DM1.tTalaoItem.AsInteger;
  DM1.tTalaoGradeTalao.AsInteger    := vTalao;
  DM1.tTalaoGradeCodGrade.AsInteger := tAuxTalaoGradeExpCodGrade.AsInteger;
  DM1.tTalaoGradePosicao.AsInteger  := tAuxTalaoGradeExpPosicao.AsInteger;
  DM1.tTalaoGradeQtdPar.AsInteger   := vQtdParTalao;
  DM1.tTalaoGrade.Post;

  Prc_Gravar_TalaoGrade_FB(DM1.tTalaoGradeLote.AsInteger,DM1.tTalaoGradeItem.AsInteger,DM1.tTalaoGradeTalao.AsInteger);

  DM1.tTalaoQtdPar.AsInteger   := DM1.tTalaoQtdPar.AsInteger + DM1.tTalaoGradeQtdPar.AsInteger;
  DM1.tLoteQtdTaloes.AsInteger := vTalao;
  DM1.tLoteQtdPares.AsInteger  := DM1.tLoteQtdPares.AsInteger + DM1.tTalaoGradeQtdPar.AsInteger;
end;

procedure TfLoteExp.Insere_Lote;
begin
  DM1.tLote.IndexFieldNames := 'Lote';
  tLoteIns.IndexFieldNames  := 'Lote';
  tLoteIns.Refresh;
  tLoteIns.Last;
  DM1.tLote.Refresh;
  DM1.tLote.Insert;
  DM1.tLoteLote.AsInteger       := tLoteInsLote.AsInteger + 1;
  DM1.tLoteObs.AsString         := Memo1.Text;
  DM1.tLoteNumMapaCompras.AsInteger := 0;
  if DateEdit1.Date > 0 then
    DM1.tLoteDtEmbarque.AsString := DateEdit1.Text
  else
    DM1.tLoteDtEmbarque.Clear;
  Case RadioGroup2.ItemIndex of
    0 : DM1.tLoteTipoTalao.AsString := 'T';
    1 : DM1.tLoteTipoTalao.AsString := 'R';
  end;
  DM1.tLoteQtdTaloes.AsInteger := 0;
  DM1.tLoteQtdPares.AsInteger  := 0;
  DM1.tLote.Post;
  Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

  DM1.tLote.Edit;
  DM1.tLoteNroPedido.AsInteger  := DM1.tPedidoPedido.AsInteger;
  DM1.tLoteItemPed.AsInteger    := DM1.tPedidoItemItem.AsInteger;
  DM1.tLoteCodFabrica.AsInteger := DM1.tPedidoCodFabrica.AsInteger;
end;

procedure TfLoteExp.Grava_LotePedido;
begin
  DM1.tLotePedido.Insert;
  DM1.tLotePedidoLote.AsInteger       := DM1.tLoteLote.AsInteger;
  DM1.tLotePedidoPedido.AsInteger     := DM1.tLoteNroPedido.AsInteger;
  DM1.tLotePedidoItemPedido.AsInteger := DM1.tLoteItemPed.AsInteger;
  DM1.tLotePedido.Post;
end;

procedure TfLoteExp.Grava_LoteSetor;
begin
  mSetorAux.First;
  while not mSetorAux.Eof do
    begin
      DM1.tLoteSetor.Insert;
      DM1.tLoteSetorLote.AsInteger     := DM1.tLoteLote.AsInteger;
      DM1.tLoteSetorItem.AsInteger     := mSetorAuxOrdem.AsInteger;
      DM1.tLoteSetorCodSetor.AsInteger := mSetorAuxCodSetor.AsInteger;
      DM1.tSetor.IndexFieldNames       := 'Codigo';
      DM1.tSetor.FindKey([mSetorAuxCodSetor.AsInteger]);
      if (DM1.tSetorAtelier.AsBoolean) and (DM1.tSetorCodigo.AsInteger = mSetorAuxCodSetor.AsInteger) then
        DM1.tLoteSetorCodAtelier.AsInteger := mSetorAuxCodAtelier.AsInteger;
      DM1.tLoteSetor.Post;
      mSetorAux.Next;
    end;
end;

procedure TfLoteExp.Gera_Taloes;
var
 vQtdParGrade : Integer;
 vLoteAux  : Integer;
begin
  LotesGerados := '';
    //Esta geracao considera que o talao e o dbTalaoGrade
  vLoteAux := 0;
  tAuxTalaoGradeExp.First;
  while not tAuxTalaoGradeExp.Eof do
    begin
      if vLoteAux <> tAuxTalaoGradeExpLote.AsInteger then
        begin
          Insere_lote;
          Grava_Talao;
          vTalao := 0;
        end;
      vQtdParGrade := tAuxTalaoGradeExpQtd.AsInteger;
      while vQtdParGrade > 0 do
        begin
          if vQtdParGrade > DM1.tPedidoItemlkQParTalao.AsInteger then
            vQtdParTalao := DM1.tPedidoItemlkQParTalao.AsInteger
          else
            vQtdParTalao := vQtdParGrade;
          Grava_TalaoGrade;
          vQtdParGrade := vQtdParGrade - vQtdParTalao;

        end;
      vLoteAux := tAuxTalaoGradeExpLote.AsInteger;
      tAuxTalaoGradeExp.Next;
      if (tAuxTalaoGradeExp.Eof) or (vLoteAux <> tAuxTalaoGradeExpLote.AsInteger) then
        begin
          Grava_LotePedido;
          Grava_LoteSetor;
          DM1.tTalao.Post;
          Prc_Gravar_Talao_FB(DM1.tTalaoLote.AsInteger,DM1.tTalaoItem.AsInteger);
          if LotesGerados = '' then
            LotesGerados := DM1.tLoteLote.AsString
          else
            LotesGerados := LotesGerados + ', ' + DM1.tLoteLote.AsString;
          DM1.tLote.Post;
          Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

        end;
    end;

  //Descomentar somente quando liberar a versao para alteracoes solicitadas - Andre 31/03/2010
  DM1.tLote.IndexFieldNames := 'Lote';
  DM1.tSetor.IndexFieldNames       := 'Codigo';
  qLote.Close;
  qLote.Sql.Clear;
  qLote.Sql.Text := ' select * from "dblote.db" dblote '
                    +' left join "dbPedidoItem.db" dbPedidoItem on (dbPedidoItem.Pedido = dbLote.NroPedido and dbPedidoItem.Item = dbLote.ItemPed) '
                    +' join "dbProdutoSetorAux.db" dbProdutoSetorAux on (dbProdutoSetorAux.CodProduto = dbPedidoItem.CodProduto) '
                    +' where lote in (' +  LotesGerados + ')';
  qLote.Open;
  qLote.First;
  while not qLote.Eof do
  begin
    if DM1.tLote.FindKey([qLote.FieldByName('Lote').AsInteger]) then
      begin
        qTalao.Close;
        qTalao.Sql.Clear;
        qTalao.Sql.Text := 'select * from "dbtalao.db" dbtalao where Lote = ' + qLote.FieldByName('Lote').AsString;
        qTalao.Open;
        qTalao.First;
        while not qTalao.Eof do
        begin
        //aqui
          qTalaoGrade.Close;
          qTalaoGrade.Sql.Clear;
          qTalaoGrade.Sql.Text := ' select dbTalaoGrade.*, dbGradeItem.Tamanho from "dbTalaoGrade.db" dbTalaoGrade ' +
                                  ' left join "dbGradeItem.db" dbGradeItem on (dbGradeItem.CodGrade = dbTalaoGrade.CodGrade) and (dbGradeItem.Posicao = dbTalaoGrade.Posicao) ' +
                                  ' where Lote = ' + qTalao.FieldByName('Lote').AsString +
                                  ' and Item = '   + qTalao.FieldByName('Item').AsString;
          qTalaoGrade.Open;
          DM1.tSetor.FindKey([qLote.FieldByName('CodSetor').AsInteger]);
          if DM1.tSetorOpcaoTalaoAuxiliar.AsString = 'T' then
            begin
              qTalaoGrade.First;
              while not qTalaoGrade.EOF do
                begin
                  if qTalaoGrade.FieldByName('QtdPar').AsInteger > 0 then
                    Grava_TalaoAuxiliar(qTalaoGrade.FieldByName('Talao').AsInteger,qTalaoGrade.FieldByName('CodGrade').AsInteger,
                                        qTalaoGrade.FieldByName('Posicao').AsInteger,qTalaoGrade.FieldByName('QtdPar').AsInteger,qTalaoGrade.FieldByName('Tamanho').AsString);
                  qTalaoGrade.Next;
                end;
            end
          else
            Grava_TalaoAuxiliar(0,0,0,qTalao.FieldByName('QtdPar').AsInteger,'');
          qTalao.Next;
        end;
      end;
    qLote.Next;
  end;         
end;

procedure TfLoteExp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  Dm1.tProduto.Close;
  Dm1.tProdutoSetor.Close;
  Dm1.tTalao.Close;
  Dm1.tTalaoGrade.Close;
  Dm1.tLote.Close;
  Dm1.tLotePedido.Close;
  Dm1.tLoteSetor.Close;
  Dm1.tSetor.Close;
  Dm1.tPedidoItem.Close;
  Dm1.tPedido.Close;
  Dm1.tPedidoItem.Close;
  DM1.tPedidoGrade.Close;
  Dm1.tGrade.Close;
  Action := Cafree;
end;

procedure TfLoteExp.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfLoteExp.RxDBGrid1DblClick(Sender: TObject);
begin
  if BitBtn1.Tag = 1 then
    begin
      if DM1.tPedidoCancelado.AsBoolean then
        ShowMessage('Pedido esta cancelado!')
      else
      if DM1.tPedidoSuspenso.AsBoolean then
        ShowMessage('Pedido esta suspenso!')
      else
      if DM1.tPedidoMercado.AsString = 'I' then
        ShowMessage('Pedido Mercado Interno!')
      else
        begin
          if DM1.tPedidoNumLote.AsInteger < 1 then
            begin
              Edit1.Text := DM1.tPedidoPedidoCliente.AsString;
              Edit2.Text := DM1.tPedidoPedCliDif.AsString;
              Edit1.SetFocus;
            end;
        end;
    end;
end;

procedure TfLoteExp.BitBtn1Click(Sender: TObject);
begin
  Habilita;
  Edit1.SetFocus;
  BitBtn1.Tag := 1;
end;

procedure TfLoteExp.BitBtn5Click(Sender: TObject);
var
 vQtd, vQtdItem, vQtdParGrade, I, vQtdTalao, vSoma : Integer;
 vGera : String[1];
begin
   vGera := 'N';
  if Edit1.Text = '' then
    ShowMessage('Falta o número do Pedido')
  else
  if CurrencyEdit2.AsInteger < 1 then
    ShowMessage('Falta o item do pedido')
  else
  if CurrencyEdit1.AsInteger < 1 then
    ShowMessage('Falta a qtd. de Lotes para gerar o Pedido')
  else
  if Edit1.Text <> '' then
  begin
    tAuxTalaoGradeExp.EmptyDataSet;
    DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
    DM1.tPedido.SetKey;
    DM1.tPedidoPedidoCliente.AsString := Edit1.Text;
    DM1.tPedidoPedCliDif.AsString     := Edit2.Text;
    if DM1.tPedido.GotoKey then
    begin
      if DM1.tPedidoCancelado.AsBoolean then
        ShowMessage('Pedido esta cancelado!')
      else
      if DM1.tPedidoSuspenso.AsBoolean then
        ShowMessage('Pedido esta suspenso!')
      else
      if DM1.tPedidoNumLote.AsInteger > 0 then
        ShowMessage('Pedido já gerado o lote!')
      else
      if DM1.tPedidoMercado.AsString = 'I' then
        ShowMessage('Pedido Mercado Interno!')
      else
        vGera := 'S';
    end
    else
      ShowMessage('Pedido não cadastrado');
  end;

  if vGera = 'N' then
  begin
    Edit1.Clear;
    Edit2.Clear;
    Edit1.SetFocus;
  end;

  if vGera = 'S' then
    begin
      vQtdItem := 0;
      Screen.Cursor := crHourGlass;
      RxDBFilter1.Active := False;
      DM1.tPedidoItem.SetKey;
      DM1.tPedidoItemPedido.AsInteger := DM1.tPedidoPedido.AsInteger;
      DM1.tPedidoItemItem.AsInteger   := CurrencyEdit2.AsInteger;
      if DM1.tPedidoItem.GotoKey = False then
        begin
          vGera := 'N';
          ShowMessage('Item do pedido não cadastrado');
          CurrencyEdit2.SetFocus;
        end
      else
      if DM1.tPedidoItemLoteGer.AsBoolean = True then
        begin
          vGera := 'N';
          ShowMessage('Lote já foi gerado para este item');
          CurrencyEdit2.Clear;
          CurrencyEdit2.SetFocus;
        end
      else
      if DM1.tPedidoItemCancelado.AsBoolean then
        begin
          vGera := 'N';
          ShowMessage('Item do pedido esta cancelado');
          CurrencyEdit2.Clear;
          CurrencyEdit2.SetFocus;
        end
      else
        begin
          if (DM1.tPedidoItemlkQParTalao.AsFloat < 1) and (DM1.tPedidoItemCancelado.AsBoolean <> True) then
            begin
              ShowMessage('A Referência ' + DM1.tPedidoItemlkReferencia.AsString + ' esta sem a qtd.de pares por talão na ficha técnica');
              vGera := 'N';
            end
          else  // Esta geracao considera que o talao e o dbTalaoGrade
            begin
              vQtdItem := 0;
              DM1.tPedidoGrade.First;
              while not DM1.tPedidoGrade.Eof do
                begin
                  vQtdParGrade := DM1.tPedidoGradeQtd.AsInteger;
                  vQtd  := DM1.tPedidoGradeQtd.AsInteger div CurrencyEdit1.AsInteger;
                  while vQtdParGrade > 0 do
                    begin
                      for i := 1 to CurrencyEdit1.AsInteger do
                        begin
                          if vQtdParGrade < 1 then
                            Break;
                          if tAuxTalaoGradeExp.FindKey([i,DM1.tPedidoGradeCodGrade.AsInteger,DM1.tPedidoGradePosicao.AsInteger,0]) then
                          {tAuxTalaoGradeExp.SetKey;
                          tAuxTalaoGradeExpLote.AsInteger     := i;
                          tAuxTalaoGradeExpCodGrade.AsInteger := DM1.tPedidoGradeCodGrade.AsInteger;
                          tAuxTalaoGradeExpPosicao.AsInteger  := DM1.tPedidoGradePosicao.AsInteger;
                          tAuxTalaoGradeExpItem.AsInteger     := 0;
                          if tAuxTalaoGradeExp.GotoKey then}
                            begin
                              tAuxTalaoGradeExp.Edit;
                              tAuxTalaoGradeExpQtd.AsInteger := tAuxTalaoGradeExpQtd.AsInteger + vQtd;
                              tAuxTalaoGradeExp.Post;
                            end
                          else
                            begin
                              tAuxTalaoGradeExp.Insert;
                              tAuxTalaoGradeExpLote.AsInteger     := i;
                              tAuxTalaoGradeExpCodGrade.AsInteger := DM1.tPedidoGradeCodGrade.AsInteger;
                              tAuxTalaoGradeExpPosicao.AsInteger  := DM1.tPedidoGradePosicao.AsInteger;
                              tAuxTalaoGradeExpItem.AsInteger     := 0;
                              tAuxTalaoGradeExpQtd.AsInteger      := vQtd;
                              tAuxTalaoGradeExp.Post;
                            end;
                          vQtdParGrade := vQtdParGrade - vQtd;
                        end;
                      vQtd := 1;
                    end;
                  vQtdItem := vQtdItem + DM1.tPedidoGradeQtd.AsInteger;
                  DM1.tPedidoGrade.Next;
                end;
            end;
          if (DM1.tPedidoItemQtdPares.AsInteger <> vQtdItem) and (DM1.tPedidoItemCancelado.AsBoolean <> True) and (vGera = 'S') then
            ShowMessage('Cancelar o lote e verificar o Pedido ' + DM1.tPedidoPedidoCliente.AsString + ' Item ' + DM1.tPedidoItemItem.AsString + ' esta com ' + DM1.tPedidoItemQtdPares.AsString
                         + ' pares ' + ' e a grade esta com ' + IntToStr(vQtdItem));
        end;
      if vGera = 'S' then
        begin
          DM1.tGrade.IndexFieldNames := 'Codigo';
          DM1.tGrade.FindKey([DM1.tPedidoItemCodGrade.AsInteger]);
          Gera_Taloes;
          DM1.tPedidoItem.Edit;
          DM1.tPedidoItemLoteGer.AsBoolean := True;
          DM1.tPedidoItem.Post;
          DM1.tPedido.Edit;
          DM1.tPedidoNumLote.AsInteger  := 0;
          DM1.tPedidoLoteExp.AsBoolean  := True;
          vGera := 'S';
          DM1.tPedidoItem.First;
          while not DM1.tPedidoItem.Eof do
            begin
              if (DM1.tPedidoItemCancelado.AsBoolean <> True) and (DM1.tPedidoItemLoteGer.AsBoolean <> True) then
                vGera := 'N';
              DM1.tPedidoItem.Next;
            end;
          if vGera = 'S' then
            DM1.tPedidoGerarLote.AsString := '1'
          else
            DM1.tPedidoGerarLote.AsString := '2';
          DM1.tPedido.Post;
        end;
      BitBtn4.Click;
//      GeraTaloesAux;
      BitBtn1.SetFocus;
      BitBtn1.Tag := 0;
      RxDBFilter1.Active := True;
      Screen.Cursor      := crDefault;
      DM1.tLote.Refresh;
      DM1.tLotePedido.Refresh;
      DM1.tLoteSetor.Refresh;
      DM1.tTalao.Refresh;
      DM1.tTalaoGrade.Refresh;
      DM1.tPedido.Refresh;
      DM1.tPedidoItem.Refresh;
    end;
end;

procedure TfLoteExp.BitBtn4Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  Memo1.Clear;
  Habilita;
  BitBtn1.Tag := 0;
  tAuxTalaoGradeExp.First;
  while not tAuxTalaoGradeExp.EOF do
    tAuxTalaoGradeExp.Delete;
end;

procedure TfLoteExp.FormShow(Sender: TObject);
begin
  Dm1.tProduto.Open;
  Dm1.tProdutoSetor.Open;
  Dm1.tTalao.Open;
  Dm1.tTalaoGrade.Open;
  Dm1.tLote.Open;
  Dm1.tLotePedido.Open;
  Dm1.tLoteSetor.Open;
  Dm1.tSetor.Open;
  Dm1.tPedidoItem.Open;
  Dm1.tGradeItemlk.Open;
  Dm1.tPedido.Open;
  Dm1.tPedidoItem.Open;
  DM1.tPedidoGrade.Open;
  Dm1.tGrade.Open;
  BitBtn1.Tag := 0;
  RadioGroup1Click(Sender);
  DM1.tLote.Refresh;
  DM1.tLote.Last;
  DM1.tTalaoAuxiliar.Open;
  DM1.tTalaoAuxiliarGrade.Open;
  tAuxTalaoGradeExp.Open;
end;

procedure TfLoteExp.RadioGroup1Click(Sender: TObject);
begin
  RxDBFilter1.Active := False;
  RxDBFilter1.Filter.Clear;
  case RadioGroup1.ItemIndex of
    0: RxDBFilter1.Filter.Add('(GerarLote = 2 or GerarLote = 3 or GerarLote < 0) and Suspenso <> True and Cancelado <> True');
    1: RxDBFilter1.Filter.Add('GerarLote = 1 and Suspenso <> True and Cancelado <> True');
    2: RxDBFilter1.Filter.Add('Suspenso <> True and Cancelado <> True');
  end;
  RxDBFilter1.Active := True;
end;

procedure TfLoteExp.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      try
        DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
        DM1.tPedido.FindKey([Edit1.Text]);
      except
        ShowMessage('Digite só números aqui!');
      end;
    end;
end;

procedure TfLoteExp.tTalaoGradeAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalaoGrade.Handle);
end;

procedure TfLoteExp.Edit1Enter(Sender: TObject);
begin
    DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
end;

procedure TfLoteExp.CurrencyEdit2Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
    begin
      ShowMessage('É obrigatório informar o número do pedido');
      Edit1.SetFocus;
    end
  else
  if CurrencyEdit2.AsInteger > 0 then
    begin
      DM1.tPedidoItem.SetKey;
      DM1.tPedidoItemPedido.AsInteger := DM1.tPedidoPedido.AsInteger;
      DM1.tPedidoItemItem.AsInteger   := CurrencyEdit2.AsInteger;
      if DM1.tPedidoItem.GotoKey = False then
        begin
          ShowMessage('Item não cadastrado');
          CurrencyEdit2.Clear;
          CurrencyEdit2.SetFocus;
        end
      else
      if DM1.tPedidoItemLoteGer.AsBoolean then
        begin
          ShowMessage('Lote já foi gerado para este item');
          CurrencyEdit2.Clear;
          CurrencyEdit2.SetFocus;
        end
      else
      if DM1.tPedidoItemCancelado.AsBoolean then
        begin
          ShowMessage('Item cancelado');
          CurrencyEdit2.Clear;
          CurrencyEdit2.SetFocus;
        end
      else
        begin
          Monta_Setores;
          if mSetorAux.RecordCount < 1 then
            begin
              ShowMessage('Setores não cadastrados no Produto');
              CurrencyEdit2.Clear;
              CurrencyEdit2.SetFocus;
            end;
        end;
    end;
end;

procedure TfLoteExp.BitBtn2Click(Sender: TObject);
begin
  if CurrencyEdit2.AsInteger > 0 then
    begin
      fLoteSetor := TfLoteSetor.Create(Self);
      fLoteSetor.ShowModal;
    end;
end;

procedure TfLoteExp.Edit2Exit(Sender: TObject);
var
 flag : Integer;
begin
  if Edit1.Text <> '' then
    begin
      flag := 0;
      DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
      DM1.tPedido.SetKey;
      DM1.tPedidoPedidoCliente.AsString := Edit1.Text;
      DM1.tPedidoPedCliDif.AsString     := Edit2.Text;
      if DM1.tPedido.GotoKey then
        begin
          if DM1.tPedidoCancelado.AsBoolean then
            ShowMessage('Pedido esta cancelado!')
          else
          if DM1.tPedidoSuspenso.AsBoolean then
            ShowMessage('Pedido esta suspenso!')
          else
          if DM1.tPedidoNumLote.AsInteger > 0 then
            ShowMessage('Pedido já gerado o lote!')
          else
          if DM1.tPedidoMercado.AsString = 'I' then
            ShowMessage('Pedido Mercado Interno!')
          else
            flag := 1;
        end;
      if flag = 0 then
        begin
          Edit1.Clear;
          Edit2.Clear;
          Edit1.SetFocus;
        end;
    end;
end;

end.
