unit UDMNotaFiscalFB;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TDMNotaFiscalFB = class(TDataModule)
    sdsNotaFiscal_Itens_DrawBack: TSQLDataSet;
    sdsNotaFiscal_Itens_DrawBackID: TIntegerField;
    sdsNotaFiscal_Itens_DrawBackITEM: TIntegerField;
    sdsNotaFiscal_Itens_DrawBackITEM_DRAWBACK: TIntegerField;
    sdsNotaFiscal_Itens_DrawBackNUM_DRAWBACK: TStringField;
    sdsNotaFiscal_Itens_DrawBackNUM_REG_EXPORTACAO: TStringField;
    sdsNotaFiscal_Itens_DrawBackNUM_CHAVE_ACESSO_NFE: TStringField;
    sdsNotaFiscal_Itens_DrawBackQTD: TFloatField;
    dspNotaFiscal_Itens_DrawBack: TDataSetProvider;
    cdsNotaFiscal_Itens_DrawBack: TClientDataSet;
    dsNotaFiscal_Itens_DrawBack: TDataSource;
    cdsNotaFiscal_Itens_DrawBackID: TIntegerField;
    cdsNotaFiscal_Itens_DrawBackITEM: TIntegerField;
    cdsNotaFiscal_Itens_DrawBackITEM_DRAWBACK: TIntegerField;
    cdsNotaFiscal_Itens_DrawBackNUM_DRAWBACK: TStringField;
    cdsNotaFiscal_Itens_DrawBackNUM_REG_EXPORTACAO: TStringField;
    cdsNotaFiscal_Itens_DrawBackNUM_CHAVE_ACESSO_NFE: TStringField;
    cdsNotaFiscal_Itens_DrawBackQTD: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure prc_Localizar_Itens_DrawBack(ID, Item : Integer);
    procedure prc_Inserir_Itens_DrawBack(ID, Item : Integer);


  end;

var
  DMNotaFiscalFB: TDMNotaFiscalFB;

implementation

uses DmdDatabase;

{$R *.dfm}

{ TDMNotaFiscalFB }

procedure TDMNotaFiscalFB.prc_Localizar_Itens_DrawBack(ID, Item: Integer);
begin
  cdsNotaFiscal_Itens_DrawBack.Close;
  sdsNotaFiscal_Itens_DrawBack.ParamByName('ID').AsInteger   := ID;
  sdsNotaFiscal_Itens_DrawBack.ParamByName('ITEM').AsInteger := Item;
  cdsNotaFiscal_Itens_DrawBack.Open;
end;

procedure TDMNotaFiscalFB.prc_Inserir_Itens_DrawBack(ID, Item : Integer);
var
  vItemAux : Integer;
begin
  cdsNotaFiscal_Itens_DrawBack.Last;
  vItemAux := cdsNotaFiscal_Itens_DrawBackITEM_DRAWBACK.AsInteger;

  cdsNotaFiscal_Itens_DrawBack.Insert;
  cdsNotaFiscal_Itens_DrawBackID.AsInteger   := ID;
  cdsNotaFiscal_Itens_DrawBackITEM.AsInteger := Item;
  cdsNotaFiscal_Itens_DrawBackITEM_DRAWBACK.AsInteger := vItemAux + 1;
end;

end.
