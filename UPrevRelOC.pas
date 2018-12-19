unit UPrevRelOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, Db, DBTables, MemTable,
  Grids, DBGrids, RXDBCtrl, RXCtrls, Menus, QuickRpt, ShellApi;

type
  TfPrevRelOC = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    mOC: TMemoryTable;
    mOCNumOC: TIntegerField;
    mOCDtEmissao: TDateField;
    mOCCodForn: TIntegerField;
    mOCVlrTotal: TFloatField;
    mOCVlrMercEntr: TFloatField;
    mOCVlrMercAberto: TFloatField;
    mOClkFornecedor: TStringField;
    mOCDtEntrega: TDateField;
    msOC: TDataSource;
    mOCCodCondPgto: TIntegerField;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    ImpressoDOS1: TMenuItem;
    ImpressoWindows1: TMenuItem;
    CheckBox1: TCheckBox;
    tAuxiliar: TTable;
    qAux: TQuery;
    tAuxiliarData: TDateField;
    tAuxiliarVlrTot: TFloatField;
    DataSource1: TDataSource;
    QRCompositeReport1: TQRCompositeReport;
    msOCPArc: TDataSource;
    mOCParc: TMemoryTable;
    mOCParcData2: TDateField;
    mOCParcData3: TDateField;
    mOCParcData4: TDateField;
    mOCParcData5: TDateField;
    mOCParcData6: TDateField;
    mOCParcData7: TDateField;
    mOCParcData8: TDateField;
    mOCParcData9: TDateField;
    mOCParcValor1: TFloatField;
    mOCParcValor2: TFloatField;
    mOCParcValor3: TFloatField;
    mOCParcValor4: TFloatField;
    mOCParcValor5: TFloatField;
    mOCParcValor6: TFloatField;
    mOCParcValor7: TFloatField;
    mOCParcValor8: TFloatField;
    mOCParcValor9: TFloatField;
    mOCParcNumOC: TIntegerField;
    mOCParcData1: TDateTimeField;
    RxDBGrid1: TRxDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ImpressoDOS1Click(Sender: TObject);
    procedure ImpressoWindows1Click(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mOCParcNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Gera_Dados;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;
    procedure Cria_Tabela;
    procedure Imprime_Resumido;
  public
    { Public declarations }
  end;

var
  fPrevRelOC: TfPrevRelOC;
  linha, pagina : Integer;
  F: TextFile;
  vVlrTotal, vVlrMercEntr, vVlrMercAberto : Real;

implementation

uses UDM1, UEscImpressora, URelOC, DateUtils;

{$R *.DFM}

procedure TfPrevRelOC.Cria_Tabela;
var
  i : Integer;
begin
  tAuxiliar.Active := False;

  if not DirectoryExists('C:\A') then
    CreateDir('C:\A');

  if FileExists('C:\A\dbAuxiliar.DB') then
    begin
      qAux.Active := False;
      qAux.SQL.Clear;
      qAux.SQL.Add('DROP TABLE dbAuxiliar');
      qAux.ExecSQL;
    end;

  qAux.Active := False;
  qAux.SQL.Clear;
  qAux.SQL.Add('CREATE TABLE dbAuxiliar(');
  qAux.SQL.Add('Data DATE, VlrTot NUMERIC(10),');
  qAux.SQL.Add('PRIMARY KEY (DATA))');
  qAux.ExecSQL;
  tAuxiliar.Active := True;
  mOCParc.RecordCount;
  mOCParc.First;
  while not mOCParc.Eof do
    begin
      for i := 1 to 9 do
        begin
          if mOCParc.FieldByName('Data'+IntToStr(i)).AsDateTime > 0 then//<> '00/00/0000' then
            begin
              if tAuxiliar.Locate('Data',mOCParc.FieldByName('Data'+IntToStr(i)).AsDateTime,([LocaseInsensitive])) then
                begin
                  tAuxiliar.Edit;
                  tAuxiliarVlrTot.AsFloat := tAuxiliarVlrTot.AsFloat + mOCParc.FieldByName('Valor'+IntToStr(i)).AsFloat;
                end
              else
                begin
                  tAuxiliar.Insert;
                  tAuxiliarData.AsDateTime := mOCParc.FieldByName('Data'+IntToStr(i)).AsDateTime;
                  tAuxiliarVlrTot.AsFloat  := mOCParc.FieldByName('Valor'+IntToStr(i)).AsFloat;
                end;
              tAuxiliar.Post;
            end;
        end;
      mOCParc.Next;
    end;
end;


procedure TfPrevRelOC.Gera_Dados;
var
  i : Integer;
  vValor : Real;
begin
  DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
  mOCParc.EmptyTable;
  mOC.EmptyTable;
  DM1.tOrdemCompra.Filtered := False;
  Case RadioGroup1.ItemIndex of
    0 : begin
          if CheckBox1.Checked then
            DM1.tOrdemCompra.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Couro = True'
          else
            DM1.tOrdemCompra.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Couro = False';
        end;
    1 : begin
          if CheckBox1.Checked then
            DM1.tOrdemCompra.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Entregue <> True  and Couro = True'
          else
            DM1.tOrdemCompra.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Entregue <> True and Couro = False';
        end;
    2 : begin
          if CheckBox1.Checked then
            DM1.tOrdemCompra.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Entregue = True  and Couro = True'
          else
            DM1.tOrdemCompra.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Entregue = True  and Couro = False';
        end;
  end;
  DM1.tOrdemCompra.Filtered := True;
  DM1.tOrdemCompra.First;
  while not DM1.tOrdemCompra.Eof do
    begin
      if DM1.tOrdemCompraEntregue.AsBoolean then
        begin
          mOC.Insert;
          mOCNumOC.AsInteger       := DM1.tOrdemCompraCodigo.AsInteger;
          mOCDtEmissao.AsDateTime  := DM1.tOrdemCompraDtEmissao.AsDateTime;
          mOCCodForn.AsInteger     := DM1.tOrdemCompraCodFornecedor.AsInteger;
          mOCVlrTotal.AsFloat      := DM1.tOrdemCompraVlrTotal.AsFloat;
          mOCVlrMercEntr.AsFloat   := DM1.tOrdemCompraVlrTotal.AsFloat;
          DM1.tOrdemCompraItem.First;
          while not DM1.tOrdemCompraItem.Eof do
            begin
              if DM1.tOrdemCompraItemDtEntrega.AsDateTime > 1 then
                mOCDtEntrega.AsDateTime := DM1.tOrdemCompraItemDtEntrega.AsDateTime;
              DM1.tOrdemCompraItem.Next;
            end;
          mOCVlrMercAberto.AsFloat := 0;
          mOC.Post;
        end
      else
        begin
          mOC.Insert;
          mOCNumOC.AsInteger       := DM1.tOrdemCompraCodigo.AsInteger;
          mOCDtEmissao.AsDateTime  := DM1.tOrdemCompraDtEmissao.AsDateTime;
          mOCCodForn.AsInteger     := DM1.tOrdemCompraCodFornecedor.AsInteger;
          mOCVlrTotal.AsFloat      := DM1.tOrdemCompraVlrTotal.AsFloat;
          mOCCodCondPgto.AsInteger := Dm1.tOrdemCompraCodCondPgto.AsInteger;
          DM1.tOrdemCompraItem.First;
          while not DM1.tOrdemCompraItem.Eof do
            begin
              mOCVlrMercAberto.AsFloat := mOCVlrMercAberto.AsFloat + (DM1.tOrdemCompraItemQtdRestante.AsFloat * DM1.tOrdemCompraItemVlrUnitario.AsFloat);
              mOCVlrMercEntr.AsFloat   := mOCVlrMercEntr.AsFloat + (DM1.tOrdemCompraItemQtdEntregue.AsFloat * DM1.tOrdemCompraItemVlrUnitario.AsFloat);
              if DM1.tOrdemCompraItemDtEntrega.AsDateTime > 1 then
                mOCDtEntrega.AsDateTime := DM1.tOrdemCompraItemDtEntrega.AsDateTime;
              DM1.tOrdemCompraItem.Next;
            end;
          Dm1.tCondPgto.IndexFieldNames := 'Codigo';
          Dm1.tCondPgto.SetKey;
          Dm1.tCondPgtoCodigo.AsInteger := mOCCodCondPgto.AsInteger;
          if Dm1.tCondPgto.GotoKey then
            begin
              if Dm1.tCondPgtoItem.RecordCount > 0 then
                begin
                  vValor := StrToFloat(FormatFloat('0.00',mOCVlrMercAberto.AsFloat / Dm1.tCondPgtoItem.RecordCount));
                  i := 0;
                  mOCParc.Insert;
                  Dm1.tCondPgtoItem.First;
                  while not Dm1.tCondPgtoItem.Eof do
                    begin
                      inc(i);
                      if i > 9 then
                        DM1.tCondPgtoItem.Last
                      else
                        begin
                          mOCParcNumOC.AsInteger := Dm1.tOrdemCompraCodigo.AsInteger;
                          mOCParc.FieldByName('Data'+IntToStr(i)).AsDateTime := mOCDtEntrega.AsDateTime + Dm1.tCondPgtoItemQtdDias.AsInteger;
                          mOCParc.FieldByName('Valor'+IntToStr(i)).AsFloat   := StrToFloat(FormatFloat('0.00',vValor));
                        end;
                      Dm1.tCondPgtoItem.Next;
                    end;
                  mOCParc.Post;
                end;
            end;
          mOC.Post;
        end;
      DM1.tOrdemCompra.Next;
    end;
  DM1.tOrdemCompra.Filtered := False;
end;

procedure TfPrevRelOC.Imprime_Cabecalho;
var
 i : Integer;
 Texto1 : String;
begin
  pagina := pagina + 1;
  if Pagina > 1 then
    begin
      while linha < 66 do
        begin
          Linha := Linha + 1;
          Writeln(F);
        end;
    end;
  Texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 53 - length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'RELACAO DE ORDENS DE COMPRA  - ';
  Case RadioGroup1.ItemIndex of
    0 : Texto1 := Texto1 + 'Todas                        Pagina.: ';
    1 : Texto1 := Texto1 + 'Pendentes                    Pagina.: ';
    2 : Texto1 := Texto1 + 'Encerradas                   Pagina.: ';
  end;
  Texto1 := Texto1 + IntToStr(pagina);
  Writeln(F,Texto1);
  Texto1 := '                                                     Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text;
  for i := 1 to 113 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'No.O.Compra  Dt.Emissao  Fornecedor                                   Valor Total  Vlr. Merc.Entregue   Valor em Aberto  Dt. Entrega');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfPrevRelOC.Imprime_Detalhe;
