unit URelNotaEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, Qrctrls, ExtCtrls;

type
  TfRelNotaEntrada = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape4: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape3: TQRShape;
    SummaryBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRDBText16: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    QRDBText14: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText19: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelNotaEntrada: TfRelNotaEntrada;

implementation

uses UDM1;

{$R *.DFM}

procedure TfRelNotaEntrada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelNotaEntrada.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if DM1.tNEntradaCondPgto.AsString = 'V' then
    QrLabel22.Caption := 'À Vista'
  else
  if DM1.tNEntradaCondPgto.AsString = 'P' then
    QrLabel22.Caption := 'A Prazo';
end;

procedure TfRelNotaEntrada.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QrLabel2.Caption := DM1.tEmpresaEndereco.AsString + ' - ' + DM1.tEmpresaBairro.AsString;
  QrLabel3.Caption := 'Cep:' + DM1.tEmpresaCep.AsString + ' - Fone:' + DM1.tEmpresaTel.AsString + ' - Fax:' + DM1.tEmpresaFax.AsString;
end;

end.
