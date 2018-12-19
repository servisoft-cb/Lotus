unit UGeraFBMI_Exc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FMTBcd, DB, DBClient, Provider, SqlExpr,
  DBTables, Mask, ToolEdit, Grids, DBGrids, SMDBGrid, ComCtrls;

type
  TfGeraFBMI_Exc = class(TForm)
    sdsTalaoGrade: TSQLDataSet;
    dspTalaoGrade: TDataSetProvider;
    cdsTalaoGrade: TClientDataSet;
    tTalaoGrade: TTable;
    sdsTalaoMov: TSQLDataSet;
    dspTalaoMov: TDataSetProvider;
    cdsTalaoMov: TClientDataSet;
    tTalaoMov: TTable;
    sdsTalao: TSQLDataSet;
    dspTalao: TDataSetProvider;
    cdsTalao: TClientDataSet;
    tTalao: TTable;
    sdsLote: TSQLDataSet;
    dspLote: TDataSetProvider;
    cdsLote: TClientDataSet;
    tLote: TTable;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    mLoteAux: TClientDataSet;
    mLoteAuxNumLote: TIntegerField;
    DateEdit2: TDateEdit;
    BitBtn5: TBitBtn;
    dsmLoteAux: TDataSource;
    SMDBGrid1: TSMDBGrid;
    BitBtn6: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn7: TBitBtn;
    dsLote: TDataSource;
    dsTalaoGrade: TDataSource;
    dsTalaoMov: TDataSource;
    dsTalao: TDataSource;
    tTalaoMov2: TTable;
    tTalaoMov2Lote: TIntegerField;
    tTalaoMov2Talao: TIntegerField;
    tTalaoMov2Setor: TIntegerField;
    tTalaoMov2DataEnt: TDateField;
    tTalaoMov2HoraEnt: TTimeField;
    tTalaoMov2DataSaida: TDateField;
    tTalaoMov2HoraSaida: TTimeField;
    tTalaoMov2CodAtelier: TIntegerField;
    sdsLoteLOTE: TIntegerField;
    sdsLoteQTDTALOES: TIntegerField;
    sdsLoteQTDPARES: TFloatField;
    sdsLoteOBS: TMemoField;
    sdsLoteIMPCALCMATERIAL: TStringField;
    sdsLoteIMPRESSO: TStringField;
    sdsLoteOCGERADO: TStringField;
    sdsLoteNUMMAPACOMPRAS: TIntegerField;
    sdsLoteDTEMBARQUE: TDateField;
    sdsLoteCODFABRICA: TIntegerField;
    sdsLoteNUMPROGRAMACAO: TIntegerField;
    sdsLoteNUMOCINI: TIntegerField;
    sdsLoteNUMOCFIN: TIntegerField;
    cdsLoteLOTE: TIntegerField;
    cdsLoteQTDTALOES: TIntegerField;
    cdsLoteQTDPARES: TFloatField;
    cdsLoteOBS: TMemoField;
    cdsLoteIMPCALCMATERIAL: TStringField;
    cdsLoteIMPRESSO: TStringField;
    cdsLoteOCGERADO: TStringField;
    cdsLoteNUMMAPACOMPRAS: TIntegerField;
    cdsLoteDTEMBARQUE: TDateField;
    cdsLoteCODFABRICA: TIntegerField;
    cdsLoteNUMPROGRAMACAO: TIntegerField;
    cdsLoteNUMOCINI: TIntegerField;
    cdsLoteNUMOCFIN: TIntegerField;
    tLoteLote: TIntegerField;
    tLoteQtdTaloes: TIntegerField;
    tLoteQtdPares: TFloatField;
    tLoteObs: TMemoField;
    tLoteImpCalcMaterial: TBooleanField;
    tLoteImpresso: TBooleanField;
    tLoteOCGerado: TBooleanField;
    tLoteNumMapaCompras: TIntegerField;
    tLoteDtEmbarque: TDateField;
    tLoteCodFabrica: TIntegerField;
    tLoteNumProgramacao: TIntegerField;
    tLoteNumOCIni: TIntegerField;
    tLoteNumOCFin: TIntegerField;
    sdsTalaoGradeLOTE: TIntegerField;
    sdsTalaoGradeITEM: TIntegerField;
    sdsTalaoGradeTALAO: TIntegerField;
    sdsTalaoGradeCODGRADE: TIntegerField;
    sdsTalaoGradePOSICAO: TIntegerField;
    sdsTalaoGradeQTDPAR: TIntegerField;
    cdsTalaoGradeLOTE: TIntegerField;
    cdsTalaoGradeITEM: TIntegerField;
    cdsTalaoGradeTALAO: TIntegerField;
    cdsTalaoGradeCODGRADE: TIntegerField;
    cdsTalaoGradePOSICAO: TIntegerField;
    cdsTalaoGradeQTDPAR: TIntegerField;
    sdsTalaoMovLOTE: TIntegerField;
    sdsTalaoMovTALAO: TIntegerField;
    sdsTalaoMovSETOR: TIntegerField;
    sdsTalaoMovDATAENT: TDateField;
    sdsTalaoMovHORAENT: TTimeField;
    sdsTalaoMovDATASAIDA: TDateField;
    sdsTalaoMovHORASAIDA: TTimeField;
    sdsTalaoMovCODATELIER: TIntegerField;
    cdsTalaoMovLOTE: TIntegerField;
    cdsTalaoMovTALAO: TIntegerField;
    cdsTalaoMovSETOR: TIntegerField;
    cdsTalaoMovDATAENT: TDateField;
    cdsTalaoMovHORAENT: TTimeField;
    cdsTalaoMovDATASAIDA: TDateField;
    cdsTalaoMovHORASAIDA: TTimeField;
    cdsTalaoMovCODATELIER: TIntegerField;
    tTalaoMovLote: TIntegerField;
    tTalaoMovTalao: TIntegerField;
    tTalaoMovSetor: TIntegerField;
    tTalaoMovDataEnt: TDateField;
    tTalaoMovHoraEnt: TTimeField;
    tTalaoMovDataSaida: TDateField;
    tTalaoMovHoraSaida: TTimeField;
    tTalaoMovCodAtelier: TIntegerField;
    sdsTalaoLOTE: TIntegerField;
    sdsTalaoITEM: TIntegerField;
    sdsTalaoCODPRODUTO: TIntegerField;
    sdsTalaoCODCABEDAL1: TIntegerField;
    sdsTalaoCODCABEDAL2: TIntegerField;
    sdsTalaoCODCOR: TIntegerField;
    sdsTalaoCODCORFORRO: TIntegerField;
    sdsTalaoCODCORPALMILHA: TIntegerField;
    sdsTalaoCODCORSOLADO: TIntegerField;
    sdsTalaoQTDPAR: TIntegerField;
    sdsTalaoCODFORRO: TIntegerField;
    sdsTalaoCODETIQUETA: TIntegerField;
    sdsTalaoCODSOLADO: TIntegerField;
    sdsTalaoCODTALONEIRA: TIntegerField;
    sdsTalaoCODCORTALONEIRA: TIntegerField;
    sdsTalaoCODPALMILHA: TIntegerField;
    sdsTalaoCODFORMA: TIntegerField;
    sdsTalaoITEMPEDIDO: TIntegerField;
    sdsTalaoNUMPEDIDO: TIntegerField;
    sdsTalaoCODFABRICA: TIntegerField;
    cdsTalaoLOTE: TIntegerField;
    cdsTalaoITEM: TIntegerField;
    cdsTalaoCODPRODUTO: TIntegerField;
    cdsTalaoCODCABEDAL1: TIntegerField;
    cdsTalaoCODCABEDAL2: TIntegerField;
    cdsTalaoCODCOR: TIntegerField;
    cdsTalaoCODCORFORRO: TIntegerField;
    cdsTalaoCODCORPALMILHA: TIntegerField;
    cdsTalaoCODCORSOLADO: TIntegerField;
    cdsTalaoQTDPAR: TIntegerField;
    cdsTalaoCODFORRO: TIntegerField;
    cdsTalaoCODETIQUETA: TIntegerField;
    cdsTalaoCODSOLADO: TIntegerField;
    cdsTalaoCODTALONEIRA: TIntegerField;
    cdsTalaoCODCORTALONEIRA: TIntegerField;
    cdsTalaoCODPALMILHA: TIntegerField;
    cdsTalaoCODFORMA: TIntegerField;
    cdsTalaoITEMPEDIDO: TIntegerField;
    cdsTalaoNUMPEDIDO: TIntegerField;
    cdsTalaoCODFABRICA: TIntegerField;
    tTalaoLote: TIntegerField;
    tTalaoItem: TIntegerField;
    tTalaoCodProduto: TIntegerField;
    tTalaoCodCabedal1: TIntegerField;
    tTalaoCodCabedal2: TIntegerField;
    tTalaoCodCor: TIntegerField;
    tTalaoCodCorForro: TIntegerField;
    tTalaoCodCorPalmilha: TIntegerField;
    tTalaoCodCorSolado: TIntegerField;
    tTalaoQtdPar: TIntegerField;
    tTalaoCodForro: TIntegerField;
    tTalaoCodEtiqueta: TIntegerField;
    tTalaoCodSolado: TIntegerField;
    tTalaoCodTaloneira: TIntegerField;
    tTalaoCodCorTaloneira: TIntegerField;
    tTalaoCodPalmilha: TIntegerField;
    tTalaoCodForma: TIntegerField;
    tTalaoItemPedido: TIntegerField;
    tTalaoNumPedido: TIntegerField;
    tTalaoCodFabrica: TIntegerField;
    tTalaoGradeLote: TIntegerField;
    tTalaoGradeItem: TIntegerField;
    tTalaoGradeTalao: TIntegerField;
    tTalaoGradeCodGrade: TIntegerField;
    tTalaoGradePosicao: TIntegerField;
    tTalaoGradeQtdPar: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Gravar_Lote;
    procedure prc_Gravar_Talao;
    procedure prc_Gravar_TalaoGrade;
    procedure prc_Gravar_TalaoMov;

  public
    { Public declarations }
  end;

