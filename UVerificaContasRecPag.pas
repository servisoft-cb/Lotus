unit UVerificaContasRecPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, RzTabs, Buttons, DB, DBClient, Grids,
  DBGrids, SMDBGrid, DBTables, ExtCtrls, CurrEdit, ComCtrls, dmdCadCReceber;

type
  TfVerificaContasRecPag = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    BitBtn3: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    mReceber: TClientDataSet;
    mReceberNumNota: TIntegerField;
    mReceberDtEmissao: TDateField;
    mReceberCodCliente: TIntegerField;
    mReceberNomeCliente: TStringField;
    mReceberVlrDuplicata: TFloatField;
    mPagar: TClientDataSet;
    mPagarNumNota: TIntegerField;
    mPagarDtEntrada: TDateField;
    mPagarCodFornecedor: TIntegerField;
    mPagarNomeFornecedor: TStringField;
    mPagarVlrDuplicata: TFloatField;
    dsmReceber: TDataSource;
    dsmPagar: TDataSource;
    qCReceber: TQuery;
    qCPagar: TQuery;
    qCReceberNumNota: TIntegerField;
    qCReceberFilial: TIntegerField;
    qCReceberDtEmissao: TDateField;
    qCReceberCodCli: TIntegerField;
    qCReceberVlrTotalDupl: TFloatField;
    qCReceberNome: TStringField;
    qCPagarNumNEntr: TIntegerField;
    qCPagarCodForn: TIntegerField;
    qCPagarDtEntrada: TDateField;
    qCPagarNomeForn: TStringField;
    tCReceberParc: TTable;
    tCPagarParc: TTable;
    tCReceber: TTable;
    tCPagar: TTable;
    tCReceberFilial: TIntegerField;
    tCReceberNumCReceber: TIntegerField;
    tCReceberNumNota: TIntegerField;
    tCReceberQuitado: TBooleanField;
    tCReceberCodCli: TIntegerField;
    tCReceberTipoDoc: TStringField;
    tCReceberDtGerado: TDateField;
    tCReceberHistorico: TStringField;
    tCReceberCancelado: TBooleanField;
    tCReceberDuplicataImp: TBooleanField;
    tCReceberVlrTotal: TFloatField;
    tCReceberBoletoImp: TBooleanField;
    qCReceberSerie: TStringField;
    qCReceberNumSeq: TIntegerField;
    tCReceberParcNumCReceber: TIntegerField;
    tCReceberParcParcCReceber: TIntegerField;
    tCReceberParcVlrParcCReceber: TFloatField;
    tCReceberParcDtVencCReceber: TDateField;
    tCReceberParcQuitParcCReceber: TBooleanField;
    tCReceberParcJurosParcCReceber: TFloatField;
    tCReceberParcDtPagParcCReceber: TDateField;
    tCReceberParcCodCli: TIntegerField;
    tCReceberParcNumSeq: TIntegerField;
    tCReceberParcDesconto: TFloatField;
    tCReceberParcPgtoParcial: TFloatField;
    tCReceberParcRestParcela: TFloatField;
    tCReceberParcContaDupl: TSmallintField;
    tCReceberParcSelecionado: TBooleanField;
    tCReceberParcCodVendedor: TIntegerField;
    tCReceberParcBaixada: TBooleanField;
    tCReceberParcPercComissao: TFloatField;
    tCReceberParcVlrComissao: TFloatField;
    tCReceberParcPlanoContas: TIntegerField;
    tCReceberParcAgencia: TStringField;
    tCReceberParcTitPortador: TStringField;
    tCReceberParcCodTipoCobranca: TIntegerField;
    tCReceberParcDespesas: TFloatField;
    tCReceberParcAbatimentos: TFloatField;
    tCReceberParcCodConta: TIntegerField;
    tCReceberParcPgCartorio: TBooleanField;
    tCReceberParcDiasAtraso: TFloatField;
    tCReceberParcLetraCambio: TBooleanField;
    tCReceberParcNroLancExtComissao: TIntegerField;
    tCReceberParcJurosPagos: TFloatField;
    tCReceberParcCancelado: TBooleanField;
    tCReceberParcTitProtestado: TBooleanField;
    tCReceberParcDtGerado: TDateField;
    tCReceberParcTipoDoc: TStringField;
    tCReceberParcVlrDevolucao: TFloatField;
    tCReceberParcDuplicataImp: TBooleanField;
    tCReceberParcPagarParteNaNota: TBooleanField;
    tCReceberParcMercado: TStringField;
    tCReceberParcFilial: TIntegerField;
    tCReceberParcPercComissao2: TFloatField;
    tCReceberParcCodVendedor2: TIntegerField;
    tCReceberParcCodBancoBoleto: TIntegerField;
    tCReceberParcComissaoItem: TBooleanField;
    tCReceberParcTransferencia: TBooleanField;
    tCReceberParcSerie: TStringField;
    tCReceberParcNumSeqNota: TIntegerField;
    tCReceberParcCodPlanoContasItens: TIntegerField;
    tCReceberParcExportacao: TBooleanField;
    tCReceberParcNumNota: TIntegerField;
    tCPagarNumCPagar: TIntegerField;
    tCPagarNumNotaEnt: TIntegerField;
    tCPagarCodForn: TIntegerField;
    tCPagarQuitado: TBooleanField;
    tCPagarTipoDoc: TStringField;
    tCPagarDtGerado: TDateField;
    tCPagarHistorico: TStringField;
    tCPagarNroDuplicata: TIntegerField;
    tCPagarCodAtelier: TIntegerField;
    tCPagarVlrTotal: TFloatField;
    tCPagarCodNatOper: TIntegerField;
    tCPagarSerie: TStringField;
    tCPagarNumSeqNEntrada: TIntegerField;
    tCPagarParcNumCPagar: TIntegerField;
    tCPagarParcParcCPagar: TIntegerField;
    tCPagarParcDtVencCPagar: TDateField;
    tCPagarParcVlrParcCPagar: TFloatField;
    tCPagarParcQuitParcCPagar: TBooleanField;
    tCPagarParcDtPagParcCPagar: TDateField;
    tCPagarParcJurosParcCPagar: TFloatField;
    tCPagarParcCodForn: TIntegerField;
    tCPagarParcNumNotaEnt: TIntegerField;
    tCPagarParcDesconto: TFloatField;
    tCPagarParcPgtoParcial: TFloatField;
    tCPagarParcRestParcela: TFloatField;
    tCPagarParcBanco: TStringField;
    tCPagarParcPlanoContas: TIntegerField;
    tCPagarParcNroDuplicata: TIntegerField;
    tCPagarParcDespesas: TFloatField;
    tCPagarParcAbatimentos: TFloatField;
    tCPagarParcCodConta: TIntegerField;
    tCPagarParcDiasAtraso: TFloatField;
    tCPagarParcJurosPagos: TFloatField;
    tCPagarParcCodTipoCobranca: TIntegerField;
    tCPagarParcDtRecto: TDateField;
    tCPagarParcCodAtelier: TIntegerField;
    tCPagarParcVlrDevolucao: TFloatField;
    tCPagarParcNumNossaNota: TIntegerField;
    tCPagarParcNomeBancoForn: TStringField;
    tCPagarParcAgenciaForn: TStringField;
    tCPagarParcNumContaForn: TStringField;
    tCPagarParcSerie: TStringField;
    tCPagarParcNumSeqNEntrada: TIntegerField;
    qCPagarVlrTotalNEntr: TFloatField;
    TabSheet3: TRzTabSheet;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FDmCadCReceber: TdmCadCReceber;
    ctCReceber_Local : String;

    procedure Monta_SQLCReceber;
    procedure Monta_SQLCPagar;
    procedure Gera_mReceber;
    procedure Gera_mPagar;

    procedure prc_Abrir_CReceber;
    procedure prc_Gravar_CReceber;
    procedure prc_Gravar_CReceberParc;
    procedure prc_Gravar_CReceberParcHist;
    
  public
    { Public declarations }
  end;

