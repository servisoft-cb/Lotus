unit URelProjecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelProjecao = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel14: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel15: TQRLabel;
    DetailBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText10: TQRDBText;
    QRExpr1: TQRExpr;
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelProjecao: TfRelProjecao;

implementation

uses UPrevProjecao;

{$R *.DFM}

procedure TfRelProjecao.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QRLabel5.Enabled := fPrevProjecao.CheckBox1.Checked;
  QRLabel6.Enabled := fPrevProjecao.CheckBox1.Checked;
  QRLabel7.Enabled := fPrevProjecao.CheckBox1.Checked;
  QRLabel8.Enabled := fPrevProjecao.CheckBox1.Checked;
  QRLabel9.Enabled := fPrevProjecao.CheckBox1.Checked;
  if fPrevProjecao.CheckBox1.Checked then
    begin
      DetailBand1.Height := 36;
      fPrevProjecao.qDetalhado.Filtered := False;
      fPrevProjecao.qDetalhado.Filter := 'CodConstrucao = '''+fPrevProjecao.qResumidoCodConstrucao.AsString+'''';
      fPrevProjecao.qDetalhado.Filtered := True;
      fPrevProjecao.qDetalhado.First;
    end
  else
    DetailBand1.Height := 20;
end;

procedure TfRelProjecao.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (fPrevProjecao.CheckBox1.Checked) and (fPrevProjecao.qDetalhado.RecordCount > 0) then
    PrintBand := True
  else
    PrintBand := False;
end;

end.
