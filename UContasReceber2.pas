unit UContasReceber2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Grids, DBGrids, RXDBCtrl,
  RXLookup, Db, DBTables, RXSplit, DBFilter, RXCtrls, Menus, Printers,
  Mask, ToolEdit, CurrEdit, ALed, Variants, SMDBGrid;

type
  TfContasReceber2 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn4: TBitBtn;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    qTotal: TQuery;
    qsTotal: TDataSource;
    qTotalGeral: TFloatField;
    qTotalRestante: TFloatField;
    qTotalPago: TFloatField;
    Label18: TLabel;
    Label19: TLabel;
    qTotalAbatimentos: TFloatField;
    qParcelas: TQuery;
    dsqParcelas: TDataSource;
    qParcelasNota: TIntegerField;
    qParcelasParcela: TIntegerField;
    qParcelasData: TDateField;
    qParcelasValorParc: TFloatField;
    qParcelasValorRestante: TFloatField;
    qParcelasCodConta: TIntegerField;
    qParcelasDtPgto: TDateField;
    qParcelasNumCReceber: TIntegerField;
    qParcelasValorPago: TFloatField;
    qParcelasAbatimentos: TFloatField;
    qParcelasCodCli: TIntegerField;
    qParcelasJurosPagos: TFloatField;
    Label22: TLabel;
    Label23: TLabel;
    qTotalVlrDevolucao: TFloatField;
    qParcelasMercado: TStringField;
    qParcelasTipoDoc: TStringField;
    qParcelasDtGerado: TDateField;
    qParcelasTitProtestado: TBooleanField;
    qParcelaslkCodBanco: TStringField;
    qParcelasFantasia: TStringField;
    qParcelasNomeCliente: TStringField;
    qParcelasclDiasAtraso: TFloatField;
    qParcelasQuitParcCReceber: TBooleanField;
    qParcelasCodVendedor: TIntegerField;
    qParcelaslkNomeVendedor: TStringField;
    qParcelasDespesas: TFloatField;
    qParcelasPercComissao: TFloatField;
    qParcelasCancelado: TBooleanField;
    Label7: TLabel;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    Label9: TLabel;
    Label10: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    GroupBox1: TGroupBox;
    ALed5: TALed;
    Label21: TLabel;
    ALed6: TALed;
    Label24: TLabel;
    ALed7: TALed;
    Label25: TLabel;
    ALed8: TALed;
    Label26: TLabel;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    RadioGroup4: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    SMDBGrid1: TSMDBGrid;
    BitBtn7: TBitBtn;
    qParcelasNroLancExtComissao: TIntegerField;
    qParcelasVlrDevolucao: TFloatField;
    RxDBFilter1: TRxDBFilter;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure qParcelasCalcFields(DataSet: TDataSet);
    procedure BitBtn7Click(Sender: TObject);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RadioGroup4Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
  private
    vAchouParcela : Boolean;
    procedure Monta_SQLqParcelas;
    procedure Monta_SQLqTotal;
    procedure Posiciona_Parcela;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fContasReceber2: TfContasReceber2;

implementation

uses UDM1, UContasReceberPag, UConsCReceberHist,
  UCReceberAltera, UEstPagamento,
  UContasReceberDev, URelCReceber2;

{$R *.DFM}

procedure TfContasReceber2.Posiciona_Parcela;
begin
  vAchouParcela := False;
  if qParcelas.Active then
    begin
      DM1.tCReceber.IndexFieldNames     := 'NumCReceber';
      DM1.tCReceberParc.IndexFieldNames := 'NumCReceber;ParcCReceber';
      if DM1.tCReceber.FindKey([qParcelasNumCReceber.AsInteger]) then
        if DM1.tCReceberParc.FindKey([qParcelasNumCReceber.AsInteger,qParcelasParcela.AsInteger]) then
          vAchouParcela := True;
      {if DM1.tCReceber.Locate('NumCReceber',qParcelasNumCReceber.AsInteger,[loCaseInsensitive]) then
        if DM1.tCReceberParc.Locate('NumCReceber;ParcCReceber',VarArrayOf([qParcelasNumCReceber.AsInteger,qParcelasParcela.AsInteger]),[locaseinsensitive]) then
          vAchouParcela := True;}
    end;