var
  fVerificaContasRecPag: TfVerificaContasRecPag;

implementation

uses UDM1;

{$R *.dfm}

procedure TfVerificaContasRecPag.Gera_mPagar;
begin
  mPagar.EmptyDataSet;
  qCPagar.First;
  while not qCPagar.Eof do
    begin
      if not tCPagarParc.Locate('CodForn;NumNotaEnt',VarArrayOf([qCPagarCodForn.AsInteger,qCPagarNumNEntr.AsInteger]),[locaseinsensitive]) then
        begin
          mPagar.Insert;
          mPagarNumNota.AsInteger       := qCPagarNumNEntr.AsInteger;
          mPagarDtEntrada.AsDateTime    := qCPagarDtEntrada.AsDateTime;
          mPagarCodFornecedor.AsInteger := qCPagarCodForn.AsInteger;
          mPagarNomeFornecedor.AsString := qCPagarNomeForn.AsString;
          mPagarVlrDuplicata.AsFloat    := qCPagarVlrTotalNEntr.AsFloat;
          mPagar.Post;
        end
      else
      if not tCPagar.Locate('CodForn;NumNotaEnt',VarArrayOf([qCPagarCodForn.AsInteger,qCPagarNumNEntr.AsInteger]),[locaseinsensitive]) then
        begin
          mPagar.Insert;
          mPagarNumNota.AsInteger       := qCPagarNumNEntr.AsInteger;
          mPagarDtEntrada.AsDateTime    := qCPagarDtEntrada.AsDateTime;
          mPagarCodFornecedor.AsInteger := qCPagarCodForn.AsInteger;
          mPagarNomeFornecedor.AsString := qCPagarNomeForn.AsString;
          mPagarVlrDuplicata.AsFloat    := qCPagarVlrTotalNEntr.AsFloat;
          mPagar.Post;
        end;
      qCPagar.Next;
    end;
