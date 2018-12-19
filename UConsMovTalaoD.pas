unit UConsMovTalaoD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Db, DBTables, MemTable, Grids,
  DBGrids, ComCtrls, ShellApi;

type
  TfConsMovTalaoD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    qLote: TQuery;
    qLoteSetor: TIntegerField;
    qLoteQtdPar: TFloatField;
    DBText14: TDBText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    Bevel1: TBevel;
    Bevel2: TBevel;
    DBText3: TDBText;
    Bevel3: TBevel;
    DBText4: TDBText;
    DBText15: TDBText;
    Bevel4: TBevel;
    DBText16: TDBText;
    Bevel5: TBevel;
    DBText17: TDBText;
    Bevel6: TBevel;
    DBText18: TDBText;
    DBText5: TDBText;
    Bevel7: TBevel;
    DBText6: TDBText;
    Bevel8: TBevel;
    DBText19: TDBText;
    Bevel9: TBevel;
    DBText20: TDBText;
    Bevel10: TBevel;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    Bevel11: TBevel;
    StaticText6: TStaticText;
    Bevel12: TBevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel3: TPanel;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    Bevel13: TBevel;
    DBText7: TDBText;
    Bevel14: TBevel;
    DBText8: TDBText;
    Bevel15: TBevel;
    DBText9: TDBText;
    Bevel16: TBevel;
    DBText10: TDBText;
    Bevel17: TBevel;
    DBText11: TDBText;
    Bevel18: TBevel;
    DBText12: TDBText;
    Bevel19: TBevel;
    DBText13: TDBText;
    Bevel20: TBevel;
    DBText21: TDBText;
    Bevel21: TBevel;
    DBText22: TDBText;
    Bevel22: TBevel;
    DBText23: TDBText;
    Bevel23: TBevel;
    DBText24: TDBText;
    Bevel24: TBevel;
    DBText25: TDBText;
    Bevel25: TBevel;
    DBText26: TDBText;
    Bevel26: TBevel;
    DBText27: TDBText;
    Bevel27: TBevel;
    DBText28: TDBText;
    Bevel28: TBevel;
    DBText29: TDBText;
    Bevel29: TBevel;
    DBText30: TDBText;
    Bevel30: TBevel;
    DBText31: TDBText;
    Bevel31: TBevel;
    DBText32: TDBText;
    Bevel32: TBevel;
    DBText33: TDBText;
    Bevel33: TBevel;
    DBText34: TDBText;
    Panel4: TPanel;
    Bevel34: TBevel;
    DBText35: TDBText;
    Bevel35: TBevel;
    DBText36: TDBText;
    Bevel36: TBevel;
    DBText37: TDBText;
    Bevel37: TBevel;
    DBText38: TDBText;
    Bevel38: TBevel;
    DBText39: TDBText;
    Bevel39: TBevel;
    DBText40: TDBText;
    Bevel40: TBevel;
    DBText41: TDBText;
    Bevel41: TBevel;
    DBText42: TDBText;
    Bevel42: TBevel;
    DBText43: TDBText;
    Bevel43: TBevel;
    DBText44: TDBText;
    Bevel44: TBevel;
    DBText45: TDBText;
    Bevel45: TBevel;
    DBText46: TDBText;
    Bevel46: TBevel;
    DBText47: TDBText;
    Bevel47: TBevel;
    DBText48: TDBText;
    Bevel48: TBevel;
    DBText49: TDBText;
    Bevel49: TBevel;
    DBText50: TDBText;
    Bevel50: TBevel;
    DBText51: TDBText;
    Bevel51: TBevel;
    DBText52: TDBText;
    Bevel52: TBevel;
    DBText53: TDBText;
    Bevel53: TBevel;
    DBText54: TDBText;
    Bevel54: TBevel;
    DBText55: TDBText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    Panel5: TPanel;
    Bevel55: TBevel;
    DBText56: TDBText;
    Bevel56: TBevel;
    DBText57: TDBText;
    Bevel57: TBevel;
    DBText58: TDBText;
    Bevel58: TBevel;
    DBText59: TDBText;
    Bevel59: TBevel;
    DBText60: TDBText;
    Bevel60: TBevel;
    DBText61: TDBText;
    Bevel61: TBevel;
    DBText62: TDBText;
    Bevel62: TBevel;
    DBText63: TDBText;
    Bevel63: TBevel;
    DBText64: TDBText;
    Bevel64: TBevel;
    DBText65: TDBText;
    Bevel65: TBevel;
    DBText66: TDBText;
    Bevel66: TBevel;
    DBText67: TDBText;
    Bevel67: TBevel;
    DBText68: TDBText;
    Bevel68: TBevel;
    DBText69: TDBText;
    Bevel69: TBevel;
    DBText70: TDBText;
    Bevel70: TBevel;
    DBText71: TDBText;
    Bevel71: TBevel;
    DBText72: TDBText;
    Bevel72: TBevel;
    DBText73: TDBText;
    Bevel73: TBevel;
    DBText74: TDBText;
    Bevel74: TBevel;
    DBText75: TDBText;
    Bevel75: TBevel;
    DBText76: TDBText;
    StaticText34: TStaticText;
    StaticText35: TStaticText;
    StaticText36: TStaticText;
    qSetores: TQuery;
    qSetoresNome: TStringField;
    qSetoresCodSetor: TIntegerField;
    qSetoresItem: TIntegerField;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    mLote: TMemoryTable;
    mLoteSetor1: TIntegerField;
    mLoteProduzido1: TIntegerField;
    mLotePendente1: TIntegerField;
    mLoteSetor2: TIntegerField;
    mLoteProduzido2: TIntegerField;
    mLotePendente2: TIntegerField;
    mLoteSetor3: TIntegerField;
    mLoteProduzido3: TIntegerField;
    mLotePendente3: TIntegerField;
    mLoteSetor4: TIntegerField;
    mLoteProduzido4: TIntegerField;
    mLotePendente4: TIntegerField;
    mLoteSetor5: TIntegerField;
    mLoteProduzido5: TIntegerField;
    mLotePendente5: TIntegerField;
    mLoteSetor6: TIntegerField;
    mLoteProduzido6: TIntegerField;
    mLotePendente6: TIntegerField;
    mLoteSetor7: TIntegerField;
    mLoteProduzido7: TIntegerField;
    mLotePendente7: TIntegerField;
    msLote: TDataSource;
    mLoteTotal1: TIntegerField;
    mLoteTotal2: TIntegerField;
    mLoteTotal3: TIntegerField;
    mLoteTotal4: TIntegerField;
    mLoteTotal5: TIntegerField;
    mLoteTotal6: TIntegerField;
    mLoteTotal7: TIntegerField;
    qFatura: TQuery;
    qFaturaSetor: TIntegerField;
    qFaturaQtdPar: TFloatField;
    mFatura: TMemoryTable;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    IntegerField27: TIntegerField;
    IntegerField28: TIntegerField;
    msFatura: TDataSource;
    qPedido: TQuery;
    mPedido: TMemoryTable;
    IntegerField29: TIntegerField;
    IntegerField30: TIntegerField;
    IntegerField31: TIntegerField;
    IntegerField32: TIntegerField;
    IntegerField33: TIntegerField;
    IntegerField34: TIntegerField;
    IntegerField35: TIntegerField;
    IntegerField36: TIntegerField;
    IntegerField37: TIntegerField;
    IntegerField38: TIntegerField;
    IntegerField39: TIntegerField;
    IntegerField40: TIntegerField;
    IntegerField41: TIntegerField;
    IntegerField42: TIntegerField;
    IntegerField43: TIntegerField;
    IntegerField44: TIntegerField;
    IntegerField45: TIntegerField;
    IntegerField46: TIntegerField;
    IntegerField47: TIntegerField;
    IntegerField48: TIntegerField;
    IntegerField49: TIntegerField;
    IntegerField50: TIntegerField;
    IntegerField51: TIntegerField;
    IntegerField52: TIntegerField;
    IntegerField53: TIntegerField;
    IntegerField54: TIntegerField;
    IntegerField55: TIntegerField;
    IntegerField56: TIntegerField;
    msPedido: TDataSource;
    qPedidoSetor: TIntegerField;
    qPedidoQtdPar: TFloatField;
    mPedidoTotalProd: TIntegerField;
    mPedidoTotalPend: TIntegerField;
    mFaturaTotalProd: TIntegerField;
    mFaturaTotalPend: TIntegerField;
    mLoteTotalProd: TIntegerField;
    mLoteTotalPend: TIntegerField;
    DBText77: TDBText;
    BitBtn6: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Posiciona_Setores;
    procedure Lote;
    procedure Fatura;
    procedure Pedido;
    procedure Imprimir;
    procedure Imprime_Posicao;
  public
    { Public declarations }
  end;

