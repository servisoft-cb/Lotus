unit uUtil;

interface

uses
  Classes, SysUtils, DB, Dialogs, Variants, Windows;

  function Monta_Numero(Campo: String; Tamanho: Integer): String;
  function TirarAcento(texto: string): string;
  function Monta_Texto(Campo: String; Tamanho: Integer): String;
  procedure prc_Grava_ObsTalao(Obs : String);
  procedure prc_chama_fPedidoCopiaObs;
  procedure prc_chama_fConsEstoqueMatLoc;

  function Verifica_TalaoFB(Pedido, Item : Integer) : Boolean;

  procedure prc_Monta_CombinacaoMaterial(CodCor1, CodCor2 : Integer);
  function fnc_Monta_Locacao(CodMaterial, CodCor : Integer) : Real;
  function Replace(Str, Ant, Novo: string): string;
  function PegaTimeZone: string;

  function Criptografar(ABase: integer; AChave, AValue: string): string;
  { Criptografa o valor informado
    - Parâmetros -
    ABase  -> Número da base utilizada para gerar o serial
    AChave -> Chave utilizada para gerar o serial
    AValue -> Valor que ser criptografado
  }

  function Descriptografar(ABase: integer; AChave, AValue: string): string;
  { Descriptografa o valor informado
    - Parâmetros -
    ABase  -> Número da base utilizada para gerar o serial
    AChave -> Chave utilizada para gerar o serial
    AValue -> Valor que ser descriptografado
  }
  function GerarSerial(ABase: Integer; AChave: string): string;
  { Gera serial
    - Parâmetros -
    ABase  -> Número da base utilizada para gerar o serial
    AChave -> Chave utilizada para gerar o serial
  }

var
  vCalcFrete, vCalcTotalNota, vCalcSeguro, vCalcOutrasDesp : Real;
  vContadorOutros : Integer;
  vFlagGeraDupl : Boolean;

  vEmail_Fortes, vEmail_Assunto_Fortes: String;
  vEmail_Fortes_Corpo: String;
  vFilial : Integer;
  vTipo_Config_Email : Integer;

implementation

uses
  StrUtils, UEmissaoNotaFiscal, UDM1, DateUtils,
  JvSerialMaker, JvXorCipher, JvComponent, JvVigenereCipher, IdCoder, IdCoder3to4, IdCoderMIME, IdBaseComponent;

function Verifica_TalaoFB(Pedido, Item : Integer) : Boolean;
begin
  //Essa função é para a Sagga, pois na Anna não existe os talões em FB
  {Result := False;
  if not(dmLoteTalao.cdsLotePedidoItem.Active) then
    dmLoteTalao.cdsLotePedidoItem.Open;
  if dmLoteTalao.cdsLotePedidoItem.Locate('PEDIDO;ITEM',VarArrayOf([Pedido,Item]),[locaseinsensitive]) then
  begin
    ShowMessage('Registro não pode ser excluido pois ja existe talão gerado!');
    exit;
  end;}
  Result := True;
end;

procedure prc_Grava_ObsTalao(Obs : String);
begin

end;

procedure prc_chama_fPedidoCopiaObs;
begin

end;

function fnc_Monta_Locacao(CodMaterial, CodCor : Integer) : Real;
begin

end;

procedure prc_Monta_CombinacaoMaterial(CodCor1, CodCor2 : Integer);
begin

end;

procedure prc_chama_fConsEstoqueMatLoc;
begin

end;

function Replace(Str, Ant, Novo: string): string;
var
  iPos: Integer;
begin
  while Pos(Ant, Str) > 0 do
  begin
    iPos := Pos(Ant, Str);
    Str := copy(Str, 1, iPos - 1) + Novo + copy(Str, iPos + 1, Length(Str) - iPos);
  end;
  Result := Str;
end;

function PegaTimeZone: string;
var
  TimeZone: TTimeZoneInformation;
begin
  GetTimeZoneInformation(TimeZone);
  Result := FormatFloat('00', TimeZone.Bias div -60) + ':00';
end;

function Monta_Numero(Campo: String; Tamanho: Integer): String;
var
  texto2: String;
  i: Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
    if Campo[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      Texto2 := Texto2 + Copy(Campo,i,1);
  for i := 1 to Tamanho - Length(texto2) do
    texto2 := '0' + texto2;
  Result := texto2;
end;

function TirarAcento(Texto: string): string;
var
  i: Integer;
begin
  Texto := Trim(AnsiUpperCase(Texto));
  for i := 1 to Length(texto) do
  begin
    if Pos(Texto[i],' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
    begin
      case Texto[i] of
        'Á', 'À', 'Â', 'Ä', 'Ã': Texto[i] := 'A';
        'É', 'È', 'Ê', 'Ë': Texto[i] := 'E';
        'Í', 'Ì', 'Î', 'Ï': Texto[i] := 'I';
        'Ó', 'Ò', 'Ô', 'Ö', 'Õ': Texto[i] := 'O';
        'Ú', 'Ù', 'Û', 'Ü': Texto[i] := 'U';
        'Ç': Texto[i] := 'C';
        'Ñ': Texto[i] := 'N';
      else
        Texto[i] := ' ';
      end;
    end;
  end;
  Texto := StringReplace(Texto, '&', 'e',[rfReplaceAll, rfIgnoreCase]);
  Result := AnsiUpperCase(Texto);
end;

function Monta_Texto(Campo: String; Tamanho: Integer): String;
var
  texto2: String;
  i: Integer;
begin
  texto2 := '';
  for i := 1 to Length(Campo) do
    if Campo[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      Texto2 := Texto2 + Copy(Campo,i,1);
  for i := 1 to Tamanho - Length(texto2) do
    texto2 := '0' + texto2;
  Result := texto2;
end;

function Criptografar(ABase: integer; AChave, AValue: string): string;
var
  Cipher: TJvVigenereCipher;
  Encoder: TIdEncoderMIME;
begin
  Cipher  := TJvVigenereCipher.Create(nil);
  Encoder := TIdEncoderMIME.Create(nil);
  try
    Cipher.Key := GerarSerial(ABase, AChave);
    Cipher.Decoded := AValue;
    Result := Encoder.Encode( Cipher.Encoded );
  finally
    FreeAndNil(Cipher);
    FreeAndNil(Encoder);
  end;
end;

function Descriptografar(ABase: integer; AChave, AValue: string): string;
var
  Cipher: TJvVigenereCipher;
  Decoder: TIdDecoderMIME;
begin
  Cipher  := TJvVigenereCipher.Create(nil);
  Decoder := TIdDecoderMIME.Create(nil);
  try
    Cipher.Key := GerarSerial(ABase, AChave);
    Cipher.Encoded := Decoder.DecodeToString( AValue );
    Result := Cipher.Decoded;
  finally
    FreeAndNil(Cipher);
    FreeAndNil(Decoder);
  end;
end;

function GerarSerial(ABase: Integer; AChave: string): string;
var
  SerialMaker: TJvSerialMaker;
begin
  SerialMaker := TJvSerialMaker.Create(nil);
  try
    Result := SerialMaker.GiveSerial(ABase, AChave);
  finally
    FreeAndNil(SerialMaker);
  end;
end;

end.
