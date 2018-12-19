unit UPrevVendasVendCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, RXLookup, DBFilter, ComCtrls, Grids, DBGrids, ShellApi;

type
  TfPrevVendasVendCli = class(TForm)
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
    tAuxVendas: TTable;
    dsAuxVendas: TDataSource;
    tAuxVendasAno: TSmallintField;
    tAuxVendasMes: TSmallintField;
    tAuxVendasQtdPedido: TIntegerField;
    tAuxVendasQtdFaturado: TIntegerField;
    RxDBFilter2: TRxDBFilter;
    RadioGroup1: TRadioGroup;
    tAuxVendasNome: TStringField;
    tAuxVendasCodCor: TIntegerField;
    tAuxVendasCodigo: TStringField;
    tAuxVendasDescMaterial: TStringField;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
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
  fPrevVendasVendCli: TfPrevVendasVendCli;
  linha, pagina : Integer;
  F: TextFile;
  MesCab: Array [1..12] of String[4];
  vQtdTab: Array [1..13] of Integer;
  vMesTab: Array [1..12] of Integer;
  vQtdTotalTab: Array [1..13] of Integer;
  TextoMes, TextoCab, TextoQtd : string;
  vCli, vQtdTotal : Integer;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevVendasVendCli.Monta_Tab;
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
           vQtdTotalTab[i] := vQtdTotalTab[i] + vQtdTab[i];
        end;
    end;
end;

procedure TfPrevVendasVendCli.Imprimir;
var
 i, flag : Integer;
 Texto1 : String;
 ano, mes, dia, ano2, mes2, dia2 : Word;
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
  vCli      := 0;
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
  tAuxVendas.IndexFieldNames := 'Nome;Ano;Mes';
  tAuxVendas.Refresh;
  tAuxVendas.First;
  while not tAuxVendas.EOF do
    begin
      if linha > 61 then
        Imprime_Cabecalho;
      if (vCli <> 0) and (vCli <> tAuxVendasCodigo.AsInteger) then
        begin
          Imprime_Detalhe;
          for i := 1 to 12 do
            vQtdTab[i] := 0;
          vQtdTotal := 0;
        end;
      Monta_Tab;
      vCli := tAuxVendasCodigo.AsInteger;
      tAuxVendas.Next;
    end;
  if vCli > 0 then
    Imprime_Detalhe;
  Imprime_Rodape;
  tAuxVendas.IndexFieldNames := 'Codigo;DescMaterial;CodCor;Ano;Mes';
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto1 := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      //WinExec(PChar(Texto1),SW_MAXIMIZE);
      ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
    end;
end;

procedure TfPrevVendasVendCli.Imprime_Cabecalho;
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
  Texto1 := Texto1 + 'RELACAO DE VENDAS POR CLIENTE                               Pagina.: ' + IntToStr(pagina);
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
  if pagina = 1 then
    Texto1   := 'Cliente';
  Writeln(F,Texto1);
    TextoMes := '    ' + TextoMes + '   Total';
  Writeln(F,TextoMes);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 6;
end;

procedure TfPrevVendasVendCli.Imprime_Detalhe;
var
 i, i2: Integer;
 Texto1, Texto2 : string;
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
  DM1.tCliente.FindKey([vCli]);
  Texto1 := DM1.tClienteNome.AsString;
  for i := 1 to 40 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  writeln(F,Texto1);
  texto1 := '';
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
  Texto1 := '   ' + Texto1 + '  ' + Texto2;
  Writeln(F,Texto1);
  linha := linha + 2;
  TextoQtd := '';
  Texto1   := '';
end;

procedure TfPrevVendasVendCli.Imprime_Rodape;
var
  i, i2 : Integer;
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
  TextoQtd := TextoQtd + ' ' + Texto1;
  Writeln(F,TextoQtd);
  TextoQtd := '';
  linha := linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevVendasVendCli.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tProduto.Close;
  DM1.tVendedor.Close;
  DM1.tCliente.Close;
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  DM1.tNotaFiscal.Close;
  DM1.tNotaFiscalItens.Close;
  Action := Cafree;
end;

