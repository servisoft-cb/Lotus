unit URelExtComissaoMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RLReport;

type
  TfRelExtComissaoMod = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
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
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand2: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel23: TRLLabel;
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
    RLLabel12: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel35: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelExtComissaoMod: TfRelExtComissaoMod;

implementation

uses UPrevExtComissao2, UDM1, UPrevExtComissaoMod;

{$R *.DFM}

procedure TfRelExtComissaoMod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelExtComissaoMod.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel5.Caption := fPrevExtComissaoMod.DateEdit1.Text + ' á ' + fPrevExtComissaoMod.DateEdit2.Text;
  RLLabel20.Caption := fPrevExtComissaoMod.RxDBLookupCombo1.Text;
end;

procedure TfRelExtComissaoMod.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vQtdPares : Integer;
begin
  vQtdPares := 0;
  if DM1.tExtComissaoModFuncao.AsString = 'E' then
    RLLabel23.Caption := 'Entr. ';
  if DM1.tExtComissaoModFuncao.AsString = 'S' then
    RLLabel23.Caption := 'Pgto. ';
  if DM1.tExtComissaoModFuncao.AsString = 'D' then
    RLLabel23.Caption := 'Devol. ';
  RLLabel12.Caption := '';
  RLLabel1.Caption  := '';
  RLLabel35.Caption := '';
  RLLabel24.Caption := '';
  if DM1.tExtComissaoModNumNota.AsInteger > 0 then
    begin
      DM1.tNotaFiscal.IndexFieldNames  := 'NumNota';
      DM1.tNotaFiscal.SetKey;
      DM1.tNotaFiscalNumNota.AsInteger := DM1.tExtComissaoModNumNota.AsInteger;
      if DM1.tNotaFiscal.GotoKey then
        begin
          Dm1.tNotaFiscalItens.First;
          while not Dm1.tNotaFiscalItens.Eof do
            begin
              vQtdPares := vQtdPares + Dm1.tNotaFiscalItensQtd.AsInteger;
              Dm1.tNotaFiscalItens.Next;
            end;
          RLLabel35.Caption := IntToStr(vQtdPares);
          RLLabel24.Caption := Dm1.tNotaFiscallkNomeVendedor.AsString;
          //RLLabel12.Caption := DM1.tNotaFiscalPedidoCliente.AsString;
          RLLabel12.Caption := DM1.tNotaFiscalPedidoRepresentante.AsString;
          RLLabel1.Caption  := FormatFloat('0.00',DM1.tNotaFiscalVlrTotalNota.AsFloat);
        end;
    end;
end;

end.
