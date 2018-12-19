unit UEstPagamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBFilter, ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids, Buttons, Db, DBTables;

type
  TfEstPagamento = class(TForm)
    RxDBFilter1: TRxDBFilter;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBGrid1: TDBGrid;
    Bevel3: TBevel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    DBText5: TDBText;
    RxDBFilter2: TRxDBFilter;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure DesFaz_ExtComissao;
    procedure DesFaz_ExtComissaoMod;
    procedure Exclui_Movimento;
  public
    { Public declarations }
  end;

var
  fEstPagamento: TfEstPagamento;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfEstPagamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Action := caFree;
end;

procedure TfEstPagamento.DesFaz_ExtComissao;
begin
  if DM1.tCReceberParcHistNroLancExtComissao.AsInteger > 0 then
    if DM1.tExtComissao.Locate('NroLancamento',DM1.tCReceberParcHistNroLancExtComissao.AsInteger,[loCaseInsensitive]) then
      DM1.tExtComissao.Delete;
end;

procedure TfEstPagamento.DesFaz_ExtComissaoMod;
begin
  DM1.tExtComissaoMod.Filtered := False;
  DM1.tExtComissaoMod.Filter   := 'NumNota = '''+DM1.tCReceberParcNumNota.AsString+''' and Parcela = '''+DM1.tCReceberParcParcCReceber.AsString +''' and ItemHistCReceber = '''+DM1.tCReceberParcHistItem.AsString+'''';
  DM1.tExtComissaoMod.Filtered := True;
  DM1.tExtComissaoMod.First;
  while not DM1.tExtComissaoMod.Eof do
    begin
      if (FormatFloat('0.00',DM1.tExtComissaoModVlrBase.AsFloat) = FormatFloat('0.00',DM1.tCReceberParcHistVlrDevolucao.AsFloat)) and
         (DM1.tExtComissaoModTipo.AsString = 'D') then
        DM1.tExtComissaoMod.Delete
      else
        DM1.tExtComissaoMod.Next;
    end;
  DM1.tExtComissaoMod.Filtered := False;
end;

procedure TfEstPagamento.Exclui_Movimento;
begin
  DM1.tMovimentos.MasterSource.Enabled    := False;
  DM1.tMovimentos.Filtered := False;
  DM1.tMovimentos.Filter   := 'NumMovimento = '''+IntToStr(DM1.tCReceberParcHistNumMov.AsInteger)+''' OR NumMovimento = '''+IntToStr(DM1.tCReceberParcHistNumMovJuros.AsInteger)+'''';
  DM1.tMovimentos.Filtered := True;
  while not DM1.tMovimentos.Eof do
    begin
      DM1.tContas.FindKey([DM1.tMovimentosCodConta.AsInteger]);
      DM1.tContas.Edit;
      DM1.tContasSaldoConta.AsCurrency := DM1.tContasSaldoConta.AsCurrency -
                                          DM1.tMovimentosVlrMovCredito.AsCurrency +
                                          DM1.tMovimentosVlrMovDebito.AsCurrency;
      DM1.tContas.Post;
      DM1.tMovimentos.Delete;
    end;
  DM1.tMovimentos.Filtered := False;
  DM1.tMovimentos.MasterSource.Enabled    := True;
end;

procedure TfEstPagamento.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfEstPagamento.FormShow(Sender: TObject);
begin
  DM1.tCReceberParcHist.Refresh;
  DM1.tCReceberParcHist.Last;
end;

procedure TfEstPagamento.BitBtn3Click(Sender: TObject);
var
  vVlrUltPgto : Currency;
begin
  DM1.tCReceberParcHist.Last;
  if MessageDlg('Deseja realmente realizar este estorno!',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      vEncComissao := False;
      if DM1.tCReceberParcHistNroLancExtComissao.AsInteger > 0 then
        if DM1.tExtComissao.Locate('NroLancamento',DM1.tCReceberParcHistNroLancExtComissao.AsInteger,[loCaseInsensitive]) then
          DM1.Verifica_ComissaoEnc(DM1.tExtComissaoCodVendedor.AsInteger,DM1.tExtComissaoDtReferencia.AsDateTime);
      if not vEncComissao then
        begin
          Exclui_Movimento;
          DM1.tCReceberParc.Edit;
          DM1.tCReceberParcPgCartorio.Clear;
          DM1.tCReceberParcQuitParcCReceber.AsBoolean := False;
          DM1.tCReceberParcJurosPagos.AsFloat         := DM1.tCReceberParcJurosPagos.AsFloat - DM1.tCReceberParcHistJurosPagos.AsFloat;
          DM1.tCReceberParcJurosParcCReceber.AsFloat  := DM1.tCReceberParcJurosParcCReceber.AsFloat - DM1.tCReceberParcHistJurosCalc.AsFloat;
          if DM1.tCReceberParcHist.RecordCount = 1 then
            begin
              DM1.tCReceberParcJurosParcCReceber.AsFloat := 0;
              DM1.tCReceberParcJurosPagos.AsFloat        := 0;
            end;
          DM1.tCReceberParcRestParcela.AsFloat := DM1.tCReceberParcRestParcela.AsFloat + DM1.tCReceberParcHistVlrUltPgto.AsFloat;
          vVlrUltPgto := DM1.tCReceberParcHistVlrUltPgto.AsCurrency;
          DesFaz_ExtComissao;
          DM1.tCReceberParcHist.Delete;
          if DM1.tCReceberParcHist.Eof then
            begin
              DM1.tCReceberParcDtPagParcCReceber.Clear;
              DM1.tCReceberParcPgtoParcial.Clear;
            end
          else
            begin
              DM1.tCReceberParcAbatimentos.AsFloat          := DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat;
              DM1.tCReceberParcDesconto.AsFloat             := DM1.tCReceberParcHistVlrUltDescontos.AsFloat;
              DM1.tCReceberParcDespesas.AsFloat             := DM1.tCReceberParcHistVlrUltDespesas.AsFloat;
              DM1.tCReceberParcDtPagParcCReceber.AsDateTime := DM1.tCReceberParcHistDtUltPgto.AsDateTime;
              DM1.tCReceberParcPgtoParcial.AsFloat          := DM1.tCReceberParcPgtoParcial.AsFloat - vVlrUltPgto;
            end;
          DM1.tCReceberParc.Post;
        end;
  end;
  Close;
end;

procedure TfEstPagamento.BitBtn2Click(Sender: TObject);
var
  vVlrUltPgto : Currency;
begin
  DM1.tCReceberParcHist.Last;
  if MessageDlg('Deseja realmente realizar este estorno?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      vEncComissao := False;
      if DM1.tCReceberParcHistNroLancExtComissao.AsInteger > 0 then
        if DM1.tExtComissao.Locate('NroLancamento',DM1.tCReceberParcHistNroLancExtComissao.AsInteger,[loCaseInsensitive]) then
          DM1.Verifica_ComissaoEnc(DM1.tExtComissaoCodVendedor.AsInteger,DM1.tExtComissaoDtReferencia.AsDateTime);
      if not vEncComissao then
        begin
          DM1.tCReceberParc.Edit;
          DM1.tCReceberParcQuitParcCReceber.AsBoolean := False;
          DM1.tCReceberParcRestParcela.AsFloat        := DM1.tCReceberParcRestParcela.AsFloat + DM1.tCReceberParcHistVlrDevolucao.AsFloat;
          vVlrUltPgto                                 := DM1.tCReceberParcHistVlrDevolucao.AsFloat;
          DesFaz_ExtComissao;
          DesFaz_ExtComissaoMod;
          DM1.tCReceberParcHist.Delete;
          if DM1.tCReceberParcHist.Eof then
            DM1.tCReceberParcVlrDevolucao.Clear
          else
            DM1.tCReceberParcVlrDevolucao.AsFloat := DM1.tCReceberParcVlrDevolucao.AsFloat - vVlrUltPgto;
          DM1.tCReceberParc.Post;
        end;
    end;
  Close;
end;

procedure TfEstPagamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
