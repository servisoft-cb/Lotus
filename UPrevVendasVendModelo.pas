unit UPrevVendasVendModelo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit,
  CurrEdit, Db, DBTables, MemTable, RXLookup, DBFilter, ComCtrls, ShellApi;

type
  TfPrevVendasVendModelo = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBFilter2: TRxDBFilter;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    dsAuxVendasRef: TDataSource;
    dsAuxVendas: TDataSource;
    tAuxVendas: TTable;
    tAuxVendasDescMaterial: TStringField;
    tAuxVendasCodCor: TIntegerField;
    tAuxVendasAno: TSmallintField;
    tAuxVendasMes: TSmallintField;
    tAuxVendasQtdPedido: TIntegerField;
    tAuxVendasQtdFaturado: TIntegerField;
    tAuxVendasNome: TStringField;
    tAuxVendasRef: TTable;
    tAuxVendasRefDescMaterial: TStringField;
    tAuxVendasRefCodCor: TIntegerField;
    tAuxVendasRefQtdTotal: TIntegerField;
    tAuxVendasReflkNomeCor: TStringField;
    tAuxVendasRefConstrucao: TStringField;
    tAuxVendasRefReferencia: TStringField;
    tAuxVendasCodigo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;
    procedure Monta_Tab;
  public
    { Public declarations }
  end;

var
  fPrevVendasVendModelo: TfPrevVendasVendModelo;
  linha, pagina : Integer;
  F: TextFile;
  MesCab: Array [1..12] of String[4];
  vQtdTab: Array [1..13] of Integer;
  vMesTab: Array [1..12] of Integer;
  vQtdTotalTab: Array [1..13] of Integer;
  TextoMes, TextoCab, TextoQtd : string;
  vRef, vQtdTotal : Integer;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevVendasVendModelo.Monta_Tab;
var
 i, vQtdAux : Integer;
begin
  for i := 1 to 12 do
    begin
      if vMesTab[i] = tAuxVendasMes.AsInteger then
        begin
          if RadioGroup1.ItemIndex = 0 then
            vQtdTab[i] := vQtdTab[i] + tAuxVendasQtdPedido.AsInteger
          else
          if RadioGroup1.ItemIndex = 1 then
            vQtdTab[i] := vQtdTab[i] + tAuxVendasQtdFaturado.AsInteger
          else
            begin
              vQtdAux := tAuxVendasQtdPedido.AsInteger - tAuxVendasQtdFaturado.AsInteger;
              vQtdTab[i] := vQtdTab[i] + vQtdAux;
            end;
        end;
    end;
end;

procedure TfPrevVendasVendModelo.Imprimir;
var
 i,flag : Integer;
 ano, mes, dia, ano2, mes2, dia2 : Word;
 Texto : String;
begin
  MesCab[1]  := 'Jan/';
  MesCab[2]  := 'Fev/';
  MesCab[3]  := 'Mar/';
  MesCab[4]  := 'Abr/';
  MesCab[5]  := 'Mai/';
  MesCab[6]  := 'Jun/';
  MesCab[7]  := 'Jul/';
  MesCab[8]  := 'Ago/';
  MesCab[9]  := 'Set/';
  MesCab[10] := 'Out/';
  MesCab[11] := 'Nov/';
  MesCab[12] := 'Dez/';

