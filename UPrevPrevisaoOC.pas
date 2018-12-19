unit UPrevPrevisaoOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, DBTables, Db, Grids, DBGrids,
  MemTable, DBClient;

type
  TfPrevPrevisaoOC = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tAuxiliar: TTable;
    qAux: TQuery;
    tAuxiliarData: TDateField;
    tAuxiliarValor: TFloatField;
    tOCItens: TTable;
    tOCItensCodigo: TIntegerField;
    tOCItensItem: TIntegerField;
    tOCItensCodMaterial: TIntegerField;
    tOCItensCodCor: TIntegerField;
    tOCItensQtd: TFloatField;
    tOCItensVlrUnitario: TFloatField;
    tOCItensAliqIPI: TFloatField;
    tOCItensVlrIPI: TFloatField;
    tOCItensDtEntrega: TDateField;
    tOCItensVlrTotal: TFloatField;
    tOCItensCodGrade: TIntegerField;
    tOCItensQtdEntregue: TFloatField;
    tOCItensQtdRestante: TFloatField;
    tOCItensUnidade: TStringField;
    DataSource1: TDataSource;
    mSemana: TMemoryTable;
    mSemanaData1: TDateField;
    mSemanaData2: TDateField;
    mSemanaData3: TDateField;
    mSemanaData4: TDateField;
    mSemanaData5: TDateField;
    mSemanaData6: TDateField;
    mSemanaData7: TDateField;
    mSemanaValor1: TFloatField;
    mSemanaValor2: TFloatField;
    mSemanaValor3: TFloatField;
    mSemanaValor4: TFloatField;
    mSemanaValor5: TFloatField;
    mSemanaValor6: TFloatField;
    mSemanaValor7: TFloatField;
    mSemanatotal: TFloatField;
    CheckBox1: TCheckBox;
    DataSource2: TDataSource;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox2: TComboBox;
    mAuxiliar: TClientDataSet;
    qOrdemCompraSelecao: TQuery;
    DataSource3: TDataSource;
    mAuxiliarNumOC: TIntegerField;
    mAuxiliarDtEmissao: TDateField;
    mAuxiliarCodForn: TIntegerField;
    mAuxiliarVlrTotal: TFloatField;
    mAuxiliarDtEntrega: TDateField;
    mAuxiliarCodCondPgto: TIntegerField;
    qOrdemCompraSelecaocodigo: TIntegerField;
    mAuxiliarVlrParcela: TFloatField;
    mAuxiliarNomeFornecedor: TStringField;
    mAuxiliarNomeCondPgto: TStringField;
    mAuxiliarDtVencimento: TDateField;
    mAuxiliarVlrEntregue: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Cria_Tabela;
    procedure Grava_Aux;
    procedure Gera_Semana;
    procedure Filtra_Datas;
    procedure Gera_Semana2;
    procedure Atualiza_Totais;

    procedure Popula_Auxiliar;

  public
    { Public declarations }
  end;

var
  fPrevPrevisaoOC: TfPrevPrevisaoOC;


implementation

uses UDM1, URelPrevisaoOC, URelPrevisaoOCDetalhado;

{$R *.DFM}

