unit UDMFichaConstrucao;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TDMFichaConstrucao = class(TDataModule)
    sdsFichaConstrucao: TSQLDataSet;
    dspFichaConstrucao: TDataSetProvider;
    cdsFichaConstrucao: TClientDataSet;
    dsFichaConstrucao: TDataSource;
    sdsFichaConstrucaoID: TIntegerField;
    sdsFichaConstrucaoNOMECONSTRUCAO: TStringField;
    sdsFichaConstrucaoNOMEFORMA: TStringField;
    sdsFichaConstrucaoOBS: TMemoField;
    cdsFichaConstrucaoID: TIntegerField;
    cdsFichaConstrucaoNOMECONSTRUCAO: TStringField;
    cdsFichaConstrucaoNOMEFORMA: TStringField;
    cdsFichaConstrucaoOBS: TMemoField;
    dsFichaConstrucaoMestre: TDataSource;
    sdsFichaConstrucao_Pos: TSQLDataSet;
    cdsFichaConstrucao_Pos: TClientDataSet;
    dsFichaConstrucao_Pos: TDataSource;
    sdsFichaConstrucao_PosID: TIntegerField;
    sdsFichaConstrucao_PosITEM: TIntegerField;
    sdsFichaConstrucao_PosNOMEPOSICAO: TStringField;
    sdsFichaConstrucao_PosSOMENTEMATERIAL: TStringField;
    sdsFichaConstrucao_PosINFORMARGRADE: TStringField;
    sdsFichaConstrucao_PosINFORMAROPCAOMAT: TStringField;
    cdsFichaConstrucaosdsFichaConstrucao_Pos: TDataSetField;
    cdsFichaConstrucao_PosID: TIntegerField;
    cdsFichaConstrucao_PosITEM: TIntegerField;
    cdsFichaConstrucao_PosNOMEPOSICAO: TStringField;
    cdsFichaConstrucao_PosSOMENTEMATERIAL: TStringField;
    cdsFichaConstrucao_PosINFORMARGRADE: TStringField;
    cdsFichaConstrucao_PosINFORMAROPCAOMAT: TStringField;
    dsFichaConstrucao_PosMestre: TDataSource;
    sdsFichaConstrucao_Mat: TSQLDataSet;
    cdsFichaConstrucao_Mat: TClientDataSet;
    dsFichaConstrucao_Mat: TDataSource;
    sdsFichaConstrucao_MatID: TIntegerField;
    sdsFichaConstrucao_MatITEMPOSICAO: TIntegerField;
    sdsFichaConstrucao_MatITEMMATERIAL: TIntegerField;
    sdsFichaConstrucao_MatTIPOMATERIAL: TStringField;
    sdsFichaConstrucao_MatREFMATERIAL: TStringField;
    sdsFichaConstrucao_MatNOMEMATERIAL: TStringField;
    sdsFichaConstrucao_MatNOMEFORNECEDOR: TStringField;
    sdsFichaConstrucao_MatNOMECOR: TStringField;
    sdsFichaConstrucao_MatMEDIDAS: TStringField;
    cdsFichaConstrucao_PossdsFichaConstrucao_Mat: TDataSetField;
    cdsFichaConstrucao_MatID: TIntegerField;
    cdsFichaConstrucao_MatITEMPOSICAO: TIntegerField;
    cdsFichaConstrucao_MatITEMMATERIAL: TIntegerField;
    cdsFichaConstrucao_MatTIPOMATERIAL: TStringField;
    cdsFichaConstrucao_MatREFMATERIAL: TStringField;
    cdsFichaConstrucao_MatNOMEMATERIAL: TStringField;
    cdsFichaConstrucao_MatNOMEFORNECEDOR: TStringField;
    cdsFichaConstrucao_MatNOMECOR: TStringField;
    cdsFichaConstrucao_MatMEDIDAS: TStringField;
    dsFichaConstrucao_MatMestre: TDataSource;
    sdsFichaConstrucao_MatTam: TSQLDataSet;
    cdsFichaConstrucao_MatTam: TClientDataSet;
    dsFichaConstrucao_MatTam: TDataSource;
    cdsFichaConstrucao_MatsdsFichaConstrucao_MatTam: TDataSetField;
    cdsFichaConstrucao_MatTamID: TIntegerField;
    cdsFichaConstrucao_MatTamITEMPOSICAO: TIntegerField;
    cdsFichaConstrucao_MatTamITEMMATERIAL: TIntegerField;
    cdsFichaConstrucao_MatTamITEMTAM: TIntegerField;
    cdsFichaConstrucao_MatTamTAMREF: TStringField;
    cdsFichaConstrucao_MatTamTAMMAT: TStringField;
    sdsFichaConstrucao_Tam: TSQLDataSet;
    cdsFichaConstrucao_Tam: TClientDataSet;
    dsFichaConstrucao_Tam: TDataSource;
    cdsFichaConstrucaosdsFichaConstrucao_Tam: TDataSetField;
    sdsFichaConstrucaoDATA: TDateField;
    sdsFichaConstrucaoUSUARIO: TStringField;
    cdsFichaConstrucaoDATA: TDateField;
    cdsFichaConstrucaoUSUARIO: TStringField;
    sdsFichaConstrucao_MatTamID: TIntegerField;
    sdsFichaConstrucao_MatTamITEMPOSICAO: TIntegerField;
    sdsFichaConstrucao_MatTamITEMMATERIAL: TIntegerField;
    sdsFichaConstrucao_MatTamITEMTAM: TIntegerField;
    sdsFichaConstrucao_MatTamTAMREF: TStringField;
    sdsFichaConstrucao_MatTamTAMMAT: TStringField;
    sdsFichaConstrucao_TamID: TIntegerField;
    sdsFichaConstrucao_TamITEM: TIntegerField;
    sdsFichaConstrucao_TamTAMANHO: TStringField;
    cdsFichaConstrucao_TamID: TIntegerField;
    cdsFichaConstrucao_TamITEM: TIntegerField;
    cdsFichaConstrucao_TamTAMANHO: TStringField;
    sdsFichaConstrucaoHRUSUARIO: TTimeField;
    sdsFichaConstrucaoDTUSUARIO: TDateField;
    cdsFichaConstrucaoHRUSUARIO: TTimeField;
    cdsFichaConstrucaoDTUSUARIO: TDateField;
    sdsFichaConstrucaoENDFOTO: TStringField;
    cdsFichaConstrucaoENDFOTO: TStringField;
    sdsFichaConstrucao_MatOBS: TStringField;
    cdsFichaConstrucao_MatOBS: TStringField;
    sdsFichaConstrucaoTIPO_MONTAGEM: TStringField;
    sdsFichaConstrucaoDESCNAVALHA: TStringField;
    sdsFichaConstrucaoDESCGUIA: TStringField;
    cdsFichaConstrucaoTIPO_MONTAGEM: TStringField;
    cdsFichaConstrucaoDESCNAVALHA: TStringField;
    cdsFichaConstrucaoDESCGUIA: TStringField;
    sdsFichaConstrucaoTIPO_NAVALHA: TStringField;
    cdsFichaConstrucaoTIPO_NAVALHA: TStringField;
    sdsFichaConstrucaoTIPO_NAVGUIASALTO: TStringField;
    cdsFichaConstrucaoTIPO_NAVGUIASALTO: TStringField;
    sdsFichaConstrucaoSALTO: TStringField;
    sdsFichaConstrucaoFACHETADO: TStringField;
    cdsFichaConstrucaoSALTO: TStringField;
    cdsFichaConstrucaoFACHETADO: TStringField;
    sdsFichaConstrucao_MatREFORCO: TStringField;
    sdsFichaConstrucao_MatPLANTA: TStringField;
    sdsFichaConstrucao_MatCAIMENTO: TStringField;
    sdsFichaConstrucao_MatALMA: TStringField;
    sdsFichaConstrucao_MatREBITE: TStringField;
    sdsFichaConstrucao_MatCAPA: TStringField;
    sdsFichaConstrucao_MatESQUELETO: TStringField;
    sdsFichaConstrucao_MatPONTE: TStringField;
    sdsFichaConstrucao_MatLIXA: TStringField;
    cdsFichaConstrucao_MatREFORCO: TStringField;
    cdsFichaConstrucao_MatPLANTA: TStringField;
    cdsFichaConstrucao_MatCAIMENTO: TStringField;
    cdsFichaConstrucao_MatALMA: TStringField;
    cdsFichaConstrucao_MatREBITE: TStringField;
    cdsFichaConstrucao_MatCAPA: TStringField;
    cdsFichaConstrucao_MatESQUELETO: TStringField;
    cdsFichaConstrucao_MatPONTE: TStringField;
    cdsFichaConstrucao_MatLIXA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsFichaConstrucaoNewRecord(DataSet: TDataSet);
  private
  public

  end;

var
  DMFichaConstrucao: TDMFichaConstrucao;
  ctFichaConstrucao : String;

implementation

{$R *.dfm}

procedure TDMFichaConstrucao.DataModuleCreate(Sender: TObject);
begin
  ctFichaConstrucao := sdsFichaConstrucao.CommandText;
end;

procedure TDMFichaConstrucao.cdsFichaConstrucaoNewRecord(
  DataSet: TDataSet);
begin
  cdsFichaConstrucaoTIPO_NAVALHA.AsString := 'N';
end;

end.