var
  fConsMovTalaoD: TfConsMovTalaoD;
  linha, pagina : Integer;
  F: TextFile;

implementation

uses UConsMovTalao, UDM1, UEscImpressora, UAgendaTelef;

{$R *.DFM}

procedure TfConsMovTalaoD.Imprime_Posicao;
var
  i, i2 : Integer;
  texto1, texto2 : String;
begin
  Pagina := Pagina + 1;
  texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 61 - length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Pagina.: ' + IntToStr(Pagina);
  Writeln(F,Texto1);
  texto1 := '             RELATORIO DA SITUACAO DO PEDIDO                 Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);
  Writeln(F,'--------------------------------------------------------------------------------');
  linha := 3;

  texto1 := 'Pedido.: ';
  texto2 := fConsMovTalao.tPedidoPedidoCliente.AsString;
  for i := 1 to 8 - length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' / ';
  texto2 := fConsMovTalao.tPedidoPedCliDif.AsString;
  for i := 1 to 2 - length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '        Emissao Pedido: ' + fConsMovTalao.tPedidoDtEmissao.AsString;
  Writeln(F,Texto1);
  Writeln(F);
  linha := linha + 2;

  texto1 := 'Pares do Pedido: ';
  texto2 := FormatFloat('#,###,###',fConsMovTalao.tPedidoQtdPares.AsFloat);
  for i := 1 to 9 - length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '    ' + 'Pares Reposicao: ';
  texto2 := FormatFloat('#,###,###',fConsMovTalao.tPedidoQtdParesRep.AsFloat);
  for i := 1 to 9 - length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F,Texto1);
  Writeln(F);
  linha := linha + 2;

  texto1 := 'Data Embarque: ' + fConsMovTalao.tPedidoDtIniEmbarque.AsString + ' a ' + fConsMovTalao.tPedidoDtFinEmbarque.AsString;
  Writeln(F,Texto1);
  Writeln(F,'--------------------------------------------------------------------------------');
  Writeln(F,'Setor             Qtd.no Setor      Qtd.Produzido     Qtd.Pendente');
  Writeln(F,'--------------------------------------------------------------------------------');
  linha := linha + 4;

  texto1 := '';
  mPedido.First;
  qSetores.First;
  for i := 1 to qSetores.RecordCount do
    begin
      texto2 := qSetoresNome.AsString;
      for i2 := 1 to 19 - Length(texto2) do
        texto2 := texto2 + ' ';
      texto1 := texto2;
      texto2 := FormatFloat('#,###,##0',mPedido.FieldByName('Total' + IntToStr(i)).AsInteger);
      for i2 := 1 to 9 - Length(texto2) do
        texto2 := ' ' + texto2;
      texto1 := texto1 + texto2 + '          ';
      texto2 := FormatFloat('#,###,##0',mPedido.FieldByName('Produzido' + IntToStr(i)).AsInteger);
      for i2 := 1 to 9 - Length(texto2) do
        texto2 := ' ' + texto2;
      texto1 := texto1 + texto2 + '         ';
      texto2 := FormatFloat('#,###,##0',mPedido.FieldByName('Pendente' + IntToStr(i)).AsInteger);
      for i2 := 1 to 9 - Length(texto2) do
        texto2 := ' ' + texto2;
      texto1 := texto1 + texto2;
      Writeln(F,Texto1);
      linha := linha + 1;
      qSetores.Next;
    end;
  Writeln(F,'--------------------------------------------------------------------------------');
  linha  := linha + 1;
  texto1 := 'Pedido             ';
  texto2 := FormatFloat('#,###,##0',fConsMovTalao.tPedidoQtdPares.AsInteger);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '          ';
  texto2 := FormatFloat('#,###,##0',mPedidoTotalProd.AsInteger);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '         ';
  texto2 := FormatFloat('#,###,##0',mPedidoTotalPend.AsInteger);
  for i := 1 to 9 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2;
  Writeln(F,Texto1);
  linha := linha + 1;

  while linha < 33 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfConsMovTalaoD.Imprimir;
