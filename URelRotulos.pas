unit URelRotulos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TfRelRotulos = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelRotulos: TfRelRotulos;

implementation

uses UDM1, UPrevRelRotulos, DB;

{$R *.DFM}

procedure TfRelRotulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelRotulos.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  texto1 : String;
begin
  QRLabel7.Caption  := '';
  QRLabel8.Caption  := '';
  QRLabel9.Caption  := '';
  QRLabel11.Caption := '';
  if fPrevRelRotulos.RadioGroup1.ItemIndex = 0 then
    begin
      QRLabel7.Caption  := fPrevRelRotulos.mRotulosNotaFiscal.AsString;
      QRLabel11.Caption := 'Pedido Cliente: ' + fPrevRelRotulos.mRotulosPedidoCliente.AsString;
      QRLabel9.Caption  := 'Pedido Representante/Fábrica: ' + fPrevRelRotulos.mRotulosPedidoRepresentante.AsString;
    end
  else
    begin
      QRLabel9.Caption  := 'Pedido:' + fPrevRelRotulos.mRotulosPedido.AsString;
      fPrevRelRotulos.qPedidoNota.Active := False;
      fPrevRelRotulos.qPedidoNota.params[0].AsInteger := fPrevRelRotulos.mRotulosPedido.AsInteger;
      fPrevRelRotulos.qPedidoNota.Active := True;
      fPrevRelRotulos.qPedidoNota.First;
      while not fPrevRelRotulos.qPedidoNota.Eof do
        begin
          if QRLabel8.Caption = '' then
            begin
              texto1 := QRLabel7.Caption;
              QRLabel7.Caption := QRLabel7.Caption + ', ' + fPrevRelRotulos.qPedidoNotaNumNota.AsString;
              if QRLabel7.Width > 640 then
                begin
                  QRLabel7.Caption := texto1;
                  QRLabel8.Caption := fPrevRelRotulos.qPedidoNotaNumNota.AsString;
                end;
            end
          else
            QRLabel8.Caption := QRLabel8.Caption + ', ' + fPrevRelRotulos.qPedidoNotaNumNota.AsString;
          fPrevRelRotulos.qPedidoNota.Next;
        end;
      fPrevRelRotulos.qPedidoNota.Active := False;
    end;
end;

end.