var
  fGeraFBMI_Exc: TfGeraFBMI_Exc;

implementation

uses DmdDatabase, uUtilPadrao, ComObj;

{$R *.dfm}

procedure TfGeraFBMI_Exc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfGeraFBMI_Exc.BitBtn5Click(Sender: TObject);
var
  vGerar : Boolean;
  vLoteAnt : Integer;
  vFlag : String;
  vVazio : Boolean;
  vMaior : Boolean;
  vMenor : Boolean;
begin
  if DateEdit1.Date <= 10 then
  begin
    ShowMessage('Data não informada!');
  end;
  if DateEdit1.Date > DateEdit2.Date then
  begin
    ShowMessage('Data não pode ser maior que ' + DateEdit2.Text);
    exit;
  end;
  if MessageDlg('Deseja gerar os Lotes/Talões para a exclusão?',mtconfirmation,[mbok,mbno],0)=mrNo then
    exit;
  vLoteAnt := 0;
  vFlag    := '';
  mLoteAux.EmptyDataSet;
  ProgressBar1.Max      := tTalaoMov2.RecordCount;
  ProgressBar1.Position := 0;
  tTalaoMov2.First;
  while not tTalaoMov2.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if vLoteAnt <> tTalaoMov2Lote.AsInteger then
    begin
      vGerar := False;
      if not vMaior then
      begin
        if vMenor then
          vGerar := True;
      end;
      if (vLoteAnt > 0) and (vGerar) then
      begin

        if not mLoteAux.Locate('NumLote',tTalaoMov2Lote.AsInteger,[loCaseInsensitive]) then
        begin
          mLoteAux.Insert;
          mLoteAuxNumLote.AsInteger := vLoteAnt;
          mLoteAux.Post;
        end;
      end;
      vFlag := '';
      vVazio := False;
      vMaior := False;
      vMenor := False;
    end;
    vGerar := False;
    if (tTalaoMov2DataEnt.IsNull) then
      vVazio := True
    else
    if (tTalaoMov2DataEnt.AsDateTime > DateEdit1.Date) then
      vMaior := True;
    if (tTalaoMov2DataSaida.IsNull) then
      vVazio := True
    else
    if (tTalaoMov2DataSaida.AsDateTime > DateEdit1.Date) then
      vMaior := True;

    if not vMaior then
    begin
      if  not(tTalaoMov2DataEnt.IsNull) and (tTalaoMov2DataEnt.AsDateTime <= DateEdit1.Date) then
        vMenor := True;
      if  not(tTalaoMov2DataSaida.IsNull) and (tTalaoMov2DataSaida.AsDateTime <= DateEdit1.Date) then
        vMenor := True;
    end;

    vLoteAnt := tTalaoMov2Lote.AsInteger;
    tTalaoMov2.Next;
  end;
  vGerar := False;
  if not vMaior then
  begin
    if vMenor then
      vGerar := True;
  end;
  if (vLoteAnt > 0) and (vGerar) then
  begin
    if not mLoteAux.Locate('NumLote',tTalaoMov2Lote.AsInteger,[loCaseInsensitive]) then
    begin
      mLoteAux.Insert;
      mLoteAuxNumLote.AsInteger := vLoteAnt;
      mLoteAux.Post;
    end;
  end;