var
  Texto : String;
begin
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#18);
  Imprime_Posicao;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      //WinExec(PChar(Texto),SW_MAXIMIZE);
      ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
    end;
end;

procedure TfConsMovTalaoD.Posiciona_Setores;
var
  i : integer;
begin
  for i := 7 to 13 do
    TStaticText(FindComponent(IntToStr(i))).Caption := '';

  for i := 1 to qSetores.RecordCount do
    begin
      qSetores.Locate('Item',i,[loCaseInsensitive]);
      case i of
        1 : StaticText7.Caption  := qSetoresNome.AsString;
        2 : StaticText8.Caption  := qSetoresNome.AsString;
        3 : StaticText9.Caption  := qSetoresNome.AsString;
        4 : StaticText10.Caption := qSetoresNome.AsString;
        5 : StaticText11.Caption := qSetoresNome.AsString;
        6 : StaticText12.Caption := qSetoresNome.AsString;
        7 : StaticText13.Caption := qSetoresNome.AsString;
      end;
    end;
end;

procedure TfConsMovTalaoD.Lote;
var
  i : integer;
begin
  mLote.EmptyTable;
  qSetores.First;
  for i := 1 to qSetores.RecordCount do
    begin
      mLote.Edit;
      mLote.FieldByName('Setor' + IntToStr(i)).AsInteger     := qLoteSetor.AsInteger;
      if qLote.Locate('Setor',qSetoresCodSetor.AsInteger,[loCaseInsensitive]) then
        begin
          mLote.FieldByName('Total' + IntToStr(i)).AsInteger     := fConsMovTalao.tLoteQtdPares.AsInteger;
          mLote.FieldByName('Produzido' + IntToStr(i)).AsInteger := qLoteQtdPar.AsInteger;
          mLote.FieldByName('Pendente' + IntToStr(i)).AsInteger  := mLote.FieldByName('Total' + IntToStr(i)).AsInteger
                                                                    - qLoteQtdPar.AsInteger;
        end
      else
        begin
          mLote.FieldByName('Total' + IntToStr(i)).AsInteger     := fConsMovTalao.tLoteQtdPares.AsInteger;
          mLote.FieldByName('Produzido' + IntToStr(i)).AsInteger := 0;
          mLote.FieldByName('Pendente' + IntToStr(i)).AsInteger  := mLote.FieldByName('Total' + IntToStr(i)).AsInteger;
        end;
      mLote.Post;
      qSetores.Next;
    end;
  mLote.Edit;
  mLoteTotalProd.AsInteger := mLote.FieldByName('Produzido' + IntToStr(qSetores.RecordCount)).AsInteger;
  mLoteTotalPend.AsInteger := fConsMovTalao.tLoteQtdPares.AsInteger - mLoteTotalProd.AsInteger;
  mLote.Post;
