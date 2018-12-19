unit UConsFatDiario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB, DBTables, DBIProcs,
  DBFilter, RXLookup, Mask, ToolEdit;

type
  TfConsFatDiario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    RxDBGrid1: TRxDBGrid;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    tAuxFatDiario: TTable;
    dsAuxFatDiario: TDataSource;
    tAuxFatDiarioDtEmissao: TDateField;
    tAuxFatDiarioVlrNormal: TFloatField;
    tAuxFatDiarioVlrC200: TFloatField;
    tAuxFatDiarioVlrC400: TFloatField;
    tAuxFatDiarioVlrDevolucao: TFloatField;
    tAuxFatDiarioVlrTotal: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    tPedidoNota: TTable;
    tPedidoNotaPedido: TIntegerField;
    tPedidoNotaItem: TIntegerField;
    tPedidoNotaNumNota: TIntegerField;
    tPedidoNotaItemNota: TIntegerField;
    tPedidoNotaDtNota: TDateField;
    tPedidoNotaQtdPares: TIntegerField;
    dsPedidoNota: TDataSource;
    RxDBFilter1: TRxDBFilter;
    RxDBFilter2: TRxDBFilter;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RxDBFilter3: TRxDBFilter;
    tPedidoItem: TTable;
    tPedidoItemPedido: TIntegerField;
    tPedidoItemItem: TIntegerField;
    tPedidoItemCodProduto: TIntegerField;
    tPedidoItemCodCor: TIntegerField;
    tPedidoItemCodGrade: TIntegerField;
    tPedidoItemQtdPares: TFloatField;
    tPedidoItemQtdParesFat: TFloatField;
    tPedidoItemQtdParesRest: TFloatField;
    tPedidoItemPreco: TFloatField;
    tPedidoItemVlrTotal: TFloatField;
    tPedidoItemCodCabedal1: TIntegerField;
    tPedidoItemCodCabedal2: TIntegerField;
    tPedidoItemCodCorForro: TIntegerField;
    tPedidoItemCodCorSolado: TIntegerField;
    tPedidoItemCodCorPalmilha: TIntegerField;
    tPedidoItemCancelado: TBooleanField;
    tPedidoItemCopiado: TBooleanField;
    tPedidoItemSelecionado: TBooleanField;
    tPedidoItemQtdParesCanc: TFloatField;
    tPedidoItemCodForro: TIntegerField;
    tPedidoItemCodEtiqueta: TIntegerField;
    tPedidoItemVlrDesconto: TFloatField;
    tPedidoItemCodSolado: TIntegerField;
    tPedidoItemSitTrib: TSmallintField;
    tPedidoItemQtdFatAut: TFloatField;
    tPedidoItemQtdFatMan: TFloatField;
    tAuxFatDiarioVlrEquiparado: TFloatField;
    tAuxFatDiarioVlrExportacao: TFloatField;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tAuxFatDiarioAfterPost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
//    procedure Soma_C200;
  public
    { Public declarations }
  end;

var
  fConsFatDiario: TfConsFatDiario;
  vValorC200 : Currency;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

{procedure TfConsFatDiario.Soma_C200;
begin
  vValorC200 := 0;
  DM1.tNotaFiscalItens.Refresh;
  DM1.tNotaFiscalItens.First;
  while not DM1.tNotaFiscalItens.Eof do
    begin
      if (DM1.tNotaFiscalItensNumPedido.AsInteger > 0) and (DM1.tNotaFiscalItensItemPedido.AsInteger > 0) then
        begin
          tPedidoItem.SetKey;
          tPedidoItemPedido.AsInteger := DM1.tNotaFiscalItensNumPedido.AsInteger;
          tPedidoItemItem.AsInteger   := DM1.tNotaFiscalItensItemPedido.AsInteger;
          if tPedidoItem.GotoKey then
            begin
              if (tPedidoItemPreco.AsCurrency - tPedidoItemVlrDesconto.AsCurrency) > (DM1.tNotaFiscalItensVlrUnit.AsCurrency) then
                vValorC200 := vValorC200 + (((tPedidoItemPreco.AsCurrency - tPedidoItemVlrDesconto.AsCurrency) -
                                              DM1.tNotaFiscalItensVlrUnit.AsCurrency) * DM1.tNotaFiscalItensQtd.AsInteger);
            end;
        end;
      DM1.tNotaFiscalItens.Next;
    end;
end;}

procedure TfConsFatDiario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tNotaFiscal.Close;
  Action := Cafree;
end;