end;

procedure TfGeraFBMI_Exc.BitBtn6Click(Sender: TObject);
begin
  ShowMessage('Total de Lotes para excluir ' + IntToStr(mLoteAux.RecordCount));
end;

procedure TfGeraFBMI_Exc.BitBtn7Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir os Lotes/Talões?',mtconfirmation,[mbok,mbno],0)=mrNo then
    exit;

  ProgressBar1.Max      := mLoteAux.RecordCount;
  ProgressBar1.Position := 0;

  mLoteAux.First;
  while not mLoteAux.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if tLote.Locate('Lote',mLoteAuxNumLote.AsInteger,[loCaseInsensitive]) then
    begin
      prc_Gravar_Lote;
      tTalao.First;
      while not tTalao.Eof do
      begin
        prc_Gravar_Talao;
        tTalao.Delete;
      end;
      tTalaoGrade.First;
      while not tTalaoGrade.Eof do
      begin
        prc_Gravar_TalaoGrade;
        tTalaoGrade.Delete;
      end;

      tTalaoMov.First;
      while not tTalaoMov.Eof do
      begin
        prc_Gravar_TalaoMov;
        tTalaoMov.Delete;
      end;

      tLote.Delete;
    end;
    mLoteAux.Next;
  end;

end;

procedure TfGeraFBMI_Exc.prc_Gravar_Lote;
begin
  cdsLote.Close;
  sdsLote.ParamByName('LOTE').AsInteger := tLoteLote.AsInteger;
  cdsLote.Open;

  if not cdsLote.IsEmpty then
    cdsLote.Edit
  else
  begin
    cdsLote.Insert;
    cdsLoteLOTE.AsInteger := tLoteLote.AsInteger;
  end;
  cdsLoteQTDTALOES.AsInteger := tLoteQtdTaloes.AsInteger;
  cdsLoteQTDPARES.AsFloat    := StrToFloat(FormatFloat('0.00',tLoteQtdPares.AsFloat));
  cdsLoteOBS.Value           := tLoteObs.Value;
  if tLoteImpCalcMaterial.AsBoolean then
    cdsLoteIMPCALCMATERIAL.AsString := 'S'
  else
    cdsLoteIMPCALCMATERIAL.AsString := 'N';
  if tLoteImpresso.AsBoolean then
    cdsLoteIMPRESSO.AsString := 'S'
  else
    cdsLoteIMPRESSO.AsString := 'N';
  if tLoteOCGerado.AsBoolean then
    cdsLoteOCGERADO.AsString := 'S'
  else
    cdsLoteOCGERADO.AsString := 'N';
  cdsLoteNUMMAPACOMPRAS.AsInteger := tLoteNumMapaCompras.AsInteger;
  cdsLoteDTEMBARQUE.AsDateTime    := tLoteDtEmbarque.AsDateTime;
  cdsLoteCODFABRICA.AsInteger     := tLoteCodFabrica.AsInteger;
  cdsLoteNUMPROGRAMACAO.AsInteger := tLoteNumProgramacao.AsInteger;
  cdsLoteNUMOCINI.AsInteger       := tLoteNumOCIni.AsInteger;
  cdsLoteNUMOCFIN.AsInteger       := tLoteNumOCFin.AsInteger;
  cdsLote.Post;
  cdsLote.ApplyUpdates(0);