end;

procedure TfConsMovTalaoD.Fatura;
var
  i : integer;
begin
  mFatura.EmptyTable;
  qSetores.First;
  for i := 1 to qSetores.RecordCount do
    begin
      mFatura.Edit;
      mFatura.FieldByName('Setor' + IntToStr(i)).AsInteger     := qFaturaSetor.AsInteger;
      if qFatura.Locate('Setor',qSetoresCodSetor.AsInteger,[loCaseInsensitive]) then
        begin
          mFatura.FieldByName('Total' + IntToStr(i)).AsInteger     := fConsMovTalao.tPedidoItemQtdPares.AsInteger;
          mFatura.FieldByName('Produzido' + IntToStr(i)).AsInteger := qFaturaQtdPar.AsInteger;
          mFatura.FieldByName('Pendente' + IntToStr(i)).AsInteger  := mFatura.FieldByName('Total' + IntToStr(i)).AsInteger
                                                                    - qFaturaQtdPar.AsInteger;
        end
      else
        begin
          mFatura.FieldByName('Total' + IntToStr(i)).AsInteger     := fConsMovTalao.tPedidoItemQtdPares.AsInteger;
          mFatura.FieldByName('Produzido' + IntToStr(i)).AsInteger := 0;
          mFatura.FieldByName('Pendente' + IntToStr(i)).AsInteger  := mFatura.FieldByName('Total' + IntToStr(i)).AsInteger;
        end;
      mFatura.Post;
      qSetores.Next;
    end;
  mFatura.Edit;
  mFaturaTotalProd.AsInteger := mFatura.FieldByName('Produzido' + IntToStr(qSetores.RecordCount)).AsInteger;
  mFaturaTotalPend.AsInteger := fConsMovTalao.tPedidoItemQtdPares.AsInteger - mFaturaTotalProd.AsInteger;
  mFatura.Post;