var
 i, vContador : Integer;
 Texto1, Texto2 : string;
begin
  Texto1 := mOCNumOC.AsString;
  for i := 1 to 11 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  Texto1 := Texto1 + '  ';
  Texto2 := mOCDtEmissao.AsString;
  for i := 1 to 12 - length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 :=  mOClkFornecedor.AsString;
  for i := 1 to 42 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := FormatFloat('###,###,##0.00',mOCVlrTotal.AsFloat);
  for i := 1 to 14 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Texto2 := FormatFloat('###,###,##0.00',mOCVlrMercEntr.AsFloat);
  for i := 1 to 20 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Texto2 := FormatFloat('###,###,##0.00',mOCVlrMercAberto.AsFloat);
  for i := 1 to 18 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  if mOCDtEntrega.AsDateTime > 1 then
    Texto2 := mOCDtEntrega.AsString
  else
    Texto2 := ' ';
  for i := 1 to 13 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Writeln(F,texto1);
  linha := linha + 1;
  vVlrTotal      := vVlrTotal + mOCVlrTotal.AsFloat;
  vVlrMercEntr   := vVlrMercEntr + mOCVlrMercEntr.AsFloat;
  vVlrMercAberto := vVlrMercAberto + mOCVlrMercAberto.AsFloat;

  vContador := 0;
  texto1 := '     ...Vectos: ';
  if mOCParc.Locate('NumOC',mOCNumOC.AsInteger,[loCaseInsensitive]) then
    begin
      for i := 1 to 9 do
        begin
          if mOCParc.FieldByName('Valor'+IntToStr(i)).AsFloat > 0 then
            begin
              inc(vContador);
              if vContador > 4 then
                begin
                  Writeln(F,texto1);
                  inc(linha);
                  texto1 := '     ...Vectos: ';
                  vContador := 1;
                end;
              texto1 := texto1 + mOCParc.FieldByName('Data'+IntToStr(i)).AsString + ' ' + FormatFloat('###,###,##0.00',mOCParc.FieldByName('Valor'+IntToStr(i)).AsFloat) + '   ';
            end;
        end;
      if vContador > 0 then
        begin
          Writeln(F,texto1);
          inc(linha);
        end;
    end;
