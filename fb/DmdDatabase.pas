unit DmdDatabase;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, Forms, IniFiles,
  IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME, FMTBcd;

type
  TdmDatabase = class(TDataModule)
    scoDados: TSQLConnection;
    Decoder64: TIdDecoderMIME;
    sdsExec: TSQLDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    function Fnc_ArquivoConfiguracao: string;
    { Private declarations }
  public
    function ProximaSequencia(NomeTabela: string; Filial: Integer): Integer;
    function Registro_Max(NomeTabela: string; Campo: String): Integer;
  end;

var
  dmDatabase: TdmDatabase;

implementation

{$R *.dfm}

const
  cArquivoConfiguracao = 'Config.ini';

function TdmDatabase.Fnc_ArquivoConfiguracao: string;
begin
  Result := ExtractFilePath(Application.ExeName) + cArquivoConfiguracao;
end;

procedure TdmDatabase.DataModuleCreate(Sender: TObject);
var
  Config: TIniFile;
begin
  if not FileExists(Fnc_ArquivoConfiguracao) then
    Exit;
  Config := TIniFile.Create(Fnc_ArquivoConfiguracao);
  try
    scoDados.Params.Values['DATABASE'] := Config.ReadString('Lotus', 'DATABASE', '');
    scoDados.Params.Values['USER_NAME'] := Config.ReadString('Lotus', 'USERNAME', '');
    scoDados.Params.Values['PASSWORD'] := Decoder64.DecodeString(Config.ReadString('Lotus', 'PASSWORD', ''));
    scoDados.Connected := True;
  finally
    FreeAndNil(Config);
  end;
end;

function TdmDatabase.ProximaSequencia(NomeTabela: string; Filial: Integer): Integer;
var
  sds: TSQLDataSet;
  iSeq: Integer;
  ID: TTransactionDesc;
  Flag: Boolean;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try

    ID.TransactionID := 999;
    ID.IsolationLevel := xilREADCOMMITTED;

    dmDatabase.scoDados.StartTransaction(ID);
    try //--
      sds.SQLConnection := dmDatabase.scoDados;

      sds.NoMetadata := True;
      sds.GetMetadata := False;

      //Esse comando foi tirado porque demora muito, as máquinas estavam demorando até 20 segundos para confirmar
     //sds.CommandText := 'SELECT NUMREGISTRO FROM SEQUENCIAL WHERE TABELA = :TABELA AND FILIAL = :FILIAL FOR UPDATE WITH LOCK';

      sds.CommandText := ' UPDATE SEQUENCIAL SET NUMREGISTRO = ( SELECT MAX(NUMREGISTRO)+1 ' +
        '                                         FROM SEQUENCIAL         ' +
        '                                        WHERE TABELA = :TABELA   ' +
        '                                          AND FILIAL = :FILIAL)  ' +
        '  WHERE TABELA = :TABELA   ' +
        '  AND FILIAL = :FILIAL  ';

      sds.ParamByName('TABELA').AsString := NomeTabela;
      sds.ParamByName('FILIAL').AsInteger := Filial;

      Flag := False;
      while not Flag do
      begin
        try
          sds.Close;
          sds.ExecSQL;
          Flag := True;
        except
          on E: Exception do
            Flag := False;
        end;
      end;

      sds.Close;
      sds.CommandText := ' SELECT MAX(NUMREGISTRO) NUMREGISTRO  ' +
        '   FROM SEQUENCIAL                    ' +
        '  WHERE TABELA = :TABELA              ' +
        '    AND FILIAL = :FILIAL              ';

      sds.ParamByName('TABELA').AsString := NomeTabela;
      sds.ParamByName('FILIAL').AsInteger := Filial;
      sds.Open;

      iSeq := sds.FieldByName('NUMREGISTRO').AsInteger;

      dmDatabase.scoDados.Commit(ID);

      Result := iSeq;

    except
      dmDatabase.scoDados.Rollback(ID);
      raise;
    end;

  finally
    FreeAndNil(sds);
  end;
end;

function TdmDatabase.Registro_Max(NomeTabela: string; Campo: String): Integer;
var
  sds: TSQLDataSet;
  iSeq: Integer;
begin
  Result := 0;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;

    sds.NoMetadata := True;
    sds.GetMetadata := False;

    sds.Close;
    sds.CommandText := ' SELECT MAX(' +CAMPO+ ')' + ' ID ' +
      '   FROM ' + NomeTabela;
    sds.Open;

    iSeq := sds.FieldByName('ID').AsInteger;

    Result := iSeq;


  finally
    FreeAndNil(sds);
  end;
end;


end.

