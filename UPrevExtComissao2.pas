unit UPrevExtComissao2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, RXLookup, Mask, ToolEdit, Db, DBTables,
  Grids, DBGrids, DBFilter, Menus, RXCtrls, RXDBCtrl, ShellApi;

type
  TfPrevExtComissao2 = class(TForm)
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Query1: TQuery;
    Query1CodVendedor: TIntegerField;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    MSDOS1: TMenuItem;
    Windows1: TMenuItem;
    tCReceberParc2: TTable;
    tCReceberParc2NumCReceber: TIntegerField;
    tCReceberParc2ParcCReceber: TIntegerField;
    tCReceberParc2VlrParcCReceber: TFloatField;
    tCReceberParc2DtVencCReceber: TDateField;
    tCReceberParc2QuitParcCReceber: TBooleanField;
    tCReceberParc2JurosParcCReceber: TFloatField;
    tCReceberParc2DtPagParcCReceber: TDateField;
    tCReceberParc2CodCli: TIntegerField;
    tCReceberParc2NumNota: TIntegerField;
    tCReceberParc2Desconto: TFloatField;
    tCReceberParc2PgtoParcial: TFloatField;
    tCReceberParc2RestParcela: TFloatField;
    tCReceberParc2ContaDupl: TSmallintField;
    tCReceberParc2Selecionado: TBooleanField;
    tCReceberParc2CodVendedor: TIntegerField;
    tCReceberParc2Baixada: TBooleanField;
    tCReceberParc2PercComissao: TFloatField;
    tCReceberParc2VlrComissao: TFloatField;
    tCReceberParc2PlanoContas: TIntegerField;
    tCReceberParc2Agencia: TStringField;
    tCReceberParc2TitPortador: TStringField;
    tCReceberParc2CodTipoCobranca: TIntegerField;
    tCReceberParc2Despesas: TFloatField;
    tCReceberParc2Abatimentos: TFloatField;
    tCReceberParc2CodConta: TIntegerField;
    tCReceberParc2PgCartorio: TBooleanField;
    tCReceberParc2DiasAtraso: TFloatField;
    tCReceberParc2LetraCambio: TBooleanField;
    tCReceberParc2NroLancExtComissao: TIntegerField;
    tCReceberParc2JurosPagos: TFloatField;
    tCReceberParc2Cancelado: TBooleanField;
    tCReceberParc2TitProtestado: TBooleanField;
    tCReceberParc2DtGerado: TDateField;
    tCReceberParc2TipoDoc: TStringField;
    tCReceberParc2VlrDevolucao: TFloatField;
    tCReceberParc2DuplicataImp: TBooleanField;
    tCReceberParc2PagarParteNaNota: TBooleanField;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Query1Nome: TStringField;
    qSaldoAnt: TQuery;
    qSaldoAntCodVendedor: TIntegerField;
    qSaldoAntVlrComissao: TFloatField;
    qSaldoAntFuncao: TStringField;
    qSaldoPeriodo: TQuery;
    qSaldoPeriodoCodVendedor: TIntegerField;
    qSaldoPeriodoVlrComissao: TFloatField;
    qSaldoPeriodoFuncao: TStringField;
    Label4: TLabel;
    ComboBox1: TComboBox;
    tCReceberParc2Serie: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure Windows1Click(Sender: TObject);
    procedure MSDOS1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Verifica_Linha;
    procedure Monta_SQL(CodVendedor : Integer);
    procedure Calcula_Saldos;
  public
    { Public declarations }
  end;

var
  fPrevExtComissao2: TfPrevExtComissao2;
  F : TextFile;
  Linha, Pagina : Integer;
  vEntradas, vSaidas, vDevolucao, vSaldoTotal, vSaldoAnterior, vSaldo  : Currency;

implementation

uses UDM1, UEscImpressora, URelExtComissao, USenhaExc, UEncComissao;

{$R *.DFM}