end;

procedure TfPrevRelOC.Imprime_Rodape;
var
 i : Integer;
 Texto1, Texto2 : string;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Texto1 := '                         ......Total no Periodo =====>         ';
  Texto2 := FormatFloat('###,###,###,##0.00',vVlrTotal);
  for i := 1 to 18 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Texto2 := FormatFloat('###,###,###,##0.00',vVlrMercEntr);
  for i := 1 to 20 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Texto2 := FormatFloat('###,###,###,##0.00',vVlrMercAberto);
  for i := 1 to 18 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Writeln(F,texto1);
  Writeln(F);
  linha := linha + 3;
  Imprime_Resumido;
end;

procedure TfPrevRelOC.Imprime_Resumido;
var
  Texto1, Texto2 : String;
  I, vContador : Integer;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'    Dt. Venc.   Valor Venc.       Dt. Venc.   Valor Venc.       Dt. Venc.   Valor Venc.       Dt. Venc.   Valor Venc.               ');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
  Texto1 := '';
  Texto2 := '';
  vContador := 1;
  tAuxiliar.First;
  while not tAuxiliar.Eof do
    begin
      Texto2 := '    ' + tAuxiliarData.AsString;
      for i := 1 to 14 - Length(Texto2) do
        Texto2 := Texto2 + ' ';
      Texto1 := Texto1 + Texto2;
      Texto2 := FormatFloat('###,###,##0.00',tAuxiliarVlrTot.AsFloat);
      for i := 1 to 12 - Length(Texto2) do
        Texto2 := ' ' + Texto2;
      Texto1 := Texto1 + Texto2 + '    ';
      if vContador = 4 then
        begin
          Writeln(F,Texto1);
          vContador := 0;
          Linha := Linha + 1;
          Texto1 := '';
        end;
      Inc(vContador);
      tAuxiliar.Next;
    end;
  Texto1 := '';
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevRelOC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      Dm1.tCondPgto.Close;
      Dm1.tCondPgtoItem.Close;
      DM1.tOrdemCompra.Close;
      DM1.tOrdemCompraItem.Close;
      DM1.tOrdemCompraItemGrade.Close;
      DM1.tFornecedores.Close;
      DM1.tMaterial.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevRelOC.BitBtn2Click(Sender: TObject);
