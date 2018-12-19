unit UDMSequencial_NumNota;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TDMSequencial_NumNota = class(TDataModule)
    sdsSequencia_NumNota: TSQLDataSet;
    sdsSequencia_NumNotaFILIAL: TIntegerField;
    sdsSequencia_NumNotaSERIE: TStringField;
    sdsSequencia_NumNotaNUMNOTA: TIntegerField;
    cdsSequencia_NumNota: TClientDataSet;
    dspSequencia_NumNota: TDataSetProvider;
    cdsSequencia_NumNotaFILIAL: TIntegerField;
    cdsSequencia_NumNotaSERIE: TStringField;
    cdsSequencia_NumNotaNUMNOTA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSequencial_NumNota: TDMSequencial_NumNota;

implementation

{$R *.dfm}

end.
