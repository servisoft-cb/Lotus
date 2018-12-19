unit UPedAmostra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, RXCtrls, RxLookup, Mask, ToolEdit,
  RXDBCtrl, ComCtrls, CurrEdit, Grids, DBGrids, Db, DBTables, MemTable,
  ALed, Variants, ShellApi;

type
  TfPedAmostra = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label18: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Edit3: TEdit;
    Panel3: TPanel;
    RxSpeedButton2: TRxSpeedButton;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBDateEdit2: TDBDateEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    Panel7: TPanel;
    DBMemo1: TDBMemo;
    StaticText1: TStaticText;
    Edit1: TEdit;
    Label6: TLabel;
    StaticText2: TStaticText;
    Edit2: TEdit;
    StaticText3: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn7: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    RxDBGrid1: TRxDBGrid;
    Label7: TLabel;
    DBText2: TDBText;
    tAuxPedAmostraGrade: TTable;
    tAuxPedAmostraGradePedido: TIntegerField;
    tAuxPedAmostraGradeCodGrade: TIntegerField;
    tAuxPedAmostraGradePosicao: TIntegerField;
    tAuxPedAmostraGradeQtd: TFloatField;
    dsAuxPedAmostraGrade: TDataSource;
    tAuxPedAmostraGradelkTamanho: TStringField;
    mAuxImpPed: TMemoryTable;
    mAuxImpPedCodGrade: TIntegerField;
    mAuxImpPedPedido: TIntegerField;
    mAuxImpPedItem: TIntegerField;
    mAuxImpPedControle: TIntegerField;
    mAuxTamanho: TMemoryTable;
    mAuxTamanhoPedido: TIntegerField;
    mAuxTamanhoControle: TIntegerField;
    mAuxTamanhoPosicao: TIntegerField;
    mAuxTamanhoTamanho: TStringField;
    mAuxTamanhoIndice: TIntegerField;
    Label9: TLabel;
    DBMemo2: TDBMemo;
    DBText4: TDBText;
    GroupBox1: TGroupBox;
    ALed1: TALed;
    Label10: TLabel;
    ALed2: TALed;
    Label11: TLabel;
    Label12: TLabel;
    BitBtn8: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit3Change(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tAuxPedAmostraGradeBeforeInsert(DataSet: TDataSet);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure DBMemo2Enter(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vItem : Integer;
    procedure Habilita;
    procedure Verifica_Totais;
    procedure Limpa_Edit;
    procedure Imprime_Pedido;
    procedure Verifica_Pedido;
    procedure Verifica_Baixa;
  public
    { Public declarations }
  end;

var
  fPedAmostra : TfPedAmostra;
  i2, vControle, T : Integer;
  Obs  : Array [1..5] of String[75];
  TextoTam, vObsItem : String;
  vEdit : String[1];  // N = Inserção do pedido
                     // S = Alteracao do pedido
                     // C = Consulta dos pares da grade da referencia

implementation

uses UDM1, UDM2, UPedAmostraGrade, UPedAmostraMat, UEscImpressora,
  UBaixaPedAmostra, UAgendaTelef;

{$R *.DFM}

procedure TfPedAmostra.Verifica_Baixa;
var
  vBaixado : Boolean;
begin
  vBaixado := True;
  DM1.tPedAmostraIt.First;
  while not DM1.tPedAmostraIt.Eof do
    begin
      if not DM1.tPedAmostraItBaixado.AsBoolean then
        vBaixado := False;
      DM1.tPedAmostraIt.Next;
    end;
  DM1.tPedAmostra.Edit;
  DM1.tPedAmostraBaixado.AsBoolean := vBaixado;
  DM1.tPedAmostra.Post;
end;

procedure TfPedAmostra.Habilita;
begin
  DBNavigator1.Enabled   := not(DBNavigator1.Enabled);
  Panel2.Enabled         := not(Panel2.Enabled);
  Panel4.Enabled         := not(Panel4.Enabled);
  Panel7.Enabled         := not(Panel7.Enabled);
  RxSpeedButton2.Enabled := not(RxSpeedButton2.Enabled);
  BitBtn1.Enabled        := not(BitBtn1.Enabled);
  BitBtn2.Enabled        := not(BitBtn2.Enabled);
  BitBtn3.Enabled        := not(BitBtn3.Enabled);
  BitBtn4.Enabled        := not(BitBtn4.Enabled);
  BitBtn5.Enabled        := not(BitBtn5.Enabled);
  BitBtn6.Enabled        := not(BitBtn6.Enabled);
  BitBtn7.Enabled        := not(BitBtn7.Enabled);
  Edit1.Enabled          := not(Edit1.Enabled);
  Edit2.Enabled          := not(Edit2.Enabled);
  CurrencyEdit1.Enabled  := not(CurrencyEdit1.Enabled);
  SpeedButton1.Enabled   := not(SpeedButton1.Enabled);
  SpeedButton2.Enabled   := not(SpeedButton2.Enabled);
  SpeedButton3.Enabled   := not(SpeedButton3.Enabled);
  SpeedButton4.Enabled   := not(SpeedButton4.Enabled);
end;

procedure TfPedAmostra.Verifica_Totais;
begin
  DM1.tPedAmostra.Edit;
  DM1.tPedAmostraQtdPares.AsFloat := 0;
  DM1.tPedAmostraIt.First;
  while not DM1.tPedAmostraIt.Eof do
    begin
      DM1.tPedAmostraQtdPares.AsFloat := DM1.tPedAmostraQtdPares.AsFloat + DM1.tPedAmostraItQtdPares.AsFloat;
      DM1.tPedAmostraIt.Next;
    end;
  DM1.tPedAmostra.Post;
end;

procedure TfPedAmostra.Limpa_Edit;
begin
  Edit1.Clear;
  Edit2.Clear;
  CurrencyEdit1.Value := 0;
end;

procedure TfPedAmostra.Imprime_Pedido;
var
  F : TextFile;
  Linha, Pagina : integer;
  Inteiro : Real;
  Texto1, Texto2, Texto3 : string;
procedure Monta_Grade;
var
 i : Integer;
begin
  TextoTam := '';
  mAuxTamanho.First;
  while not mAuxTamanho.Eof do
    begin
      if (mAuxTamanhoPedido.AsInteger = DM1.tPedAmostraPedido.AsInteger) and  (mAuxTamanhoControle.AsInteger = vControle) then
        begin
          Texto1 := mAuxTamanhoTamanho.AsString;
          for i := 1 to 4 - length(Texto1) do
            texto1 := ' ' + texto1;
          TextoTam := TextoTam + Texto1 + ' ';
        end;
      mAuxTamanho.Next;
    end;
end;
procedure Monta_Aux;
var
  vindice,i,i2 : Integer;
  vTam : array[1..13] of String[3];
begin
  mAuxTamanho.EmptyTable;
  mAuxImpPed.EmptyTable;
  vControle := 1;
  vIndice   := 0;
  DM1.tPedAmostraIt.Refresh;
  DM1.tPedAmostraIt.First;
  while not DM1.tPedAmostraIt.Eof do
    begin
      for i := 1 to 13 do
        vTam[i] := '';
      i := 0;
      DM1.tPedAmostraGrade.First;
      while not DM1.tPedAmostraGrade.Eof do
        begin
          inc(i);
          vTam[i] := DM1.tPedAmostraGradelkTamanho.AsString;
          if not mAuxTamanho.Locate('Pedido;Controle;Posicao',VarArrayOf([DM1.tPedAmostraItPedido.AsInteger,vControle,DM1.tPedAmostraGradePosicao.AsInteger]),[locaseinsensitive]) then
            begin
              vIndice := vIndice + 1;
              if vIndice > 13 then
                begin
                  vIndice   := 0;
                  vControle := vControle + 1;
                  i := i - 1;
                  for i2 := 1 to i do
                    begin
                      vIndice := vIndice + 1;
                      mAuxTamanho.Insert;
                      mAuxTamanhoPedido.AsInteger   := DM1.tPedAmostraItPedido.AsInteger;
                      mAuxTamanhoControle.AsInteger := vControle;
                      mAuxTamanhoPosicao.AsInteger  := DM1.tPedAmostraGradePosicao.AsInteger;
                      mAuxTamanhoTamanho.AsString   := vTam[i2];
                      mAuxTamanho.Post;
                    end;
                  for i := 1 to 13 do
                    vTam[i] := '';
                  i := 0;
                end;
              mAuxTamanho.Insert;
              mAuxTamanhoPedido.AsInteger   := DM1.tPedAmostraItPedido.AsInteger;
              mAuxTamanhoControle.AsInteger := vControle;
              mAuxTamanhoPosicao.AsInteger  := DM1.tPedAmostraGradePosicao.AsInteger;
              mAuxTamanhoTamanho.AsString   := DM1.tPedAmostraGradelkTamanho.AsString;
              mAuxTamanho.Post;
            end;
          DM1.tPedAmostraGrade.Next;
        end;
      mAuxImpPed.Insert;
      mAuxImpPedCodGrade.AsInteger := DM1.tPedAmostraItCodGrade.AsInteger;
      mAuxImpPedPedido.AsInteger   := DM1.tPedAmostraItPedido.AsInteger;
      mAuxImpPedItem.AsInteger     := DM1.tPedAmostraItItem.AsInteger;
      mAuxImpPedControle.AsInteger := vControle;
      mAuxImpPed.Post;
      DM1.tPedAmostraIt.Next
    end;
// Grava o indice no arquivo auxiliar
  vControle := 1;
  vIndice   := 0;
  mAuxTamanho.First;
  while not mAuxTamanho.Eof do
    begin
      if mAuxTamanhoPedido.AsInteger = DM1.tPedAmostraPedido.AsInteger then
        begin
          inc(vIndice);
          if vControle <> mAuxTamanhoControle.AsInteger then
            vIndice := 1;
          mAuxTamanho.Edit;
          mAuxTamanhoIndice.AsInteger := vIndice;
          vControle                   := mAuxTamanhoControle.AsInteger;
          mAuxTamanho.Post;
        end;
      mAuxTamanho.Next;
    end;
end;
procedure Imprime_Cab_Detalhe;
var
 i : Integer;
begin
  Monta_Grade;
  for i := 1 to 59 - Length(TextoTam) do
    TextoTam := TextoTam + ' ';
  Texto1 := 'Refer    Cor           Material   Pares    ' + TextoTam + ' Pr.Unit.           Pr.Total';
  Writeln(F,Texto1);
  Linha := Linha + 1;
end;
procedure Cabecalho;
var
  i : integer;
begin
  Linha := 0;
  Pagina := Pagina + 1;
  if Pagina > 1 then
    begin
      while linha < 66 do
        begin
          Linha := Linha + 1;
          Writeln(F);
        end;
    end;
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#18);
  DM1.tEmpresa.First;
  Texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 65 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Pag: ';
  Writeln(F,Format('%s%5d',[Texto1,Pagina]));
  Writeln(F);
  Texto1 := 'PEDIDO No: ' + DM1.tPedAmostraPedido.AsString;
  for i := 1 to 26 - length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + '          ';
  for i := 1 to 53 - length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'DATA DE EMISSAO: ' + DM1.tPedAmostraData.AsString;
  Writeln(F,Texto1);
  Texto1 := '';
  for i := 1 to 8 do
    Texto1 := Texto1 + '----------';
  Writeln(F,Texto1);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  Texto3 := 'CLIENTE: ' + DM1.tPedAmostraCliente.AsString;
  for i := 1 to 71 - Length(Texto3) do
    Texto3 := Texto3 + ' ';
  Texto1 := Texto3;
  Texto3 := 'CIA: ' + DM1.tPedAmostraCia.AsString;
  for i := 1 to 40 - Length(Texto3) do
    Texto3 := Texto3 + ' ';
  Texto1 := Texto1 + Texto3;
  Writeln(F,Texto1);
  Texto3 := 'DATA DE ENTREGA: ' + DM1.tPedAmostraDtEntrega.AsString;
  for i := 1 to 30 - Length(Texto3) do
    Texto3 := Texto3 + ' ';
  Texto1 := Texto3;
  Writeln(F,Texto1);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#18);
  Texto1 := '';
  for i := 1 to 8 do
    Texto1 := Texto1 + '----------';
  Writeln(F,Texto1);
  Writeln(F,Format('%33s%s',['','ITENS DO PEDIDO']));
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  Linha := 8;//era 13
  Imprime_Cab_Detalhe;
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#18);
end;
procedure Detalhes;
var
  i : Integer;
  Texto2, Texto3, vExisteGrade : String;
begin
 if not DM1.tImpressoraVisualizar.AsBoolean then
   Write(F,#15);
 vControle := 0;
 mAuxImpPed.First;
 while not mAuxImpPed.Eof do
   begin
     if (vControle > 0) and (vControle <> mAuxImpPedControle.AsInteger) then
       begin
         Writeln(F);
         Linha := Linha + 1;
         vControle := mAuxImpPedControle.AsInteger;
         Imprime_Cab_Detalhe;
       end;
     DM1.tPedAmostraIt.SetKey;
     DM1.tPedAmostraItPedido.AsInteger := mAuxImpPedPedido.AsInteger;
     DM1.tPedAmostraItItem.AsInteger   := mAuxImpPedItem.AsInteger;
     if DM1.tPedAmostraIt.GotoKey then
       begin
         Texto2 := DM1.tPedAmostraItRef.AsString;
         for i := 1 to 8 - length(DM1.tPedAmostraItRef.AsString) do
           Texto2 := Texto2 + ' ';
         Texto3 := Copy(DM1.tPedAmostraItCor.AsString,1,23);
         for i := 1 to 23 - length(Texto3) do
           Texto3 := Texto3 + ' ';
         Texto2 := Texto2 + ' ' + Texto3;
         Texto3 := DM1.tPedAmostraItQtdPares.AsString;
         for i := 1 to 5 - length(DM1.tPedAmostraItQtdPares.AsString) do
           Texto3 := ' ' + Texto3;
         Texto2 := Texto2 + ' ' + Texto3 + ' ';
         vExisteGrade := 'N';
         DM1.tGrade.SetKey;
         DM1.tGradeCodigo.AsInteger := DM1.tPedAmostraItCodGrade.AsInteger;
         if DM1.tGrade.GotoKey then
           vExisteGrade := 'S';
         DM1.tPedAmostraGrade.First;
         while not DM1.tPedAmostraGrade.EOF do
           begin 
             if DM1.tPedAmostraGradeQtd.AsFloat > 0 then
               begin
                 if mAuxTamanho.Locate('Pedido;Controle;Posicao',VarArrayOf([DM1.tPedAmostraPedido.AsInteger,mAuxImpPedControle.AsInteger,DM1.tPedAmostraGradePosicao.AsInteger]),[locaseinsensitive]) then
                   begin
                     texto3 := DM1.tPedAmostraGradeQtd.AsString;
                     for i := 1 to 4 - length(texto3) do
                       texto3 := ' ' + texto3;
                     i2 := 38 + (mAuxTamanhoIndice.AsInteger * 5);
                     for i := 1 to i2 - length(Texto2) do
                       texto2 := texto2 + ' ';
                     texto2 := texto2 + texto3 + ' ';
                   end;
               end;
             DM1.tPedAmostraGrade.Next;
           end;
         if Linha > 61 then
           begin
             vControle := mAuxImpPedControle.AsInteger;
             Cabecalho;
             if not DM1.tImpressoraVisualizar.AsBoolean then
               Write(F,#15);
           end;
         for i := 1 to 101 - length(Texto2) do
           Texto2 := Texto2 + ' ';
         Writeln(F,Format('%s%3s%13.2n%6s%13.2n',[Texto2,' ',DM1.tPedAmostraItVlrUnit.AsFloat,' ',DM1.tPedAmostraItVlrTotal.AsFloat]));
         Linha := Linha + 1;
       end;
     mAuxImpPed.Next;
   end;
  if not DM1.tImpressoraVisualizar.AsBoolean then
   Write(F,#18);
end;
procedure Sumario;
var
  i : Integer;
begin
  if linha > 53 then
    cabecalho;
  Texto1 := '';
  for i := 1 to 8 do
    Texto1 := Texto1 + '----------';
  Writeln(F,Texto1);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  Texto2 := ' ';
  Texto1 := '';
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#18);
  for i := 1 to 8 do
    Texto1 := Texto1 + '----------';
  Writeln(F,Texto1);
  Inteiro := DM1.tPedAmostraQtdPares.AsFloat;
  Writeln(F,Format('%s%14.2n%8s%s%18.2n',['TOTAL DE PARES..: ',Inteiro,'','VALOR TOTAL DO PEDIDO:',DM1.tPedAmostraVlrTotal.AsFloat]));
  Texto1 := '';
  for i := 1 to 8 do
    Texto1 := Texto1 + '----------';
  Writeln(F,Texto1);
  Writeln(F,Format('%s',['OBSERVACOES:']));
  Texto1 := '';
  Texto2 := '';
  T := 1;
  for i := 1 to 650 do
    begin
      Texto2 := Copy(DM1.tPedAmostraObs.AsString,i,1);
      if (Texto2 = #$D) or (Texto2 = #$A) then
        Texto1 := Texto1 + ' '
      else
        Texto1 := Texto1 + Copy(DM1.tPedAmostraObs.AsString,i,1);
    end;
  for i := 1 to 5 do
    begin
      Obs[i] := Copy(Texto1,T, 75);
      T      := T + 75;
    end;
  for i := 1 to 5 do
    Writeln(F,'  ' + Obs[i]);
  Texto1 := '';
  for i := 1 to 8 do
    Texto1 := Texto1 + '----------';
  Writeln(F,Texto1);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  Writeln(F);
  Linha := Linha + 12;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  Pagina := 0;
  Monta_Aux;
  vControle := 1;
  Cabecalho;
  Detalhes;
  Sumario;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto2 := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto2),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
  mAuxTamanho.EmptyTable;
  mAuxImpPed.EmptyTable;
end;

procedure TfPedAmostra.Verifica_Pedido;
begin
  if DM1.tPedAmostraBaixado.AsBoolean then
    Label12.Visible := True
  else
    Label12.Visible := False;
end;

procedure TfPedAmostra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Dm1.tPedAmostra.Close;
  Dm1.tPedAmostraIt.Close;
  Dm1.tPedAmostraGrade.Close;
  Dm1.tPedAmostraMat.Close;
  Dm1.tGrade.Close;
  Dm1.tGradeItem.Close;
  Action := Cafree;
end;

procedure TfPedAmostra.Edit3Change(Sender: TObject);
begin
  try
    DM1.tPedAmostra.IndexFieldNames := 'Pedido';
    DM1.tPedAmostra.FindNearest([Edit3.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
  Verifica_Pedido;
end;

procedure TfPedAmostra.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit3.Text := RxDBLookupCombo1.Text;
end;

procedure TfPedAmostra.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tPedAmostra.IndexFieldNames := 'Pedido';
  Edit3.Text := RxDBLookupCombo1.Text;
end;

procedure TfPedAmostra.RxDBLookupCombo1Exit(Sender: TObject);
begin
  Edit3.Text := RxDBLookupCombo1.Text;
end;

procedure TfPedAmostra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tPedAmostra.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o pedido antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfPedAmostra.BitBtn1Click(Sender: TObject);
var
  vNum : Integer;
begin
  if DM1.tUsuarioInsPedAmostra.AsBoolean then
    begin
      DM1.tPedAmostra.Refresh;
      DM1.tPedAmostra.Last;
      vNum := DM1.tPedAmostraPedido.AsInteger;
      DM1.tPedAmostra.Insert;
      DM1.tPedAmostraPedido.AsInteger := vNum + 1;
      DM1.tPedAmostraData.AsDateTime  := Date;
      DM1.tPedAmostra.Post;
      DM1.tPedAmostra.Edit;
      vEdit                           := 'N';
      Habilita;
      DBEdit1.SetFocus;
      Verifica_Pedido;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfPedAmostra.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltPedAmostra.AsBoolean then
    begin
      if not DM1.tPedAmostra.IsEmpty then
        begin
          if not DM1.tPedAmostraBaixado.AsBoolean then
            begin
              DM1.tPedAmostra.Edit;
              BitBtn2.Tag := 1;
              Habilita;
              vEdit       := 'N';
              DBEdit1.SetFocus;
              Verifica_Pedido;
            end
          else
            ShowMessage('Não pode ser alterado pedido já baixado!');
        end
      else
        ShowMessage('Não há registro p/ ser alterado!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfPedAmostra.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcPedAmostra.AsBoolean then
    begin
      if not DM1.tPedAmostra.IsEmpty then
        begin
          if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
            begin
              DM1.tPedAmostraIt.First;
              while not DM1.tPedAmostraIt.Eof do
                begin
                  DM1.tPedAmostraGrade.First;
                  while not DM1.tPedAmostraGrade.Eof do
                    DM1.tPedAmostraGrade.Delete;
                  DM1.tPedAmostraMat.First;
                  while not DM1.tPedAmostraMat.Eof do
                    DM1.tPedAmostraMat.Delete;
                  DM1.tPedAmostraIt.Delete;
                end;
              DM1.tPedAmostra.Delete;
            end;
        end
      else
        ShowMessage('Não há registro p/ ser excluído!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
  Verifica_Pedido;
end;

procedure TfPedAmostra.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 1 then
    begin
      DM1.tPedAmostra.Cancel;
      Verifica_Totais;
    end
  else
    begin
      DM1.tPedAmostra.Post;
      DM1.tPedAmostraIt.First;
      while not DM1.tPedAmostraIt.Eof do
        begin
          DM1.tPedAmostraGrade.First;
          while not DM1.tPedAmostraGrade.Eof do
            DM1.tPedAmostraGrade.Delete;
          DM1.tPedAmostraMat.First;
          while not DM1.tPedAmostraMat.Eof do
            DM1.tPedAmostraMat.Delete;
          DM1.tPedAmostraIt.Delete;
        end;
      DM1.tPedAmostra.Delete;
    end;
  Habilita;
  Verifica_Baixa;
  Verifica_Pedido;
  BitBtn2.Tag := 0;
  BitBtn1.SetFocus;
end;

procedure TfPedAmostra.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfPedAmostra.BitBtn5Click(Sender: TObject);
begin
  DM1.tPedAmostra.Post;
  Habilita;
  BitBtn2.Tag := 0;
  Verifica_Totais;
  Verifica_Baixa;
  Verifica_Pedido;
  BitBtn1.SetFocus;
end;

procedure TfPedAmostra.SpeedButton1Click(Sender: TObject);
begin
  Limpa_Edit;
  vEdit    := 'N';
  vObsItem := ' ';
  Edit1.SetFocus;
end;

procedure TfPedAmostra.tAuxPedAmostraGradeBeforeInsert(DataSet: TDataSet);
var
 icount : integer;
begin
  i2 := 0;
  if vEdit <> 'C' then
    begin
      icount := fPedAmostra.tAuxPedAmostraGrade.RecordCount;
      if icount >= DM1.tGradeItem.RecordCount then
        begin
         fPedAmostraGrade.BitBtn5.SetFocus;
         Abort;
       end;
    end;
end;

procedure TfPedAmostra.SpeedButton4Click(Sender: TObject);
begin
  vEdit := 'N';
  fPedAmostraMat := TfPedAmostraMat.Create(Self);
  fPedAmostraMat.ShowModal;
end;

procedure TfPedAmostra.SpeedButton2Click(Sender: TObject);
begin
  if not DM1.tPedAmostraIt.IsEmpty then
    begin
      if Edit1.Text = '' then
        begin
          if not DM1.tPedAmostraItBaixado.AsBoolean then
            begin
              vEdit                      := 'S';
              vItem                      := DM1.tPedAmostraItItem.AsInteger;
              Edit1.Text                 := DM1.tPedAmostraItRef.AsString;
              Edit2.Text                 := DM1.tPedAmostraItCor.AsString;
              CurrencyEdit1.Value        := DM1.tPedAmostraItQtdPares.AsFloat;
              vObsItem                   := DM1.tPedAmostraItObs.AsString;
              DM1.tGrade.IndexFieldNames := 'Codigo';
              DM1.tGrade.FindKey([DM1.tPedAmostraItCodGrade.AsInteger]);
              tAuxPedAmostraGrade.First;
              while not tAuxPedAmostraGrade.Eof do
                tAuxPedAmostraGrade.Delete;
              DM1.tPedAmostraGrade.First;
              while not DM1.tPedAmostraGrade.Eof do
                begin
                  tAuxPedAmostraGrade.Insert;
                  tAuxPedAmostraGradeCodGrade.AsInteger := DM1.tPedAmostraGradeCodGrade.AsInteger;
                  tAuxPedAmostraGradePedido.AsInteger   := DM1.tPedAmostraGradePedido.AsInteger;
                  tAuxPedAmostraGradePosicao.AsInteger  := DM1.tPedAmostraGradePosicao.AsInteger;
                  tAuxPedAmostraGradeQtd.AsFloat        := DM1.tPedAmostraGradeQtd.AsFloat;
                  DM1.tPedAmostraGrade.Delete;
                end;
              DM1.tPedAmostraQtdPares.AsFloat := DM1.tPedAmostraQtdPares.AsFloat - DM1.tPedAmostraItQtdPares.AsFloat;
              DM1.tPedAmostraIt.Delete;
            end
          else
            ShowMessage('Não pode ser alterado item já baixado!');
        end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
      Edit1.SetFocus;
    end
  else
    ShowMessage('Não Há registro p/ ser alterado!');
end;

procedure TfPedAmostra.RxDBGrid1DblClick(Sender: TObject);
begin
  vEdit := 'C';
// grava a grade nos itens
  tAuxPedAmostraGrade.First;
  while not tAuxPedAmostraGrade.Eof do
    tAuxPedAmostraGrade.Delete;
  DM1.tPedAmostraGrade.First;
  while not DM1.tPedAmostraGrade.Eof do
    begin
      tAuxPedAmostraGrade.Insert;
      tAuxPedAmostraGradeCodGrade.AsInteger   := DM1.tPedAmostraGradeCodGrade.AsInteger;
      tAuxPedAmostraGradePosicao.AsInteger    := DM1.tPedAmostraGradePosicao.AsInteger;
      tAuxPedAmostraGradeQtd.asFloat          := DM1.tPedAmostraGradeQtd.AsFloat;
      tAuxPedAmostraGrade.Post;
      DM1.tPedAmostraGrade.Next;
    end;
  fPedAmostraGrade := TfPedAmostraGrade.Create(Self);
  fPedAmostraGrade.ShowModal;
  vEdit := 'N';
// Apaga a tabela auxiliar
  tAuxPedAmostraGrade.First;
  while not tAuxPedAmostraGrade.Eof do
    tAuxPedAmostraGrade.Delete;
end;

procedure TfPedAmostra.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      fPedAmostraGrade := TfPedAmostraGrade.Create(Self);
      fPedAmostraGrade.ShowModal;
    end;
end;

procedure TfPedAmostra.BitBtn7Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if (Edit1.Text <> '') and (CurrencyEdit1.Value > 0) then
    begin
      DM1.tPedAmostraIt.Refresh;
      DM1.tPedAmostraIt.Last;
      vItemAux := DM1.tPedAmostraItItem.AsInteger; 
      DM1.tPedAmostraIt.Insert;
      DM1.tPedAmostraItPedido.AsInteger   := DM1.tPedAmostraPedido.AsInteger;
      if vEdit = 'S' then
        begin
          DM1.tPedAmostraItItem.AsInteger := vItem;
          if vObsItem <> '' then
            DM1.tPedAmostraItObs.AsString := vObsItem;
        end
      else
        DM1.tPedAmostraItItem.AsInteger := vItemAux + 1;
      DM1.tPedAmostraItCodGrade.AsInteger := tAuxPedAmostraGradeCodGrade.AsInteger;
      DM1.tPedAmostraItCor.AsString       := Edit2.Text;
      DM1.tPedAmostraItRef.AsString       := Edit1.Text;
      DM1.tPedAmostraItQtdPares.AsFloat   := CurrencyEdit1.Value;
      DM1.tPedAmostraIt.Post;
// grava a grade nos itens
      tAuxPedAmostraGrade.First;
      while not tAuxPedAmostraGrade.Eof do
        begin
          DM1.tPedAmostraGrade.Insert;
          DM1.tPedAmostraGradePedido.AsInteger   := DM1.tPedAmostraPedido.AsInteger;
          DM1.tPedAmostraGradeItem.AsInteger     := DM1.tPedAmostraItItem.AsInteger;
          DM1.tPedAmostraGradeCodGrade.AsInteger := tAuxPedAmostraGradeCodGrade.AsInteger;
          DM1.tPedAmostraGradePosicao.AsInteger  := tAuxPedAmostraGradePosicao.AsInteger;
          DM1.tPedAmostraGradeQtd.AsFloat        := tAuxPedAmostraGradeQtd.asFloat;
          DM1.tPedAmostraGrade.Post;
          tAuxPedAmostraGrade.Next;
        end;
      tAuxPedAmostraGrade.First;
      while not tAuxPedAmostraGrade.Eof do
        tAuxPedAmostraGrade.Delete;
      DM1.tPedAmostraQtdPares.AsFloat     := DM1.tPedAmostraQtdPares.AsFloat + DM1.tPedAmostraItQtdPares.AsFloat;
      fPedAmostraMat                      := TfPedAmostraMat.Create(Self);
      fPedAmostraMat.ShowModal;
      Limpa_Edit;
      vEdit                               := 'N';
      vObsItem                            := ' ';
      Edit1.SetFocus;
    end
  else
    begin
      ShowMessage('Você deve informar "Referência", "Qtd." e "Vlr. Unitário"!');
      Edit1.SetFocus;
    end;
end;

procedure TfPedAmostra.SpeedButton3Click(Sender: TObject);
begin
  if not DM1.tPedAmostraIt.IsEmpty then
    begin
      DM1.tPedAmostraMat.First;
      while not DM1.tPedAmostraMat.Eof do
        DM1.tPedAmostraMat.Delete;
      DM1.tPedAmostraGrade.First;
      while not DM1.tPedAmostraGrade.Eof do
        DM1.tPedAmostraGrade.Delete;
      DM1.tPedAmostraQtdPares.AsFloat := DM1.tPedAmostraQtdPares.AsFloat - DM1.tPedAmostraItQtdPares.AsFloat;
      DM1.tPedAmostraIt.Delete;
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfPedAmostra.RxSpeedButton2Click(Sender: TObject);
begin
  if not DM1.tPedAmostra.IsEmpty then
    Imprime_Pedido;
end;

procedure TfPedAmostra.DBMemo2Enter(Sender: TObject);
begin
  if DM1.tPedAmostraIt.IsEmpty then
    begin
      ShowMessage('Não há item registrado p/ ser inserido a observação!');
      DBMemo1.SetFocus;
    end;
end;

procedure TfPedAmostra.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DM1.tPedAmostraItBaixado.AsBoolean then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end;
end;

procedure TfPedAmostra.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  Verifica_Pedido;
end;

procedure TfPedAmostra.FormShow(Sender: TObject);
begin
  Dm1.tPedAmostra.Open;
  Dm1.tPedAmostraIt.Open;
  Dm1.tPedAmostraGrade.Open;
  Dm1.tPedAmostraMat.Open;
  Dm1.tGrade.Open;
  Dm1.tGradeItem.Open;
  Dm1.tPosicao.Open;
  Verifica_Pedido;
end;

procedure TfPedAmostra.BitBtn8Click(Sender: TObject);
begin
  fBaixaPedAmostra := TfBaixaPedAmostra.Create(Self);
  fBaixaPedAmostra.ShowModal;
  Verifica_Baixa;
  Verifica_Pedido;
end;

procedure TfPedAmostra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