begin
  RadioGroup1.ItemIndex := 0;
  DateEdit1.Clear;
  DateEdit2.Clear;
  RadioGroup1.SetFocus;
end;

procedure TfPrevRelOC.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelOC.ImpressoDOS1Click(Sender: TObject);
var
  Texto : String;
begin
  Screen.Cursor  := crHourGlass;
  Gera_Dados;
  Cria_Tabela;
  Screen.Cursor  := crDefault;
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha          := 99;
  pagina         := 0;
  vVlrTotal      := 0;
  vVlrMercEntr   := 0;
  vVlrMercAberto := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  mOC.First;
  while not mOC.Eof do
    begin
      if linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      mOC.Next;
    end;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfPrevRelOC.ImpressoWindows1Click(Sender: TObject);
begin
  Screen.Cursor  := crHourGlass;
  Gera_Dados;
  Cria_Tabela;
  tAuxiliar.First;
  Screen.Cursor  := crDefault;
  fRelOC := TfRelOC.Create(Self);
  QRCompositeReport1.Preview;
  fRelOC.QuickRep2.Free;
end;

procedure TfPrevRelOC.QRCompositeReport1AddReports(Sender: TObject);
begin
  QRCompositeReport1.Reports.Add(fRelOC.QuickRep1);
  QRCompositeReport1.Reports.Add(fRelOC.QuickRep2);
end;

procedure TfPrevRelOC.FormShow(Sender: TObject);
begin
  mOC.open;
  Dm1.tCondPgto.Open;
  Dm1.tCondPgtoItem.Open;
  DM1.tOrdemCompra.Open;
  DM1.tOrdemCompraItem.Open;
  DM1.tOrdemCompraItemGrade.Open;
  DM1.tFornecedores.Open;
  DM1.tMaterial.Open;
end;

procedure TfPrevRelOC.mOCParcNewRecord(DataSet: TDataSet);
var
  i : Integer;
begin
  for i := 1 to 9 do
    begin
      mOCParc.FieldByName('Data'+IntToStr(i)).AsFloat := 0;
      mOCParc.FieldByName('Valor'+IntToStr(i)).AsFloat := 0;
    end;
end;

end.
