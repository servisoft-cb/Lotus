unit UPrevExtComissaoMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, RXLookup, Mask, ToolEdit, Db, DBTables,
  Grids, DBGrids, DBFilter, Menus, RXCtrls;

type
  TfPrevExtComissaoMod = class(TForm)
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Query1: TQuery;
    tExtComissaoMod: TTable;
    Query1CodModelista: TIntegerField;
    Query1lkModeilsta: TStringField;
    tExtComissaoModNroLancamento: TIntegerField;
    tExtComissaoModCodModelista: TIntegerField;
    tExtComissaoModDtReferencia: TDateField;
    tExtComissaoModNumNota: TIntegerField;
    tExtComissaoModCodProduto: TIntegerField;
    tExtComissaoModFuncao: TStringField;
    tExtComissaoModVlrBase: TFloatField;
    tExtComissaoModPercComissao: TFloatField;
    tExtComissaoModVlrComissao: TFloatField;
    tExtComissaoModTipo: TStringField;
    tExtComissaoModCodCliente: TIntegerField;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    MSDOS1: TMenuItem;
    Windows1: TMenuItem;
    Label4: TLabel;
    ComboBox1: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure MSDOS1Click(Sender: TObject);
    procedure Windows1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  fPrevExtComissaoMod: TfPrevExtComissaoMod;
  F : TextFile;
  Linha, Pagina : Integer;
  Texto : array[1..15] of String;
  vEntradas, vSaidas, vDevolucao, vSaldoTotal, vSaldoAnterior, vSaldo  : Currency;

implementation

uses UDM1, UEscImpressora, URelExtComissaoMod;

{$R *.DFM}

Procedure TfPrevExtComissaoMod.Imprime_Cabecalho;
var Texto1,Texto2 : String;
    i             : Integer;
begin
  Inc(Pagina);
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
  Texto1 := Texto1 + 'RELACAO DE COMISSOES POR MODELISTA                          Pagina.: ' + IntToStr(pagina);
  Writeln(F,Texto1);
  for i := 1 to 53 do
    Texto2 := Texto2 + ' ';
  Texto2 := Texto2 + 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text +
            '                            Emissao: ' + DateToStr(Date);
  Writeln(F,Texto2);

  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'  Data      Funcao  No.Nota  Referencia Cliente                                         Vlr.Base  % Comissao    Vlr.Comissao');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Linha := 5;
end;

procedure TfPrevExtComissaoMod.Imprime_Rodape;
var
 i : Integer;
begin
  if Linha > 61 then
    Imprime_Cabecalho;

  Writeln(F,'                                                                                 ----------------------------------------------------');

  Texto[1] := 'Total Entradas.: ';
  for i := 1 to 102 do
    Texto[1] := ' ' + Texto[1];
  Texto[2] := FormatFloat('0.00',vEntradas);
  for i := 1 to 9 - length(Texto[2]) do
    Texto[2] := ' ' + Texto[2];
  Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));

  Texto[1] := 'Total Saidas...: ';
  for i := 1 to 102 do
    Texto[1] := ' ' + Texto[1];
  Texto[2] := FormatFloat('0.00',vSaidas);
  for i := 1 to 9 - length(Texto[2]) do
     Texto[2] := ' ' + Texto[2];
  Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));

  Texto[1] := 'Total Devolucao: ';
  for i := 1 to 102 do
    Texto[1] := ' ' + Texto[1];
  Texto[2] := FormatFloat('0.00',vDevolucao);
  for i := 1 to 9 - length(Texto[2]) do
     Texto[2] := ' ' + Texto[2];
  Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));

  Texto[1] := 'Total Periodo..: ';
  for i := 1 to 102 do
    Texto[1] := ' ' + Texto[1];
  Texto[2] := FormatFloat('0.00',vSaldo);
  for i := 1 to 9 - length(Texto[2]) do
     Texto[2] := ' ' + Texto[2];
  Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));

  vSaldoTotal := vSaldoAnterior + vSaldo;

  Texto[1] := 'Saldo Total....: ';
  for i := 1 to 102 do
    Texto[1] := ' ' + Texto[1];
  Texto[2] := FormatFloat('0.00',vSaldoTotal);
  for i := 1 to 9 - length(Texto[2]) do
     Texto[2] := ' ' + Texto[2];
  Writeln(F,Format('%s%s',[Texto[1],Texto[2]]));

  Linha := Linha + 6;

  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevExtComissaoMod.Imprime_Detalhe;
