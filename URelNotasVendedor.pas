unit URelNotasVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RLReport;

type
  TfRelNotasVendedor = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLBand2: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLLabel18: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLSubDetail2: TRLSubDetail;
    RLBand3: TRLBand;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLDBText7: TRLDBText;
    RLBand4: TRLBand;
    RLDraw3: TRLDraw;
    RLLabel22: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel12: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel29: TRLLabel;
    RLLabel1: TRLLabel;
    RLDBText9: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLSubDetail1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    vComissao, vVlrBaseC, vVlrCom, vVlrTotalNota : Real;
    vPares : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelNotasVendedor: TfRelNotasVendedor;

implementation

uses UDM1, UPrevNotasVendedor;

{$R *.DFM}

procedure TfRelNotasVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelNotasVendedor.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel5.Caption := fPrevNotasVendedor.DateEdit1.Text + ' a ' + fPrevNotasVendedor.DateEdit2.Text; 
end;

procedure TfRelNotasVendedor.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vQtd : Integer;
  vComissao : Real;
begin
  vQtd := 0;
  DM1.tNotaFiscalItens.Refresh;
  DM1.tNotaFiscalItens.First;
  while not DM1.tNotaFiscalItens.Eof do
    begin
      vQtd := vQtd + DM1.tNotaFiscalItensQtd.AsInteger;
      DM1.tNotaFiscalItens.Next;
    end;
  vPares    := vPares + vQtd;
  RLLabel18.Caption := IntToStr(vQtd);
  vVlrTotalNota     := vVlrTotalNota + DM1.tNotaFiscalVlrTotalNota.AsFloat;
  if DM1.tNotaFiscalCondPgto.AsString = 'V' then
    begin
      RLLabel19.Caption := FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
      RLLabel23.Caption := FormatFloat('###,###,##0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
      vComissao := DM1.tNotaFiscalVlrTotalNota.AsFloat * DM1.tNotaFiscalPercComissao.AsFloat / 100;
      RLLabel20.Caption := FormatFloat('###,##0.00',vComissao);
      RLLabel24.Caption := FormatFloat('###,##0.00',vComissao);
      RLLabel21.Caption := DM1.tNotaFiscalDtEmissao.AsString;
      RLLabel25.Caption := DM1.tNotaFiscalDtEmissao.AsString;
      vVlrCom   := vVlrCom + vComissao;
      vVlrBaseC := vVlrBaseC + Dm1.tNotaFiscalVlrTotalNota.AsFloat
    end;
// Monta os valores quando a nota for a prazo
  if DM1.tNotaFiscalCondPgto.AsString = 'P' then
    begin
      DM1.tNotaFiscalParc.First;
      RLLabel21.Caption := DM1.tNotaFiscalParcDtVenc.AsString;
      RLLabel19.Caption := FormatFloat('###,###,##0.00',DM1.tNotaFiscalParcVlrVenc.AsFloat);
      vComissao         := DM1.tNotaFiscalParcVlrVenc.AsFloat * DM1.tNotaFiscalPercComissao.AsFloat / 100;
      vVlrCom   := vVlrCom + vComissao;
      RLLabel20.Caption := FormatFloat('###,##0.00',vComissao);
      DM1.tNotaFiscalParc.Next;
      vVlrBaseC := vVlrBaseC + DM1.tNotaFiscalParcVlrVenc.AsFloat;
    end;
end;

procedure TfRelNotasVendedor.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if (DM1.tNotaFiscalParc.RecordCount > 1) and (DM1.tNotaFiscalParc.RecNo > 1) then
    begin
      RLLabel23.Caption := FormatFloat('###,###,##0.00',DM1.tNotaFiscalParcVlrVenc.AsFloat);
      vComissao         := DM1.tNotaFiscalParcVlrVenc.AsFloat * DM1.tNotaFiscalPercComissao.AsFloat / 100;
      RLLabel24.Caption := FormatFloat('###,##0.00',vComissao);
      RLLabel25.Caption := DM1.tNotaFiscalParcDtVenc.AsString;
      vVlrBaseC := vVlrBaseC + DM1.tNotaFiscalParcVlrVenc.AsFloat;
      vVlrCom   := vVlrCom + vComissao;
      PrintIt := True;
    end
  else
    PrintIt := False;
end;

procedure TfRelNotasVendedor.RLSubDetail1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vVlrBaseC  := 0;
  vVlrCom    := 0;
  vPares     := 0;
  vTotalNota := 0;
end;

procedure TfRelNotasVendedor.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel26.Caption := IntToStr(vPares);
  RLLabel27.Caption := FormatFloat('###,###,##0.00',vVlrBaseC);
  RLLabel28.Caption := FormatFloat('###,###,##0.00',vVlrCom);
  RLLabel29.Caption := FormatFloat('###,###,##0.00',vVlrTotalNota);
  vVlrBaseC  := 0;
  vVlrCom    := 0;
  vPares     := 0;
  vTotalNota := 0;
end;

end.