end;

procedure TfContasReceber2.Monta_SQLqParcelas;
begin
  Label4.Caption  := '0,00';
  Label16.Caption := '0,00';
  Label17.Caption := '0,00';
  Label19.Caption := '0,00';

  qParcelas.Close;
  qParcelas.SQL.Clear;
  qParcelas.SQL.Add('SELECT A.NumNota Nota, A.ParcCReceber Parcela, A.DtVencCReceber Data, A.VlrParcCReceber ValorParc, ');
  qParcelas.SQL.Add(' A.JurosPagos JurosPagos, A.RestParcela ValorRestante, A.CodConta CodConta, A.DtPagParcCReceber DtPgto, ');
  qParcelas.SQL.Add(' A.NumCReceber, A.PgtoParcial ValorPago, A.Abatimentos Abatimentos, A.CodCli, B.Mercado, A.TipoDoc, ');
  qParcelas.SQL.Add(' A.DtGerado, A.TitProtestado, B.Fantasia, B.Nome NomeCliente, A.QuitParcCReceber, A.CodVendedor, ');
  qParcelas.SQL.Add(' A.Despesas, A.PercComissao, A.Cancelado, A.NroLancExtComissao, A.VlrDevolucao ');
  qParcelas.SQL.Add('FROM dbCReceberParc A ');
  qParcelas.SQL.Add('   LEFT OUTER JOIN "dbCliente.DB" B ');
  qParcelas.SQL.Add('   ON  (A.CodCli = B.Codigo) ');
  qParcelas.SQL.Add('WHERE ((A.Cancelado = False) or (A.Cancelado is Null)) ');
  if RxDBLookupCombo1.Text <> '' then
    begin
      qParcelas.SQL.Add(' AND (A.CodCli = :CodCli)');
      qParcelas.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;

      qTotal.SQL.Add(' AND (A.CodCli = :CodCli)');
      qTotal.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if CurrencyEdit1.AsInteger > 0 then
    begin
      qParcelas.SQL.Add(' AND (A.NumNota = :NumNota)');
      qParcelas.ParamByName('NumNota').AsInteger := CurrencyEdit1.AsInteger;

      qTotal.SQL.Add(' AND (A.NumNota = :NumNota)');
      qTotal.ParamByName('NumNota').AsInteger := CurrencyEdit1.AsInteger;
    end
  else
  if CurrencyEdit2.AsInteger > 0 then
    begin
      qParcelas.SQL.Add(' AND (A.NumCReceber = :NumCReceber)');
      qParcelas.ParamByName('NumCReceber').AsInteger := CurrencyEdit2.AsInteger;
    end;
  if (CurrencyEdit1.AsInteger <= 0) and (CurrencyEdit2.AsInteger <= 0) then
    begin
      if DateEdit2.Date > 0 then
        begin
          qParcelas.SQL.Add(' AND (A.DtVencCReceber >= :DtVectoIni)');
          qParcelas.ParamByName('DtVectoIni').AsDate := DateEdit2.Date;
        end;
      if DateEdit3.Date > 0 then
        begin
          qParcelas.SQL.Add(' AND (A.DtVencCReceber <= :DtVectoFin)');
          qParcelas.ParamByName('DtVectoFin').AsDate := DateEdit3.Date;
        end;
      qParcelas.SQL.Add(' AND (A.Mercado = :Mercado) ');
      Case RadioGroup4.ItemIndex of
        0 : qParcelas.ParamByName('Mercado').AsString := 'I';
        1 : qParcelas.ParamByName('Mercado').AsString := 'O';
      end;
      case RadioGroup1.ItemIndex of
        0 : qParcelas.SQL.Add(' AND (A.RestParcela > 0) ');
        1 : qParcelas.SQL.Add(' AND (A.PgtoParcial > 0) ');
      end;
    end;
  qParcelas.SQL.Add('ORDER BY A.DtVencCReceber, A.NumNota, A.ParcCReceber');
  qParcelas.Open;

  RxDBFilter1.Active := True;
end;