end;

procedure TfVerificaContasRecPag.Gera_mReceber;
begin
  mReceber.EmptyDataSet;
  qCReceber.First;
  while not qCReceber.Eof do
    begin
      if qCReceberNumNota.AsInteger > 0 then
      begin
        if not tCReceberParc.Locate('CodCli;NumNota;DtGerado',VarArrayOf([qCReceberCodCli.AsInteger,qCReceberNumNota.AsInteger,qCReceberDtEmissao.AsDateTime]),[locaseinsensitive]) then
          begin
            mReceber.Insert;
            mReceberNumNota.AsInteger    := qCReceberNumNota.AsInteger;
            mReceberDtEmissao.AsDateTime := qCReceberDtEmissao.AsDateTime;
            mReceberCodCliente.AsInteger := qCReceberCodCli.AsInteger;
            mReceberNomeCliente.AsString := qCReceberNome.AsString;
            mReceberVlrDuplicata.AsFloat := qCReceberVlrTotalDupl.AsFloat;
            mReceber.Post;
          end
        else
        if not tCReceber.Locate('CodCli;NumNota;DtGerado',VarArrayOf([qCReceberCodCli.AsInteger,qCReceberNumNota.AsInteger,qCReceberDtEmissao.AsDateTime]),[locaseinsensitive]) then
          begin
            mReceber.Insert;
            mReceberNumNota.AsInteger    := qCReceberNumNota.AsInteger;
            mReceberDtEmissao.AsDateTime := qCReceberDtEmissao.AsDateTime;
            mReceberCodCliente.AsInteger := qCReceberCodCli.AsInteger;
            mReceberNomeCliente.AsString := qCReceberNome.AsString;
            mReceberVlrDuplicata.AsFloat := qCReceberVlrTotalDupl.AsFloat;
            mReceber.Post;
          end;
      end;
      qCReceber.Next;
    end;
end;

