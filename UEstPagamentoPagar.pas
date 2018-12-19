unit UEstPagamentoPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBFilter, ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids, Buttons;

type
  TfEstPagamentoPagar = class(TForm)
    RxDBFilter1: TRxDBFilter;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
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
    procedure Exclui_Movimento;
  public
    { Public declarations }
  end;

var
  fEstPagamentoPagar: TfEstPagamentoPagar;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfEstPagamentoPagar.Exclui_Movimento;
begin
  DM1.tMovimentos.MasterSource.Enabled    := False;
  DM1.tMovimentos.Filtered := False;
  DM1.tMovimentos.Filter   := 'NumMovimento = '''+IntToStr(DM1.tCPagarParcHistNumMov.AsInteger)+''' OR NumMovimento = '''+IntToStr(DM1.tCPagarParcHistNumMovJuros.AsInteger)+'''';
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
  DM1.tMovimentos.MasterSource.Enabled := True;
end;

procedure TfEstPagamentoPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Action := caFree;
end;

procedure TfEstPagamentoPagar.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfEstPagamentoPagar.FormShow(Sender: TObject);
begin
  DM1.tCPagarParcHist.Refresh;
  DM1.tCPagarParcHist.Last;
//  RxDBFilter1.Active := True;
end;

procedure TfEstPagamentoPagar.BitBtn3Click(Sender: TObject);
begin
  DM1.tCPagarParcHist.Last;
  if MessageDlg('Deseja realmente realizar este estorno!',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      Exclui_Movimento;
      DM1.tCPagarParc.Edit;
      DM1.tCPagarParcQuitParcCPagar.AsBoolean   := False;
      DM1.tCPagarParcJurosParcCPagar.AsFloat    := DM1.tCPagarParcJurosParcCPagar.AsFloat - DM1.tCPagarParcHistVlrUltJuros.AsFloat;
      if DM1.tCPagarParcHist.RecordCount = 1 then
        begin
          DM1.tCPagarParcJurosParcCPagar.AsFloat := 0;
          DM1.tCPagarParcJurosPagos.AsFloat      := 0;
        end;
      DM1.tCPagarParcRestParcela.AsFloat := DM1.tCPagarParcRestParcela.AsFloat + DM1.tCPagarParcHistVlrUltPgto.AsFloat +
                                            DM1.tCPagarParcHistVlrUltAbatimentos.AsFloat + DM1.tCPagarParcHistVlrUltDescontos.AsFloat;
      DM1.tCPagarParcAbatimentos.AsFloat := DM1.tCPagarParcAbatimentos.AsFloat - DM1.tCPagarParcHistVlrUltAbatimentos.AsFloat;
      DM1.tCPagarParcDesconto.AsFloat    := DM1.tCPagarParcDesconto.AsFloat - DM1.tCPagarParcHistVlrUltDescontos.AsFloat;
      DM1.tCPagarParcDespesas.AsFloat    := DM1.tCPagarParcDespesas.AsFloat - DM1.tCPagarParcHistVlrUltDespesas.AsFloat;
      DM1.tCPagarParcPgtoParcial.AsFloat := DM1.tCPagarParcPgtoParcial.AsFloat - DM1.tCPagarParcHistVlrUltPgto.AsFloat;
      DM1.tCPagarParcHist.Delete;
      if DM1.tCPagarParcHist.Eof then
        begin
          DM1.tCPagarParcDtPagParcCPagar.Clear;
//          DM1.tCPagarParcAbatimentos.Clear;
//          DM1.tCPagarParcDesconto.Clear;
//          DM1.tCPagarParcDespesas.Clear;
          DM1.tCPagarParcPgtoParcial.Clear;
        end
      else
        begin
//          DM1.tCPagarParcAbatimentos.AsFloat          := DM1.tCPagarParcAbatimentos.AsFloat - DM1.tCPagarParcHistVlrUltAbatimentos.AsFloat;
//          DM1.tCPagarParcDesconto.AsFloat             := DM1.tCPagarParcDesconto.AsFloat - DM1.tCPagarParcHistVlrUltDescontos.AsFloat;
//          DM1.tCPagarParcDespesas.AsFloat             := DM1.tCPagarParcDespesas.AsFloat - DM1.tCPagarParcHistVlrUltDespesas.AsFloat;
          DM1.tCPagarParcDtPagParcCPagar.AsDateTime   := DM1.tCPagarParcHistDtUltPgto.AsDateTime;
//          DM1.tCPagarParcPgtoParcial.AsFloat          := DM1.tCPagarParcVlrParcCPagar.AsFloat - DM1.tCPagarParcRestParcela.AsFloat;
//          DM1.tCPagarParcPgtoParcial.AsFloat          := DM1.tCPagarParcPgtoParcial.AsFloat - DM1.tCPagarParcHistVlrUltPgto.AsFloat;
        end;
      DM1.tCPagarParc.Post;
    end;
  Close;
end;

procedure TfEstPagamentoPagar.BitBtn2Click(Sender: TObject);
var
  vVlrUltPgto : Currency;
begin
  DM1.tCPagarParcHist.Last;
  if MessageDlg('Deseja realmente realizar este estorno?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      DM1.tCPagarParc.Edit;
      DM1.tCPagarParcQuitParcCPagar.AsBoolean := False;
      DM1.tCPagarParcRestParcela.AsFloat      := DM1.tCPagarParcRestParcela.AsFloat + DM1.tCPagarParcHistVlrDevolucao.AsFloat;
      vVlrUltPgto                             := DM1.tCPagarParcHistVlrDevolucao.AsFloat;
      DM1.tCPagarParcHist.Delete;
      if DM1.tCPagarParcHist.Eof then
        DM1.tCPagarParcVlrDevolucao.Clear
      else
        DM1.tCPagarParcVlrDevolucao.AsFloat := DM1.tCPagarParcVlrDevolucao.AsFloat - vVlrUltPgto;
      DM1.tCPagarParc.Post;
    end;
  Close;
end;

procedure TfEstPagamentoPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