procedure TfContasReceber2.Monta_SQLqTotal;
begin
  qTotal.Close;
  qTotal.SQL.Clear;
  qTotal.SQL.Add('SELECT SUM(A.VlrParcCReceber) Geral, SUM(A.RestParcela) Restante, SUM(A.PgtoParcial) Pago, SUM(A.Abatimentos) Abatimentos, SUM(A.VlrDevolucao) VlrDevolucao');
  qTotal.SQL.Add('FROM dbCReceberParc A');
  qTotal.SQL.Add('LEFT OUTER JOIN "dbCliente.DB" B');
  qTotal.SQL.Add('   ON  (A.CodCli = B.Codigo)');
  qTotal.SQL.Add('WHERE ((A.Cancelado = False) or (A.Cancelado is Null))');
  if RxDBLookupCombo1.Text <> '' then
    begin
      qTotal.SQL.Add(' AND (A.CodCli = :CodCli)');
      qTotal.ParamByName('CodCli').AsInteger := RxDBLookupCombo1.KeyValue;
    end;
  if CurrencyEdit1.AsInteger > 0 then
    begin
      qTotal.SQL.Add(' AND (A.NumNota = :NumNota)');
      qTotal.ParamByName('NumNota').AsInteger := CurrencyEdit1.AsInteger;
    end
  else
  if CurrencyEdit2.AsInteger > 0 then
    begin
      qTotal.SQL.Add(' AND (A.NumCReceber = :NumCReceber)');
      qTotal.ParamByName('NumCReceber').AsInteger := CurrencyEdit2.AsInteger;
    end;
  if (CurrencyEdit1.AsInteger <= 0) and (CurrencyEdit2.AsInteger <= 0) then
    begin
      if DateEdit2.Date > 0 then
        begin
          qTotal.SQL.Add(' AND (A.DtVencCReceber >= :DtVectoIni)');
          qTotal.ParamByName('DtVectoIni').AsDate := DateEdit2.Date;
        end;
      if DateEdit3.Date > 0 then
        begin
          qTotal.SQL.Add(' AND (A.DtVencCReceber <= :DtVectoFin)');
          qTotal.ParamByName('DtVectoFin').AsDate := DateEdit3.Date;
        end;
      qTotal.SQL.Add(' AND (A.Mercado = :Mercado) ');
      Case RadioGroup4.ItemIndex of
        0 : qTotal.ParamByName('Mercado').AsString := 'I';
        1 : qTotal.ParamByName('Mercado').AsString := 'O';
      end;
      case RadioGroup1.ItemIndex of
        0 : qTotal.SQL.Add(' AND (A.RestParcela > 0) ');
        1 : qTotal.SQL.Add(' AND (A.PgtoParcial > 0) ');
      end;
    end;
  qTotal.Open;

  //SQL do Total
  Label4.Caption  := '0,00';
  Label16.Caption := '0,00';
  Label17.Caption := '0,00';
  Label19.Caption := '0,00';
  qTotal.Open;
  qTotal.First;
  Label4.Caption  := FormatFloat('#,###,##0.00',qTotalPago.AsFloat);
  Label16.Caption := FormatFloat('#,###,##0.00',qTotalGeral.AsFloat);
  Label23.Caption := FormatFloat('#,###,##0.00',qTotalVlrDevolucao.AsFloat);
  Label17.Caption := FormatFloat('#,###,##0.00',qTotalRestante.AsFloat);
  Label19.Caption := FormatFloat('#,###,##0.00',qTotalAbatimentos.AsFloat);
end;


procedure TfContasReceber2.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfContasReceber2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fContasReceberPag.Free;
  RxDBFilter1.Active := False;

  DM1.tCliente.Filtered  := False;
  qParcelas.Close;
  qTotal.Close;

  if Screen.FormCount < 3 then
    begin
      DM1.tExtComissao.Close;
      DM1.tExtComissaoMod.Close;
      Dm1.tJuros.Close;
      Dm1.tCliente.Close;
      Dm1.tCReceber.Close;
      Dm1.tCReceberParc.Close;
      Dm1.tCReceberParcHist.Close;
      DM1.tMovimentos.Close;
      DM1.tContas.Close;
      DM1.tVendedor.Close;
      DM1.tNotaFiscal.Close;
      DM1.tTipoCobranca.Close;
      DM1.tPlanoContas.Close;
      DM1.tHistorico.Close;
      DM1.tModelista.Close;
    end;
  Action := Cafree;