procedure TfVerificaContasRecPag.Monta_SQLCReceber;
begin
  qCReceber.Close;
  qCReceber.SQL.Clear;
  qCReceber.SQL.Add('SELECT Dbnotafiscal.NumNota, Dbnotafiscal.Filial, Dbnotafiscal.DtEmissao, Dbnotafiscal.CodCli, Dbnotafiscal.VlrTotalDupl, Dbcliente.Nome, dbNotaFiscal.Serie, dbNotaFiscal.NumSeq');
  qCReceber.SQL.Add('FROM "DBNOTAFISCAL.DB" Dbnotafiscal');
  qCReceber.SQL.Add('   INNER JOIN "dbCliente.DB" Dbcliente');
  qCReceber.SQL.Add('   ON  (Dbnotafiscal.CodCli = Dbcliente.Codigo)');
  qCReceber.SQL.Add('WHERE  (Dbnotafiscal.DtEmissao BETWEEN :Data1 AND :Data2 )');
  qCReceber.SQL.Add('       AND ((dbNotaFiscal.CondPgto = ''P'') or (dbNotaFiscal.CondPgto = ''V''))');
  qCReceber.SQL.Add('       AND ((dbNotaFiscal.Cancelada = False) or (dbNotaFiscal.Cancelada is Null))');
  qCReceber.ParamByName('Data1').AsDate := DateEdit1.Date;
  qCReceber.ParamByName('Data2').AsDate := DateEdit2.Date;
  qCReceber.Open;
end;

procedure TfVerificaContasRecPag.Monta_SQLCPagar;
begin
  qCPagar.Close;
  qCPagar.SQL.Clear;
  qCPagar.SQL.Add('SELECT Dbnentrada.NumNEntr, Dbnentrada.CodForn, Dbnentrada.DtEntrada, Dbfornecedores.NomeForn, Dbnentrada.VlrTotalNEntr');
  qCPagar.SQL.Add('FROM "DBNENTRADA.DB" Dbnentrada');
  qCPagar.SQL.Add('   INNER JOIN "dbFornecedores.DB" Dbfornecedores');
  qCPagar.SQL.Add('   ON  (Dbnentrada.CodForn = Dbfornecedores.CodForn)');
  qCPagar.SQL.Add('WHERE  (Dbnentrada.DtEntrada BETWEEN :Data1 AND :Data2)');
  qCPagar.SQL.Add('      AND  ((dbNEntrada.CondPgto = ''P'')  or (dbNEntrada.CondPgto = ''V''))');
  qCPagar.ParamByName('Data1').AsDate := DateEdit1.Date;
  qCPagar.ParamByName('Data2').AsDate := DateEdit2.Date;
  qCPagar.Open;
end;

procedure TfVerificaContasRecPag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qCPagar.Close;
  qCReceber.Close;
  Action := Cafree;
end;

procedure TfVerificaContasRecPag.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfVerificaContasRecPag.BitBtn1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 0) and (DateEdit2.Date > 0) then
    begin
      Monta_SQLCReceber;
      Gera_mReceber;
      ShowMessage('Final da verificação!');
    end
  else
    ShowMessage('Falta informar as datas!');
end;

procedure TfVerificaContasRecPag.BitBtn2Click(Sender: TObject);
begin
  if (DateEdit1.Date > 0) and (DateEdit2.Date > 0) then
    begin
      Monta_SQLCPagar;
      Gera_mPagar;
      ShowMessage('Final da verificação!');
    end
  else
    ShowMessage('Falta informar as datas!');
end;

procedure TfVerificaContasRecPag.FormShow(Sender: TObject);
begin
  tCReceberParc.Open;
  tCReceberParc.Refresh;
  tCPagarParc.Open;
  tCPagarParc.Refresh;
  tCReceber.Open;
  tCReceber.Refresh;
  tCPagar.Open;
  tCPagar.Refresh;
end;

procedure TfVerificaContasRecPag.BitBtn4Click(Sender: TObject);
var
  vExcluir : Boolean;
