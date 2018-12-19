unit UDMNavalha_Local;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TDMNavalha_Local = class(TDataModule)
    sdsNavalha_Local: TSQLDataSet;
    dspNavalha_Local: TDataSetProvider;
    cdsNavalha_Local: TClientDataSet;
    dsNavalha_Local: TDataSource;
    sdsNavalha_LocalID: TIntegerField;
    sdsNavalha_LocalDTENTRADA: TDateField;
    sdsNavalha_LocalLOCALIZACAO: TStringField;
    sdsNavalha_LocalNAVALHA: TStringField;
    sdsNavalha_LocalREORDER: TStringField;
    sdsNavalha_LocalDTDESCARTE: TDateField;
    sdsNavalha_LocalDTESTOQUE: TDateField;
    cdsNavalha_LocalID: TIntegerField;
    cdsNavalha_LocalDTENTRADA: TDateField;
    cdsNavalha_LocalLOCALIZACAO: TStringField;
    cdsNavalha_LocalNAVALHA: TStringField;
    cdsNavalha_LocalREORDER: TStringField;
    cdsNavalha_LocalDTDESCARTE: TDateField;
    cdsNavalha_LocalDTESTOQUE: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  DMNavalha_Local: TDMNavalha_Local;
  ctNavalha_Local : String;

implementation

{$R *.dfm}

procedure TDMNavalha_Local.DataModuleCreate(Sender: TObject);
begin
  ctNavalha_Local := sdsNavalha_Local.CommandText;
end;

end.