end;

procedure TfGeraFBMI_Exc.prc_Gravar_Talao;
begin
  cdsTalao.Close;
  sdsTalao.ParamByName('LOTE').AsInteger := tTalaoLote.AsInteger;
  sdsTalao.ParamByName('ITEM').AsInteger := tTalaoItem.AsInteger;
  cdsTalao.Open;

  if not cdsTalao.IsEmpty then
    cdsTalao.Edit
  else
  begin
    cdsTalao.Insert;
    cdsTalaoLOTE.AsInteger := tTalaoLote.AsInteger;
    cdsTalaoITEM.AsInteger := tTalaoItem.AsInteger;
  end;
  cdsTalaoCODPRODUTO.AsInteger      := tTalaoCodProduto.AsInteger;
  cdsTalaoCODCABEDAL1.AsInteger     := tTalaoCodCabedal1.AsInteger;
  cdsTalaoCODCABEDAL2.AsInteger     := tTalaoCodCabedal2.AsInteger;
  cdsTalaoCODCOR.AsInteger          := tTalaoCodCor.AsInteger;
  cdsTalaoCODCORFORRO.AsInteger     := tTalaoCodCorForro.AsInteger;
  cdsTalaoCODCORPALMILHA.AsInteger  := tTalaoCodCorPalmilha.AsInteger;
  cdsTalaoCODCORSOLADO.AsInteger    := tTalaoCodCorSolado.AsInteger;
  cdsTalaoQTDPAR.AsInteger          := tTalaoQtdPar.AsInteger;
  cdsTalaoCODFORRO.AsInteger        := tTalaoCodForro.AsInteger;
  cdsTalaoCODETIQUETA.AsInteger     := tTalaoCodEtiqueta.AsInteger;
  cdsTalaoCODSOLADO.AsInteger       := tTalaoCodSolado.AsInteger;
  cdsTalaoCODTALONEIRA.AsInteger    := tTalaoCodTaloneira.AsInteger;
  cdsTalaoCODCORTALONEIRA.AsInteger := tTalaoCodCorTaloneira.AsInteger;
  cdsTalaoCODPALMILHA.AsInteger     := tTalaoCodPalmilha.AsInteger;
  cdsTalaoCODFORMA.AsInteger        := tTalaoCodForma.AsInteger;
  cdsTalaoITEMPEDIDO.AsInteger      := tTalaoItemPedido.AsInteger;
  cdsTalaoNUMPEDIDO.AsInteger       := tTalaoNumPedido.AsInteger;
  cdsTalaoCODFABRICA.AsInteger      := tTalaoCodFabrica.AsInteger;
  cdsTalao.Post;
  cdsTalao.ApplyUpdates(0);
