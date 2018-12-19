unit URelExtComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RLReport, Db, DBTables, Variants;

type
  TfRelExtComissao = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel8: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel17: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand2: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel23: TRLLabel;
    RLSubDetail2: TRLSubDetail;
    RLBand3: TRLBand;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLLabel24: TRLLabel;
    RLBand4: TRLBand;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLDraw3: TRLDraw;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel36: TRLLabel;
    RLLabel37: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLSubDetail2BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelExtComissao: TfRelExtComissao;

implementation

uses UPrevExtComissao2, UDM1;

{$R *.DFM}

procedure TfRelExtComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelExtComissao.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel5.Caption := fPrevExtComissao2.DateEdit1.Text + ' á ' + fPrevExtComissao2.DateEdit2.Text;
  RLLabel20.Caption := fPrevExtComissao2.RxDBLookupCombo1.Text;
end;

procedure TfRelExtComissao.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vQtdPares : Integer;
begin
  vQtdPares := 0;
  if DM1.tExtComissaoFuncao.AsString = 'E' then
    RLLabel23.Caption := 'Entr. ';
  if DM1.tExtComissaoFuncao.AsString = 'S' then
    RLLabel23.Caption := 'Pgto. ';
  if DM1.tExtComissaoFuncao.AsString = 'D' then
    RLLabel23.Caption := 'Devol. ';
  RLLabel14.Caption := '';
  RLLabel16.Caption := '';
  RLLabel37.Caption := '';
  if DM1.tExtComissaoNroDoc.AsInteger > 0 then
  begin
    if DM1.tNotaFiscal.Locate('NumNota;Serie',VarArrayOf([DM1.tExtComissaoNroDoc.AsInteger,'1']),[locaseinsensitive]) then
    {DM1.tNotaFiscal.IndexFieldNames  := 'NumNota';
    DM1.tNotaFiscal.SetKey;
    DM1.tNotaFiscalNumNota.AsInteger := DM1.tExtComissaoNroDoc.AsInteger;
    if DM1.tNotaFiscal.GotoKey then}
    begin
      Dm1.tNotaFiscalItens.First;
      while not Dm1.tNotaFiscalItens.Eof do
      begin
        vQtdPares := vQtdPares + Dm1.tNotaFiscalItensQtd.AsInteger;
        Dm1.tNotaFiscalItens.Next;
      end;
      RLLabel37.Caption := IntToStr(vQtdPares);
      RLLabel16.Caption := DM1.tNotaFiscalPedidoRepresentante.AsString;
      if DM1.tExtComissaoParcDoc.AsInteger < 1 then
        RLLabel14.Caption := FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
    end;
    if (DM1.tExtComissaoTipo.AsString = 'D') and (DM1.tExtComissaoParcDoc.AsInteger > 0) then
    begin
      if fPrevExtComissao2.tCReceberParc2.Locate('NumNota;ParcCReceber;Serie',VarArrayOf([DM1.tExtComissaoNroDoc.AsInteger,DM1.tExtComissaoParcDoc.AsInteger,'1']),[locaseinsensitive]) then
        RLLabel14.Caption := FormatFloat('0.00',fPrevExtComissao2.tCReceberParc2VlrParcCReceber.AsFloat);
    end;
  end;
end;

procedure TfRelExtComissao.RLSubDetail2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if DM1.tExtComissaoTipo.AsString = 'N' then
    begin
      //RLLabel24.Caption := FormatFloat('0.00',(fPrevExtComissao2.tNotaFiscalParcVlrVenc.AsFloat * DM1.tExtComissaoPercComissao.AsFloat) / 100);
      RLLabel24.Caption := FormatFloat('0.00',(DM1.tNotaFiscalParcVlrVenc.AsFloat * DM1.tExtComissaoPercComissao.AsFloat) / 100);
      PrintIt := True;
    end
  else
    PrintIt := False;
end;

end.
