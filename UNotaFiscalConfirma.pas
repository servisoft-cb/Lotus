unit UNotaFiscalConfirma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, DbTables, DB,
  UDMSequencial_NumNota, DBXpress, SqlExpr;

type
  TfNotaFiscalConfirma = class(TForm)
    btNormal: TBitBtn;
    btAtualiza: TBitBtn;
    btContingencia: TBitBtn;
    GroupBox1: TGroupBox;
    btFS: TBitBtn;
    btScan: TBitBtn;
    btCancelar: TBitBtn;
    btFSDA: TBitBtn;
    procedure btNormalClick(Sender: TObject);
    procedure btFSClick(Sender: TObject);
    procedure btScanClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btAtualizaClick(Sender: TObject);
    procedure btContingenciaClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btFSDAClick(Sender: TObject);
  private
    { Private declarations }
    fDMSequencial_NumNota: TDMSequencial_NumNota;

    procedure Grava_NumNota(Serie, Tipo: String);
  public
    vOk: Boolean;
    { Public declarations }
  end;

var
  fNotaFiscalConfirma: TfNotaFiscalConfirma;

implementation

uses UEmissaoNotaFiscal, UDM1, UDM2, uNFeComandos, UNFeDados, uNFe,
  UDMNotaFiscal, DmdDatabase;

{$R *.dfm}

procedure TfNotaFiscalConfirma.Grava_NumNota(Serie, Tipo: String);
var
  vNumAux: Integer;
  vNumSeq: Integer;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
