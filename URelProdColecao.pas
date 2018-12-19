unit URelProdColecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelProdColecao = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape5: TQRShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelProdColecao: TfRelProdColecao;

implementation

uses UDM1, UPrevProdColecao;

{$R *.DFM}

procedure TfRelProdColecao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelProdColecao.PageHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if fPrevProdColecao.BitBtn1.Enabled then
    QRLabel4.Enabled := False
  else
    begin
      QRLabel4.Enabled := True;
      Case fPrevProdColecao.RadioGroup1.ItemIndex of
        0 : begin
              if fPrevProdColecao.RxDBLookupCombo1.Text <> '' then
                QRLabel4.Caption := 'COLE플O: '+fPrevProdColecao.RxDBLookupCombo1.Text+' MERCADO: INTERNO'
              else
                QRLabel4.Caption := 'MERCADO: INTERNO';
            end;
        1 : begin
              if fPrevProdColecao.RxDBLookupCombo1.Text <> '' then
                QRLabel4.Caption := 'COLE플O: '+fPrevProdColecao.RxDBLookupCombo1.Text+' MERCADO: EXPORTA플O'
              else
                QRLabel4.Caption := 'MERCADO: EXPORTA플O';
            end;
      end;
    end;
end;

end.
