unit UDMPosicao_Ficha;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TDMPosicao_Ficha = class(TDataModule)
    sdsPosicao_Ficha: TSQLDataSet;
    dspPosicao_Ficha: TDataSetProvider;
    cdsPosicao_Ficha: TClientDataSet;
    dsPosicao_Ficha: TDataSource;
    sdsPosicao_FichaID: TIntegerField;
    sdsPosicao_FichaNOMEPOSICAO: TStringField;
    sdsPosicao_FichaORDEM: TIntegerField;
    cdsPosicao_FichaID: TIntegerField;
    cdsPosicao_FichaNOMEPOSICAO: TStringField;
    cdsPosicao_FichaORDEM: TIntegerField;
    sdsPosicao_FichaSOMENTEMATERIAL: TStringField;
    sdsPosicao_FichaINFORMARGRADE: TStringField;
    sdsPosicao_FichaINFORMAROPCAOMAT: TStringField;
    cdsPosicao_FichaSOMENTEMATERIAL: TStringField;
    cdsPosicao_FichaINFORMARGRADE: TStringField;
    cdsPosicao_FichaINFORMAROPCAOMAT: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  DMPosicao_Ficha: TDMPosicao_Ficha;
  ctPosicao_Ficha : String;

implementation

{$R *.dfm}

procedure TDMPosicao_Ficha.DataModuleCreate(Sender: TObject);
begin
  ctPosicao_Ficha := sdsPosicao_Ficha.CommandText;
end;

end.