procedure TfPrevVendasVendCli.BitBtn6Click(Sender: TObject);
var
 Ano,Mes,Dia : Word;
 i : integer;
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
              case RadioGroup2.ItemIndex of
                0 : begin
                      Case RadioGroup3.ItemIndex of
                        0 : DM1.tPedido.Filter := 'DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                        1 : DM1.tPedido.Filter := 'DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
                      end;
                    end;
                1 : begin
                      Case RadioGroup3.ItemIndex of
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
                  case RadioGroup2.ItemIndex of
                    0 : begin
                          Case RadioGroup3.ItemIndex of
                            0 : DM1.tPedido.Filter   := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                            1 : DM1.tPedido.Filter   := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
                          end;
                        end;
                    1 : begin
                          Case RadioGroup3.ItemIndex of
                            0 : DM1.tPedido.Filter   := 'CodVendedor = ''' +DM1.tVendedorCodigo.AsString+''' and DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                            1 : DM1.tPedido.Filter   := 'CodVendedor = ''' +DM1.tVendedorCodigo.AsString+''' and DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
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
        // Lê os pedidos para gravar a quantidade dos pedidos
          if (RadioGroup1.ItemIndex = 0) or (RadioGroup1.ItemIndex = 2) then
            begin
              DM1.tPedido.First;
              while not DM1.tPedido.EOF do
                begin
                  DM1.tPedidoItem.First;
                  while not DM1.tPedidoItem.EOF do
                    begin
                      Case RadioGroup2.ItemIndex of
                        0 : DecodeDate(DM1.tPedidoDtFinEmbarque.AsDateTime,ano,mes,dia);
                        1 : DecodeDate(DM1.tPedidoDtEmissao.AsDateTime,ano,mes,dia);
                      end;
                      tAuxVendas.SetKey;
                      tAuxVendasAno.AsInteger          := Ano;
                      tAuxVendasMes.AsInteger          := Mes;
                      tAuxVendasCodigo.AsInteger       := DM1.tPedidoCodCliente.AsInteger;
                      tAuxVendasDescMaterial.AsString  := '';
                      tAuxVendasCodCor.AsInteger       := 0;
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
                          tAuxVendasCodigo.AsInteger      := DM1.tPedidoCodCliente.AsInteger;
                          tAuxVendasDescMaterial.AsString := '';
                          tAuxVendasCodCor.AsInteger      := 0;
                          tAuxVendasQtdPedido.AsInteger   := DM1.tPedidoItemQtdPares.AsInteger - DM1.tPedidoItemQtdParesCanc.AsInteger;
                          tAuxVendasNome.AsString         := DM1.tPedidolkNomeCliente.AsString;
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
                      DecodeDate(DM1.tNotaFiscalDtEmissao.AsDateTime,ano,mes,dia);
                      tAuxVendas.SetKey;
                      tAuxVendasAno.AsInteger          := Ano;
                      tAuxVendasMes.AsInteger          := Mes;
                      tAuxVendasCodigo.AsInteger       := DM1.tNotaFiscalCodCli.AsInteger;
                      tAuxVendasDescMaterial.AsString  := '';
                      tAuxVendasCodCor.AsInteger       := 0;
                      if tAuxVendas.GotoKey then
                        begin
                          tAuxVendas.Edit;
                          tAuxVendasQtdFaturado.AsInteger := tAuxVendasQtdFaturado.AsInteger + DM1.tNotaFiscalItensQtd.AsInteger;
                          tAuxVendas.Post;
                        end
                      else
                        begin
                          tAuxVendas.Insert;
                          tAuxVendasAno.AsInteger         := Ano;
                          tAuxVendasMes.AsInteger         := Mes;
                          tAuxVendasCodigo.AsInteger      := DM1.tNotaFiscalCodCli.AsInteger;
                          tAuxVendasDescMaterial.AsString := '';
                          tAuxVendasCodCor.AsInteger      := 0;
                          tAuxVendasQtdPedido.AsInteger   := 0;
                          tAuxVendasQtdFaturado.AsInteger := DM1.tNotaFiscalItensQtd.AsInteger;
                          tAuxVendasNome.AsString         := DM1.tNotaFiscallkNomeCli.AsString;
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
                      case RadioGroup2.ItemIndex of
                        0 : DecodeDate(DM1.tPedidoDtFinEmbarque.AsDateTime,ano,mes,dia);
                        1 : DecodeDate(DM1.tPedidoDtEmissao.AsDateTime,ano,mes,dia);
                      end;
                      tAuxVendas.SetKey;
                      tAuxVendasAno.AsInteger          := Ano;
                      tAuxVendasMes.AsInteger          := Mes;
                      tAuxVendasCodigo.AsInteger       := DM1.tPedidoCodCliente.AsInteger;
                      tAuxVendasDescMaterial.AsString  := '';
                      tAuxVendasCodCor.AsInteger       := 0;
                      if tAuxVendas.GotoKey then
                        begin
                          tAuxVendas.Edit;
                          tAuxVendasQtdFaturado.AsInteger := tAuxVendasQtdFaturado.AsInteger + DM1.tPedidoItemQtdFatMan.AsInteger;;
                          tAuxVendas.Post;
                        end
                      else
                        begin
                          tAuxVendas.Insert;
                          tAuxVendasAno.AsInteger         := Ano;
                          tAuxVendasMes.AsInteger         := Mes;
                          tAuxVendasCodigo.AsInteger      := DM1.tPedidoCodCliente.AsInteger;
                          tAuxVendasDescMaterial.AsString := '';
                          tAuxVendasCodCor.AsInteger      := 0;
                          tAuxVendasQtdPedido.AsInteger   := 0;
                          tAuxVendasQtdFaturado.AsInteger := DM1.tPedidoItemQtdFatMan.AsInteger;
                          tAuxVendasNome.AsString         := DM1.tPedidolkNomeCliente.AsString;
                          tAuxVendas.Post;
                        end;
                      DM1.tPedidoItem.Next;
                    end;
                  DM1.tPedido.Next;
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
end;

procedure TfPrevVendasVendCli.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevVendasVendCli.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPrevVendasVendCli.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfPrevVendasVendCli.FormShow(Sender: TObject);
begin
  DM1.tProduto.Open;
  DM1.tVendedor.Open;
  DM1.tCliente.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tNotaFiscal.Open;
  DM1.tNotaFiscalItens.Open;
end;

end.