begin
  if DateEdit3.Date <= 10 then
  begin
    ShowMessage('Data não informada!');
    exit;
  end;

  if MessageDlg('Deseja excluir o contas a receber?',mtconfirmation,[mbok,mbno],0)=mrNo then
    exit;

  FDmCadCReceber := TdmCadCReceber.Create(Self);
  try
    ctCReceber_Local := FDmCadCReceber.sdsCReceber.CommandText;
    DM1.tCReceber.Open;
    DM1.tCReceberParc.Open;
    DM1.tCReceberParcHist.Open;

    ProgressBar1.Max      := DM1.tCReceber.RecordCount;
    ProgressBar1.Position := 0;

    DM1.tCReceber.First;
    while not DM1.tCReceber.Eof do
    begin
      vExcluir := False;
      ProgressBar1.Position := ProgressBar1.Position + 1;
      if ((DM1.tCReceberDtGerado.AsDateTime >= 10) and (DM1.tCReceberDtGerado.AsDateTime <= DateEdit3.Date)) OR (DM1.tCReceberCancelado.AsBoolean) then
      begin
        vExcluir := True;
        prc_Abrir_CReceber;
        DM1.tCReceberParc.First;
        while not DM1.tCReceberParc.Eof do
        begin
          if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) > 0 then
            vExcluir := False;
          DM1.tCReceberParc.Next;
        end;
        if vExcluir then
        begin
          prc_Gravar_CReceber;
          DM1.tCReceberParc.First;
          while not DM1.tCReceberParc.Eof do
          begin
            prc_Gravar_CReceberParc;
            DM1.tCReceberParcHist.First;
            while not DM1.tCReceberParcHist.Eof do
            begin
              prc_Gravar_CReceberParcHist;
              DM1.tCReceberParcHist.Next;
            end;
            DM1.tCReceberParc.Next;
          end;
          if FDmCadCReceber.cdsCReceber.State in [dsEdit,dsInsert] then
            FDmCadCReceber.cdsCReceber.Post;
          FDmCadCReceber.cdsCReceber.ApplyUpdates(0);

          DM1.tCReceberParc.First;
          while not DM1.tCReceberParc.Eof do
          begin
            DM1.tCReceberParcHist.First;
            while not DM1.tCReceberParcHist.Eof do
              DM1.tCReceberParcHist.Delete;
            DM1.tCReceberParc.Delete;
          end;

        end;
      end;
      if vExcluir then
        DM1.tCReceber.Delete
      else
        DM1.tCReceber.Next;
    end;
  finally
    FreeAndNil(FDmCadCReceber);
  end;

  ShowMessage('Processo finalizado!');

end;

procedure TfVerificaContasRecPag.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    DateEdit4.Visible := not(DateEdit4.Visible);
end;

procedure TfVerificaContasRecPag.prc_Abrir_CReceber;
begin
  FDmCadCReceber.cdsCReceber.Close;
  FDmCadCReceber.sdsCReceber.CommandText := ctCReceber_Local + ' WHERE NUMCRECEBER = ' + IntToStr(DM1.tCReceberNumCReceber.AsInteger);
  FDmCadCReceber.cdsCReceber.Open;

  FDmCadCReceber.cdsCReceberParc.Close;
  FDmCadCReceber.cdsCReceberParc.Open;
  FDmCadCReceber.cdsCReceberParcHist.Close;
  FDmCadCReceber.cdsCReceberParcHist.Open;
end;