Var
  I : Integer;
  Texto1, Texto2 : String;
begin
  Texto1 := DM1.tExtComissaoModDtReferencia.AsString;
  if DM1.tExtComissaoModFuncao.AsString = 'E' then
    Texto1  := Texto1 + '   Entr.  '
  else
  if DM1.tExtComissaoModFuncao.AsString = 'S' then
    Texto1  := Texto1 + '   Pgto.  '
  else
  if DM1.tExtComissaoModFuncao.AsString = 'D' then
    Texto1  := Texto1 + '   Devol  ';
  Texto2 := DM1.tExtComissaoModNumNota.AsString;
  for i := 1 to 6 - Length(Texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '   ';
  texto2 := '';
  //texto2 := DM1.tExtComissaoModlkReferencia.AsString;
  for i := 1 to 8 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '   ';
  texto2 := DM1.tExtComissaoModlkNomeCliente.AsString;
  for i := 1 to 40 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '  ';
  texto2 := FormatFloat('###,###,##0.00',DM1.tExtComissaoModVlrBase.AsFloat);
  for i := 1 to 14 - length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '      ';

  texto2 := FormatFloat('##0.00',DM1.tExtComissaoModPercComissao.AsFloat);
  for i := 1 to 6 - length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '  ';

  texto2 := FormatFloat('###,###,##0.00',DM1.tExtComissaoModVlrComissao.AsFloat);
  for i := 1 to 14 - length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '';

  Writeln(F,texto1);

  Linha := Linha + 1;
end;

procedure TfPrevExtComissaoMod.Imprimir;
Var I : Integer;
{    Texto : array[1..15] of String;
    vEntradas, vSaidas, vDevolucao, vSaldoTotal, vSaldoAnterior, vSaldo  : Currency;}
begin
  Linha := 90;
  if RxDBLookupCombo1.Text <> '' then
    begin
      vEntradas      := 0;
      vSaidas        := 0;
      vDevolucao     := 0;
      vSaldoAnterior := 0;
      vSaldo         := 0;

      DM1.tExtComissaoMod.Filtered := False;
      case ComboBox1.ItemIndex of
        0 : DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+''' and Tipo <> '''+'F'+'''';
        1 : DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+''' and Tipo = '''+'F'+'''';
        2 : DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+'''';
      end;
      DM1.tExtComissaoMod.Filtered := True;

      tExtComissaoMod.Filtered     := False;
      case ComboBox1.ItemIndex of
        0 : tExtComissaoMod.Filter       := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia < '''+DateEdit1.Text+''' and Tipo <> '''+'F'+'''';
        1 : tExtComissaoMod.Filter       := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia < '''+DateEdit1.Text+''' and Tipo = '''+'F'+'''';
        2 : tExtComissaoMod.Filter       := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia < '''+DateEdit1.Text+'''';
      end;
      tExtComissaoMod.Filtered     := True;
      tExtComissaoMod.First;
      while not tExtComissaoMod.EOF do
        begin
          if tExtComissaoModFuncao.AsString = 'E' then
            vSaldoAnterior := vSaldoAnterior + tExtComissaoModVlrComissao.AsFloat
          else
          if tExtComissaoModFuncao.AsString = 'S' then
            vSaldoAnterior := vSaldoAnterior - tExtComissaoModVlrComissao.AsFloat
          else
          if tExtComissaoModFuncao.AsString = 'D' then
            vSaldoAnterior := vSaldoAnterior - tExtComissaoModVlrComissao.AsFloat;
          tExtComissaoMod.Next;
        end;

      Imprime_Cabecalho;
      Texto[1] := 'Modelista.: ';
      Texto[2] := RxDBLookupCombo1.Text;
      for i := 1 to 96 - length(Texto[2]) do
        Texto[2] := Texto[2] + ' ';
      Texto[3] := 'Saldo Ant.: ';
      Texto[4] := FormatFloat('0.00',vSaldoAnterior);
      for i := 1 to 8 - length(Texto[4]) do
        Texto[4] := ' ' + Texto[4];
      Writeln(F,Format('%s%s%s%s',[Texto[1],Texto[2],Texto[3],Texto[4]]));
      Linha := Linha + 1;

      DM1.tExtComissaoMod.First;
      while not DM1.tExtComissaoMod.EOF do
        begin
          if Linha > 61 then
            Imprime_Cabecalho;
          Imprime_Detalhe;
          if DM1.tExtComissaoModFuncao.AsString = 'E' then
            begin
              vEntradas   := vEntradas   + DM1.tExtComissaoModVlrComissao.AsFloat;
              vSaldo      := vSaldo      + DM1.tExtComissaoModVlrComissao.AsFloat;
            end;
          if DM1.tExtComissaoModFuncao.AsString = 'S' then
            begin
              vSaidas     := vSaidas     + DM1.tExtComissaoModVlrComissao.AsFloat;
              vSaldo      := vSaldo      - DM1.tExtComissaoModVlrComissao.AsFloat;
            end;
          if DM1.tExtComissaoModFuncao.AsString = 'D' then
            begin
              vDevolucao  := vDevolucao  + DM1.tExtComissaoModVlrComissao.AsFloat;
              vSaldo      := vSaldo      - DM1.tExtComissaoModVlrComissao.AsFloat;
            end;
          DM1.tExtComissaoMod.Next;
        end;
      Imprime_Rodape;

      DM1.tExtComissaoMod.Filtered := False;
    end;
  if RxDBLookupCombo1.Text = '' then
    begin
      Query1.Active := True;
      Query1.First;
      while not Query1.EOF do
        begin
          vEntradas      := 0;
          vSaidas        := 0;
          vDevolucao     := 0;
          vSaldoAnterior := 0;
          vSaldo         := 0;

          tExtComissaoMod.Filtered     := False;
          case ComboBox1.ItemIndex of
            0 : tExtComissaoMod.Filter       := 'CodModelista  = '''+Query1CodModelista.AsString+''' and DtReferencia < '''+DateEdit1.Text+''' and Tipo <> '''+'F'+'''';
            1 : tExtComissaoMod.Filter       := 'CodModelista  = '''+Query1CodModelista.AsString+''' and DtReferencia < '''+DateEdit1.Text+''' and Tipo = '''+'F'+'''';
            2 : tExtComissaoMod.Filter       := 'CodModelista  = '''+Query1CodModelista.AsString+''' and DtReferencia < '''+DateEdit1.Text+'''';
          end;
          tExtComissaoMod.Filtered     := True;
          tExtComissaoMod.First;
          while not tExtComissaoMod.EOF do
            begin
              if tExtComissaoModFuncao.AsString = 'E' then
                vSaldoAnterior := vSaldoAnterior + tExtComissaoModVlrComissao.AsFloat
              else
              if tExtComissaoModFuncao.AsString = 'S' then
                vSaldoAnterior := vSaldoAnterior - tExtComissaoModVlrComissao.AsFloat
              else
              if tExtComissaoModFuncao.AsString = 'D' then
                vSaldoAnterior := vSaldoAnterior - tExtComissaoModVlrComissao.AsFloat;
              tExtComissaoMod.Next;
            end;

          DM1.tExtComissaoMod.Filtered := False;
          case ComboBox1.ItemIndex of
            0 : DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+Query1CodModelista.AsString+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+''' and Tipo <> '''+'F'+'''';
            1 : DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+Query1CodModelista.AsString+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+''' and Tipo = '''+'F'+'''';
            2 : DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+Query1CodModelista.AsString+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+'''';
          end;
          DM1.tExtComissaoMod.Filtered := True;

          if (vSaldoAnterior > 0) or (DM1.tExtComissaoMod.RecordCount > 0) then
            begin
              Imprime_Cabecalho;
              Texto[1] := 'Modelista.: ';
              Texto[2] := Query1lkModeilsta.AsString;
              for i := 1 to 96 - length(Texto[2]) do
                Texto[2] := Texto[2] + ' ';
              Texto[3] := 'Saldo Ant.: ';
              Texto[4] := FormatFloat('0.00',vSaldoAnterior);
              for i := 1 to 8 - length(Texto[4]) do
                Texto[4] := ' ' + Texto[4];
              Writeln(F,Format('%s%s%s%s',[Texto[1],Texto[2],Texto[3],Texto[4]]));
              Linha := Linha + 1;
            end;

          DM1.tExtComissaoMod.First;
          while not DM1.tExtComissaoMod.EOF do
            begin
              if Linha > 61 then
                Imprime_Cabecalho;
              Imprime_Detalhe;
              if DM1.tExtComissaoModFuncao.AsString = 'E' then
                begin
                  vEntradas   := vEntradas   + DM1.tExtComissaoModVlrComissao.AsFloat;
                  vSaldo      := vSaldo      + DM1.tExtComissaoModVlrComissao.AsFloat;
                end;
              if DM1.tExtComissaoModFuncao.AsString = 'S' then
                begin
                  vSaidas     := vSaidas     + DM1.tExtComissaoModVlrComissao.AsFloat;
                  vSaldo      := vSaldo      - DM1.tExtComissaoModVlrComissao.AsFloat;
                end;
              if DM1.tExtComissaoModFuncao.AsString = 'D' then
                begin
                  vDevolucao  := vDevolucao  + DM1.tExtComissaoModVlrComissao.AsFloat;
                  vSaldo      := vSaldo      - DM1.tExtComissaoModVlrComissao.AsFloat;
                end;
              DM1.tExtComissaoMod.Next;
            end;

          if DM1.tExtComissaoMod.RecordCount > 0 then
            Imprime_Rodape;

          Query1.Next;
        end;
      Query1.Active                := False;
      DM1.tExtComissaoMod.Filtered := False;
    end;
end;

procedure TfPrevExtComissaoMod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      Dm1.tNotaFiscalItens.Close;
      Dm1.tNotaFiscal.Close;
      Dm1.tModelista.Close;
      Dm1.tExtComissaoMod.Close;
      DM1.tCliente.Close;
      DM1.tVendedor.Close;
      DM1.tProduto.Close;
    end;
  Action := caFree;
end;

procedure TfPrevExtComissaoMod.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Descricao';
end;

procedure TfPrevExtComissaoMod.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevExtComissaoMod.FormShow(Sender: TObject);
begin
  Dm1.tNotaFiscalItens.Open;
  Dm1.tNotaFiscal.Open;
  Dm1.tModelista.Open;
  Dm1.tExtComissaoMod.Open;
  DM1.tCliente.Open;
  DM1.tVendedor.Open;
  DM1.tProduto.Open;
  DateEdit1.Date := Date;
  DateEdit2.Date := Date;
  RxDBLookupCombo1.SetFocus;
end;

procedure TfPrevExtComissaoMod.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Codigo';
end;

procedure TfPrevExtComissaoMod.MSDOS1Click(Sender: TObject);
var
  Texto : String;
begin
  if ((DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ')) and (DateEdit1.Date <= DateEdit2.Date) then
    begin
      DM1.tExtComissaoMod.IndexFieldNames := 'CodModelista;DtReferencia';
      Screen.Cursor := crHourGlass;
      fEscImpressora := TfEscImpressora.Create(Self);
      fEscImpressora.ShowModal;
      AssignFile(F,DM1.tImpressoraEndereco.AsString);
      ReWrite(F);
      if not DM1.tImpressoraVisualizar.AsBoolean then
        Write(F,#15);
      if RxDBLookupCombo1.Text = '' then
        Query1.Active := True;
      Pagina := 0;
      Linha  := 0;
//      Imprime_Cabecalho;
      Imprimir;
      CloseFile(F);
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      if DM1.tImpressoraVisualizar.AsBoolean then
        WinExec(PChar(Texto),SW_MAXIMIZE);
      Query1.Active                := False;
      DM1.tExtComissaoMod.Filtered := False;
      DM1.tModelista.Filtered      := False;
      tExtComissaoMod.Filtered     := False;
      Screen.Cursor := crDefault;
      DM1.tExtComissaoMod.IndexFieldNames := 'NroLancamento';
    end
  else
    begin
      ShowMessage('É nessessário informar uma data válida!');
      DateEdit1.Date := Date;
      DateEdit2.Date := Date;
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevExtComissaoMod.Windows1Click(Sender: TObject);
begin
  if ((DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ')) and (DateEdit1.Date <= DateEdit2.Date) and (RxDBLookupCombo1.Text <> '')then
    begin
      Screen.Cursor := crHourGlass;
      if RxDBLookupCombo1.Text <> '' then
        begin
          vEntradas := 0;
          vSaldo := 0;
          vSaidas := 0;
          vDevolucao := 0;
          vSaldoAnterior := 0;
          vSaldoTotal := 0;
          DM1.tExtComissaoMod.Filtered := False;
          case ComboBox1.ItemIndex of
            0 : DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+''' and Tipo <> '''+'F'+'''';
            1 : DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+''' and Tipo = '''+'F'+'''';
            2 : DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia >= '''+DateEdit1.Text+''' and DtReferencia <= '''+DateEdit2.Text+'''';
          end;
          DM1.tExtComissaoMod.Filtered := True;
          tExtComissaoMod.Filtered     := False;
          case ComboBox1.ItemIndex of
            0 :  tExtComissaoMod.Filter       := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia < '''+DateEdit1.Text+''' and Tipo <> '''+'F'+'''';
            1 :  tExtComissaoMod.Filter       := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia < '''+DateEdit1.Text+''' and Tipo = '''+'F'+'''';
            2 :  tExtComissaoMod.Filter       := 'CodModelista = '''+RxDBLookupCombo1.Value+''' and DtReferencia < '''+DateEdit1.Text+'''';
          end;
          tExtComissaoMod.Filtered     := True;
          tExtComissaoMod.First;
          while not tExtComissaoMod.EOF do
            begin
              if tExtComissaoModFuncao.AsString = 'E' then
                vSaldoAnterior := vSaldoAnterior + tExtComissaoModVlrComissao.AsFloat
              else
              if tExtComissaoModFuncao.AsString = 'S' then
                vSaldoAnterior := vSaldoAnterior - tExtComissaoModVlrComissao.AsFloat
              else
              if tExtComissaoModFuncao.AsString = 'D' then
                vSaldoAnterior := vSaldoAnterior - tExtComissaoModVlrComissao.AsFloat;
              tExtComissaoMod.Next;
            end;
          Dm1.tExtComissaoMod.First;
          while not Dm1.tExtComissaoMod.Eof do
            begin
              if Dm1.tExtComissaoModFuncao.AsString = 'E' then
                begin
                  vEntradas   := vEntradas   + Dm1.tExtComissaoModVlrComissao.AsFloat;
                  vSaldo      := vSaldo      + Dm1.tExtComissaoModVlrComissao.AsFloat;
                end
              else
              if Dm1.tExtComissaoModFuncao.AsString = 'S' then
                begin
                  vSaidas     := vSaidas     + Dm1.tExtComissaoModVlrComissao.AsFloat;
                  vSaldo      := vSaldo      - Dm1.tExtComissaoModVlrComissao.AsFloat;
                end
              else
              if Dm1.tExtComissaoModFuncao.AsString = 'D' then
                begin
                  vDevolucao  := vDevolucao  + Dm1.tExtComissaoModVlrComissao.AsFloat;
                  vSaldo      := vSaldo      - Dm1.tExtComissaoModVlrComissao.AsFloat;
                end;
              Dm1.tExtComissaoMod.Next;
            end;
          vSaldoTotal := vSaldoAnterior + vSaldo;
          fRelExtComissaoMod := TfRelExtComissaoMod.Create(Self);
          fRelExtComissaoMod.RLLabel22.Caption := FormatFloat('###,###,##0.00',vSaldoAnterior);
          fRelExtComissaoMod.RLLabel30.Caption := FormatFloat('###,###,##0.00',vEntradas);
          fRelExtComissaoMod.RLLabel31.Caption := FormatFloat('###,###,##0.00',vSaidas);
          fRelExtComissaoMod.RLLabel32.Caption := FormatFloat('###,###,##0.00',vDevolucao);
          fRelExtComissaoMod.RLLabel33.Caption := FormatFloat('###,###,##0.00',vSaldo);
          fRelExtComissaoMod.RLLabel34.Caption := FormatFloat('###,###,##0.00',vSaldoTotal);
          fRelExtComissaoMod.RLReport1.Preview;
          fRelExtComissaoMod.RLReport1.Free;
        end;
      Query1.Active                := False;
      DM1.tExtComissaoMod.Filtered := False;
      DM1.tModelista.Filtered      := False;
      tExtComissaoMod.Filtered     := False;
      Screen.Cursor                := crDefault;
    end
  else
    begin
      ShowMessage('É nessessário informar uma data válida!');
      DateEdit1.Date := Date;
      DateEdit2.Date := Date;
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevExtComissaoMod.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    begin
      ComboBox1.Visible := not(ComboBox1.Visible);
      Label4.Visible    := not(Label4.Visible);
    end;
end;

end.
