unit UPrevVendasVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, RXLookup, DBFilter, ComCtrls, ShellApi;

type
  TfPrevVendasVendedor = class(TForm)
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
    tAuxVendasCodCor: TIntegerField;
    tAuxVendasNome: TStringField;
    tAuxVendasCodigo: TStringField;
    RadioGroup1: TRadioGroup;
    tAuxVendasDescMaterial: TStringField;
    RadioGroup2: TRadioGroup;
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
  public
    { Public declarations }
  end;

var
  fPrevVendasVendedor: TfPrevVendasVendedor;
  linha, pagina : Integer;
  F: TextFile;
  Contador, vQtdPed, vQtdFat : Integer;
  MesCab : Array [1..12] of String;
  TextoMes, TextoCab, TextoQtd : string;

implementation

uses UDM1, UEscImpressora;

{$R *.DFM}

procedure TfPrevVendasVendedor.Imprimir;
var
 vQtd, i : Integer;
 Texto1 : String;
begin
  MesCab[1]  := ' Janeiro ';
  MesCab[2]  := 'Fevereiro';
  MesCab[3]  := '  Marco  ';
  MesCab[4]  := '  Abril  ';
  MesCab[5]  := '  Maio   ';
  MesCab[6]  := '  Junho  ';
  MesCab[7]  := '  Julho  ';
  MesCab[8]  := '  Agosto ';
  MesCab[9]  := ' Setembro';
  MesCab[10] := ' Outubro ';
  MesCab[11] := ' Novembro';
  MesCab[12] := ' Dezembro';

  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);

  TextoMes := '';
  TextoCab := '';
  TextoQtd := '';
  Contador := 0;
  vQtdPed  := 0;
  vQtdFat  := 0;
  tAuxVendas.Refresh;
  tAuxVendas.First;
  while not tAuxVendas.EOF do
    begin
      Contador := Contador + 1;
      if linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      tAuxVendas.Next;
    end;
  if Contador > 0 then
    begin
      Contador := Contador + 1;
      if Contador > 5 then
        begin
          Writeln(F,TextoMes);
          Writeln(F,TextoCab);
          Writeln(F,TextoQtd);
          Writeln(F);
          Linha := Linha + 4;
          TextoMes := '';
          TextoCab := '';
          TextoQtd := '';
          Contador := 1;
        end;
    // Imprimir o total
      TextoMes := TextoMes + '     T O T A L';
      TextoCab := TextoCab + ' Pedido  Fatura  Difer.  ';
      Texto1   := FormatFloat('###,###',vQtdPed);
      for i := 1 to 7 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoQtd := TextoQtd + Texto1 + ' ';
      Texto1   := FormatFloat('###,###',vQtdFat);
      for i := 1 to 7 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoQtd := TextoQtd + Texto1 + ' ';
      vQtd := vQtdPed - vQtdFat;
      Texto1   := FormatFloat('###,###',vQtd);
      for i := 1 to 7 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      TextoQtd := TextoQtd + Texto1 + '  ';
      Writeln(F,TextoMes);
      Writeln(F,TextoCab);
      Writeln(F,TextoQtd);
      Linha := Linha + 3;
    end;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto1 := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      //WinExec(PChar(Texto1),SW_MAXIMIZE);
      ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
    end;
end;

procedure TfPrevVendasVendedor.Imprime_Cabecalho;
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
  Texto1 := Texto1 + 'RELACAO DE VENDAS POR VENDEDOR                              Pagina.: ' + IntToStr(pagina);
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

  linha := 3;
end;

procedure TfPrevVendasVendedor.Imprime_Detalhe;
var
 i, vQtd: Integer;
 Texto1 : string;
begin
  if contador > 5 then
    begin
      Writeln(F,TextoMes);
      Writeln(F,TextoCab);
      Writeln(F,TextoQtd);
      Writeln(F);
      Linha := 4;
      Contador := 1;
      TextoMes := '';
      TextoCab := '';
      TextoQtd := '';
    end;

  Texto1   := '     ' + MesCab[tAuxVendasMes.AsInteger] + '/' + tAuxVendasAno.AsString + '      ';
  TextoMes := TextoMes + Texto1;
  TextoCab := TextoCab + ' Pedido  Fatura  Difer.  ';
  Texto1   := FormatFloat('###,###',tAuxVendasQtdPedido.AsInteger);
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoQtd := TextoQtd + Texto1 + ' ';
  Texto1   := FormatFloat('###,###',tAuxVendasQtdFaturado.AsInteger);
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoQtd := TextoQtd + Texto1 + ' ';
  vQtd := tAuxVendasQtdPedido.AsInteger - tAuxVendasQtdFaturado.AsInteger;
  Texto1   := FormatFloat('###,###',vQtd);
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  TextoQtd := TextoQtd + Texto1 + '  ';

  vQtdPed := vQtdPed + tAuxVendasQtdPedido.AsInteger;
  vQtdFat := vQtdFat + tAuxVendasQtdFaturado.AsInteger;
end;

procedure TfPrevVendasVendedor.Imprime_Rodape;
begin
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevVendasVendedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tCor.Close;
  DM1.tProduto.Close;
  DM1.tCliente.Close;
  DM1.tVendedor.Close;
  DM1.tPedido.Close;
  DM1.tPedidoItem.Close;
  DM1.tNotaFiscal.Close;
  DM1.tNotaFiscalItens.Close;
  Action := Cafree;
end;

procedure TfPrevVendasVendedor.BitBtn6Click(Sender: TObject);
var
 Ano,Mes,Dia : Word;