// montando os meses para imprimir no cabecalho
  TextoMes  := '';
  TextoQtd  := '';
  vRef      := 0;
  vQtdTotal := 0;
  flag      := 0;
  for i := 1 to 12 do
    begin
      vMesTab[i] := 0;
      vQtdTab[i] := 0;
    end;
  i := 0;
  DecodeDate(DateEdit1.Date,ano,mes,dia);
  DecodeDate(DateEdit2.Date,ano2,mes2,dia2);

  while flag = 0 do
    begin
      inc(i);
      vMesTab[i] := mes;
      TextoMes := TextoMes + MesCab[mes] + IntToStr(ano) + ' ';
      mes := mes + 1;
      if mes > 12 then
        begin
          mes := 1;
          ano := ano + 1;
        end;
      if (ano > ano2) or ((ano = ano2) and (mes > mes2)) then
        flag := 1;
    end;

  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);

  tAuxVendasRef.IndexName := 'iQtdTotal';
  tAuxVendasRef.Refresh;
  tAuxVendasRef.First;
  while not tAuxVendasRef.Eof do
    begin
      if linha > 61 then
        Imprime_Cabecalho;
      for i := 1 to 12 do
       vQtdTab[i] := 0;
      vQtdTotal := 0;
      tAuxVendas.Filtered := False;
      if RadioGroup2.ItemIndex = 0 then
        tAuxVendas.Filter   := 'Codigo = ''' + tAuxVendasRefReferencia.AsString + ''''
      else
        tAuxVendas.Filter   := 'Codigo = ''' + tAuxVendasRefReferencia.AsString + ''' and CodCor = ''' + tAuxVendasRefCodCor.AsString + '''';
      tAuxVendas.Filtered := True;
      tAuxVendas.Refresh;
      tAuxVendas.First;
      while not tAuxVendas.EOF do
        begin
          Monta_Tab;
          tAuxVendas.Next;
        end;
      for i := 1 to 12 do
        vQtdTotalTab[i] := vQtdTotalTab[i] + vQtdTab[i];
      Imprime_Detalhe;
      tAuxVendasRef.Next;
    end;
  tAuxVendas.Filtered := False;
  tAuxVendasRef.IndexFieldNames := 'Referencia';
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfPrevVendasVendModelo.Imprime_Cabecalho;
var
 i : Integer;
 texto1 : String;
begin
  pagina := pagina + 1;
  if Pagina > 1 then
    begin
      while linha < 66 do
        begin
          Linha := Linha + 1;
          Writeln(F);
        end;
    end;

  DM1.tEmpresa.First;
  Texto1 := Copy(DM1.tEmpresaEmpresa.AsString,1,50);
  For i := 1 to 53 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'RELACAO DE VENDAS POR MODELO                            Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);

  if RxDBLookupCombo1.Text <> '' then
    Texto1 := 'Vendedor: ' + RxDBLookupCombo1.Text
  else
    Texto1 := 'Vendedor: ' + 'Todos';
  for i := 1 to 53 - length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text +
            '                            Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);

  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  if Pagina < 2 then
    begin
      if RadioGroup2.ItemIndex = 0 then
        Writeln(F,'        Modelo                                   ')
      else
        Writeln(F,'        Modelo             Cor                   ');
    end;

  TextoMes := '     ' + TextoMes + '   Total';
  Writeln(F,TextoMes);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  linha := 6;
end;

procedure TfPrevVendasVendModelo.Imprime_Detalhe;
var
 i, i2: Integer;
 Texto1, Texto2 : string;
begin
  if tAuxVendasRefReferencia.AsString <> '' then
    begin
      TextoQtd := tAuxVendasRefReferencia.AsString;
      for i := 1 to 20 - Length(TextoQtd) do
        TextoQtd := ' ' +  TextoQtd;
      TextoQtd := ' ' + TextoQtd;
    end
  else
    TextoQtd := '           ' + 'SEM MODELO';

  Texto1 := '';
  if RadioGroup2.ItemIndex = 1 then
    Texto1 := tAuxVendasReflkNomeCor.AsString;
  for i := 1 to 15 - Length(Texto1) do
    Texto1 := Texto1 + '-';
  TextoQtd := TextoQtd + '-----' + Texto1;

  Writeln(F,TextoQtd);
  Linha := Linha + 1;

  Texto1 := '';
  for i := 1 to 12 do
    begin
      if vMesTab[i] > 0 then
        begin
          Texto2 := FormatFloat('###,###',vQtdTab[i]);
          for i2 := 1 to 7 - Length(Texto2) do
            Texto2 := ' ' + Texto2;
          Texto1 := Texto1 + '  ' + Texto2;
          vQtdTotal := vQtdTotal + vQtdTab[i];
        end;
    end;

  Texto2 := FormatFloat('###,###',vQtdTotal);
  for i2 := 1 to 7 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := '    ' + Texto1 + '    ' + Texto2;

  Writeln(F,Texto1);
  Linha := Linha + 1;

  TextoQtd := '';
  Texto1   := '';
end;

procedure TfPrevVendasVendModelo.Imprime_Rodape;
var
 i, i2: Integer;
 Texto1 : string;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  vQtdTotal := 0;
  TextoQtd := 'Tot:';
  for i := 1 to 12 do
    begin
      if vMesTab[i] > 0 then
        begin
          Texto1 := FormatFloat('###,###',vQtdTotalTab[i]);
          for i2 := 1 to 7 - Length(Texto1) do
            Texto1 := ' ' + Texto1;
          TextoQtd := TextoQtd + '  ' + Texto1;
          vQtdTotal := vQtdTotal + vQtdTotalTab[i];
        end;
    end;
  Texto1 := FormatFloat('###,###',vQtdTotal);
  for i2 := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoQtd := TextoQtd + '    ' + Texto1;
  Writeln(F,TextoQtd);
  TextoQtd := '';
  linha := linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevVendasVendModelo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tVendedor.Close;
  DM1.tCliente.Close;
  DM1.tProduto.Close;
  DM1.tCor.Close;
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  DM1.tNotaFiscal.Close;
  DM1.tNotaFiscalItens.Close;
  tAuxVendas.First;
  while not tAuxVendas.EOF do
    tAuxVendas.Delete;
  tAuxVendasRef.First;
  while not tAuxVendasRef.EOF do
    tAuxVendasRef.Delete;
  Action := Cafree;
end;

procedure TfPrevVendasVendModelo.BitBtn6Click(Sender: TObject);
var
 Ano,Mes,Dia : Word;
 i : Integer;
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') then
    begin
      ShowMessage('Selecione data inicial e data final!');
      Exit;
    end
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que data final')
  else
    begin
      if DateEdit2.Date - DateEdit1.Date > 365 then
        begin
          ShowMessage('Período não pode ser maior que um ano!');
          Exit;
        end
      else
        begin
          for i := 1 to 12 do
            vQtdTotalTab[i] := 0;
          Screen.Cursor := crHourglass;
          if RxDBLookupCombo1.Text = '' then
            begin
              DM1.tPedido.Filtered := False;
              Case RadioGroup3.ItemIndex of
                0 : begin
                      Case RadioGroup4.ItemIndex of
                        0 : DM1.tPedido.Filter := 'DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                        1 : DM1.tPedido.Filter := 'DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
                      end;
                    end;
                1 : begin
                      Case RadioGroup4.ItemIndex of
                        0 : DM1.tPedido.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                        1 : DM1.tPedido.Filter   := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
                      end;
                    end;
              end;
              DM1.tPedido.Filtered := True;
              DM1.tNotaFiscal.IndexFieldNames := 'DtEmissao';
              DM1.tNotaFiscal.Filtered        := False;
              DM1.tNotaFiscal.Filter          := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelada <> True and CondPgto <> ''N''';
              DM1.tNotaFiscal.Filtered        := True;
            end
          else
            begin
              if RxDBLookupCombo1.Text <> '' then
                begin
                  DM1.tPedido.Filtered := False;
                  Case RadioGroup3.ItemIndex of
                    0 : begin
                          Case RadioGroup4.ItemIndex of
                            0 : DM1.tPedido.Filter := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                            1 : DM1.tPedido.Filter := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
                          end;
                        end;
                    1 : begin
                          Case RadioGroup4.ItemIndex of
                            0 : DM1.tPedido.Filter := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                            1 : DM1.tPedido.Filter := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
                          end;
                        end;
                  end;
                  DM1.tPedido.Filtered := True;
                  DM1.tNotaFiscal.IndexFieldNames := 'CodVendedor;DtEmissao';
                  DM1.tNotaFiscal.Filtered        := False;
                  DM1.tNotaFiscal.Filter          := 'DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelada <> True and CondPgto <> ''N'' and CodVendedor = '''+IntToStr(DM1.tVendedorCodigo.AsInteger)+'''';
                  DM1.tNotaFiscal.Filtered        := True;
                end;
            end;
        // Deleta os registros do arquivo auxiliar
          tAuxVendas.First;
          while not tAuxVendas.EOF do
            tAuxVendas.Delete;
          tAuxVendasRef.First;
          while not tAuxVendasRef.EOF do
            tAuxVendasRef.Delete;
          tAuxVendasRef.IndexFieldNames := 'Referencia';
        // Lê os pedidos para gravar a quantidade dos pedidos
          if (RadioGroup1.ItemIndex = 0) or (RadioGroup1.ItemIndex = 2) then
            begin
              DM1.tPedido.First;
              while not DM1.tPedido.EOF do
                begin
                  DM1.tPedidoItem.First;
                  while not DM1.tPedidoItem.EOF do
                    begin
                      tAuxVendasRef.SetKey;
                      tAuxVendasRefReferencia.AsString   := DM1.tPedidoItemlkNomeModelo.AsString;
                      if RadioGroup2.ItemIndex = 0 then
                        tAuxVendasRefCodCor.AsInteger := 0
                      else
                        tAuxVendasRefCodCor.AsInteger := DM1.tPedidoItemCodCor.AsInteger;
                      if tAuxVendasRef.GotoKey then
                        begin
                          tAuxVendasRef.Edit;
                          tAuxVendasRefQtdTotal.AsInteger := tAuxVendasRefQtdTotal.AsInteger +
                                                             (DM1.tPedidoItemQtdPares.AsInteger - DM1.tPedidoItemQtdParesCanc.AsInteger);
                          tAuxVendasRef.Post;
                        end
                      else
                        begin
                          tAuxVendasRef.Insert;
                          tAuxVendasRefReferencia.AsString   := DM1.tPedidoItemlkNomeModelo.AsString;
                          if RadioGroup2.ItemIndex = 0 then
                            tAuxVendasRefCodCor.AsInteger     := 0
                          else
                            tAuxVendasRefCodCor.AsInteger     := DM1.tPedidoItemCodCor.AsInteger;
                          tAuxVendasRefQtdTotal.AsInteger   := (DM1.tPedidoItemQtdPares.AsInteger - DM1.tPedidoItemQtdParesCanc.AsInteger);
                          tAuxVendasRef.Post;
                        end;
                      Case RadioGroup3.ItemIndex of
                        0 : DecodeDate(DM1.tPedidoDtFinEmbarque.AsDateTime,ano,mes,dia);
                        1 : DecodeDate(DM1.tPedidoDtEmissao.AsDateTime,ano,mes,dia);
                      end;
                      tAuxVendas.SetKey;
                      tAuxVendasAno.AsInteger          := Ano;
                      tAuxVendasMes.AsInteger          := Mes;
                      tAuxVendasCodigo.AsString        := DM1.tPedidoItemlkNomeModelo.AsString;
                      if RadioGroup2.ItemIndex = 0 then
                        tAuxVendasCodCor.AsInteger := 0
                      else
                        tAuxVendasCodCor.AsInteger := DM1.tPedidoItemCodCor.AsInteger;
                      if tAuxVendas.GotoKey then
                        begin
                          tAuxVendas.Edit;
                          tAuxVendasQtdPedido.AsInteger := tAuxVendasQtdPedido.AsInteger +
                                                           (DM1.tPedidoItemQtdPares.AsInteger - DM1.tPedidoItemQtdParesCanc.AsInteger);
                          tAuxVendas.Post;
                        end
                      else
                        begin
                          tAuxVendas.Insert;
                          tAuxVendasAno.AsInteger         := Ano;
                          tAuxVendasMes.AsInteger         := Mes;
                          tAuxVendasCodigo.AsString       := DM1.tPedidoItemlkNomeModelo.AsString;
                          if RadioGroup2.ItemIndex = 0 then
                            tAuxVendasCodCor.AsInteger      := 0
                          else
                            tAuxVendasCodCor.AsInteger      := DM1.tPedidoItemCodCor.AsInteger;
                          tAuxVendasQtdPedido.AsInteger   := DM1.tPedidoItemQtdPares.AsInteger - DM1.tPedidoItemQtdParesCanc.AsInteger;
                          tAuxVendasQtdFaturado.AsInteger := 0;
                          tAuxVendas.Post;
                        end;
                      DM1.tPedidoItem.Next;
                    end;
                  DM1.tPedido.Next;
                end;
            end;
        // Lê as notas para gravar a quantidade das notas
          if (RadioGroup1.ItemIndex = 1) or (RadioGroup1.ItemIndex = 2) then
            begin
              DM1.tNotaFiscal.First;
              while not DM1.tNotaFiscal.EOF do
                begin
                  DM1.tNotaFiscalItens.First;
                  while not DM1.tNotaFiscalItens.EOF do
                    begin
                      tAuxVendasRef.SetKey;
                      tAuxVendasRefReferencia.AsString    := DM1.tNotaFiscalItenslkNomeModelo.AsString;
                      if RadioGroup2.ItemIndex = 0 then
                        tAuxVendasRefCodCor.AsInteger := 0
                      else
                        tAuxVendasRefCodCor.AsInteger := DM1.tNotaFiscalItensCodCor.AsInteger;
                      if tAuxVendasRef.GotoKey then
                        begin
                          tAuxVendasRef.Edit;
                          if RadioGroup1.ItemIndex = 2 then
                              tAuxVendasRefQtdTotal.AsInteger := tAuxVendasRefQtdTotal.AsInteger - DM1.tNotaFiscalItensQtd.AsInteger
                            else
                              tAuxVendasRefQtdTotal.AsInteger := tAuxVendasRefQtdTotal.AsInteger + DM1.tNotaFiscalItensQtd.AsInteger;
                          tAuxVendasRef.Post;
                        end
                      else
                        begin
                          tAuxVendasRef.Insert;
                          tAuxVendasRefReferencia.AsString    := DM1.tNotaFiscalItenslkNomeModelo.AsString;
                          if RadioGroup2.ItemIndex = 0 then
                            tAuxVendasRefCodCor.AsInteger := 0
                          else
                            tAuxVendasRefCodCor.AsInteger := DM1.tNotaFiscalItensCodCor.AsInteger;
                          if RadioGroup1.ItemIndex = 2 then
                            tAuxVendasRefQtdTotal.AsInteger   := DM1.tNotaFiscalItensQtd.AsInteger * -1
                          else
                            tAuxVendasRefQtdTotal.AsInteger   := DM1.tNotaFiscalItensQtd.AsInteger;
                          tAuxVendasRef.Post;
                        end;
                      DecodeDate(DM1.tNotaFiscalDtEmissao.AsDateTime,ano,mes,dia);
                      tAuxVendas.SetKey;
                      tAuxVendasAno.AsInteger          := Ano;
                      tAuxVendasMes.AsInteger          := Mes;
                      tAuxVendasCodigo.AsString        := DM1.tNotaFiscalItenslkNomeModelo.AsString;
                      if RadioGroup2.ItemIndex = 0 then
                        tAuxVendasCodCor.AsInteger := 0
                      else
                        tAuxVendasCodCor.AsInteger := DM1.tNotaFiscalItensCodCor.AsInteger;
                      if tAuxVendas.GotoKey then
                        begin
                          tAuxVendas.Edit;
                          tAuxVendasQtdFaturado.AsInteger := tAuxVendasQtdFaturado.AsInteger +
                                                             DM1.tNotaFiscalItensQtd.AsInteger;
                          tAuxVendas.Post;
                        end
                      else
                        begin
                          tAuxVendas.Insert;
                          tAuxVendasAno.AsInteger         := Ano;
                          tAuxVendasMes.AsInteger         := Mes;
                          tAuxVendasCodigo.AsString       := DM1.tNotaFiscalItenslkNomeModelo.AsString;
                           if RadioGroup2.ItemIndex = 0 then
                            tAuxVendasCodCor.AsInteger := 0
                          else
                            tAuxVendasCodCor.AsInteger := DM1.tNotaFiscalItensCodCor.AsInteger;
                          tAuxVendasQtdPedido.AsInteger   := 0;
                          tAuxVendasQtdFaturado.AsInteger := DM1.tNotaFiscalItensQtd.AsInteger;
                          tAuxVendas.Post;
                        end;
                      DM1.tNotaFiscalItens.Next;
                    end;
                  DM1.tNotaFiscal.Next;
                end;
              DM1.tPedido.First;
              while not DM1.tPedido.EOF do
                begin
                  DM1.tPedidoItem.First;
                  while not DM1.tPedidoItem.EOF do
                    begin
                      tAuxVendasRef.SetKey;
                      tAuxVendasRefReferencia.AsString    := DM1.tPedidoItemlkNomeModelo.AsString;
                      if RadioGroup2.ItemIndex = 0 then
                        tAuxVendasRefCodCor.AsInteger := 0
                      else
                        tAuxVendasRefCodCor.AsInteger := DM1.tPedidoItemCodCor.AsInteger;
                      if tAuxVendasRef.GotoKey then
                        begin
                          tAuxVendasRef.Edit;
                          if RadioGroup1.ItemIndex = 2 then
                              tAuxVendasRefQtdTotal.AsInteger := tAuxVendasRefQtdTotal.AsInteger - DM1.tPedidoItemQtdFatMan.AsInteger
                            else
                              tAuxVendasRefQtdTotal.AsInteger := tAuxVendasRefQtdTotal.AsInteger + DM1.tPedidoItemQtdFatMan.AsInteger;
                          tAuxVendasRef.Post;
                        end
                      else
                        begin
                          tAuxVendasRef.Insert;
                          tAuxVendasRefReferencia.AsString   := DM1.tPedidoItemlkNomeModelo.AsString;
                          if RadioGroup2.ItemIndex = 0 then
                            tAuxVendasRefCodCor.AsInteger := 0
                          else
                            tAuxVendasRefCodCor.AsInteger := DM1.tPedidoItemCodCor.AsInteger;
                          if RadioGroup1.ItemIndex = 2 then
                            tAuxVendasRefQtdTotal.AsInteger   := DM1.tPedidoItemQtdFatMan.AsInteger * -1
                          else
                            tAuxVendasRefQtdTotal.AsInteger   := DM1.tPedidoItemQtdFatMan.AsInteger;
                          tAuxVendasRef.Post;
                        end;
                      Case RadioGroup3.ItemIndex of
                        0: DecodeDate(DM1.tPedidoDtFinEmbarque.AsDateTime,ano,mes,dia);
                        1: DecodeDate(DM1.tPedidoDtEmissao.AsDateTime,ano,mes,dia);
                      end;
                      tAuxVendas.SetKey;
                      tAuxVendasAno.AsInteger          := Ano;
                      tAuxVendasMes.AsInteger          := Mes;
                      tAuxVendasCodigo.AsString        := DM1.tPedidoItemlkNomeModelo.AsString;
                      if RadioGroup2.ItemIndex = 0 then
                        tAuxVendasCodCor.AsInteger := 0
                      else
                        tAuxVendasCodCor.AsInteger := DM1.tPedidoItemCodCor.AsInteger;
                      if tAuxVendas.GotoKey then
                        begin
                          tAuxVendas.Edit;
                          tAuxVendasQtdFaturado.AsInteger := tAuxVendasQtdFaturado.AsInteger +
                                                             DM1.tPedidoItemQtdFatMan.AsInteger;;
                          tAuxVendas.Post;
                        end
                      else
                        begin
                          tAuxVendas.Insert;
                          tAuxVendasAno.AsInteger          := Ano;
                          tAuxVendasMes.AsInteger          := Mes;
                          tAuxVendasCodigo.AsString        := DM1.tPedidoItemlkNomeModelo.AsString;
                          if RadioGroup2.ItemIndex = 0 then
                            tAuxVendasCodCor.AsInteger := 0
                          else
                            tAuxVendasCodCor.AsInteger := DM1.tPedidoItemCodCor.AsInteger;
                          tAuxVendasQtdPedido.AsInteger   := 0;
                          tAuxVendasQtdFaturado.AsInteger := DM1.tPedidoItemQtdFatMan.AsInteger;;
                          tAuxVendas.Post;
                        end;
                      DM1.tPedidoItem.Next;
                    end;
                  DM1.tPedido.Next;
                end;
            end;
        end;
      DM1.tPedido.Filtered            := False;
      DM1.tNotaFiscal.Filtered        := False;
      DM1.tPedido.IndexFieldNames     := 'Pedido';
      DM1.tNotaFiscal.IndexFieldNames := 'NumNota';
      Imprimir;
      Screen.Cursor := crDefault;
      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevVendasVendModelo.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevVendasVendModelo.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPrevVendasVendModelo.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfPrevVendasVendModelo.FormShow(Sender: TObject);
begin
  DM1.tVendedor.Open;
  DM1.tCliente.Open;
  DM1.tProduto.Open;
  DM1.tCor.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tNotaFiscal.Open;
  DM1.tNotaFiscalItens.Open;
end;

end.