procedure TfVerificaContasRecPag.prc_Gravar_CReceber;
begin
  if not FDmCadCReceber.cdsCReceber.IsEmpty then
  begin
    try
      FDmCadCReceber.cdsCReceberParc.First;
      while not FDmCadCReceber.cdsCReceberParc.Eof do
      begin
        FDmCadCReceber.cdsCReceberParcHist.First;
        while not FDmCadCReceber.cdsCReceberParcHist.Eof do
          FDmCadCReceber.cdsCReceberParcHist.Delete;
        FDmCadCReceber.cdsCReceberParc.Delete;
      end;
      FDmCadCReceber.cdsCReceber.Delete;
      FDmCadCReceber.cdsCReceber.ApplyUpdates(0);
    except;
    end;
  end;

  FDmCadCReceber.cdsCReceber.Insert;
  FDmCadCReceber.cdsCReceberNUMCRECEBER.AsInteger := DM1.tCReceberNumCReceber.AsInteger;
  FDmCadCReceber.cdsCReceberNUMSEQNOTA.AsInteger  := DM1.tCReceberNumSeqNota.AsInteger;
  if DM1.tCReceberQuitado.AsBoolean then
    FDmCadCReceber.cdsCReceberQUITADO.AsString := 'S'
  else
    FDmCadCReceber.cdsCReceberQUITADO.AsString := 'N';
  FDmCadCReceber.cdsCReceberCODCLI.AsInteger := DM1.tCReceberCodCli.AsInteger;
  FDmCadCReceber.cdsCReceberTIPODOC.AsString := DM1.tCReceberTipoDoc.AsString;
  FDmCadCReceber.cdsCReceberDTGERADO.AsDateTime := DM1.tCReceberDtGerado.AsDateTime;
  FDmCadCReceber.cdsCReceberHISTORICO.AsString := DM1.tCReceberHistorico.AsString;
  if DM1.tCReceberQuitado.AsBoolean then
    FDmCadCReceber.cdsCReceberCANCELADO.AsString := 'S'
  else
    FDmCadCReceber.cdsCReceberCANCELADO.AsString := 'N';
  if DM1.tCReceberDuplicataImp.AsBoolean then
    FDmCadCReceber.cdsCReceberDUPLICATAIMP.AsString := 'S'
  else
    FDmCadCReceber.cdsCReceberDUPLICATAIMP.AsString := 'N';
  FDmCadCReceber.cdsCReceberVLRTOTAL.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberVlrTotal.AsFloat));
  FDmCadCReceber.cdsCReceberPERCBASECOMISSAO.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberPercBaseComissao.AsFloat));
  FDmCadCReceber.cdsCReceberMERCADO.AsString := DM1.tCReceberMercado.AsString;
  FDmCadCReceber.cdsCReceberFILIAL.AsInteger := DM1.tCReceberFilial.AsInteger;
  FDmCadCReceber.cdsCReceberSERIE.AsString := DM1.tCReceberSerie.AsString;
  FDmCadCReceber.cdsCReceberNUMNOTA.AsInteger := DM1.tCReceberNumNota.AsInteger;
  if DM1.tCReceberBoletoImp.AsBoolean then
    FDmCadCReceber.cdsCReceberBOLETOIMP.AsString := 'S'
  else
    FDmCadCReceber.cdsCReceberBOLETOIMP.AsString := 'N';
  FDmCadCReceber.cdsCReceberNUMSEQ.AsInteger := DM1.tCReceberNumSeq.AsInteger;
  FDmCadCReceber.cdsCReceber.Post;
end;