begin
  if (DateEdit1.Text = '') or (DateEdit2.Text = '') then
    begin
      ShowMessage('Selecione data inicial e data final!');
      Exit;
    end
  else
  if DateEdit1.Date > DateEdit2.Date then
    ShowMessage('Data inicial maior que data final!')
  else
    begin
      Screen.Cursor := crHourglass;
      if RxDBLookupCombo1.Text = '' then
        begin
          DM1.tPedido.Filtered := False;
          Case RadioGroup1.ItemIndex of
            0 : begin
                  Case RadioGroup2.ItemIndex of
                    0 : DM1.tPedido.Filter   := 'DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                    1 : DM1.tPedido.Filter   := 'DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
                  end;
                end;
            1 : begin
                  Case RadioGroup2.ItemIndex of
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
             Case RadioGroup1.ItemIndex of
               0 : begin
                     Case RadioGroup2.ItemIndex of
                       0 : DM1.tPedido.Filter   := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                       1 : DM1.tPedido.Filter   := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtFinEmbarque >= '''+DateEdit1.Text+''' and DtFinEmbarque <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
                     end;
                   end;
               1 : begin
                     Case RadioGroup2.ItemIndex of
                       0 : DM1.tPedido.Filter   := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''I''';
                       1 : DM1.tPedido.Filter   := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+''' and DtEmissao >= '''+DateEdit1.Text+''' and DtEmissao <= '''+DateEdit2.Text+''' and Cancelado <> True and Suspenso <> True and Mercado = ''E''';
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
      DM1.tPedido.First;
      while not DM1.tPedido.EOF do
        begin
          DM1.tPedidoItem.First;
          while not DM1.tPedidoItem.EOF do
            begin
              Case RadioGroup1.ItemIndex of
                0 : DecodeDate(DM1.tPedidoDtFinEmbarque.AsDateTime,ano,mes,dia);
                1 : DecodeDate(DM1.tPedidoDtEmissao.AsDateTime,ano,mes,dia);
              end;
              tAuxVendas.SetKey;
              tAuxVendasAno.AsInteger         := Ano;
              tAuxVendasMes.AsInteger         := Mes;
              tAuxVendasCodigo.AsInteger      := 0;
              tAuxVendasDescMaterial.AsString := '';
              tAuxVendasCodCor.AsInteger      := 0;
              if tAuxVendas.GotoKey then
                begin
                  tAuxVendas.Edit;
                  tAuxVendasQtdPedido.AsInteger := tAuxVendasQtdPedido.AsInteger + (DM1.tPedidoItemQtdPares.AsInteger - DM1.tPedidoItemQtdParesCanc.AsInteger);
                  tAuxVendasQtdFaturado.AsInteger := tAuxVendasQtdFaturado.AsInteger + DM1.tPedidoItemQtdFatMan.AsInteger;
                  tAuxVendas.Post;
                end
              else
                begin
                  tAuxVendas.Insert;
                  tAuxVendasAno.AsInteger         := Ano;
                  tAuxVendasMes.AsInteger         := Mes;
                  tAuxVendasCodigo.AsInteger      := 0;
                  tAuxVendasDescMaterial.AsString := '';
                  tAuxVendasCodCor.AsInteger      := 0;
                  tAuxVendasQtdPedido.AsInteger   := DM1.tPedidoItemQtdPares.AsInteger - DM1.tPedidoItemQtdParesCanc.AsInteger;
                  tAuxVendasQtdFaturado.AsInteger := DM1.tPedidoItemQtdFatMan.AsInteger;
                  tAuxVendas.Post;
                end;
              DM1.tPedidoItem.Next;
            end;
          DM1.tPedido.Next;
        end;
    // Lê as notas para gravar a quantidade das notas
      DM1.tNotaFiscal.First;
      while not DM1.tNotaFiscal.EOF do
        begin
          DM1.tNotaFiscalItens.First;
          while not DM1.tNotaFiscalItens.EOF do
            begin
              DecodeDate(DM1.tNotaFiscalDtEmissao.AsDateTime,ano,mes,dia);
              tAuxVendas.SetKey;
              tAuxVendasAno.AsInteger             := Ano;
              tAuxVendasMes.AsInteger             := Mes;
              tAuxVendasCodigo.AsInteger          := 0;
              tAuxVendasDescMaterial.AsString     := '';
              tAuxVendasCodCor.AsInteger          := 0;
              if tAuxVendas.GotoKey then
                begin
                  tAuxVendas.Edit;
                  tAuxVendasQtdFaturado.AsInteger := tAuxVendasQtdFaturado.AsInteger + DM1.tNotaFiscalItensQtd.AsInteger;
                  tAuxVendas.Post;
                end
              else
                begin
                  tAuxVendas.Insert;
                  tAuxVendasAno.AsInteger             := Ano;
                  tAuxVendasMes.AsInteger             := Mes;
                  tAuxVendasCodigo.AsInteger          := 0;
                  tAuxVendasDescMaterial.AsString     := '';
                  tAuxVendasCodCor.AsInteger          := 0;
                  tAuxVendasQtdPedido.AsInteger       := 0;
                  tAuxVendasQtdFaturado.AsInteger     := DM1.tNotaFiscalItensQtd.AsInteger;
                  tAuxVendas.Post;
                end;
              DM1.tNotaFiscalItens.Next;
            end;
          DM1.tNotaFiscal.Next;
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

procedure TfPrevVendasVendedor.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevVendasVendedor.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfPrevVendasVendedor.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
end;

procedure TfPrevVendasVendedor.FormShow(Sender: TObject);
begin
  DM1.tCor.Open;
  DM1.tProduto.Open;
  DM1.tCliente.Open;
  DM1.tVendedor.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tNotaFiscal.Open;
  DM1.tNotaFiscalItens.Open;
end;

end.