end;

procedure TfGeraFBMI_Exc.prc_Gravar_TalaoGrade;
begin
  cdsTalaoGrade.Close;
  sdsTalaoGrade.ParamByName('LOTE').AsInteger     := tTalaoGradeLote.AsInteger;
  sdsTalaoGrade.ParamByName('ITEM').AsInteger     := tTalaoGradeItem.AsInteger;
  sdsTalaoGrade.ParamByName('TALAO').AsInteger    := tTalaoGradeTalao.AsInteger;
  sdsTalaoGrade.ParamByName('CODGRADE').AsInteger := tTalaoGradeCodGrade.AsInteger;
  sdsTalaoGrade.ParamByName('POSICAO').AsInteger  := tTalaoGradePosicao.AsInteger;
  cdsTalaoGrade.Open;

  if not cdsTalaoGrade.IsEmpty then
    cdsTalaoGrade.Edit
  else
  begin
    cdsTalaoGrade.Insert;
    cdsTalaoGradeLOTE.AsInteger     := tTalaoGradeLote.AsInteger;
    cdsTalaoGradeITEM.AsInteger     := tTalaoGradeItem.AsInteger;
    cdsTalaoGradeTALAO.AsInteger    := tTalaoGradeTalao.AsInteger;
    cdsTalaoGradeCODGRADE.AsInteger := tTalaoGradeCodGrade.AsInteger;
    cdsTalaoGradePOSICAO.AsInteger  := tTalaoGradePosicao.AsInteger;
  end;
  cdsTalaoGradeQTDPAR.AsInteger   := tTalaoGradeQtdPar.AsInteger;
  cdsTalaoGrade.Post;
  cdsTalaoGrade.ApplyUpdates(0);
