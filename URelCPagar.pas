unit URelCPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, ExtCtrls, Qrctrls;

type
  TfRelCPagar = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel15: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape18: TQRShape;
    QRLabel17: TQRLabel;
    QRShape23: TQRShape;
    QRDBText5: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel23: TQRLabel;
    QRShape26: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape10: TQRShape;
    QRShape15: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    vVlrRestanteDia, vVlrRestanteMes, vVlrRestanteGer : Real;
  public
    { Public declarations }
  end;

var
  fRelCPagar: TfRelCPagar;
  vQtdTitulosDia, vQtdTitulosMes, vQtdTitulos : Integer;

implementation

uses UContasPagar, UDM1, UPrevRelCPagar;

{$R *.DFM}

procedure TfRelCPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelCPagar.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  vTexto : String;
  i      : Integer;
begin
  //vQtdTitulosDia := vQtdTitulosDia + 1;
  //vQtdTitulosMes := vQtdTitulosMes + 1;
  //vQtdTitulos    := vQtdTitulos + 1;
  for i := 0 to Screen.FormCount - 1 do
    begin
      if (Screen.Forms[i] is TfContasPagar) and (fContasPagar.Showing) then
        begin
          if fContasPagar.Query1lkTipoConta.AsString <> 'I' then
            begin
              vVlrRestanteDia := vVlrRestanteDia + fContasPagar.Query1ValorRestante.AsFloat;
              vVlrRestanteMes := vVlrRestanteMes + fContasPagar.Query1ValorRestante.AsFloat;
              vVlrRestanteGer := vVlrRestanteGer + fContasPagar.Query1ValorRestante.AsFloat;

              vQtdTitulosDia := vQtdTitulosDia + 1;
              vQtdTitulosMes := vQtdTitulosMes + 1;
              vQtdTitulos    := vQtdTitulos + 1;

              QRDBText2.Color := clWhite;
            end
          else
            QRDBText2.Color := clSilver;

          QRLabel8.Caption  := fContasPagar.Query1Duplicata.AsString;
          vTexto   := FormatFloat('0',fContasPagar.Query1Parcela.AsInteger) + '/';
          fContasPagar.tCPagarParc2.Filtered := False;
          fContasPagar.tCPagarParc2.Filter   := 'NroDuplicata = '''+IntToStr(fContasPagar.Query1Duplicata.AsInteger)+''' AND NumCPagar = '''+IntToStr(fContasPagar.Query1NumCPagar.AsInteger)+'''';
          fContasPagar.tCPagarParc2.Filtered := True;
          vTexto   := vTexto + FormatFloat('0',fContasPagar.tCPagarParc2.RecordCount);
          fContasPagar.tCPagarParc2.Filtered := False;
          QRLabel12.Caption := vTexto;
          QRLabel22.Enabled := False;
          QRLabel24.Enabled := False;
          if (fContasPagar.Query1NomeBancoForn.AsString <> '') or (fContasPagar.Query1AgenciaForn.AsString <> '') or
             (fContasPagar.Query1NumContaForn.AsString <> '') then
            begin
              DetailBand1.Height := 35;
              QRLabel22.Enabled  := True;
              QRLabel24.Enabled  := True;
              QRLabel24.Caption  := fContasPagar.Query1NomeBancoForn.AsString + ' / ' +
                                    fContasPagar.Query1AgenciaForn.AsString + ' / ' +
                                    fContasPagar.Query1NumContaForn.AsString;
            end
          else
            DetailBand1.Height := 16;
        end;
      if (Screen.Forms[i] is TfPrevRelCPagar) and (fPrevRelCPagar.Showing) then
        begin
          if fPrevRelCPagar.Query1lkTipoConta.AsString <> 'I' then
            begin
              vVlrRestanteDia := vVlrRestanteDia + fPrevRelCPagar.Query1ValorRestante.AsFloat;
              vVlrRestanteMes := vVlrRestanteMes + fPrevRelCPagar.Query1ValorRestante.AsFloat;
              vVlrRestanteGer := vVlrRestanteGer + fPrevRelCPagar.Query1ValorRestante.AsFloat;

              vQtdTitulosDia := vQtdTitulosDia + 1;
              vQtdTitulosMes := vQtdTitulosMes + 1;
              vQtdTitulos    := vQtdTitulos + 1;

              QRDBText2.Color := clWhite;
            end
          else
            QRDBText2.Color := clSilver;


          QRLabel8.Caption  := fPrevRelCPagar.Query1Duplicata.AsString;
          vTexto   := FormatFloat('0',fPrevRelCPagar.Query1Parcela.AsInteger) + '/';
          fPrevRelCPagar.tCPagarParc2.Filtered := False;
          fPrevRelCPagar.tCPagarParc2.Filter   := 'NroDuplicata = '''+IntToStr(fPrevRelCPagar.Query1Duplicata.AsInteger)+''' AND NumCPagar = '''+IntToStr(fPrevRelCPagar.Query1NumCPagar.AsInteger)+'''';
          fPrevRelCPagar.tCPagarParc2.Filtered := True;
          vTexto   := vTexto + FormatFloat('0',fPrevRelCPagar.tCPagarParc2.RecordCount);
          fPrevRelCPagar.tCPagarParc2.Filtered := False;
          QRLabel12.Caption := vTexto;
          QRLabel22.Enabled := False;
          QRLabel24.Enabled := False;
          if (fPrevRelCPagar.Query1NomeBancoForn.AsString <> '') or (fPrevRelCPagar.Query1AgenciaForn.AsString <> '') or
             (fPrevRelCPagar.Query1NumContaForn.AsString <> '') then
            begin
              DetailBand1.Height := 35;
              QRLabel22.Enabled  := True;
              QRLabel24.Enabled  := True;
              QRLabel24.Caption  := fPrevRelCPagar.Query1NomeBancoForn.AsString + ' / ' +
                                    fPrevRelCPagar.Query1AgenciaForn.AsString + ' / ' +
                                    fPrevRelCPagar.Query1NumContaForn.AsString;
            end
          else
            DetailBand1.Height := 16;
        end;
    end;
end;

procedure TfRelCPagar.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var i : Integer;
begin
  for i := 0 to Screen.FormCount - 1 do
    begin
      if (Screen.Forms[i] is TfContasPagar) and (fContasPagar.Showing) then
        begin
          if fContasPagar.CheckBox1.Checked then
            begin
              QRLabel13.Enabled := true;
              QRLabel13.Caption := 'Período ' + fContasPagar.DateEdit1.Text + ' à ' + fContasPagar.DateEdit2.Text;
            end
          else
            QRLabel13.Enabled := false;
          QRLabel17.Enabled := False;
        end;
      if (Screen.Forms[i] is TfPrevRelCPagar) and (fPrevRelCPagar.Showing) then
        begin
          case fPrevRelCPagar.RadioGroup1.ItemIndex of
            0 : begin
                  QRLabel17.Caption := '(Vencidas)';
                  QRLabel13.Caption := 'Referência: ' + fPrevRelCPagar.DateEdit1.Text;
                end;
            1 : begin
                  QRLabel17.Caption := '(Vcto.Período)';
                  QRLabel13.Caption := 'Período ' + fPrevRelCPagar.DateEdit1.Text + ' à ' + fPrevRelCPagar.DateEdit2.Text;
                end;
            2 : begin
                  QRLabel17.Caption := '(Pagas)';
                  QRLabel13.Caption := 'Período ' + fPrevRelCPagar.DateEdit1.Text + ' à ' + fPrevRelCPagar.DateEdit2.Text;
                end;
            3 : begin
                  QRLabel17.Caption := '(Todas)';
                  QRLabel13.Caption := 'Período ' + fPrevRelCPagar.DateEdit1.Text + ' à ' + fPrevRelCPagar.DateEdit2.Text;
                end;
          end;
          QRLabel17.Enabled := True;
        end;
    end;
end;

procedure TfRelCPagar.ChildBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
 vData : TDateTime;
 i     : Integer;
 dia, mes, ano : word;
 dia2, mes2, ano2 : word;
begin
  QrLabel14.Caption := IntToStr(vQtdTitulosDia);
  QrLabel20.Caption := IntToStr(vQtdTitulosMes);
  QRLabel27.Caption := FormatFloat('###,###,###,##0.00',vVlrRestanteDia);
  QRLabel28.Caption := FormatFloat('###,###,###,##0.00',vVlrRestanteMes);
  for i := 0 to Screen.FormCount - 1 do
    begin
      if (Screen.Forms[i] is TfContasPagar) and (fContasPagar.Showing) then
        begin
          if fContasPagar.CheckBox2.Checked = False then
            PrintBand := False
          else
            begin
              vData := fContasPagar.Query1Data.AsDateTime;
              DecodeDate(vData, Ano, Mes, Dia);
              if fContasPagar.Query1.Eof then
                begin
                  PrintBand := True;
                  ChildBand1.Height := 38;
                end
              else
                begin
                  fContasPagar.Query1.Next;
                  DecodeDate(fContasPagar.Query1Data.AsDateTime, Ano2, Mes2, Dia2);
                  if fContasPagar.Query1.Eof then
                    begin
                      PrintBand := True;
                      ChildBand1.Height := 38;
                    end
                  else
                  if vData <> fContasPagar.Query1Data.AsDateTime then
                    begin
                      PrintBand := True;
                      if (mes <> mes2) or ((mes = mes2) and (ano <> ano2)) then
                        ChildBand1.Height := 38
                      else
                        ChildBand1.Height := 21;
                      fContasPagar.Query1.Prior;
                    end
                  else
                    begin
                      PrintBand := False;
                      fContasPagar.Query1.Prior;
                    end;
                end;
            end;
        end;
      if (Screen.Forms[i] is TfPrevRelCPagar) and (fPrevRelCPagar.Showing) then
        begin
          if fPrevRelCPagar.CheckBox1.Checked = False then
            PrintBand := False
          else
            begin
              vData := fPrevRelCPagar.Query1Data.AsDateTime;
              DecodeDate(vData, Ano, Mes, Dia);
              if fPrevRelCPagar.Query1.Eof then
                begin
                  PrintBand := True;
                  ChildBand1.Height := 38;
                end
              else
                begin
                  fPrevRelCPagar.Query1.Next;
                  DecodeDate(fPrevRelCPagar.Query1Data.AsDateTime, Ano2, Mes2, Dia2);
                  if fPrevRelCPagar.Query1.Eof then
                    begin
                      PrintBand := True;
                      ChildBand1.Height := 38;
                    end
                  else
                  if vData <> fPrevRelCPagar.Query1Data.AsDateTime then
                    begin
                      PrintBand := True;
                      if (mes <> mes2) or ((mes = mes2) and (ano <> ano2)) then
                        ChildBand1.Height := 38
                      else
                        ChildBand1.Height := 21;
                      fPrevRelCPagar.Query1.Prior;
                    end
                  else
                    begin
                      PrintBand := False;
                      fPrevRelCPagar.Query1.Prior;
                    end;
                end;
            end;
        end;
    end;
  if PrintBand = True then
    begin
      vQtdTitulosDia  := 0;
      vVlrRestanteDia := 0;
      if ChildBand1.Height > 30 then
        begin
          //QRExpr1.ResetAfterPrint := True;
          vQtdTitulosMes          := 0;
          vVlrRestanteMes         := 0;
        end;
      //else
        //QRExpr1.ResetAfterPrint := False;
    end;
end;

procedure TfRelCPagar.FormShow(Sender: TObject);
begin
  vQtdTitulosDia := 0;
  vQtdTitulosMes := 0;
  vQtdTitulos    := 0;
  vVlrTotalDia   := 0;
  vVlrTotal      := 0;
end;

procedure TfRelCPagar.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  QrLabel16.Caption := IntToStr(vQtdTitulos);
  QRLabel29.Caption := FormatFloat('###,###,###,##0.00',vVlrRestanteGer);
  vVlrRestanteGer   := 0;
  vQtdTitulos       := 0;
  vQtdTitulosDia    := 0;
  vQtdTitulosMes    := 0;
end;

procedure TfRelCPagar.ChildBand1AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  {if BandPrinted = True then
    begin
      if ChildBand1.Height > 30 then
        QRExpr1.ResetAfterPrint := True
      else
        QRExpr1.ResetAfterPrint := False;
    end
  else
    QRExpr1.ResetAfterPrint := False;}
end;

procedure TfRelCPagar.FormCreate(Sender: TObject);
begin
  vVlrRestanteGer := 0;
  vVlrRestanteDia := 0;
  vVlrRestanteMes := 0;
end;

end.