procedure TfVerificaContasRecPag.prc_Gravar_CReceberParc;
begin
  FDmCadCReceber.cdsCReceberParc.Insert;

  fDmCadCReceber.cdsCReceberParcNUMCRECEBER.AsInteger := DM1.tCReceberParcNumCReceber.AsInteger;
  fDmCadCReceber.cdsCReceberParcPARCCRECEBER.AsInteger := DM1.tCReceberParcParcCReceber.AsInteger;
  fDmCadCReceber.cdsCReceberParcVLRPARCCRECEBER.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrParcCReceber.AsFloat));
  fDmCadCReceber.cdsCReceberParcDTVENCCRECEBER.AsDateTime := DM1.tCReceberParcDtVencCReceber.AsDateTime;
  if DM1.tCReceberParcQuitParcCReceber.AsBoolean then
    fDmCadCReceber.cdsCReceberParcQUITPARCCRECEBER.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcQUITPARCCRECEBER.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcJUROSPARCCRECEBER.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosParcCReceber.AsFloat));
  fDmCadCReceber.cdsCReceberParcDTPAGPARCCRECEBER.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  fDmCadCReceber.cdsCReceberParcCODCLI.AsInteger := DM1.tCReceberParcCodCli.AsInteger;
  fDmCadCReceber.cdsCReceberParcNUMSEQ.AsInteger := DM1.tCReceberParcNumSeq.AsInteger;
  fDmCadCReceber.cdsCReceberParcDESCONTO.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat));
  fDmCadCReceber.cdsCReceberParcPGTOPARCIAL.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcPgtoParcial.AsFloat));
  fDmCadCReceber.cdsCReceberParcRESTPARCELA.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat));
  fDmCadCReceber.cdsCReceberParcCONTADUPL.AsInteger := DM1.tCReceberParcContaDupl.AsInteger;
  if DM1.tCReceberParcSelecionado.AsBoolean then
    fDmCadCReceber.cdsCReceberParcSELECIONADO.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcSELECIONADO.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcCODVENDEDOR.AsInteger := DM1.tCReceberParcCodVendedor.AsInteger;
  if DM1.tCReceberParcBaixada.AsBoolean then
    fDmCadCReceber.cdsCReceberParcBAIXADA.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcBAIXADA.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcPERCCOMISSAO.AsFloat := StrToFloat(FormatFloat('0.0000',DM1.tCReceberParcPercComissao.AsFloat));
  fDmCadCReceber.cdsCReceberParcVLRCOMISSAO.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrComissao.AsFloat));
  fDmCadCReceber.cdsCReceberParcPLANOCONTAS.AsInteger := DM1.tCReceberParcPlanoContas.AsInteger;
  fDmCadCReceber.cdsCReceberParcAGENCIA.AsString := DM1.tCReceberParcAgencia.AsString;
  fDmCadCReceber.cdsCReceberParcTITPORTADOR.AsString := DM1.tCReceberParcTitPortador.AsString;
  fDmCadCReceber.cdsCReceberParcCODTIPOCOBRANCA.AsInteger := DM1.tCReceberParcCodTipoCobranca.AsInteger;
  fDmCadCReceber.cdsCReceberParcDESPESAS.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDespesas.AsFloat));
  fDmCadCReceber.cdsCReceberParcABATIMENTOS.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcAbatimentos.AsFloat));
  fDmCadCReceber.cdsCReceberParcCODCONTA.AsInteger := DM1.tCReceberParcCodConta.AsInteger;
  if DM1.tCReceberParcPgCartorio.AsBoolean then
    fDmCadCReceber.cdsCReceberParcPGCARTORIO.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcPGCARTORIO.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcDIASATRASO.AsFloat := DM1.tCReceberParcDiasAtraso.AsFloat;
  if DM1.tCReceberParcLetraCambio.AsBoolean then
    fDmCadCReceber.cdsCReceberParcLETRACAMBIO.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcLETRACAMBIO.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcNROLANCEXTCOMISSAO.AsInteger := DM1.tCReceberParcNroLancExtComissao.AsInteger;
  fDmCadCReceber.cdsCReceberParcJUROSPAGOS.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosPagos.AsFloat));
  if DM1.tCReceberParcCancelado.AsBoolean then
    fDmCadCReceber.cdsCReceberParcCANCELADO.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcCANCELADO.AsString := 'N';
  if DM1.tCReceberParcTitProtestado.AsBoolean then
    fDmCadCReceber.cdsCReceberParcTITPROTESTADO.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcTITPROTESTADO.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcDTGERADO.AsDateTime := DM1.tCReceberParcDtGerado.AsDateTime;
  fDmCadCReceber.cdsCReceberParcTIPODOC.AsString := DM1.tCReceberParcTipoDoc.AsString;
  fDmCadCReceber.cdsCReceberParcVLRDEVOLUCAO.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrDevolucao.AsFloat));
  if DM1.tCReceberParcDuplicataImp.AsBoolean then
    fDmCadCReceber.cdsCReceberParcDUPLICATAIMP.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcDUPLICATAIMP.AsString := 'N';
  if DM1.tCReceberParcPagarParteNaNota.AsBoolean then
    fDmCadCReceber.cdsCReceberParcPAGARPARTENANOTA.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcPAGARPARTENANOTA.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcMERCADO.AsString := DM1.tCReceberParcMercado.AsString;
  fDmCadCReceber.cdsCReceberParcFILIAL.AsInteger := DM1.tCReceberParcFilial.AsInteger;
  fDmCadCReceber.cdsCReceberParcPERCCOMISSAO2.AsFloat := StrToFloat(FormatFloat('0.0000',DM1.tCReceberParcPercComissao2.AsFloat));
  fDmCadCReceber.cdsCReceberParcCODVENDEDOR2.AsInteger := DM1.tCReceberParcCodVendedor2.AsInteger;
  fDmCadCReceber.cdsCReceberParcCODBANCOBOLETO.AsInteger := DM1.tCReceberParcCodBancoBoleto.AsInteger;
  if DM1.tCReceberParcComissaoItem.AsBoolean then
    fDmCadCReceber.cdsCReceberParcCOMISSAOITEM.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcCOMISSAOITEM.AsString := 'N';
  if DM1.tCReceberParcTransferencia.AsBoolean then
    fDmCadCReceber.cdsCReceberParcTRANSFERENCIA.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcTRANSFERENCIA.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcSERIE.AsString := DM1.tCReceberParcSerie.AsString;
  fDmCadCReceber.cdsCReceberParcNUMSEQNOTA.AsInteger := DM1.tCReceberParcNumSeqNota.AsInteger;
  fDmCadCReceber.cdsCReceberParcCODPLANOCONTASITENS.AsInteger := DM1.tCReceberParcCodPlanoContasItens.AsInteger;
  if DM1.tCReceberParcExportacao.AsBoolean then
    fDmCadCReceber.cdsCReceberParcEXPORTACAO.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcEXPORTACAO.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcNUMNOTA.AsInteger := DM1.tCReceberParcNumNota.AsInteger;
  FDmCadCReceber.cdsCReceberParc.Post;