end;

procedure TfGeraFBMI_Exc.prc_Gravar_TalaoMov;
begin
  cdsTalaoMov.Close;
  sdsTalaoMov.ParamByName('LOTE').AsInteger  := tTalaoMovLote.AsInteger;
  sdsTalaoMov.ParamByName('TALAO').AsInteger := tTalaoMovTalao.AsInteger;
  sdsTalaoMov.ParamByName('SETOR').AsInteger := tTalaoMovSetor.AsInteger;
  cdsTalaoMov.Open;
  if not cdsTalaoMov.IsEmpty then
    cdsTalaoMov.Edit
  else
  begin
    cdsTalaoMov.Insert;
    cdsTalaoMovLOTE.AsInteger       := tTalaoMovLote.AsInteger;
    cdsTalaoMovTALAO.AsInteger      := tTalaoMovTalao.AsInteger;
    cdsTalaoMovSETOR.AsInteger      := tTalaoMovSetor.AsInteger;
  end;
  if tTalaoMovDataEnt.AsDateTime > 10 then
  begin
    cdsTalaoMovDATAENT.AsDateTime   := tTalaoMovDataEnt.AsDateTime;
    if not tTalaoMovHoraEnt.IsNull then
      cdsTalaoMovHORAENT.AsDateTime   := tTalaoMovHoraEnt.AsDateTime;
  end;
  if tTalaoMovDataSaida.AsDateTime > 10 then
  begin
    cdsTalaoMovDATASAIDA.AsDateTime := tTalaoMovDataSaida.AsDateTime;
    if not tTalaoMovHoraSaida.IsNull then
      cdsTalaoMovHORASAIDA.AsDateTime := tTalaoMovHoraSaida.AsDateTime;
  end;
  cdsTalaoMovCODATELIER.AsInteger := tTalaoMovCodAtelier.AsInteger;
  cdsTalaoMov.Post;
  cdsTalaoMov.ApplyUpdates(0);
end;

end.