end;

procedure TfConsMovTalaoD.Pedido;
var
  i : integer;
begin
  mPedido.EmptyTable;
  qSetores.First;
  for i := 1 to qSetores.RecordCount do
    begin
      mPedido.Edit;
      mPedido.FieldByName('Setor' + IntToStr(i)).AsInteger     := qPedidoSetor.AsInteger;
      if qPedido.Locate('Setor',qSetoresCodSetor.AsInteger,[loCaseInsensitive]) then
        begin
          mPedido.FieldByName('Total' + IntToStr(i)).AsInteger     := fConsMovTalao.tPedidoQtdPares.AsInteger;
          mPedido.FieldByName('Produzido' + IntToStr(i)).AsInteger := qPedidoQtdPar.AsInteger;
          mPedido.FieldByName('Pendente' + IntToStr(i)).AsInteger  := mPedido.FieldByName('Total' + IntToStr(i)).AsInteger
                                                                    - qPedidoQtdPar.AsInteger;
        end
      else
        begin
          mPedido.FieldByName('Total' + IntToStr(i)).AsInteger     := fConsMovTalao.tPedidoQtdPares.AsInteger;
          mPedido.FieldByName('Produzido' + IntToStr(i)).AsInteger := 0;
          mPedido.FieldByName('Pendente' + IntToStr(i)).AsInteger  := mPedido.FieldByName('Total' + IntToStr(i)).AsInteger;
        end;
      mPedido.Post;
      qSetores.Next;
    end;
  mPedido.Edit;
  mPedidoTotalProd.AsInteger := mPedido.FieldByName('Produzido' + IntToStr(qSetores.RecordCount)).AsInteger;
  mPedidoTotalPend.AsInteger := fConsMovTalao.tPedidoQtdPares.AsInteger - mPedidoTotalProd.AsInteger;
  mPedido.Post;
end;

procedure TfConsMovTalaoD.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsMovTalaoD.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsMovTalaoD.FormShow(Sender: TObject);
begin
  Posiciona_Setores;
  Lote;
  Fatura;
  Pedido;
end;

procedure TfConsMovTalaoD.BitBtn6Click(Sender: TObject);
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  Imprimir;
end;

procedure TfConsMovTalaoD.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