begin
  if DM1.tNotaFiscalNumNota.AsInteger > 0 then
    exit;

  fDMSequencial_NumNota := TDMSequencial_NumNota.Create(Self);

  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);

  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText := ' UPDATE TABELALOC SET FLAG = 1 ' +
                       ' WHERE TABELA = ' + QuotedStr('NOTAFISCAL');
    sds.ExecSQL();

    fDMSequencial_NumNota.cdsSequencia_NumNota.Close;
    fDMSequencial_NumNota.sdsSequencia_NumNota.ParamByName('FILIAL').AsInteger := DM1.tNotaFiscalFilial.AsInteger;
    fDMSequencial_NumNota.sdsSequencia_NumNota.ParamByName('SERIE').AsString   := Trim(Serie);
    fDMSequencial_NumNota.cdsSequencia_NumNota.Open;

    vNumAux := fDMSequencial_NumNota.cdsSequencia_NumNotaNUMNOTA.AsInteger;
    vNumAux := vNumAux + 1;

    vOk := True;

    vNumSeq := Dm1.tNotaFiscalNumSeq.AsInteger;
    DM1.tNotaFiscalNumNota.AsInteger    := vNumAux;
    DM1.tNotaFiscalSerie.AsString       := Serie;
    DM1.tNotaFiscalTipoEnvioNF.AsString        := Tipo;
    DM1.tNotaFiscalVersaoNFe.AsString          := DM1.tParametrosVersaoNFe.AsString;
    DM1.tNotaFiscalIdentVersaoEmissao.AsString := DM1.tParametrosVersaoEmissaoNFe.AsString;

    DM1.tNotaFiscal.Post;
    DM1.tNotaFiscal.Refresh;
    DMNotaFiscal.tNotaFiscalIns.Refresh;

    fDMSequencial_NumNota.cdsSequencia_NumNota.Edit;
    fDMSequencial_NumNota.cdsSequencia_NumNotaNUMNOTA.AsInteger := vNumAux;
    fDMSequencial_NumNota.cdsSequencia_NumNota.Post;
    fDMSequencial_NumNota.cdsSequencia_NumNota.ApplyUpdates(0);

    DM1.tNotaFiscal.Locate('Filial;NumSeq',VarArrayOf([DM1.tFilialCodigo.AsInteger,vNumSeq]),[locaseinsensitive]);
    DM1.tNotaFiscal.Edit;

    dmDatabase.scoDados.Commit(ID);
  except
    on e: Exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      Raise Exception.Create('Ocorreu o seguinte erro ao gravar o número da nota: ' + #13 + e.Message);
    end
  end;
  FreeAndNil(sds);
  FreeAndNil(fDMSequencial_NumNota);
end;

procedure TfNotaFiscalConfirma.btNormalClick(Sender: TObject);
begin
  //NFe 2.0
  Grava_NumNota(DM1.tParametrosSerieNormal.AsString,'1-NORMAL') ;
  if not vOk  then
    fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

procedure TfNotaFiscalConfirma.btFSClick(Sender: TObject);
begin
  //NFe 2.0
  Grava_NumNota(DM1.tParametrosSerieNormal.AsString,'2-CONTINGENCIA FS') ;
  if not vOk  then
    fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

procedure TfNotaFiscalConfirma.btScanClick(Sender: TObject);
begin
  //NFe 2.0
  Grava_NumNota(DM1.tParametrosSerieContingencia.AsString,'3-CONTINGENCIA SCAN') ;
  if not vOk  then
    fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

procedure TfNotaFiscalConfirma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfNotaFiscalConfirma.FormShow(Sender: TObject);
begin
  fEmissaoNotaFiscal.Tag := 0;
  btAtualizaClick(Sender);
  if btNormal.Enabled then
    btNormal.SetFocus
  else
    btContingencia.SetFocus;
end;

procedure TfNotaFiscalConfirma.btAtualizaClick(Sender: TObject);
var
  texto: String;
begin
  DM1.tParametros.Close;
  DM1.tParametros.Open;
  DM1.tParametros.Refresh;
  btAtualiza.Enabled := DM1.tParametrosControlaNFe.AsBoolean;
  //btScan.Enabled     := False;
  //btFS.Enabled       := False;
  if DM1.tParametrosControlaNFe.AsBoolean then
    begin
      texto := Monta_Texto(DM1.tFilialCNPJ.AsString,14);
      //Foi tirado dia 18/03/2010 para deixar confirmar a nota mesmo que não tenha internet
      {btNormal.Enabled := VerificaStatusNFe(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                            // 'localhost',
                                            DM1.tParametrosLocalServidorNFe.AsString,
                                            //edCNPJ.Text,
                                            texto,False);}
      {if not btNormal.Enabled then
        btScan.Enabled := VerificaStatusNFe(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                            //'localhost',
                                            DM1.tParametrosLocalServidorNFe.AsString,
                                            //edCNPJ.Text,
                                            texto,True) and not(btNormal.Enabled);


      btFS.Enabled := not(btNormal.Enabled);}

      {btFS.Enabled := not(ConectadoInternet(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                            //'localhost',
                                            DM1.tParametrosLocalServidorNFe.AsString,
                                            //edCNPJ.Text,
                                            texto));}
    end;


end;

procedure TfNotaFiscalConfirma.btContingenciaClick(Sender: TObject);
var
  texto: String;
begin
  DM1.tParametros.Close;
  DM1.tParametros.Open;
  DM1.tParametros.Refresh;
  if DM1.tParametrosControlaNFe.AsBoolean then
    begin
      texto := Monta_Texto(DM1.tFilialCNPJ.AsString,14);

      try
        btScan.Enabled := VerificaStatusNFe(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                             //'localhost',
                                             DM1.tParametrosLocalServidorNFe.AsString,
                                             //edCNPJ.Text,
                                             texto,True);
      except
        ShowMessage('Modo Scan não ativado ou internet com problema!');
      end;

      btFS.Enabled   := True;
      btFSDA.Enabled := True;

      {btFS.Enabled := not(ConectadoInternet(
                                            //no lugar do localhost incluir o ip da máquina onde vai ficar o nfeconfig
                                            //'localhost',
                                            DM1.tParametrosLocalServidorNFe.AsString,
                                            //edCNPJ.Text,
                                            texto));}
    end;

end;

procedure TfNotaFiscalConfirma.btCancelarClick(Sender: TObject);
begin
  fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

procedure TfNotaFiscalConfirma.btFSDAClick(Sender: TObject);
begin
  //NFe 2.0
  Grava_NumNota(DM1.tParametrosSerieNormal.AsString,'5-CONTINGENCIA FS-DA') ;
  if not vOk  then
    fEmissaoNotaFiscal.Tag := 2;
  Close;
end;

end.