procedure TfConsFatDiario.FormShow(Sender: TObject);
begin
  DM1.tNotaFiscal.Open;
  DateEdit1.Date := Date();
  DateEdit2.Date := Date();
  tAuxFatDiario.Refresh;
  tAuxFatDiario.First;
  while not tAuxFatDiario.EOF do
    tAuxFatDiario.Delete;
end;

procedure TfConsFatDiario.tAuxFatDiarioAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tAuxFatDiario.Handle);
end;

procedure TfConsFatDiario.BitBtn1Click(Sender: TObject);
var
Normal, C200, C400, Devolucao, TotalGeral, Equiparado, Exportacao : Currency;
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') then
    ShowMessage('É obrigatório informar a data inicial e final')
  else
    begin
      Screen.Cursor := crHourGlass;
      RxDBFilter2.Active := True;
      tAuxFatDiario.DisableControls;
      tAuxFatDiario.Refresh;
      tAuxFatDiario.First;
      while not tAuxFatDiario.EOF do
        tAuxFatDiario.Delete;
      DM1.tNotaFiscal.IndexFieldNames := 'DtEmissao';
      DM1.tNotaFiscal.SetRangeStart;
      DM1.tNotaFiscalDtEmissao.AsDateTime  := DateEdit1.Date;
      DM1.tNotaFiscal.SetRangeEnd;
      DM1.tNotaFiscalDtEmissao.AsDateTime  := DateEdit2.Date;
      DM1.tNotaFiscal.ApplyRange;
      DM1.tNotaFiscal.First;
      while not DM1.tNotaFiscal.EOF do
        begin
          if not DM1.tNotaFiscalCancelada.AsBoolean then
            begin
              if DM1.tNotaFiscalSaidaEntrada.AsString = 'E' then
                begin
                  if DM1.tNotaFiscalNumNotaOrigem.AsInteger > 0 then
                    begin
                      tAuxFatDiario.SetKey;
                      tAuxFatDiarioDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                      if tAuxFatDiario.GotoKey then
                        begin
                          tAuxFatDiario.Edit;
                          tAuxFatDiarioVlrDevolucao.AsFloat := tAuxFatDiarioVlrDevolucao.AsFloat + DM1.tNotaFiscalVlrTotalNota.AsFloat;
                          tAuxFatDiarioVlrTotal.AsFloat     := tAuxFatDiarioVlrTotal.AsFloat - DM1.tNotaFiscalVlrTotalNota.AsFloat;
                          tAuxFatDiario.Post;
                        end
                      else
                        begin
                          tAuxFatDiario.Insert;
                          tAuxFatDiarioDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                          tAuxFatDiarioVlrDevolucao.AsFloat := DM1.tNotaFiscalVlrTotalNota.AsFloat;
                          tAuxFatDiarioVlrTotal.AsFloat     := DM1.tNotaFiscalVlrTotalNota.AsFloat * -1;
                          tAuxFatDiario.Post;
                        end;
                    end;
                end
              else
                begin