Procedure TfPrevExtComissao2.Calcula_Saldos;
begin
  vEntradas      := 0;
  vSaldo         := 0;
  vSaidas        := 0;
  vDevolucao     := 0;
  vSaldoAnterior := 0;
  vSaldoTotal    := 0;

  //Saldo anterior
  qSaldoAnt.First;
  while not qSaldoAnt.EOF do
    begin
      if qSaldoAntFuncao.AsString = 'E' then
        vSaldoAnterior := vSaldoAnterior + StrToFloat(FormatFloat('0.00',qSaldoAntVlrComissao.AsFloat))
      else
      if (qSaldoAntFuncao.AsString = 'S') or (qSaldoAntFuncao.AsString = 'D') then
        vSaldoAnterior := vSaldoAnterior - StrToFloat(FormatFloat('0.00',qSaldoAntVlrComissao.AsFloat));
      qSaldoAnt.Next;
    end;

  //Saldo do período
  qSaldoPeriodo.First;
  while not qSaldoPeriodo.Eof do
    begin
      if qSaldoPeriodoFuncao.AsString = 'E' then
        begin
          vEntradas   := vEntradas   + qSaldoPeriodoVlrComissao.AsFloat;
          vSaldo      := vSaldo      + qSaldoPeriodoVlrComissao.AsFloat;
        end
      else
      if qSaldoPeriodoFuncao.AsString = 'S' then
        begin
          vSaidas     := vSaidas     + qSaldoPeriodoVlrComissao.AsFloat;
          vSaldo      := vSaldo      - qSaldoPeriodoVlrComissao.AsFloat;
        end
      else
      if qSaldoPeriodoFuncao.AsString = 'D' then
        begin
          vDevolucao  := vDevolucao  + qSaldoPeriodoVlrComissao.AsFloat;
          vSaldo      := vSaldo      - qSaldoPeriodoVlrComissao.AsFloat;
        end;
      qSaldoPeriodo.Next;
    end;
  vSaldoTotal := vSaldoAnterior + vSaldo;
end;