end;

procedure TfVerificaContasRecPag.prc_Gravar_CReceberParcHist;
begin
  FDmCadCReceber.cdsCReceberParcHist.Insert;

  fDmCadCReceber.cdsCReceberParcHistNUMCRECEBER.AsInteger := DM1.tCReceberParcHistNumCReceber.AsInteger;
  fDmCadCReceber.cdsCReceberParcHistPARCCRECEBER.AsInteger := DM1.tCReceberParcHistParcCReceber.AsInteger;
  fDmCadCReceber.cdsCReceberParcHistITEM.AsInteger := DM1.tCReceberParcHistItem.AsInteger;
  fDmCadCReceber.cdsCReceberParcHistCODHISTORICO.AsInteger := DM1.tCReceberParcHistCodHistorico.AsInteger;
  fDmCadCReceber.cdsCReceberParcHistDTHISTORICO.AsDateTime := DM1.tCReceberParcHistDtHistorico.AsDateTime;
  fDmCadCReceber.cdsCReceberParcHistHISTORICO.AsString := DM1.tCReceberParcHistHistorico.AsString;
  fDmCadCReceber.cdsCReceberParcHistDTULTPGTO.AsDateTime := DM1.tCReceberParcHistDtUltPgto.AsDateTime;
  fDmCadCReceber.cdsCReceberParcHistVLRULTPGTO.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcHistVlrUltPgto.AsFloat));
  fDmCadCReceber.cdsCReceberParcHistVLRULTJUROS.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcHistVlrUltJuros.AsFloat));
  fDmCadCReceber.cdsCReceberParcHistVLRULTDESCONTOS.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcHistVlrUltDescontos.AsFloat));
  fDmCadCReceber.cdsCReceberParcHistVLRULTDESPESAS.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcHistVlrUltDespesas.AsFloat));
  fDmCadCReceber.cdsCReceberParcHistVLRULTABATIMENTOS.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat));
  if Dm1.tCReceberParcHistPgto.AsBoolean then
    fDmCadCReceber.cdsCReceberParcHistPGTO.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcHistPGTO.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcHistJUROSPAGOS.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcHistJurosPagos.AsFloat));
  fDmCadCReceber.cdsCReceberParcHistNUMMOV.AsInteger := DM1.tCReceberParcHistNumMov.AsInteger;
  fDmCadCReceber.cdsCReceberParcHistNUMMOVJUROS.AsInteger := DM1.tCReceberParcHistNumMovJuros.AsInteger;
  fDmCadCReceber.cdsCReceberParcHistJUROSCALC.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcHistJurosCalc.AsFloat));
  fDmCadCReceber.cdsCReceberParcHistVLRDEVOLUCAO.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcHistVlrDevolucao.AsFloat));
  if DM1.tCReceberParcHistDevolucao.AsBoolean then
    fDmCadCReceber.cdsCReceberParcHistDEVOLUCAO.AsString := 'S'
  else
    fDmCadCReceber.cdsCReceberParcHistDEVOLUCAO.AsString := 'N';
  fDmCadCReceber.cdsCReceberParcHistNROLANCEXTCOMISSAO.AsInteger := DM1.tCReceberParcHistNroLancExtComissao.AsInteger;
  fDmCadCReceber.cdsCReceberParcHistFILIAL.AsInteger := DM1.tCReceberParcHistFilial.AsInteger;
  FDmCadCReceber.cdsCReceberParcHist.Post;
end;

end.