procedure TfPrevPrevisaoOC.Filtra_Datas;
begin
  tAuxiliar.Filtered := False;
  tAuxiliar.Filter   := 'Data >= '''+DateEdit1.Text+''' and Data <= '''+DateEdit2.Text+'''';
  tAuxiliar.Filtered := True;
end;

procedure TfPrevPrevisaoOC.Cria_Tabela;
begin
  tAuxiliar.Active := False;

  if not DirectoryExists('C:\A') then
    CreateDir('C:\A');

  if FileExists('C:\A\dbAuxiliar.DB') then
    begin
      qAux.Close;
      qAux.SQL.Clear;
      qAux.SQL.Add('DROP TABLE dbAuxiliar');
      qAux.ExecSQL;
    end;
  qAux.Close;
  qAux.SQL.Clear;
  qAux.SQL.Add('CREATE TABLE dbAuxiliar(');
  qAux.SQL.Add('Data DATE, Valor NUMERIC(10),');
  qAux.SQL.Add('PRIMARY KEY (Data))');
  qAux.ExecSQL;
  tAuxiliar.Open;
end;

// substituida pela Popula_Aux.

procedure TfPrevPrevisaoOC.Grava_Aux;
var
  vTotal, vTotParcela : Real;
  vData : TDateTime;
begin
  tOCItens.Filtered := False;
//  tOCItens.Filter   := 'DtEntrega >= '''+DateEdit1.Text+''' and DtEntrega <= '''+DateEdit2.Text+''' and QtdRestante > 0';
  tOCItens.Filter   := 'QtdRestante > 0';
  tOCItens.Filtered := True;
  tOCItens.First;
  while not tOCItens.Eof do
    begin
      vTotal := tOCItensQtdRestante.AsFloat * tOCItensVlrUnitario.AsFloat;
      Dm1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
      Dm1.tOrdemCompra.SetKey;
      DM1.tOrdemCompraFilial.AsInteger := 1;
      Dm1.tOrdemCompraCodigo.AsInteger := tOCItensCodigo.AsInteger;
      if Dm1.tOrdemCompra.GotoKey then
        begin
          Dm1.tCondPgto.IndexFieldNames := 'Codigo';
          Dm1.tCondPgto.SetKey;
          Dm1.tCondPgtoCodigo.AsInteger := Dm1.tOrdemCompraCodCondPgto.AsInteger;
          if Dm1.tCondPgto.GotoKey then
            begin
              Dm1.tCondPgtoItem.First;
              if Dm1.tCondPgtoItem.RecordCount > 0 then
                begin
                  vTotParcela := vTotal / Dm1.tCondPgtoItem.RecordCount;
                  while not Dm1.tCondPgtoItem.Eof do
                    begin
                      vData := tOCItensDtEntrega.AsDateTime + Dm1.tCondPgtoItemQtdDias.AsInteger;

                      if tAuxiliar.Locate('Data',vData,([])) then
                        begin
                         tAuxiliar.Edit;
                         tAuxiliarValor.AsFloat := tAuxiliarValor.AsFloat + vTotParcela;
                        end
                      else
                        begin
                          tAuxiliar.Insert;
                          tAuxiliarData.AsDateTime := vData;
                          tAuxiliarValor.AsFloat := vTotParcela;
                        end;
                      tAuxiliar.Post;
                      Dm1.tCondPgtoItem.Next;
                    end;
                end
              else
                begin
                  vData := tOCItensDtEntrega.AsDateTime;
                  if tAuxiliar.Locate('Data',vData,([])) then
                    begin
                     tAuxiliar.Edit;
                     tAuxiliarValor.AsFloat := vTotParcela;
                    end
                  else
                    begin
                      tAuxiliar.Insert;
                      tAuxiliarData.AsDateTime := vData;
                      tAuxiliarValor.AsFloat := vTotParcela;
                    end;
                  tAuxiliar.Post;
                end;
            end;
        end;
      tOCItens.Next;
    end;
end;

procedure TfPrevPrevisaoOC.Gera_Semana;
var
  vDataI, vDataF, vDataAux : TDate;
begin
  mSemana.EmptyTable;
  mAuxiliar.First;
  while not mAuxiliar.Eof do
    begin

      //tAuxiliarData.AsDateTime;

      vDataI := mAuxiliarDtVencimento.AsDateTime;
      vDataF := mAuxiliarDtVencimento.AsDateTime;

      if DayOfWeek(vDataI) > 1 then
        vDataI := vDataI - (DayOfWeek(vDataI) - 1);

      if DayOfWeek(vDataF) < 7 then
        vDataF := vDataF + (7 - DayOfWeek(vDataF));

      if mSemana.Locate('Data1',vDataI,([locaseinsensitive])) then
        begin
          mSemana.Edit;
          mSemana.FieldByName('Data'+IntToStr(DayOfWeek(mAuxiliarDtVencimento.AsDateTime))).AsDateTime := mAuxiliarDtVencimento.AsDateTime;
          mSemana.FieldByName('Valor'+IntToStr(DayOfWeek(mAuxiliarDtVencimento.AsDateTime))).AsFloat   := mAuxiliarVlrParcela.AsFloat;
          mSemana.Post;
        end
      else
        begin
          vDataAux := vDataI;
          mSemana.Insert;
          while vDataAux <= vDataF do
            begin
              mSemana.FieldByName('Data'+IntToStr(DayOfWeek(vDataAux))).AsDateTime := vDataAux;
              mSemana.FieldByName('Valor'+IntToStr(DayOfWeek(vDataAux))).AsFloat   := 0;

              if vDataAux = mAuxiliarDtVencimento.AsDateTime then
                mSemana.FieldByName('Valor'+IntToStr(DayOfWeek(vDataAux))).AsFloat := mAuxiliarVlrParcela.AsFloat;
              vDataAux := vDataAux + 1;
            end;
          mSemana.Post;
        end;
      mAuxiliar.Next;
    end;

  //tAuxiliar.Filtered := False;
  //tAuxiliar.First;

  //while not tAuxiliar.Eof do
  //  tAuxiliar.Delete;

  Atualiza_Totais;
end;

procedure TfPrevPrevisaoOC.Gera_Semana2;
var
  vDataI, vDataF, vDataAux : TDate;
  vCount: Integer;
  vPos: Integer;
begin
  mSemana.EmptyTable;
  mAuxiliar.First;
  while not mAuxiliar.Eof do
    begin
      vDataI := mAuxiliarDtVencimento.AsDateTime;
      vDataF := mAuxiliarDtVencimento.AsDateTime;

      if DayOfWeek(vDataI) = 1 then
        vDataI := vDataI - 6
      else
        if DayOfWeek(vDataI) > 2 then
          vDataI := vDataI - (DayOfWeek(vDataI) - 2);

      vDataF := vDataI + 6;

      if mSemana.Locate('Data1',vDataI,([locaseinsensitive])) then
        begin
          if DayOfWeek(mAuxiliarDtVencimento.AsDateTime) = 1 then
            vPos := 7
          else
            vPos := (DayOfWeek(mAuxiliarDtVencimento.AsDateTime)-1);
          mSemana.Edit;
          mSemana.FieldByName('Data'+IntToStr(vPos)).AsDateTime := mAuxiliarDtVencimento.AsDateTime;
          mSemana.FieldByName('Valor'+IntToStr(vPos)).AsFloat   := mAuxiliarVlrParcela.AsFloat;
          mSemana.Post;
        end
      else
        begin
          vDataAux := vDataI;
          mSemana.Insert;
          while vDataAux <= vDataF do
            begin
              if DayOfWeek(vDataAux) = 1 then
                vPos := 7
              else
                vPos := (DayOfWeek(vDataAux)-1);
              mSemana.FieldByName('Data'+IntToStr(vPos)).AsDateTime := vDataAux;
              mSemana.FieldByName('Valor'+IntToStr(vPos)).AsFloat   := 0;
              if vDataAux = mAuxiliarDtVencimento.AsDateTime then
                mSemana.FieldByName('Valor'+IntToStr(vPos)).AsFloat := mAuxiliarVlrParcela.AsFloat;
              vDataAux := vDataAux + 1;
            end;
          mSemana.Post;
        end;
      mAuxiliar.Next;
    end;

   //tAuxiliar.Filtered := False;
   //tAuxiliar.First;

  //while not tAuxiliar.Eof do
  //  tAuxiliar.Delete;

  Atualiza_Totais;
end;



procedure TfPrevPrevisaoOC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tOrdemCompra.Filtered := False;
  if Screen.FormCount < 3 then
    begin
      Dm1.tOrdemCompra.Close;
      DM1.tOrdemCompraItem.Close;
      DM1.tOrdemCompraItemGrade.Close;
      Dm1.tCondPgto.Close;
      Dm1.tCondPgtoItem.Close;
      DM1.tFornecedores.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevPrevisaoOC.BitBtn1Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
end;

procedure TfPrevPrevisaoOC.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevPrevisaoOC.BitBtn6Click(Sender: TObject);
begin

{  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    begin
      Cria_Tabela;
      Grava_Aux;
      Filtra_Datas;

      if not CheckBox1.Checked then
        Gera_Semana
      else
        Gera_Semana2;

      fRelPrevisaoOC := TfRelPrevisaoOC.Create(Self);
      fRelPrevisaoOC.QuickRep1.Preview;
      fRelPrevisaoOC.QuickRep1.Free;
    end
  else
    ShowMessage('Deve haver datas válidas!');
}


  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
  begin
    DM1.tOrdemCompra.Filtered := False;
    case ComboBox2.ItemIndex of
      1 : DM1.tOrdemCompra.Filter   := 'Couro = True';
      2 : DM1.tOrdemCompra.Filter   := 'Couro = False';
    end;
    if ComboBox2.ItemIndex > 0 then
      DM1.tOrdemCompra.Filtered := True;

    Popula_Auxiliar;

    mAuxiliar.Filtered := False;
    mAuxiliar.Filter   := 'DtVencimento >= '''+DateEdit1.Text+''' and DtVencimento <= '''+DateEdit2.Text+'''';
    mAuxiliar.Filtered := True;

    if ComboBox1.ItemIndex = 0 then
    begin

      mAuxiliar.IndexFieldNames := 'DtVencimento';
      mAuxiliar.First;

      if not CheckBox1.Checked then
        Gera_Semana  // inicio no domingo
      else
       Gera_Semana2; // inicio na segunda

      fRelPrevisaoOC := TfRelPrevisaoOC.Create(Self);
      fRelPrevisaoOC.QuickRep1.Preview;
      fRelPrevisaoOC.QuickRep1.Free;
    end
    else
    begin

      mAuxiliar.IndexFieldNames := 'DtVencimento; NumOC';
      mAuxiliar.First;

      fRelPrevisaoOCDetalhado := TfRelPrevisaoOCDetalhado.Create(Self);
      fRelPrevisaoOCDetalhado.QuickRep1.Preview;
      fRelPrevisaoOCDetalhado.QuickRep1.Free;
    end;
    DM1.tOrdemCompra.Filtered := False;
  end
  else
    ShowMessage('Deve haver datas válidas!');

end;

procedure TfPrevPrevisaoOC.FormShow(Sender: TObject);
begin
  Dm1.tOrdemCompra.Open;
  DM1.tOrdemCompraItem.Open;
  DM1.tOrdemCompraItemGrade.Open;
  Dm1.tCondPgto.Open;
  Dm1.tCondPgtoItem.Open;
  DM1.tFornecedores.Open;
end;

procedure TfPrevPrevisaoOC.Atualiza_Totais;
begin
  mSemana.First;
  while not mSemana.Eof do
  begin
    mSemana.Edit;
    mSemana.FieldByName('Total').AsFloat := mSemana.FieldByName('Valor1').AsFloat+
                                            mSemana.FieldByName('Valor2').AsFloat+
                                            mSemana.FieldByName('Valor3').AsFloat+
                                            mSemana.FieldByName('Valor4').AsFloat+
                                            mSemana.FieldByName('Valor5').AsFloat+
                                            mSemana.FieldByName('Valor6').AsFloat+
                                            mSemana.FieldByName('Valor7').AsFloat;
    mSemana.Post;
    mSemana.Next;
  end;
  mSemana.First;
end;

procedure TfPrevPrevisaoOC.ComboBox1Change(Sender: TObject);
begin
   CheckBox1.Enabled := ComboBox1.ItemIndex = 0;
end;

procedure TfPrevPrevisaoOC.Popula_Auxiliar;

var
  vVlrTotalParc, vVlrValorTotalRest: Real;

  procedure Insere_Auxiliar( Opcao: Integer; Data_Vencimento: TDateTime; Valor_Total, Valor_Entregue, Valor_Parcela: Real );
  var
    bAchou: Boolean;
  begin
    bAchou := False;
    if Opcao = 0 then
    begin
      bAchou := mAuxiliar.Locate('DtVencimento',Data_Vencimento,([]));
      if bAchou then
      begin
        mAuxiliar.Edit;
        mAuxiliarVlrTotal.AsFloat    := mAuxiliarVlrTotal.AsFloat    + Valor_Total;
        mAuxiliarVlrEntregue.AsFloat := mAuxiliarVlrEntregue.AsFloat + Valor_Entregue;
        mAuxiliarVlrParcela.AsFloat  := mAuxiliarVlrParcela.AsFloat  + Valor_Parcela;
        mAuxiliar.Post;
      end
      else
      begin
        mAuxiliar.Insert;
        mAuxiliarNumOC.AsInteger         := Dm1.tOrdemCompraCodigo.AsInteger;
        mAuxiliarDtVencimento.AsDateTime := Data_Vencimento;
        mAuxiliarVlrTotal.AsFloat        := Valor_Total;
        mAuxiliarVlrEntregue.AsFloat     := Valor_Entregue;
        mAuxiliarVlrParcela.AsFloat      := Valor_Parcela;
      end;
    end
    else
    begin

      mAuxiliar.Insert;
      mAuxiliarNumOC.AsInteger         := Dm1.tOrdemCompraCodigo.AsInteger;
      mAuxiliarDtEmissao.AsDateTime    := Dm1.tOrdemCompraDtEmissao.AsDateTime;
      mAuxiliarCodForn.AsInteger       := Dm1.tOrdemCompraCodFornecedor.AsInteger;
      mAuxiliarNomeFornecedor.AsString := Dm1.tOrdemCompralkFornecedor.AsString;
      mAuxiliarCodCondPgto.AsInteger   := Dm1.tOrdemCompraCodCondPgto.AsInteger;
      mAuxiliarNomeCondPgto.AsString   := Dm1.tOrdemCompralkCondsPgto.AsString;

      mAuxiliarVlrTotal.AsFloat        := Valor_Total;
      mAuxiliarVlrEntregue.AsFloat     := Valor_Entregue;
      mAuxiliarDtEntrega.AsDateTime    := Dm1.tOrdemCompraItemDtEntrega.AsDateTime;
      mAuxiliarDtVencimento.AsDateTime := Data_Vencimento;
      mAuxiliarVlrParcela.AsFloat      := Valor_Parcela;
      mAuxiliar.Post;
    end;
  end;

var
  vVlrTotal,
  vVlrEntregue,
  vVlrParcela: Real;


  vDifTotal,
  vDifEntregue,
  vDifParcela: Real;
begin

  mAuxiliar.EmptyDataSet;
  mAuxiliar.IndexFieldNames := '';

  qOrdemCompraSelecao.Close;
  qOrdemCompraSelecao.SQL.Clear;

  qOrdemCompraSelecao.SQL.Add('select distinct o.codigo');
  qOrdemCompraSelecao.SQL.Add('from dbordemcompra o');
  qOrdemCompraSelecao.SQL.Add('inner join dbordemcompraitem.db i');
  qOrdemCompraSelecao.SQL.Add('  on  o.Filial = i.Filial');
  qOrdemCompraSelecao.SQL.Add('  and o.Codigo = i.Codigo');
  qOrdemCompraSelecao.SQL.Add('where i.QtdRestante > 0');

  case ComboBox2.ItemIndex of
    1 : qOrdemCompraSelecao.SQL.Add('   and o.Couro = True ');
    2 : qOrdemCompraSelecao.SQL.Add('   and (( o.Couro = False) or (o.Couro is null )) ');
  end;
  
  qOrdemCompraSelecao.Open;
  qOrdemCompraSelecao.First;

  // OC Selecionadas
  while not qOrdemCompraSelecao.Eof do
  begin

    Dm1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
    Dm1.tOrdemCompra.SetKey;
    DM1.tOrdemCompraFilial.AsInteger := 1;
    Dm1.tOrdemCompraCodigo.AsInteger := qOrdemCompraSelecaocodigo.AsInteger;
    // OC
    if Dm1.tOrdemCompra.GotoKey then
    begin
       vVlrTotalParc      := 0;
       vVlrValorTotalRest :=0;
       // OC Item
       Dm1.tOrdemCompraItem.First;
       while not Dm1.tOrdemCompraItem.Eof do
       begin

         //
         vDifTotal    := ((Dm1.tOrdemCompraItemQtd.AsFloat         * Dm1.tOrdemCompraItemVlrUnitario.AsFloat));
         vDifEntregue := ((Dm1.tOrdemCompraItemQtdEntregue.AsFloat * Dm1.tOrdemCompraItemVlrUnitario.AsFloat));
         vDifParcela  := ((Dm1.tOrdemCompraItemQtdRestante.AsFloat * Dm1.tOrdemCompraItemVlrUnitario.AsFloat));
         //

         // Condicao pagamento
         Dm1.tCondPgto.IndexFieldNames := 'Codigo';
         Dm1.tCondPgto.SetKey;
         Dm1.tCondPgtoCodigo.AsInteger := Dm1.tOrdemCompraCodCondPgto.AsInteger;
         if Dm1.tCondPgto.GotoKey then
         begin
           // Condicao pagamento item
           Dm1.tCondPgtoItem.First;
           if not Dm1.tCondPgtoItem.Eof then
           begin
             vVlrEntregue := StrToFloat(FormatFloat('0.00',((Dm1.tOrdemCompraItemQtdEntregue.AsFloat * Dm1.tOrdemCompraItemVlrUnitario.AsFloat) / Dm1.tCondPgtoItem.RecordCount)));
             vVlrParcela  := StrToFloat(FormatFloat('0.00',((Dm1.tOrdemCompraItemQtdRestante.AsFloat * Dm1.tOrdemCompraItemVlrUnitario.AsFloat) / Dm1.tCondPgtoItem.RecordCount)));
             vVlrTotal    := StrToFloat(FormatFloat('0.00',((Dm1.tOrdemCompraItemQtd.AsFloat * Dm1.tOrdemCompraItemVlrUnitario.AsFloat) / Dm1.tCondPgtoItem.RecordCount)));
             Dm1.tCondPgtoItem.First;
             while not Dm1.tCondPgtoItem.Eof do
             begin

               //
               vDifTotal    := vDifTotal    - vVlrTotal;
               vDifEntregue := vDifEntregue - vVlrEntregue;
               vDifParcela  := vDifParcela  - vVlrParcela;
               //

               Insere_Auxiliar(ComboBox1.ItemIndex, Dm1.tOrdemCompraItemDtEntrega.AsDateTime + Dm1.tCondPgtoItemQtdDias.AsInteger, vVlrTotal, vVlrEntregue, vVlrParcela );
               Dm1.tCondPgtoItem.Next;
             end;
           end
           else
           begin
             vVlrEntregue := StrToFloat(FormatFloat('0.00',((Dm1.tOrdemCompraItemQtdEntregue.AsFloat * Dm1.tOrdemCompraItemVlrUnitario.AsFloat))));
             vVlrParcela  := StrToFloat(FormatFloat('0.00',((Dm1.tOrdemCompraItemQtdRestante.AsFloat * Dm1.tOrdemCompraItemVlrUnitario.AsFloat))));
             vVlrTotal    := StrToFloat(FormatFloat('0.00',((Dm1.tOrdemCompraItemQtd.AsFloat         * Dm1.tOrdemCompraItemVlrUnitario.AsFloat))));

             //
             vDifTotal    := vDifTotal    - vVlrTotal;
             vDifEntregue := vDifEntregue - vVlrEntregue;
             vDifParcela  := vDifParcela  - vVlrParcela;
             //

             Insere_Auxiliar(ComboBox1.ItemIndex, Dm1.tOrdemCompraItemDtEntrega.AsDateTime, vVlrTotal, vVlrEntregue, vVlrParcela);
           end;
         end;

         //
         if  (vDifTotal <> 0) or (vDifEntregue <>0) or (vDifParcela <> 0) then
         begin
           mAuxiliar.Edit;
           mAuxiliarVlrTotal.AsFloat    := mAuxiliarVlrTotal.AsFloat    + vDifTotal;
           mAuxiliarVlrEntregue.AsFloat := mAuxiliarVlrEntregue.AsFloat + vDifEntregue;
           mAuxiliarVlrParcela.AsFloat  := mAuxiliarVlrParcela.AsFloat  + vDifParcela;
           mAuxiliar.Post;
           //
         end;

         Dm1.tOrdemCompraItem.Next;
       end;
    end;
    qOrdemCompraSelecao.Next;
  end;

end;

procedure TfPrevPrevisaoOC.FormCreate(Sender: TObject);
begin
  Dm1.tOrdemCompra.Filtered := false;
  Dm1.tCondPgto.Filtered    := false;

  mAuxiliar.CreateDataSet;
end;


end.