end;

procedure TfContasReceber2.FormShow(Sender: TObject);
begin
  DM1.tExtComissao.Open;
  DM1.tExtComissaoMod.Open;
  Dm1.tJuros.Open;
  Dm1.tCliente.Open;
  Dm1.tCReceber.Open;
  Dm1.tCReceberParc.Open;
  Dm1.tCReceberParcHist.Open;
  DM1.tMovimentos.Open;
  DM1.tContas.Open;
  DM1.tVendedor.Open;
  DM1.tNotaFiscal.Open;
  DM1.tTipoCobranca.Open;
  DM1.tPlanoContas.Open;
  DM1.tHistorico.Open;
  DM1.tModelista.Open;

  fContasReceberPag := tfContasReceberPag.Create(Self);
end;

procedure TfContasReceber2.SpeedButton1Click(Sender: TObject);
begin
  Monta_SQLqParcelas;
end;

procedure TfContasReceber2.BitBtn1Click(Sender: TObject);
begin
  Posiciona_Parcela;
  if vAchouParcela then
    begin
      fConsCReceberHist := tfConsCReceberHist.Create(Self);
      fConsCReceberHist.ShowModal;
    end;
end;

procedure TfContasReceber2.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioCReceberAltera.AsBoolean then
    begin
      Posiciona_Parcela;
      if not vAchouParcela then
        exit;
      if (StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
        begin
          fCReceberAltera := tfCReceberAltera.Create(Self);
          fCReceberAltera.ShowModal;
        end
      else
        ShowMessage('Parcela já quitada!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioCReceberPag.AsBoolean then
    begin
      Posiciona_Parcela;
      if not vAchouParcela then
        exit;
      if (StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
        begin
          //fContasReceberPag := tfContasReceberPag.Create(Self);
          fContasReceberPag.ShowModal;
          //fContasReceberPag.Free;
        end
      else
        ShowMessage('Parcela já quitada!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_Return then
    if CurrencyEdit1.AsInteger > 0 then
      SpeedButton1Click(Sender);
end;

procedure TfContasReceber2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_F4 then
    SpeedButton1Click(Sender);
  if key = vk_F5 then
    BitBtn1Click(Sender);
  if key = vk_F6 then
    BitBtn2Click(Sender);
  if key = vk_F7 then
    BitBtn3Click(Sender);
  if key = vk_F8 then
    BitBtn5Click(Sender);
  if key = vk_F9 then
    BitBtn6Click(Sender);
  if key = vk_F10 then
    CurrencyEdit1.SetFocus;
  if (Shift = [ssCtrl]) and (Key = 87) then
    RxDBFilter1.Active := not(RxDBFilter1.Active);
end;

procedure TfContasReceber2.BitBtn5Click(Sender: TObject);
begin
  if DM1.tUsuarioEstPgtoRec.AsBoolean then
    begin
      Posiciona_Parcela;
      if not vAchouParcela then
        exit;
      fEstPagamento := TfEstPagamento.Create(Self);
      if MessageDlg('Deseja fazer estorno de Pgto?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
          fEstPagamento.RxDBFilter1.Active := True;
          fEstPagamento.BitBtn2.Enabled    := False;
          fEstPagamento.BitBtn3.Enabled    := True;
          if (DM1.tCReceberParcHist.RecordCount > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
            fEstPagamento.ShowModal
          else
            ShowMessage('Não há pagamentos a estornar!');
        end
      else
        begin
          fEstPagamento.RxDBFilter2.Active := True;
          fEstPagamento.BitBtn3.Enabled    := False;
          fEstPagamento.BitBtn2.Enabled    := True;
          if (DM1.tCReceberParcHist.RecordCount > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
            fEstPagamento.ShowModal
          else
            ShowMessage('Não há devoluções a estornar!');
        end;
      fEstPagamento.RxDBFilter1.Active := False;
      fEstPagamento.RxDBFilter2.Active := False;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfContasReceber2.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F2 then
    begin
      if RxDBLookupCombo1.LookupDisplay = 'Nome' then
        begin
           RxDBLookupCombo1.CloseUp(True);
           RxDBLookupCombo1.LookupDisplay := 'Fantasia';
           DM1.tCliente.IndexFieldNames   := 'Fantasia';
           Label1.Caption := 'Consulta por Fantasia';
           RxDBLookupCombo1.Refresh;
           RxDBLookupCombo1.SetFocus;
           if DM1.tClienteCodigo.AsInteger > 0 then
             RxDBLookupCombo1.KeyValue := DM1.tClienteCodigo.AsInteger;
        end
      else
      if RxDBLookupCombo1.LookupDisplay = 'Fantasia' then
        begin
           RxDBLookupCombo1.CloseUp(True);
           RxDBLookupCombo1.LookupDisplay := 'Nome';
           DM1.tCliente.IndexFieldNames   := 'Nome';
           Label1.Caption := 'Consulta por Nome';
           RxDBLookupCombo1.Refresh;
           RxDBLookupCombo1.SetFocus;
           if DM1.tClienteCodigo.AsInteger > 0 then
             RxDBLookupCombo1.KeyValue := DM1.tClienteCodigo.AsInteger;
        end;
    end;
end;

procedure TfContasReceber2.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  if RxDBLookupCombo1.LookupDisplay = 'Nome' then
    DM1.tCliente.IndexFieldNames := 'Nome';
  if RxDBLookupCombo1.LookupDisplay = 'Fantasia' then
    DM1.tCliente.IndexFieldNames := 'Fantasia';
end;

procedure TfContasReceber2.BitBtn6Click(Sender: TObject);
begin
  if DM1.tUsuarioCReceberPag.AsBoolean then
    begin
      Posiciona_Parcela;
      if not vAchouParcela then
        exit;
      if (StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) > 0) and (not DM1.tCReceberParcCancelado.AsBoolean) then
        begin
          fContasReceberDev := tfContasReceberDev.Create(Self);
          fContasReceberDev.ShowModal;
        end
      else
        ShowMessage('Parcela já quitada e/ou Nota Fiscal cancelada!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfContasReceber2.qParcelasCalcFields(DataSet: TDataSet);
begin
  if StrToFloat(FormatFloat('0.00',qParcelasValorRestante.AsFloat)) >= 0 then
    begin
      qParcelasclDiasAtraso.AsFloat := Date - qParcelasData.AsDateTime;
      if qParcelasclDiasAtraso.AsFloat <= 0 then
        qParcelasclDiasAtraso.AsFloat := 0;
    end
  else
    begin
      qParcelasclDiasAtraso.AsFloat := qParcelasDtPgto.AsDateTime - qParcelasData.AsDateTime;
      if qParcelasclDiasAtraso.AsFloat <= 0 then
        qParcelasclDiasAtraso.AsFloat := 0;
    end;
end;

procedure TfContasReceber2.BitBtn7Click(Sender: TObject);
begin
  Monta_SQLqTotal;
end;

procedure TfContasReceber2.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_Return then
    if CurrencyEdit2.AsInteger > 0 then
      SpeedButton1Click(Sender);
end;

procedure TfContasReceber2.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (qParcelas.Active) and (qParcelasNumCReceber.AsInteger > 0) then
    begin
      if qParcelasCancelado.AsBoolean then
        Background := $00C080FF
      else
      if StrToFloat(FormatFloat('0.00',qParcelasValorRestante.AsFloat)) <= 0 then
        begin
          Background  := clTeal;
          AFont.Color := clWhite;
        end
      else
      if qParcelasclDiasAtraso.AsFloat > 0 then
        begin
          Background  := clRed;
          AFont.Color := clWhite;
        end;
    end;
end;

procedure TfContasReceber2.RadioGroup4Click(Sender: TObject);
begin
  DM1.tCliente.Filtered  := False;
  Case RadioGroup4.ItemIndex of
    0 : DM1.tCliente.Filter   := 'Mercado = ''I''';
    1 : DM1.tCliente.Filter   := 'Mercado = ''O''';
  end;
  DM1.tCliente.Filtered := True;
end;

procedure TfContasReceber2.RxSpeedButton1Click(Sender: TObject);
begin
  fRelCReceber2 := TfRelCReceber2.Create(Self);
  fRelCReceber2.RLReport1.Preview;
  FreeAndNil(fRelCReceber2);
end;

end.