Procedure TfPrevExtComissao2.Monta_SQL(CodVendedor : Integer);
begin
  //Monta sql saldo anterior
  qSaldoAnt.Close;
  qSaldoAnt.SQL.Clear;
  qSaldoAnt.SQL.Add('SELECT CodVendedor, SUM( VlrComissao ) VlrComissao, Funcao');
  qSaldoAnt.SQL.Add('FROM "dbExtComissao.DB" Dbextcomissao');
  qSaldoAnt.SQL.Add('WHERE   (DtReferencia < :DtReferencia)');
  qSaldoAnt.SQL.Add('   AND  (CodVendedor = :CodVendedor)');
  case ComboBox1.ItemIndex of
    0 : qSaldoAnt.SQL.Add('AND  (TIPO <> ''F'')');
    1 : qSaldoAnt.SQL.Add('AND  (TIPO = ''F'')');
  end;
  qSaldoAnt.ParamByName('CodVendedor').AsInteger := CodVendedor;
  qSaldoAnt.ParamByName('DtReferencia').AsDate   := DateEdit1.Date;
  qSaldoAnt.SQL.Add('GROUP BY CodVendedor, Funcao');
  qSaldoAnt.Open;

  //Monta sql por período
  qSaldoPeriodo.Close;
  qSaldoPeriodo.SQL.Clear;
  qSaldoPeriodo.SQL.Add('SELECT CodVendedor, SUM( VlrComissao ) VlrComissao, Funcao');
  qSaldoPeriodo.SQL.Add('FROM "dbExtComissao.DB" Dbextcomissao');
  qSaldoPeriodo.SQL.Add('WHERE   DtReferencia BETWEEN :DataIni AND :DataFin');
  qSaldoPeriodo.SQL.Add('AND  (CodVendedor = :CodVendedor)');
  case ComboBox1.ItemIndex of
    0 : qSaldoPeriodo.SQL.Add('AND  (TIPO <> ''F'')');
    1 : qSaldoPeriodo.SQL.Add('AND  (TIPO = ''F'')');
  end;
  qSaldoPeriodo.ParamByName('CodVendedor').AsInteger := CodVendedor;
  qSaldoPeriodo.ParamByName('DataIni').AsDate        := DateEdit1.Date;
  qSaldoPeriodo.ParamByName('DataFin').AsDate        := DateEdit2.Date;
  qSaldoPeriodo.SQL.Add('GROUP BY CodVendedor, Funcao');
  qSaldoPeriodo.Open;

  DM1.tExtComissao.Filtered := False;
  case ComboBox1.ItemIndex of
    0 : DM1.tExtComissao.Filter   := 'CodVendedor = '''+IntToStr(CodVendedor)+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+''' and Tipo <> '''+'F'+'''';
    1 : DM1.tExtComissao.Filter   := 'CodVendedor = '''+IntToStr(CodVendedor)+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+''' and Tipo = '''+'F'+'''';
    2 : DM1.tExtComissao.Filter   := 'CodVendedor = '''+IntToStr(CodVendedor)+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+'''';
  end;
  DM1.tExtComissao.Filtered := True;
end;

Procedure TfPrevExtComissao2.Imprime_Cabecalho;
var Texto1,Texto2 : String;
    i             : Integer;
begin
  Inc(Pagina);
  DM1.tEmpresa.First;
  Texto1 := Copy(DM1.tEmpresaEmpresa.AsString,1,50);
  For i := 1 to 53 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'RELACAO DE NOTAS EMITIDAS POR VENDEDOR                      Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);
  Verifica_Linha;
  for i := 1 to 53 do
    Texto2 := Texto2 + ' ';
  Texto2 := Texto2 + 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text +
            '                            Emissao: ' + DateToStr(Date);
  Writeln(F,Texto2);
  Verifica_Linha;
end;

procedure TfPrevExtComissao2.Verifica_Linha;
Var
  I : Integer;
begin
  Inc(Linha);
  if Linha = 63 then
    begin
      for i := 1 to 3 do
        Writeln(F);
      Imprime_Cabecalho;
      Writeln(F);
      Linha := 3;
    end;
end;

procedure TfPrevExtComissao2.Imprimir;
Var I : Integer;
    Texto : array[1..15] of String;
procedure Imprime_Detalhe;
Var I : Integer;
    vAux : Real;
    texto1, texto2 : String;
begin
  Texto1 := DM1.tExtComissaoDtReferencia.AsString + ' ';
  for i := 1 to 11 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  texto2 := '';
  if DM1.tExtComissaoFuncao.AsString = 'E' then
    Texto2  := 'Entr. '
  else
  if DM1.tExtComissaoFuncao.AsString = 'S' then
    Texto2  := 'Pgto. '
  else
  if DM1.tExtComissaoFuncao.AsString = 'D' then
    Texto2  := 'Devol. ';
  for i := 1 to 7 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2;
  Texto2  := DM1.tExtComissaoNroDoc.AsString + ' ';
  for i := 1 to 7 - length(Texto2) do
    Texto2 := ' ' + Texto2;
  texto1 := texto1 + texto2 + '/';
  Texto2  := DM1.tExtComissaoParcDoc.AsString + ' ';
  for i := 1 to 4 - length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2;
  texto2 := '';
  if DM1.tExtComissaoNroDoc.AsInteger > 0 then
    begin
      DM1.tNotaFiscal.IndexFieldNames  := 'NumNota';
      DM1.tNotaFiscal.SetKey;
      DM1.tNotaFiscalNumNota.AsInteger := DM1.tExtComissaoNroDoc.AsInteger;
      if DM1.tNotaFiscal.GotoKey then
        //texto2 := DM1.tNotaFiscalPedidoCliente.AsString;
        texto2 := DM1.tNotaFiscalPedidoRepresentante.AsString;
    end;
  for i := 1 to 15 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  texto1 := texto1 + texto2 + ' ';
  Texto2  := Copy(DM1.tExtComissaolkCliente.AsString,1,40);
  for i := 1 to 40 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  Texto2  := FormatFloat('###,###,##0.00',DM1.tExtComissaoVlrBase.AsFloat) + ' ';
  for i := 1 to 14 - length(Texto2) do
    Texto2 := ' ' + Texto2;
  texto1 := texto1 + texto2 + '   ';
  Texto2  := FormatFloat('#0.00',DM1.tExtComissaoPercComissao.AsFloat) + ' ';
  for i := 1 to 5 - length(Texto2) do
    Texto2 := ' ' + Texto2;
  texto1 := texto1 + texto2 + '  ';
  Texto2 := FormatFloat('###,###,##0.00',DM1.tExtComissaoVlrComissao.AsFloat) + ' ';
  for i := 1 to 14 - length(Texto2) do
    Texto2 := ' ' + Texto2;
  texto1 := texto1 + texto2 + '    ' + DM1.tExtComissaoTipo.AsString;
  Writeln(F,texto1);
  Verifica_Linha;

  //*** Imprime as parcelas quando o tipo for N "Nota"
  if DM1.tExtComissaoTipo.AsString = 'N' then
    begin
      for i := 1 to 15 do
        texto[i] := '';
      DM1.tNotaFiscal.IndexFieldNames := 'NumNota';
      DM1.tNotaFiscal.SetKey;
      DM1.tNotaFiscalNumNota.AsInteger := DM1.tExtComissaoNroDoc.AsInteger;
      if DM1.tNotaFiscal.GotoKey then
        begin
          DM1.tNotaFiscalParc.First;
          while not DM1.tNotaFiscalParc.Eof do
            begin
              Texto[1] := '            Dt.Vcto.: ';
              texto[2] := DM1.tNotaFiscalParcDtVenc.AsString;
              for i := 1 to 10 - Length(texto[2]) do
                texto[2] := texto[2] + ' ';
              texto[1] := texto[1] + texto[2] + '  Vlr.Parcela: ';
              texto[2] := FormatFloat('###,###,##0.00',DM1.tNotaFiscalParcVlrVenc.AsFloat);
              for i := 1 to 14 - Length(texto[2]) do
                texto[2] := ' ' + texto[2];
              texto[1] := texto[1] + texto[2] + '  %Com.: ';
              texto[2] := FormatFloat('##0.00',DM1.tNotaFiscalPercComissao.AsFloat);
              for i := 1 to 6 - Length(texto[2]) do
                texto[2] := ' ' + texto[2];
              texto[1] := texto[1] + texto[2] + '  Vlr.Comissao: ';
              vAux := StrToFloat(FormatFloat('0.00',(DM1.tNotaFiscalParcVlrVenc.AsFloat * DM1.tNotaFiscalPercComissao.AsFloat) / 100));
              texto[2] := FormatFloat('###,###,##0.00',vAux);
              for i := 1 to 14 - Length(texto[2]) do
                texto[2] := ' ' + texto[2];
              texto[1] := texto[1] + texto[2];
              Writeln(F,Texto[1]);
              Verifica_Linha;
              DM1.tNotaFiscalParc.next;
            end;
        end;
    end;
end;
begin
  Linha := 0;
  if RxDBLookupCombo1.Text <> '' then
    begin
      Monta_Sql(RxDBLookupCombo1.KeyValue);
      Calcula_Saldos;
      
      Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
      Verifica_Linha;
      Writeln(F,'Dt.Lanc.   Funcao      Nota            Pedido Cliente                                      Vlr. Base  %Comis.    Vlr. Comis.  Tipo');
      Verifica_Linha;
      Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
      Verifica_Linha;
      Texto[1] := 'Vendedor..: ';
      Texto[2] := RxDBLookupCombo1.Text;
      for i := 1 to 96 - length(Texto[2]) do
        Texto[2] := Texto[2] + ' ';
      Texto[3] := 'Saldo Ant.: ';
      Texto[4] := FormatFloat('0.00',vSaldoAnterior);
      for i := 1 to 8 - length(Texto[4]) do
        Texto[4] := ' ' + Texto[4];
      Writeln(F,Format('%s%s%s%s',[Texto[1],Texto[2],Texto[3],Texto[4]]));
      Verifica_Linha;
      DM1.tExtComissao.First;
      while not DM1.tExtComissao.EOF do
        begin
          Imprime_Detalhe;
          if DM1.tExtComissaoFuncao.AsString = 'E' then
            begin
              vEntradas   := vEntradas   + DM1.tExtComissaoVlrComissao.AsFloat;
              vSaldo      := vSaldo      + DM1.tExtComissaoVlrComissao.AsFloat;
            end;
          if DM1.tExtComissaoFuncao.AsString = 'S' then
            begin
              vSaidas     := vSaidas     + DM1.tExtComissaoVlrComissao.AsFloat;
              vSaldo      := vSaldo      - DM1.tExtComissaoVlrComissao.AsFloat;
            end;
          if DM1.tExtComissaoFuncao.AsString = 'D' then
            begin
              vDevolucao  := vDevolucao  + DM1.tExtComissaoVlrComissao.AsFloat;
              vSaldo      := vSaldo      - DM1.tExtComissaoVlrComissao.AsFloat;
            end;
          DM1.tExtComissao.Next;
        end;
      Writeln(F,'                                                                                 ----------------------------------------------------');
      Verifica_Linha;
      Texto[1] := 'Total Entradas.: ';
      for i := 1 to 102 do
        Texto[1] := ' ' + Texto[1];
      Texto[2] := FormatFloat('0.00',vEntradas);
      for i := 1 to 9 - length(Texto[2]) do
         Texto[2] := ' ' + Texto[2];
      Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
      Verifica_Linha;
      Texto[1] := 'Total Saidas...: ';
      for i := 1 to 102 do
        Texto[1] := ' ' + Texto[1];
      Texto[2] := FormatFloat('0.00',vSaidas);
      for i := 1 to 9 - length(Texto[2]) do
         Texto[2] := ' ' + Texto[2];
      Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
      Verifica_Linha;
      Texto[1] := 'Total Devolucao: ';
      for i := 1 to 102 do
        Texto[1] := ' ' + Texto[1];
      Texto[2] := FormatFloat('0.00',vDevolucao);
      for i := 1 to 9 - length(Texto[2]) do
         Texto[2] := ' ' + Texto[2];
      Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
      Verifica_Linha;
      Texto[1] := 'Total Periodo..: ';
      for i := 1 to 102 do
        Texto[1] := ' ' + Texto[1];
      Texto[2] := FormatFloat('0.00',vSaldo);
      for i := 1 to 9 - length(Texto[2]) do
         Texto[2] := ' ' + Texto[2];
      Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
      Verifica_Linha;
      vSaldoTotal := vSaldoAnterior + vSaldo;
      Texto[1] := 'Saldo Total....: ';
      for i := 1 to 102 do
        Texto[1] := ' ' + Texto[1];
      Texto[2] := FormatFloat('0.00',vSaldoTotal);
      for i := 1 to 9 - length(Texto[2]) do
         Texto[2] := ' ' + Texto[2];
      Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
      Verifica_Linha;
      DM1.tExtComissao.Filtered := False;
    end;
  if RxDBLookupCombo1.Text = '' then
    begin
      Query1.Active := True;
      Query1.First;
      while not Query1.EOF do
        begin
          Monta_Sql(Query1CodVendedor.AsInteger);
          Calcula_Saldos;
          if (vSaldoAnterior > 0) or (DM1.tExtComissao.RecordCount > 0) then
            begin
              Writeln(F,'-------------------------------------------------------------------------------------------------------------------------------------');
              Verifica_Linha;
              Writeln(F,'Dt.Lanc.   Funcao      Nota            Pedido Cliente                                      Vlr. Base  %Comis.    Vlr. Comis.  Tipo');
              Verifica_Linha;
              Writeln(F,'-------------------------------------------------------------------------------------------------------------------------------------');
              Verifica_Linha;
              Texto[1] := 'Vendedor..: ';
              Texto[2] := Query1Nome.AsString;
              for i := 1 to 96 - length(Texto[2]) do
                Texto[2] := Texto[2] + ' ';
              Texto[3] := 'Saldo Ant.: ';
              Texto[4] := FormatFloat('0.00',vSaldoAnterior);
              for i := 1 to 8 - length(Texto[4]) do
                Texto[4] := ' ' + Texto[4];
              Writeln(F,Format('%s%s%s%s',[Texto[1],Texto[2],Texto[3],Texto[4]]));
              Verifica_Linha;
            end;
          DM1.tExtComissao.First;
          while not DM1.tExtComissao.EOF do
            begin
              Imprime_Detalhe;
              if DM1.tExtComissaoFuncao.AsString = 'E' then
                begin
                  vEntradas   := vEntradas   + DM1.tExtComissaoVlrComissao.AsFloat;
                  vSaldo      := vSaldo      + DM1.tExtComissaoVlrComissao.AsFloat;
                end;
              if DM1.tExtComissaoFuncao.AsString = 'S' then
                begin
                  vSaidas     := vSaidas     + DM1.tExtComissaoVlrComissao.AsFloat;
                  vSaldo      := vSaldo      - DM1.tExtComissaoVlrComissao.AsFloat;
                end;
              if DM1.tExtComissaoFuncao.AsString = 'D' then
                begin
                  vDevolucao  := vDevolucao  + DM1.tExtComissaoVlrComissao.AsFloat;
                  vSaldo      := vSaldo      - DM1.tExtComissaoVlrComissao.AsFloat;
                end;
              DM1.tExtComissao.Next;
            end;
          if DM1.tExtComissao.RecordCount > 0 then
            begin
              Writeln(F,'                                                                                 ----------------------------------------------------');
              Verifica_Linha;
              Texto[1] := 'Total Entradas.: ';
              for i := 1 to 102 do
                Texto[1] := ' ' + Texto[1];
              Texto[2] := FormatFloat('0.00',vEntradas);
              for i := 1 to 9 - length(Texto[2]) do
                 Texto[2] := ' ' + Texto[2];
              Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
              Verifica_Linha;
              Texto[1] := 'Total Saidas...: ';
              for i := 1 to 102 do
                Texto[1] := ' ' + Texto[1];
              Texto[2] := FormatFloat('0.00',vSaidas);
              for i := 1 to 9 - length(Texto[2]) do
                 Texto[2] := ' ' + Texto[2];
              Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
              Verifica_Linha;
              Texto[1] := 'Total Devolucao: ';
              for i := 1 to 102 do
                Texto[1] := ' ' + Texto[1];
              Texto[2] := FormatFloat('0.00',vDevolucao);
              for i := 1 to 9 - length(Texto[2]) do
                 Texto[2] := ' ' + Texto[2];
              Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
              Verifica_Linha;
              Texto[1] := 'Total do Periodo.: ';
              for i := 1 to 102 do
                Texto[1] := ' ' + Texto[1];
              Texto[2] := FormatFloat('0.00',vSaldo);
              for i := 1 to 9 - length(Texto[2]) do
                 Texto[2] := ' ' + Texto[2];
              Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
              Verifica_Linha;
              vSaldoTotal := vSaldoAnterior + vSaldo;
              Texto[1] := 'Saldo Total....: ';
              for i := 1 to 102 do
                Texto[1] := ' ' + Texto[1];
              Texto[2] := FormatFloat('0.00',vSaldoTotal);
              for i := 1 to 9 - length(Texto[2]) do
                 Texto[2] := ' ' + Texto[2];
              Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));
              Verifica_Linha;
            end;
          Query1.Next;
        end;
      Query1.Active             := False;
      DM1.tExtComissao.Filtered := False;
    end;
end;

procedure TfPrevExtComissao2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tVendedor.Close;
      DM1.tExtComissao.Close;
      DM1.tNotaFiscal.Close;
      DM1.tNotaFiscalParc.Close;
      DM1.tNotaFiscalItens.Close;
      DM1.tCliente.Close;
    end;
  Action := caFree;
end;

procedure TfPrevExtComissao2.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPrevExtComissao2.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevExtComissao2.FormShow(Sender: TObject);
begin
  DM1.tVendedor.Open;
  DM1.tExtComissao.Open;
  DM1.tNotaFiscal.Open;
  DM1.tNotaFiscalParc.Open;
  DM1.tNotaFiscalItens.Open;
  DM1.tCliente.Open;
  RxDBLookupCombo1.SetFocus;
  tCReceberParc2.Refresh;
  BitBtn1.Visible := DM1.tUsuarioMostrarDtEncerramento.AsBoolean;
end;

procedure TfPrevExtComissao2.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfPrevExtComissao2.Windows1Click(Sender: TObject);
begin
  if ((DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ')) and (DateEdit1.Date <= DateEdit2.Date) and (RxDBLookupCombo1.Text <> '')then
    begin
      Screen.Cursor := crHourGlass;
      if RxDBLookupCombo1.Text <> '' then
        begin
          DM1.tExtComissao.IndexFieldNames := 'CodVendedor;DtReferencia';
          Monta_Sql(RxDBLookupCombo1.KeyValue);
          Calcula_Saldos;
          
          fRelExtComissao := TfRelExtComissao.Create(Self);
          fRelExtComissao.RLLabel22.Caption := FormatFloat('###,###,##0.00',vSaldoAnterior);
          fRelExtComissao.RLLabel30.Caption := FormatFloat('###,###,##0.00',vEntradas);
          fRelExtComissao.RLLabel31.Caption := FormatFloat('###,###,##0.00',vSaidas);
          fRelExtComissao.RLLabel32.Caption := FormatFloat('###,###,##0.00',vDevolucao);
          fRelExtComissao.RLLabel33.Caption := FormatFloat('###,###,##0.00',vSaldo);
          fRelExtComissao.RLLabel34.Caption := FormatFloat('###,###,##0.00',vSaldoTotal);
          fRelExtComissao.RLReport1.Preview;
          fRelExtComissao.RLReport1.Free;
        end;
      Query1.Close;
      qSaldoAnt.Close;
      qSaldoPeriodo.Close;
      DM1.tExtComissao.Filtered := False;
      DM1.tVendedor.Filtered    := False;
      Screen.Cursor := crDefault;
      DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
    end
  else
    begin
      ShowMessage('É nessessário informar uma data valida!');
      DateEdit1.Date := Date;
      DateEdit2.Date := Date;
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevExtComissao2.MSDOS1Click(Sender: TObject);
var
  Texto : String;
begin
  if ((DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ')) and (DateEdit1.Date <= DateEdit2.Date) then
    begin
      DM1.tExtComissao.IndexFieldNames := 'CodVendedor;DtReferencia';
      Screen.Cursor := crHourGlass;
      fEscImpressora := TfEscImpressora.Create(Self);
      fEscImpressora.ShowModal;
      AssignFile(F,DM1.tImpressoraEndereco.AsString);
      ReWrite(F);
      Write(F,'0'#15);
      if RxDBLookupCombo1.Text = '' then
        Query1.Active := True;
      Pagina := 0;
      Imprime_Cabecalho;
      Imprimir;
      CloseFile(F);
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      if DM1.tImpressoraVisualizar.AsBoolean then
        //WinExec(PChar(Texto),SW_MAXIMIZE);
        ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
      Query1.Active             := False;
      DM1.tExtComissao.Filtered := False;
      DM1.tVendedor.Filtered    := False;
      Screen.Cursor := crDefault;
      DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
    end
  else
    begin
      ShowMessage('É nessessário informar uma data valida!');
      DateEdit1.Date := Date;
      DateEdit2.Date := Date;
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevExtComissao2.BitBtn1Click(Sender: TObject);
begin
  fEncComissao := TfEncComissao.Create(Self);
  fEncComissao.ShowModal;
end;

procedure TfPrevExtComissao2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    begin
      ComboBox1.Visible := not(ComboBox1.Visible);
      Label4.Visible    := not(Label4.Visible);
    end;
end;

end.
