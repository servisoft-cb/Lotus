unit URelRotulos3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB;

type
  TfRelRotulos3 = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;                                   
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrlCidade: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    qrlMaterial: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRLabel8: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    Tam1: TQRLabel;
    Qtd1: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    Tam2: TQRLabel;
    Qtd2: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    Tam3: TQRLabel;
    Qtd3: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    Tam4: TQRLabel;
    Qtd4: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    Tam5: TQRLabel;
    Qtd5: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    Tam6: TQRLabel;
    Qtd6: TQRLabel;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    Tam7: TQRLabel;
    Qtd7: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    Tam8: TQRLabel;
    Qtd8: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    Tam9: TQRLabel;
    Qtd9: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    Tam10: TQRLabel;
    Qtd10: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    Tam11: TQRLabel;
    Qtd11: TQRLabel;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    Tam12: TQRLabel;
    Qtd12: TQRLabel;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    Tam13: TQRLabel;
    Qtd13: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    Tam14: TQRLabel;
    Qtd14: TQRLabel;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    Tam15: TQRLabel;
    Qtd15: TQRLabel;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel37: TQRLabel;
    qrlTotal: TQRLabel;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    qrlPedido: TQRLabel;
    QRLabel3: TQRLabel;
    qrlbTalao: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelRotulos3: TfRelRotulos3;

implementation

uses UDM1, UPrevRelRotulos2;

{$R *.dfm}

procedure TfRelRotulos3.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelRotulos3.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 i : Integer;
 vQtd : Integer; 
begin

  if not DM1.tPedido.Locate('Pedido',fPrevRelRotulos2.mPedidoAuxPedido.AsInteger,[loCaseInsensitive]) then
    begin
      PrintBand := False;
      exit;
    end;

  if not DM1.tPedidoItem.Locate('Pedido;Item',VarArrayOf([fPrevRelRotulos2.mPedidoAuxPedido.AsInteger,fPrevRelRotulos2.mPedidoAuxItemPedido.AsInteger]),[locaseinsensitive]) then
    begin
      PrintBand := False;
      exit;
    end;

  qrlbTalao.Caption := '';
  if fPrevRelRotulos2.tTalaoMI.Locate('NumPedido;ItemPedido',VarArrayOf([fPrevRelRotulos2.mPedidoAuxPedido.AsInteger,fPrevRelRotulos2.mPedidoAuxItemPedido.AsInteger]),[locaseinsensitive]) then
    qrlbTalao.Caption := fPrevRelRotulos2.tTalaoMILote.AsString + ' / ' + fPrevRelRotulos2.tTalaoMIItem.AsString; 

  qrlCidade.Caption := '';
  if DM1.tCliente.Locate('Codigo',DM1.tPedidoCodCliente.AsInteger,[loCaseInsensitive]) then
    if DM1.tCidade.Locate('Codigo',DM1.tClienteCodCidade.AsInteger,[loCaseInsensitive]) then
      qrlCidade.Caption := DM1.tCidadeNome.AsString;

  qrlMaterial.Caption := DM1.tPedidoItemlkDescMaterial.AsString + ' / ' + DM1.tPedidoItemlkCor.AsString;

  QRImage1.Picture := nil;

  if FileExists(DM1.tPedidoItemlkEndEtiq.AsString) then
    QRImage1.Picture.LoadFromFile(DM1.tPedidoItemlkEndEtiq.AsString);

  for i := 1 to 15 do
    begin
      TQRLabel(FindComponent('Tam'+IntToStr(i))).Caption   := ' ';
      TQRLabel(FindComponent('Qtd'+IntToStr(i))).Caption   := ' ';
    end;

  i    := 0;
  vQtd := 0;
  DM1.tPedidoGrade.First;
  while not DM1.tPedidoGrade.Eof do
    begin
      if DM1.tPedidoGradeQtd.AsFloat > 0 then
        begin
          inc(i);
          TQRLabel(FindComponent('Tam'+IntToStr(i))).Caption := DM1.tPedidoGradelkTamanho.AsString;
          TQRLabel(FindComponent('Qtd'+IntToStr(i))).Caption := DM1.tPedidoGradeQtd.AsString;
          vQtd := vQtd + DM1.tPedidoGradeQtd.AsInteger;
        end;
      DM1.tPedidoGrade.Next;
    end;

  qrlTotal.Caption := IntToStr(vQtd);

  qrlPedido.Caption := DM1.tPedidoPedido.AsString + ' / ' + DM1.tPedidoItemItem.AsString;

end;

end.