//aqui verificar como fazer
                  if DM1.tNotaFiscallkTipoFat.AsString = 'N' then
                  //if (DM1.tNotaFiscallkCodNatOper.AsInteger = 511) or (DM1.tNotaFiscallkCodNatOper.AsInteger = 512)
                  //or (DM1.tNotaFiscallkCodNatOper.AsInteger = 611) or (DM1.tNotaFiscallkCodNatOper.AsInteger = 612)
                  //or (DM1.tNotaFiscallkCodNatOper.AsInteger = 712) then
                    begin
                      //Tirar C200 conforme a Tati
                      //if DM1.tNotaFiscalSituacao.AsString = '2' then
                      //  Soma_C200;
                      //************
                      tAuxFatDiario.SetKey;
                      tAuxFatDiarioDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                      if tAuxFatDiario.GotoKey then
                        begin
                          tAuxFatDiario.Edit;
                          if DM1.tNotaFiscalSituacao.AsInteger > 0 then
                            begin
                              tAuxFatDiarioVlrNormal.AsFloat := tAuxFatDiarioVlrNormal.AsFloat + DM1.tNotaFiscalVlrTotalNota.AsFloat;
                              tAuxFatDiarioVlrTotal.AsFloat := tAuxFatDiarioVlrTotal.AsFloat + DM1.tNotaFiscalVlrTotalNota.AsFloat;
                            end;
                          //Tirar o C200 conforme a Tati
                          //if DM1.tNotaFiscalSituacao.AsString = '2' then
                          //  begin
                          //    tAuxFatDiarioVlrC200.AsCurrency  := tAuxFatDiarioVlrC200.AsCurrency + vValorC200;
                          //    tAuxFatDiarioVlrTotal.AsCurrency := tAuxFatDiarioVlrTotal.AsCurrency + vValorC200;
                          //  end;
                          //*********
                          tAuxFatDiario.Post;
                        end
                      else
                        begin
                          tAuxFatDiario.Insert;
                          tAuxFatDiarioDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                          if DM1.tNotaFiscalSituacao.AsInteger > 0 then
                            begin
                              tAuxFatDiarioVlrNormal.AsFloat := DM1.tNotaFiscalVlrTotalNota.AsFloat;
                              tAuxFatDiarioVlrTotal.AsFloat  := DM1.tNotaFiscalVlrTotalNota.AsFloat;
                            end;
                          //Tirar o C200 conforme a Tati
                          //
                          //if DM1.tNotaFiscalSituacao.AsString = '2' then
                          //  begin
                          //    tAuxFatDiarioVlrC200.AsCurrency  := vValorC200;
                          //    tAuxFatDiarioVlrTotal.AsCurrency := tAuxFatDiarioVlrTotal.AsCurrency + vValorC200;
                          //  end;
                          //****************
                          tAuxFatDiario.Post;
                        end;
                    end
                  else
                //verificar como fazer
                  if DM1.tNotaFiscallkTipoFat.AsString = 'X' then
                    begin
                      tAuxFatDiario.SetKey;
                      tAuxFatDiarioDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                      if tAuxFatDiario.GotoKey then
                        begin
                          tAuxFatDiario.Edit;
                          if DM1.tNotaFiscalSituacao.AsInteger > 0 then
                            begin
                              tAuxFatDiarioVlrExportacao.AsFloat := tAuxFatDiarioVlrExportacao.AsFloat + DM1.tNotaFiscalVlrTotalNota.AsFloat;
                              tAuxFatDiarioVlrTotal.AsFloat      := tAuxFatDiarioVlrTotal.AsFloat + DM1.tNotaFiscalVlrTotalNota.AsFloat;
                            end;
                          tAuxFatDiario.Post;
                        end
                      else
                        begin
                          tAuxFatDiario.Insert;
                          tAuxFatDiarioDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                          if DM1.tNotaFiscalSituacao.AsInteger > 0 then
                            begin
                              tAuxFatDiarioVlrExportacao.AsFloat := DM1.tNotaFiscalVlrTotalNota.AsFloat;
                              tAuxFatDiarioVlrTotal.AsFloat      := DM1.tNotaFiscalVlrTotalNota.AsFloat;
                            end;
                          tAuxFatDiario.Post;
                        end;
                    end
                  else
                  if DM1.tNotaFiscallkTipoFat.AsString = 'Q' then
                    begin
                      tAuxFatDiario.SetKey;
                      tAuxFatDiarioDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                      if tAuxFatDiario.GotoKey then
                        begin
                          tAuxFatDiario.Edit;
                          if DM1.tNotaFiscalSituacao.AsInteger > 0 then
                            begin
                              tAuxFatDiarioVlrEquiparado.AsFloat := tAuxFatDiarioVlrEquiparado.AsFloat + DM1.tNotaFiscalVlrTotalNota.AsFloat;
                              tAuxFatDiarioVlrTotal.AsFloat      := tAuxFatDiarioVlrTotal.AsFloat + DM1.tNotaFiscalVlrTotalNota.AsFloat;
                            end;
                          tAuxFatDiario.Post;
                        end
                      else
                        begin
                          tAuxFatDiario.Insert;
                          tAuxFatDiarioDtEmissao.AsDateTime := DM1.tNotaFiscalDtEmissao.AsDateTime;
                          if DM1.tNotaFiscalSituacao.AsInteger > 0 then
                            begin
                              tAuxFatDiarioVlrEquiparado.AsFloat := DM1.tNotaFiscalVlrTotalNota.AsFloat;
                              tAuxFatDiarioVlrTotal.AsFloat      := DM1.tNotaFiscalVlrTotalNota.AsFloat;
                            end;
                          tAuxFatDiario.Post;
                        end;
                    end;
                end;
            end;
          DM1.tNotaFiscal.Next;
        end;
      DM1.tNotaFiscal.CancelRange;
      DM1.tNotaFiscal.IndexFieldNames := 'NumNota';
      RxDBFilter2.Active := False;
      tPedidoNota.IndexFieldNames := 'DtNota';
      tPedidoNota.SetRangeStart;
      tPedidoNotaDtNota.AsDateTime  := DateEdit1.Date;
      tPedidoNota.SetRangeEnd;
      tPedidoNotaDtNota.AsDateTime  := DateEdit2.Date;
      tPedidoNota.ApplyRange;
      tPedidoNota.First;
      while not tPedidoNota.EOF do
        begin
          DM1.tPedido.SetKey;
          DM1.tPedidoPedido.AsInteger := tPedidoNotaPedido.AsInteger;
          if (DM1.tPedido.GotoKey) and (DM1.tPedidoQtdFatMan.AsInteger > 0) then
            begin
              tAuxFatDiario.SetKey;
              tAuxFatDiarioDtEmissao.AsDateTime := tPedidoNotaDtNota.AsDateTime;
              if tAuxFatDiario.GotoKey then
                begin
              //Tirar o C400 conforme a Tati
              //
              //    DM1.tPedidoItem.SetKey;
              //    DM1.tPedidoItemPedido.AsInteger := tPedidoNotaPedido.AsInteger;
              //    DM1.tPedidoItemItem.AsInteger   := tPedidoNotaItem.AsInteger;
              //    if DM1.tPedidoItem.GotoKey then
              //      begin
              //        tAuxFatDiario.Edit;
              //        tAuxFatDiarioVlrC400.AsFloat   := tAuxFatDiarioVlrC400.AsFloat   + (DM1.tPedidoItemQtdFatMan.AsFloat * (DM1.tPedidoItemPreco.AsFloat - DM1.tPedidoItemVlrDesconto.AsFloat));
              //        if DM1.tPedidoSituacao.AsInteger > 0 then
              //          tAuxFatDiarioVlrTotal.AsFloat := tAuxFatDiarioVlrTotal.AsFloat + (DM1.tPedidoItemQtdFatMan.AsFloat * (DM1.tPedidoItemPreco.AsFloat - DM1.tPedidoItemVlrDesconto.AsFloat));
              //        tAuxFatDiario.Post;
              //      end;
                end
              else
                begin
                //Tirar o C400 conforme a Tati
                //
                //  DM1.tPedidoItem.SetKey;
                //  DM1.tPedidoItemPedido.AsInteger := tPedidoNotaPedido.AsInteger;
                //  DM1.tPedidoItemItem.AsInteger   := tPedidoNotaItem.AsInteger;
                //  if DM1.tPedidoItem.GotoKey then
                //    begin
                //      tAuxFatDiario.Insert;
                //      tAuxFatDiarioDtEmissao.AsDateTime := tPedidoNotaDtNota.AsDateTime;
                //      tAuxFatDiarioVlrC400.AsFloat   := DM1.tPedidoItemQtdFatMan.AsFloat * (DM1.tPedidoItemPreco.AsFloat - DM1.tPedidoItemVlrDesconto.AsFloat);
                //      if DM1.tPedidoSituacao.AsInteger > 0 then
                //        tAuxFatDiarioVlrTotal.AsFloat := DM1.tPedidoItemQtdFatMan.AsFloat * (DM1.tPedidoItemPreco.AsFloat - DM1.tPedidoItemVlrDesconto.AsFloat);
                //      tAuxFatDiario.Post;
                //    end;
                end;
            end;
          tPedidoNota.Next;
        end;
      tPedidoNota.CancelRange;
      tAuxFatDiario.EnableControls;
      Normal := 0; C200 := 0; C400 := 0; Devolucao := 0; TotalGeral := 0; Equiparado := 0; Exportacao := 0;
      tAuxFatDiario.First;
      while not tAuxFatDiario.EOF do
        begin
          Normal     := Normal     + tAuxFatDiarioVlrNormal.AsCurrency;
          C200       := C200       + tAuxFatDiarioVlrC200.AsCurrency;
          C400       := C400       + tAuxFatDiarioVlrC400.AsCurrency;
          Equiparado := Equiparado + tAuxFatDiarioVlrEquiparado.AsCurrency;
          Exportacao := Exportacao + tAuxFatDiarioVlrExportacao.AsCurrency;
          Devolucao  := Devolucao  + tAuxFatDiarioVlrDevolucao.AsCurrency;
          TotalGeral := TotalGeral + tAuxFatDiarioVlrTotal.AsCurrency;
          tAuxFatDiario.Next;
        end;
      Label4.Caption := FormatFloat('###,###,##0.00',Normal);
      Label5.Caption := FormatFloat('###,###,##0.00',Equiparado);
      Label6.Caption := FormatFloat('###,###,##0.00',Exportacao);
      Label7.Caption := FormatFloat('###,###,##0.00',Devolucao);
      Label8.Caption := FormatFloat('###,###,##0.00',Totalgeral);
      Screen.Cursor := crDefault;
    end;
end;

procedure TfConsFatDiario.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsFatDiario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
