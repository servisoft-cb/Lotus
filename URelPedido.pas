unit URelPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, DB, DBClient, Variants;

type
  TfRelPedido = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRDBText5: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    Tam1: TQRLabel;
    Tam2: TQRLabel;
    Tam3: TQRLabel;
    Tam4: TQRLabel;
    Tam5: TQRLabel;
    Tam6: TQRLabel;
    Tam7: TQRLabel;
    Tam8: TQRLabel;
    Tam9: TQRLabel;
    Tam10: TQRLabel;
    Tam11: TQRLabel;
    Tam12: TQRLabel;
    Tam13: TQRLabel;
    Par1: TQRLabel;
    Par2: TQRLabel;
    Par3: TQRLabel;
    Par4: TQRLabel;
    Par5: TQRLabel;
    Par6: TQRLabel;
    Par7: TQRLabel;
    Par8: TQRLabel;
    Par9: TQRLabel;
    Par10: TQRLabel;
    Par11: TQRLabel;
    Par12: TQRLabel;
    Par13: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape1: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel37: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel38: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel39: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText20: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRShape7: TQRShape;
    QRLabel6: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRLabel19: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    Tam14: TQRLabel;
    Par14: TQRLabel;
    Tam15: TQRLabel;
    Par15: TQRLabel;
    Tam16: TQRLabel;
    Par16: TQRLabel;
    Tam17: TQRLabel;
    Par17: TQRLabel;
    cdsGradeAgrupada: TClientDataSet;
    cdsGradeAgrupadaReferencia: TStringField;
    cdsGradeAgrupadaCor: TStringField;
    cdsGradeAgrupadaMaterial: TStringField;
    cdsGradeAgrupadaPar1: TIntegerField;
    cdsGradeAgrupadaPar2: TIntegerField;
    cdsGradeAgrupadaPar3: TIntegerField;
    cdsGradeAgrupadaPar4: TIntegerField;
    cdsGradeAgrupadaPar5: TIntegerField;
    cdsGradeAgrupadaPar6: TIntegerField;
    cdsGradeAgrupadaPar7: TIntegerField;
    cdsGradeAgrupadaPar8: TIntegerField;
    cdsGradeAgrupadaPar9: TIntegerField;
    cdsGradeAgrupadaPar10: TIntegerField;
    cdsGradeAgrupadaPar11: TIntegerField;
    cdsGradeAgrupadaPar12: TIntegerField;
    cdsGradeAgrupadaPar13: TIntegerField;
    cdsGradeAgrupadaPar14: TIntegerField;
    cdsGradeAgrupadaPar15: TIntegerField;
    cdsGradeAgrupadaPar16: TIntegerField;
    cdsGradeAgrupadaPar17: TIntegerField;
    QRSubDetail2: TQRSubDetail;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    Ta1: TQRLabel;
    Ta2: TQRLabel;
    Ta3: TQRLabel;
    Ta4: TQRLabel;
    Ta5: TQRLabel;
    Ta6: TQRLabel;
    Ta7: TQRLabel;
    Ta8: TQRLabel;
    Ta9: TQRLabel;
    Ta10: TQRLabel;
    Ta11: TQRLabel;
    Ta12: TQRLabel;
    Ta13: TQRLabel;
    Ta14: TQRLabel;
    Ta15: TQRLabel;
    Ta16: TQRLabel;
    Ta17: TQRLabel;
    QRBand1: TQRBand;
    QRLabel72: TQRLabel;
    QRExpr2: TQRExpr;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fRelPedido: TfRelPedido;

implementation

uses UDM1, UPedido;

{$R *.DFM}

procedure TfRelPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelPedido.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var posicao : integer;
begin
//  if DM1.tPedidoItemCancelado.AsBoolean = False then
//    begin
  for posicao := 1 to 17 do
    begin
      TQRLabel(FindComponent('Tam'+IntToStr(Posicao))).Enabled := False;
      TQRLabel(FindComponent('Par'+IntToStr(Posicao))).Enabled := False;
    end;
  DM1.tGrade.IndexFieldNames := 'Codigo';
  DM1.tGrade.FindKey([DM1.tPedidoItemCodGrade.AsInteger]);
  DM1.tPedidoGrade.First;
  Posicao := 0;
  while not DM1.tPedidoGrade.EOF do
    begin
      if DM1.tPedidoGradeQtd.AsInteger > 0 then
        begin
          //Inc(Posicao);
          posicao := DM1.tPedidoGradePosicao.AsInteger;
          
          if Posicao <= 17 then
          begin
            TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('Tam' + IntToStr(Posicao))).Caption  := DM1.tPedidoGradelkTamanho.AsString;
            TQRLabel(FindComponent('Ta' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('Ta' + IntToStr(Posicao))).Caption  := DM1.tPedidoGradelkTamanho.AsString;
            TQRLabel(FindComponent('Par' + IntToStr(Posicao))).Enabled  := True;
            TQRLabel(FindComponent('Par' + IntToStr(Posicao))).Caption  := DM1.tPedidoGradeQtd.AsString;
            if cdsGradeAgrupada.Locate('Referencia;Cor;Material',VarArrayOf([DM1.tPedidoItemlkReferencia.AsString,DM1.tPedidoItemlkCor.AsString,DM1.tPedidoItemlkDescMaterial.AsString]),[locaseinsensitive]) then
            begin
              cdsGradeAgrupada.Edit;
              cdsGradeAgrupada.FieldByName('Par' + IntToStr(Posicao)).AsInteger := cdsGradeAgrupada.FieldByName('Par' + IntToStr(Posicao)).AsInteger + DM1.tPedidoGradeQtd.AsInteger;
            end
            else
            begin
              cdsGradeAgrupada.Insert;
              cdsGradeAgrupada.FieldByName('Referencia').AsString := DM1.tPedidoItemlkReferencia.AsString;
              cdsGradeAgrupada.FieldByName('Cor').AsString        := DM1.tPedidoItemlkCor.AsString;
              cdsGradeAgrupada.FieldByName('Material').AsString   := DM1.tPedidoItemlkDescMaterial.AsString;
              cdsGradeAgrupada.FieldByName('Par' + IntToStr(Posicao)).AsInteger := DM1.tPedidoGradeQtd.AsInteger;
            end;
            cdsGradeAgrupada.Post;
          end;
        end;
      DM1.tPedidoGrade.Next;
    end;
end;

procedure TfRelPedido.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if DM1.tPedidoSituacao.AsInteger = 1 then
    QRLabel41.Caption := 'Normal'
  else
    if DM1.tPedidoSituacao.AsInteger = 2 then
      QRLabel41.Caption := 'C 200'
  else
    if DM1.tPedidoSituacao.AsInteger = 3 then
      QRLabel41.Caption := 'C 400';
end;

procedure TfRelPedido.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vDesc : String;
begin
  vDesc := ' ';
  DM1.tPedidoDesconto.First;
  while not DM1.tPedidoDesconto.EOF do
    begin
      if vDesc = ' ' then
        begin
          vDesc := vDesc + DM1.tPedidoDescontoPercDesconto.AsString;
          DM1.tPedidoDesconto.Next;
        end
      else
        begin
          vDesc := vDesc + '+' + DM1.tPedidoDescontoPercDesconto.AsString;
          DM1.tPedidoDesconto.Next;
        end;
    end;
  QRLabel50.Caption := vDesc;
end;

end.
