unit UDMArmazenamento_Ref;

interface

uses
  SysUtils, Classes, DmdDatabase, FMTBcd, DB, SqlExpr, DBClient, Provider,
  arTypes;

type
  TDMArmazenamento_Ref = class(TDataModule)
    sdsArmazenamento_Ref: TSQLDataSet;
    dspArmazenamento_Ref: TDataSetProvider;
    cdsArmazenamento_Ref: TClientDataSet;
    dsArmazenamento_Ref: TDataSource;
    sdsArmazenamento_RefID: TIntegerField;
    sdsArmazenamento_RefCAIXA: TStringField;
    sdsArmazenamento_RefREFERENCIA: TStringField;
    sdsArmazenamento_RefCIA: TStringField;
    sdsArmazenamento_RefDATA: TDateField;
    cdsArmazenamento_RefID: TIntegerField;
    cdsArmazenamento_RefCAIXA: TStringField;
    cdsArmazenamento_RefREFERENCIA: TStringField;
    cdsArmazenamento_RefCIA: TStringField;
    cdsArmazenamento_RefDATA: TDateField;
    procedure DataModuleCreate(Sender: TObject);
  private

  public

  end;

var
  DMArmazenamento_Ref: TDMArmazenamento_Ref;
  ctArmazenamento_Ref : String;

implementation

{$R *.dfm}

procedure TDMArmazenamento_Ref.DataModuleCreate(Sender: TObject);
begin
  ctArmazenamento_Ref := sdsArmazenamento_Ref.CommandText;
end;

end.
