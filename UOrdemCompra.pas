unit UOrdemCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, ComCtrls,
  Db, DBTables, RXLookup, Grids, DBGrids, RXDBCtrl, Menus, RXCtrls,
  DBFilter, ALed, Variants, ShellApi;

type
  TfOrdemCompra = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
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
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tOrdemCompraIns: TTable;
    GroupBox1: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    tOrdemCompraItemIns: TTable;
    tOrdemCompraInsCodFornecedor: TIntegerField;
    tOrdemCompraInsCodCondPgto: TIntegerField;
    tOrdemCompraInsCodTransp: TIntegerField;
    tOrdemCompraInsDtEmissao: TDateField;
    tOrdemCompraInsObs: TMemoField;
    tOrdemCompraInsVlrTotal: TFloatField;
    tOrdemCompraItemInsItem: TIntegerField;
    tOrdemCompraItemInsCodMaterial: TIntegerField;
    tOrdemCompraItemInsQtd: TFloatField;
    tOrdemCompraItemInsVlrUnitario: TFloatField;
    tOrdemCompraItemInsAliqIPI: TFloatField;
    tOrdemCompraItemInsVlrIPI: TFloatField;
    tOrdemCompraItemInsDtEntrega: TDateField;
    tOrdemCompraInsCodigo: TIntegerField;
    tOrdemCompraItemInsCodigo: TIntegerField;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    Label6: TLabel;
    Edit1: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    CurrencyEdit4: TCurrencyEdit;
    StaticText7: TStaticText;
    CurrencyEdit5: TCurrencyEdit;
    StaticText8: TStaticText;
    DateEdit1: TDateEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    SpeedButton3: TSpeedButton;
    DBDateEdit1: TDBDateEdit;
    Label8: TLabel;
    DBText2: TDBText;
    StaticText9: TStaticText;
    tAuxOrdemCompra: TTable;
    tAuxOrdemCompraCodGrade: TIntegerField;
    tAuxOrdemCompraPosicao: TIntegerField;
    tAuxOrdemCompraQtd: TFloatField;
    tAuxOrdemCompraVlrUnitario: TFloatField;
    tAuxOrdemCompraVlrTotal: TFloatField;
    tAuxOrdemCompralkTamanho: TStringField;
    dsAuxOrdemCompra: TDataSource;
    RxSpeedButton2: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    tMaterialGradeNum: TTable;
    tMaterialGradeNumCodMaterial: TIntegerField;
    tMaterialGradeNumCodGrade: TIntegerField;
    tMaterialGradeNumPosicao: TIntegerField;
    tMaterialGradeNumTamanho: TStringField;
    tMaterialGradeNumPeso: TFloatField;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    BitBtn16: TBitBtn;
    Query1: TQuery;
    dsQuery1: TDataSource;
    Query1Codigo: TIntegerField;
    Query1Nome: TStringField;
    DateEdit2: TDateEdit;
    Label9: TLabel;
    RxDBFilter1: TRxDBFilter;
    RxDBFilter2: TRxDBFilter;
    StaticText10: TStaticText;
    Edit3: TEdit;
    tMaterialGradeNumTamMaterial: TStringField;
    tGradeItem: TTable;
    tGradeItemCodGrade: TIntegerField;
    tGradeItemPosicao: TIntegerField;
    tGradeItemTamanho: TStringField;
    StaticText11: TStaticText;
    DBEdit1: TDBEdit;
    GroupBox2: TGroupBox;
    ALed1: TALed;
    Label10: TLabel;
    ALed2: TALed;
    Label11: TLabel;
    ALed3: TALed;
    Label12: TLabel;
    RxDBGrid1: TRxDBGrid;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    Label13: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    SpeedButton5: TSpeedButton;
    tOrdemCompraInsEntregue: TBooleanField;
    tOrdemCompraInsReferencia: TStringField;
    tOrdemCompraInsCodProd: TIntegerField;
    DBCheckBox1: TDBCheckBox;
    email1: TMenuItem;
    Query1PrCusto: TFloatField;
    BitBtn15: TBitBtn;
    DBMemo1: TDBMemo;
    RxDBLookupCombo8: TRxDBLookupCombo;
    Label14: TLabel;
    DBDateEdit2: TDBDateEdit;
    qCalcMaterial: TQuery;
    qCalcMaterialNumOC: TIntegerField;
    qCalcMaterialLote: TIntegerField;
    dsqCalcMaterial: TDataSource;
    BitBtn10: TBitBtn;
    tOrdemCompraInsFilial: TIntegerField;
    tOrdemCompraItemInsFilial: TIntegerField;
    qCalcMaterialNumPedido: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure tAuxOrdemCompraBeforeInsert(DataSet: TDataSet);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBEdit1Change(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBLookupCombo1Click(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2CloseUp(Sender: TObject);
    procedure RxDBLookupCombo2DropDown(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure RxDBLookupCombo3DropDown(Sender: TObject);
    procedure RxDBLookupCombo3CloseUp(Sender: TObject);
    procedure RxDBLookupCombo4CloseUp(Sender: TObject);
    procedure RxDBLookupCombo4DropDown(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure RxDBLookupCombo5Click(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo7Enter(Sender: TObject);
    procedure RxDBLookupCombo7Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure email1Click(Sender: TObject);
    procedure RxDBLookupCombo6Exit(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure RxDBLookupCombo8Click(Sender: TObject);
    procedure RxDBLookupCombo8Enter(Sender: TObject);
    procedure RxDBLookupCombo8Exit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
  private
    { Private declarations }
    vCodMaterial : Integer;
    procedure Habilita;
    procedure Imprime_OrdemCompra;
    procedure Monta_Lotes;
  public
    { Public declarations }

  end;

var
  fOrdemCompra: TfOrdemCompra;
  vTotalPesoTr : Real;
  Obs   : Array [1..6] of String[126];
  vEdit : String[1];
  T, vCodFornecedor, vItem : Integer;

implementation

uses UGrupos, UDM1, USubGrupos, UFornecedores, UGrade, UCondPgto, UTransp,
  UMaterial, UOrdemCompraCor, URelOrdemCompra, Printers, UEscImpressora,
  UBaixaItOC, UConsFornecAtiv, UConsHistMat, UConsOrdemCompra, UProduto,
  UAgendaTelef, URelOrdemCompraMail, UCopiarOC, UOrdemCompraLote, uUtil;

{$R *.DFM}

procedure TfOrdemCompra.Monta_Lotes;
begin
  qCalcMaterial.Close;
  qCalcMaterial.ParamByName('NUMOC').AsInteger  := DM1.tOrdemCompraCodigo.AsInteger;
  qCalcMaterial.Open;
  qCalcMaterial.First;
end;

procedure TfOrdemCompra.Habilita;
begin
  Panel2.Enabled         := not(Panel2.Enabled);
  Panel4.Enabled         := not(Panel4.Enabled);
  BitBtn1.Enabled        := not(BitBtn1.Enabled);
  BitBtn2.Enabled        := not(BitBtn2.Enabled);
  BitBtn3.Enabled        := not(BitBtn3.Enabled);
  BitBtn4.Enabled        := not(BitBtn4.Enabled);
  BitBtn5.Enabled        := not(BitBtn5.Enabled);
  BitBtn6.Enabled        := not(BitBtn6.Enabled);
  RxSpeedButton2.Enabled := not(RxSpeedButton2.Enabled);
  DBNavigator1.Enabled   := not(DBNavigator1.Enabled);
  DBMemo1.ReadOnly       := not(DBMemo1.ReadOnly);
  BitBtn15.Enabled       := not(BitBtn15.Enabled);
end;

procedure TfOrdemCompra.Imprime_OrdemCompra;
var
  F : TextFile;
  Linha, Pagina : integer;
  Texto1, Texto2, Texto3 : string;
procedure Cabecalho;
var
 i : Integer;
begin
  Pagina := Pagina + 1;
  if Pagina > 1 then
    begin
      while linha < 66 do
        begin
          inc(linha);
          Writeln(F);
        end;
    end;
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  DM1.tEmpresa.First;
  Texto1 := ' ' + DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 80 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + '|          O R D E M    D E    C O M P R A';
  Writeln(F,Texto1);
  Texto1 := DM1.tEmpresaEndereco.AsString;
  Writeln(F,Format('%1s%s%'+IntToStr(59-Length(Texto1))+'s%s%s%6s%s',['',Texto1,'','CEP: ',DM1.tEmpresaCep.AsString,'','|']));
  Texto1 := ' FONE: ' +  DM1.tEmpresaTel.AsString;
  Texto2 := 'FAX: ' + DM1.tEmpresaFax.AsString;
  Texto3 := ' No. ' + DM1.tOrdemCompraCodigo.AsString;
  Writeln(F,Format('%s%'+IntToStr(60-Length(Texto1))+'s%s%'+IntToStr(20-Length(Texto2))+'s%s%s',[Texto1,'',Texto2,'','|',Texto3]));
  Texto1 := ' ' +  DM1.tEmpresaCidade.AsString;
  Texto2 := 'Estado: ' +DM1.tEmpresaEstado.AsString;
  Writeln(F,Format('%s%'+IntToStr(57-length(Texto1))+'s%s%13s%s',[Texto1,'',Texto2,'','|']));
  Texto1 := ' CNPJ: ' +  DM1.tEmpresaCgc.AsString;
  Texto2 := 'INSCR.EST.: ' + DM1.tEmpresaInscr.AsString;
  Texto3 := 'Pagina: ' + IntToStr(Pagina);
  Writeln(F,Format('%s%'+IntToStr(53-length(Texto1))+'s%s%'+IntToStr(27-length(Texto2))+'s%s%s%'+IntToStr(10-Length(DM1.tOrdemCompraDtEmissao.AsString))+'s%4s%s%s%'+IntToStr(31-length(Texto3))+'s',
         [Texto1,'',Texto2,'','|',' Data de Emissao: ',DM1.tOrdemCompraDtEmissao.AsString,'','',Texto3,'','|']));
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := ' Fornecedor: ' + DM1.tOrdemCompralkFornecedor.AsString;
  Texto2 := 'Telefone: ' + DM1.tOrdemCompralkFone.AsString;
  Writeln(F,Format('%s%'+IntToStr(55-Length(Texto1))+'s%s',[Texto1,'',Texto2]));
  Texto1 := '   Endereco: ' + DM1.tOrdemCompralkEnd.AsString;
  Texto2 := 'Cep: ' + DM1.tOrdemCompralkCep.AsString;
  Writeln(F,Format('%s%'+IntToStr(60-length(Texto1))+'s%s',[Texto1,'',Texto2]));
  Writeln(F,Format('%s%s',['     Bairro: ',DM1.tOrdemCompralkBairro.AsString]));
  Texto1 := '     Cidade: ' + DM1.tOrdemCompralkCidade.AsString;
  Texto2 := ' Estado: '+ DM1.tOrdemCompralkEstado.AsString;
  Writeln(F,Format('%s%'+IntToStr(56-Length(Texto1))+'s%s',[Texto1,'',Texto2]));
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  // Imprime dados da transportadora
  DM1.tTransp.IndexFieldNames := 'Codigo';
  DM1.tTransp.FindKey([DM1.tOrdemCompraCodTransp.AsInteger]);
  Texto1 := ' Transportador: ' + DM1.tOrdemCompralkNomeTransp.AsString;
  for i := 1 to 62 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Telefone: ' + DM1.tOrdemCompralkFoneTransp.AsString;
  Writeln(F,Texto1);
  Texto1 := '      Endereco: ' + DM1.tOrdemCompralkEndTransp.AsString;
  for i := 1 to 67 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto2 := 'Cep: ' + DM1.tOrdemCompralkCepTransp.AsString;
  for i := 1 to 25 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + 'Bairro: ' + DM1.tOrdemCompralkBairroTransp.AsString;
  Writeln(F,Texto1);
  Texto1 := '        Cidade: ' + DM1.tOrdemCompralkCidTransp.AsString;
  for i := 1 to 64 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Estado: ' + DM1.tOrdemCompralkUfTransp.AsString;
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'                                          Itens da Ordem de Compra');
  Writeln(F,'It. Nome Produto                              Larg. Nome da Cor     Dt.Entrega       Quantidade  Unid.   Vlr.Unitario    Valor Total');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Linha := 0;
end;
procedure Detalhes;
var
  i : Integer;
  Texto2, Texto3, Texto4 : String;
begin
 DM1.tOrdemCompraItem.First;
 while not DM1.tOrdemCompraItem.EOF do
   begin
     if Linha > 61 then
       begin
         Cabecalho;
         Write(F,#15);
       end;
     Texto2 := '';
     Texto3 := DM1.tOrdemCompraItemItem.AsString;
     for i := 1 to 3 - length(DM1.tOrdemCompraItemItem.AsString) do
       Texto3 := ' ' + Texto3;
     Texto2 := Texto2 + Texto3 + ' ';
     Texto3 := copy(DM1.tOrdemCompraItemlkNomeMaterial.AsString,1,42);
     for i := 1 to 42 - length(DM1.tOrdemCompraItemlkNomeMaterial.AsString) do
       Texto3 := Texto3 + ' ';
     Texto2 := Texto2 + Texto3 + '  ';
     texto3 := DM1.tOrdemCompraItemlkLargura.AsString;
     for i := 1 to 1 - Length(texto3) do
       texto3 := texto3 + ' ';
     texto2 := texto2 + texto3 + '   ';
     Texto3 := copy(DM1.tOrdemCompraItemlkNomeCor.AsString,1,15);
     for i := 1 to 15 - length(DM1.tOrdemCompraItemlkNomeCor.AsString) do
       Texto3 := Texto3 + ' ';
     Texto2 := Texto2 + Texto3 + ' ';
     Texto3 := DM1.tOrdemCompraItemDtEntrega.AsString;
     for i := 1 to 10 - length(DM1.tOrdemCompraItemDtEntrega.AsString) do
       Texto3 := ' ' + Texto3;
     Texto2 := Texto2 + Texto3 + ' ';
     Texto3 := FormatFloat('##,###,##0.00000',DM1.tOrdemCompraItemQtd.AsFloat);
     for i := 1 to 16 - length(Texto3) do
       Texto3 := ' ' + Texto3;
     Texto2 := Texto2 + Texto3 + '   ';
     Texto3 := DM1.tOrdemCompraItemUnidade.AsString;
     for i := 1 to 3 - length(Texto3) do
       Texto3 := Texto3 + ' ';
     Texto2 := Texto2 + Texto3 + ' ';
     Texto3 := FormatFloat('###,###,##0.000',DM1.tOrdemCompraItemVlrUnitario.AsFloat);
     for i := 1 to 15 - length(Texto3) do
       Texto3 := ' ' + Texto3;
     Texto2 := Texto2 + Texto3 + ' ';
     Texto3 := FormatFloat('###,###,##0.00',DM1.tOrdemCompraItemVlrTotal.AsFloat);
     for i := 1 to 14 - length(Texto3) do
       Texto3 := ' ' + Texto3;
     Texto2 := Texto2 + Texto3;
     Writeln(F,Texto2);

     Linha := Linha + 1;
     if not DM1.tOrdemCompraItemGrade.IsEmpty then
       begin
         Texto2 := '';
         Texto3 := '        Tam:';
         Texto4 := '        Qtd:';
         DM1.tOrdemCompraItemGrade.First;
         while not DM1.tOrdemCompraItemGrade.EOF do
           begin
             DM1.tGrade.IndexFieldNames := 'Codigo';
             DM1.tGrade.FindKey([DM1.tOrdemCompraItemGradeCodGrade.AsInteger]);
             if DM1.tOrdemCompraItemGradeQtd.AsInteger > 0 then
               begin
                 Texto2 := '';
                 if tGradeItem.Locate('CodGrade;Posicao',VarArrayOf([DM1.tOrdemCompraItemGradeCodGrade.AsInteger,DM1.tOrdemCompraItemGradePosicao.AsInteger]),[loCaseInsensitive]) then
                   Texto2 := tGradeItemTamanho.AsString;
                 for i := 1 to 4 - length(Texto2) do
                   texto2 := ' ' + texto2;
                 Texto3 := Texto3 + ' ' + Texto2;
                 Texto2 := DM1.tOrdemCompraItemGradeQtd.AsString;
                 for i := 1 to 4 - length(DM1.tOrdemCompraItemGradeQtd.AsString) do
                   Texto2 := ' ' + texto2;
                 texto4 := texto4 + ' ' + texto2;
                 // Posiciona a tabela tMaterialGradeNum para somar o peso de TR
                 tMaterialGradeNum.SetKey;
                 tMaterialGradeNumCodMaterial.AsInteger := DM1.tOrdemCompraItemCodMaterial.AsInteger;
                 tMaterialGradeNumCodGrade.AsInteger    := DM1.tOrdemCompraItemGradeCodGrade.AsInteger;
                 tMaterialGradeNumPosicao.AsInteger     := DM1.tOrdemCompraItemGradePosicao.AsInteger;
                 if tMaterialGradeNum.GotoKey then
                   vTotalPesoTr := vTotalPesoTr + (tMaterialGradeNumPeso.AsFloat * DM1.tOrdemCompraItemGradeQtd.AsInteger);
               end;
             DM1.tOrdemCompraItemGrade.Next
           end;
         Writeln(F,texto3);
         Writeln(F,texto4);
         Linha := Linha + 2;
       end;
     DM1.tOrdemCompraItem.Next;
   end;
end;
procedure Sumario;
var
  Texto1, Texto2 : String;
  i, contador : Integer;
begin
  if linha > 53 then
    cabecalho;
  Texto1 := '';
  Texto1 := Texto1 + '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := 'Condicao de Pagamento.: ' + DM1.tOrdemCompralkCondsPgto.AsString;
  Writeln(F,Texto1);
  Texto1 := '';
  Texto1 := '';
  Texto2 := '';
  Contador := 0;
  if Contador > 0 then
    Writeln(F,Texto1);
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := 'Observacoes';
  Texto2 := '| Total R$: ' + FormatFloat('###,###,##0.00',DM1.tOrdemCompraVlrTotal.AsFloat);
  Writeln(F,Format('%s%'+IntToStr(104-Length(Texto1))+'s%s',[Texto1,'',Texto2]));
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := '';
  Texto2 := '';
  T := 1;
  for i := 1 to 650 do
    begin
      Texto2 := Copy(DM1.tOrdemCompraObs.AsString,i,1);
      if (Texto2 = #$D) or (Texto2 = #$A) then
        Texto1 := Texto1 + ' '
      else
        Texto1 := Texto1 + Copy(DM1.tOrdemCompraObs.AsString,i,1);
    end;
  for i := 1 to 6 do
    begin
      Obs[i] := Copy(Texto1,T, 126);
      T      := T + 126;
    end;
  for i := 1 to 6 do
    Writeln(F,'  ' + Obs[i]);
  Texto1 := '------------------------------------------------------------------------------------------------------------------------------------';
  Writeln(F,Texto1);
  Writeln(F,Format('%s',['DEVE CONSTAR O NUMERO DA ORDEM DE COMPRA NA NOTA FISCAL E O ITEM']));
  Writeln(F);
  Writeln(F);
  Writeln(F);
  Writeln(F);
  Writeln(F);
  Texto1 := '  ----------------------------------------------------------           ----------------------------------------------------------';
  Writeln(F,Texto1);
  Texto1 := '                          Fornecedor                                                          Comprador';
  Writeln(F,Texto1);
end;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  Pagina := 0;
  vTotalPesoTr := 0;
  Cabecalho;
  Detalhes;
  Sumario;
  CloseFile(F);
  DM1.tPedido.Edit;
  DM1.tPedidoImpresso.AsBoolean := True;
  DM1.tPedido.Post;
  if DM1.tImpressoraVisualizar.AsBoolean then
    Begin
      Texto2 := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      //WinExec(PChar(Texto2),SW_MAXIMIZE);
      ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
    end;  
end;

procedure TfOrdemCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  RxDBFilter2.Active := False;
  if Screen.FormCount < 3 then
    begin
      DM1.tOrdemCompra.Close;
      DM1.tOrdemCompraItem.Close;
      DM1.tOrdemCompraItemGrade.Close;
      DM1.tOrdemCompraNota.Close;
      DM1.tFornecedores.Close;
      DM1.tProduto.Close;
      DM1.tProdutoCor.Close;
      DM1.tProdutoTam.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      DM1.tTransp.Close;
      DM1.tCondPgto.Close;
      DM1.tCondPgtoItem.Close;
      DM1.tCor.Close;
      DM1.tMaterial.Close;
      DM1.tMaterialCor.Close;
      DM1.tMaterialGradeNum.Close;
      DM1.tCidade.Close;
      DM1.tUF.Close;
      DM1.tPedido.Close;
      DM1.tPedidoItem.Close;
      DM1.tPedidoGrade.Close;
      DM1.tCalcMaterial.Close;
    end;
  Action := Cafree;
end;

procedure TfOrdemCompra.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfOrdemCompra.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
    begin
      RxDBFilter1.Active := False;
      DM1.tFornecedores.Refresh;
      fFornecedores := TfFornecedores.Create(Self);
      fFornecedores.ShowModal;
      RxDBFilter1.Active := True;
      DM1.tFornecedores.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de fornecedores!');
end;

procedure TfOrdemCompra.BitBtn1Click(Sender: TObject);
begin
  BitBtn2.Tag := 0;
  if DM1.tUsuarioInsOrdemCompra.AsBoolean then
    begin
      DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
      tOrdemCompraIns.IndexFieldNames  := 'Filial;Codigo';
      DM1.tOrdemCompra.Refresh;
      tOrdemCompraIns.Refresh;
      tOrdemCompraIns.Last;
      DM1.tOrdemCompra.Insert;
      DM1.tOrdemCompraFilial.AsInteger := 1;
      DM1.tOrdemCompraCodigo.AsInteger := tOrdemCompraInsCodigo.AsInteger + 1;
      DM1.tOrdemCompra.Post;
      DM1.tOrdemCompra.Edit;
      DM1.tOrdemCompraCouro.AsBoolean := False;
      StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
      DM1.tOrdemCompraDtEmissao.AsDateTime := Date();
      vEdit := 'N';
      vItem := 0;
      Habilita;
      RxDBLookupCombo2.SetFocus;
      DateEdit2.Date := Date;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfOrdemCompra.BitBtn2Click(Sender: TObject);
begin
  BitBtn2.Tag := 1;
  DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
  vEdit := 'N';
  vItem := 0;
  if DM1.tUsuarioAltOrdemCompra.AsBoolean then
  begin
    DM1.tOrdemCompra.Edit;
    Habilita;
    RxDBLookupCombo2.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfOrdemCompra.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 0 then
    begin
      DM1.tOrdemCompraItem.First;
      while not DM1.tOrdemCompraItem.Eof do
        begin
          DM1.tOrdemCompraItemGrade.First;
          while not DM1.tOrdemCompraItemGrade.Eof do
            DM1.tOrdemCompraItemGrade.Delete;
          DM1.tOrdemCompraItem.Delete;
        end;
      DM1.tOrdemCompra.Delete;
    end;
  DM1.tOrdemCompra.Cancel;
  Habilita;
  RxDBLookupCombo8.ClearValue;
  RxDBLookupCombo6.ClearValue;
  Edit1.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  DateEdit1.Clear;
  BitBtn2.Tag := 0;
end;

procedure TfOrdemCompra.BitBtn3Click(Sender: TObject);
var
  vExcluir : Boolean;
begin
  if DM1.tUsuarioExcOrdemCompra.AsBoolean then
    begin
      if DM1.tOrdemCompraEntregue.AsBoolean then
        vExcluir := False
      else
        begin
          vExcluir := True;
          DM1.tOrdemCompraItem.First;
          while not DM1.tOrdemCompraItem.Eof do
            begin
              if DM1.tOrdemCompraItemQtdEntregue.AsFloat > 0 then
                begin
                  vExcluir := False;
                  DM1.tOrdemCompraItem.Last;
                end;
              DM1.tOrdemCompraItem.Next;
            end;
        end;
      if vExcluir then
        begin
          if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
            begin
              DM1.tOrdemCompraItem.First;
              while not DM1.tOrdemCompraItem.Eof do
                begin
                  DM1.tOrdemCompraItemGrade.First;
                  while not DM1.tOrdemCompraItemGrade.Eof do
                    DM1.tOrdemCompraItemGrade.Delete;
                  DM1.tCalcMaterial.First;
                  while not DM1.tCalcMaterial.Eof do
                    DM1.tCalcMaterial.Delete;
                  DM1.tOrdemCompraItem.Delete;
                end;
              DM1.tOrdemCompra.Delete;
              DM1.tOrdemCompra.Refresh;
              DM1.tOrdemCompraItem.Refresh;
              DM1.tCalcMaterial.Refresh;
              StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
            end
        end
      else
        ShowMessage('Ordem de compra ja foi entregue!');
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfOrdemCompra.BitBtn5Click(Sender: TObject);
var
  vEntregue : Boolean;
  vGrava    : Boolean;
begin
  BitBtn2.Tag := 0;
  if DM1.tOrdemCompra.State in [dsEdit,dsInsert] then
    begin
      if DM1.tOrdemCompraItem.RecordCount > 0 then
        vGrava := True
      else
        begin
          ShowMessage('Não pode confirmar a OC sem produtos!');
          vGrava := False;
        end;
      if vGrava then
        begin
          if DM1.tOrdemCompraItem.RecordCount > 0 then
            begin
              vEntregue := True;
              DM1.tOrdemCompraItem.First;
              while not DM1.tOrdemCompraItem.Eof do
                begin
                  if DM1.tOrdemCompraItemQtdRestante.AsFloat > 0 then
                    vEntregue := False;
                  DM1.tOrdemCompraItem.Next;
                end;
            end
          else
            vEntregue := False;
          DM1.tOrdemCompraEntregue.AsBoolean := vEntregue;
          DM1.tOrdemCompra.Post;
          StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
          Habilita;
          BitBtn1.SetFocus;
        end;
    end;
end;

procedure TfOrdemCompra.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioCondPgto.AsBoolean then
    begin
      fCondPgto := TfCondPgto.Create(Self);
      fCondPgto.ShowModal;
      DM1.tCondPgto.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de cond.pagto.!');
end;

procedure TfOrdemCompra.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
end;

procedure TfOrdemCompra.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tOrdemCompra.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a ordem de compra antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfOrdemCompra.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
//  if (Shift = [ssCtrl]) and (Key = 76) then
//    DM1.Login;
  if (Key = Vk_F9) then
    begin
      if DM1.tUsuarioConsFornecAtiv.AsBoolean then
        begin
          fConsFornecAtiv := TfConsFornecAtiv.Create(Self);
          fConsFornecAtiv.ShowModal;
        end
      else
        ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de Consulta de fornecedores!');
    end;
  if (Key = Vk_F8) then
    begin
      fConsHistMat := TfConsHistMat.Create(Self);
      fConsHistMat.ShowModal;
    end;
  if (Key = Vk_F2) and (DM1.tOrdemCompra.State in [dsBrowse]) then
    begin
      fConsOrdemCompra := TfConsOrdemCompra.Create(Self);
      fConsOrdemCompra.ShowModal;
    end;
end;

procedure TfOrdemCompra.BitBtn7Click(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger <= 0 then
    begin
      ShowMessage('Não foi informada a quantidade!');
      exit;
    end;

  if RxDBLookupCombo8.Text = '' then
    begin
      ShowMessage('Há campos em branco!');
      Edit1.SetFocus;
    end
  else
  if DateEdit1.Date < DM1.tOrdemCompraDtEmissao.AsDateTime then
    begin
      ShowMessage('Data de entrega é menor que a data de emissão!');
      DateEdit1.SetFocus;
    end
  else
    begin
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.FindKey([RxDBLookupCombo8.KeyValue]);
      DM1.tOrdemCompraItem.Refresh;
      tOrdemCompraItemIns.Refresh;
      tOrdemCompraItemIns.Last;
      DM1.tOrdemCompraItem.Insert;
      DM1.tOrdemCompraItemCodigo.AsInteger      := DM1.tOrdemCompraCodigo.AsInteger;
      if vEdit = 'S' then
        DM1.tOrdemCompraItemItem.AsInteger  := vItem
      else
        DM1.tOrdemCompraItemItem.AsInteger        := tOrdemCompraItemInsItem.AsInteger + 1;
      if RxDBLookupCombo8.Text <> '' then
        DM1.tOrdemCompraItemCodMaterial.AsInteger := RxDBLookupCombo8.KeyValue;
      if RxDBLookupCombo6.Text <> '' then
        DM1.tOrdemCompraItemCodCor.AsInteger    := RxDBLookupCombo6.KeyValue
      else
        DM1.tOrdemCompraItemCodCor.AsInteger    := 0;
      DM1.tOrdemCompraItemQtd.AsFloat           := CurrencyEdit1.Value;
      DM1.tOrdemCompraItemUnidade.AsString      := Edit3.Text;
      DM1.tOrdemCompraItemQtdRestante.AsFloat   := CurrencyEdit1.Value;
      DM1.tOrdemCompraItemQtdEntregue.AsFloat   := 0;
      DM1.tOrdemCompraItemVlrUnitario.AsFloat   := CurrencyEdit2.Value;
      DM1.tOrdemCompraItemAliqIpi.AsFloat       := CurrencyEdit4.Value;
      DM1.tOrdemCompraItemVlrIpi.AsFloat        := CurrencyEdit5.Value;
      if DateEdit1.Text = '  /  /    ' then
        DM1.tOrdemCompraItemDtEntrega.Clear
      else
        DM1.tOrdemCompraItemDtEntrega.AsDateTime  := DateEdit1.Date;
      DM1.tOrdemCompraItemVlrTotal.AsFloat      := CurrencyEdit2.Value * CurrencyEdit1.Value;
      DM1.tOrdemCompraVlrTotal.AsFloat          := DM1.tOrdemCompraVlrTotal.AsFloat +
                                                   DM1.tOrdemCompraItemVlrTotal.AsFloat;
      tAuxOrdemCompra.First;
      if not tAuxOrdemCompra.IsEmpty then
        DM1.tOrdemCompraItemCodGrade.AsInteger    := tAuxOrdemCompraCodGrade.AsInteger
      else
        DM1.tOrdemCompraItemCodGrade.AsInteger    := 0;
      DM1.tOrdemCompraItem.Post;
      // grava a grade nos itens
      if DM1.tMaterialLancaGrade.AsBoolean then
        begin
          tAuxOrdemCompra.First;
          while not tAuxOrdemCompra.Eof do
            begin
              DM1.tOrdemCompraItemGrade.Insert;
              DM1.tOrdemCompraItemGradeCodigo.AsInteger      := DM1.tOrdemCompraCodigo.AsInteger;
              DM1.tOrdemCompraItemGradeItem.AsInteger        := DM1.tOrdemCompraItemItem.AsInteger;
              DM1.tOrdemCompraItemGradeCodGrade.AsInteger    := tAuxOrdemCompraCodGrade.AsInteger;
              DM1.tOrdemCompraItemGradePosicao.AsInteger     := tAuxOrdemCompraPosicao.AsInteger;
              DM1.tOrdemCompraItemGradeQtd.AsFloat           := tAuxOrdemCompraQtd.asFloat;
              DM1.tOrdemCompraItemGradeQtdRestante.AsFloat   := tAuxOrdemCompraQtd.asFloat;
              DM1.tOrdemCompraItemGradeQtdEntregue.AsFloat   := 0;
              DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat   := tAuxOrdemCompraVlrUnitario.asFloat;
              DM1.tOrdemCompraItemGradeVlrTotal.AsFloat      := tAuxOrdemCompraQtd.AsFloat * tAuxOrdemCompraVlrUnitario.asFloat;
              DM1.tOrdemCompraItemGrade.Post;
              tAuxOrdemCompra.Next;
            end;
          DM1.tOrdemCompraItem.Refresh;
          DM1.tOrdemCompraItemGrade.Refresh;
          tAuxOrdemCompra.First;
          while not tAuxOrdemCompra.Eof do
            tAuxOrdemCompra.Delete;
        end;
      // fim da gravação da grade
      BitBtn8Click(Sender);
      vEdit := 'N';
    end;
end;

procedure TfOrdemCompra.BitBtn8Click(Sender: TObject);
begin
  vCodMaterial := 0;
  RxDBLookupCombo8.ClearValue;
  RxDBLookupCombo6.ClearValue;
  Edit1.Clear;
  Edit3.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  DateEdit1.Clear;
  Edit1.SetFocus;
  vItem := 0;
end;

procedure TfOrdemCompra.BitBtn9Click(Sender: TObject);
begin
  if (not DM1.tOrdemCompraItem.IsEmpty) and (DM1.tOrdemCompraItemQtdEntregue.AsFloat <= 0) then
    begin
      if MessageDlg('Deseja realmente excluir este item ?',mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          DM1.tOrdemCompraVlrTotal.AsFloat  := DM1.tOrdemCompraVlrTotal.AsFloat -
                                               DM1.tOrdemCompraItemVlrTotal.AsFloat;
          DM1.tOrdemCompraItemGrade.First;
          while not DM1.tOrdemCompraItemGrade.Eof do
            DM1.tOrdemCompraItemGrade.delete;

          DM1.tCalcMaterial.First;
          while not DM1.tCalcMaterial.Eof do
            DM1.tCalcMaterial.Delete;

          DM1.tOrdemCompraItem.Delete;
        end;
    end
  else
    ShowMessage('Não há registro p/ ser excluído, ou item ja entregue!');
end;

procedure TfOrdemCompra.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      if StrToInt(Edit1.Text) <> vCodMaterial then
        vEdit := 'N';
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsString := Edit1.Text;
      if DM1.tMaterial.GotoKey then
        begin
          RxDBLookupCombo8.KeyValue := DM1.tMaterialCodigo.AsInteger;
          if vEdit <> 'S' then
            begin
              CurrencyEdit2.Value        := DM1.tMaterialPrCusto.AsCurrency;
              CurrencyEdit3.Value        := DM1.tMaterialPrCusto.AsCurrency * CurrencyEdit1.Value;
            end;
          RxDBLookupCombo8.SetFocus;
        end
      else
        begin
          ShowMessage('Material não encontrado, ou inativo!');
          Edit1.Clear;
          Edit1.SetFocus;
        end;
    end;
end;

procedure TfOrdemCompra.CurrencyEdit1Exit(Sender: TObject);
begin
  CurrencyEdit3.Value := CurrencyEdit2.Value * CurrencyEdit1.Value;
end;

procedure TfOrdemCompra.SpeedButton4Click(Sender: TObject);
begin
  if DM1.tUsuarioTransp.AsBoolean then
    begin
      fTransp := TfTransp.Create(Self);
      fTransp.ShowModal;
      DM1.tTransp.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de transportadora!');
end;

procedure TfOrdemCompra.SpeedButton3Click(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
    begin
      RxDBFilter2.Active := False;
      DM1.tMaterial.Refresh;
      fMaterial := TfMaterial.Create(Self);
      fMaterial.ShowModal;
      RxDBFilter2.Active := True;
      DM1.tMaterial.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de Material!');
end;

procedure TfOrdemCompra.tAuxOrdemCompraBeforeInsert(DataSet: TDataSet);
var
 icount : integer;
begin
  i2 := 0;
  icount := fOrdemCompra.tAuxOrdemCompra.RecordCount;
  if icount >= DM1.tGradeItem.RecordCount then
    begin
      fOrdemCompraCor.BitBtn5.SetFocus;
      Abort;
    end;
end;

procedure TfOrdemCompra.Imprimir1Click(Sender: TObject);
var
  NumOrd : integer;
begin
  case RadioGroup1.ItemIndex of
    0 : Imprime_OrdemCompra;
    1 : begin
          NumOrd := DM1.tOrdemCompraCodigo.AsInteger;
          Dm1.tFornecedores.Filtered := False;
          Dm1.tFornecedores.Filter   := 'CodForn = '''+IntToStr(Dm1.tOrdemCompraCodFornecedor.AsInteger)+'''';
          Dm1.tFornecedores.Filtered := True;

          DM1.tOrdemCompra.Filtered  := False;
          DM1.tOrdemCompra.Filter    := 'Codigo = '''+IntToStr(NumOrd)+'''';
          DM1.tOrdemCompra.Filtered  := True;

          fRelOrdemCompraMail := TfRelOrdemCompraMail.Create(Self);
          fRelOrdemCompraMail.RLReport1.Print;
          fRelOrdemCompraMail.RLReport1.Free;

          FreeAndNil(fRelOrdemCompraMail);
          DM1.tOrdemCompra.Filtered  := False;
          Dm1.tFornecedores.Filtered := False;
          DM1.tOrdemCompra.FindKey([1,NumOrd]);
        end;
  end;
end;

procedure TfOrdemCompra.Visualizar1Click(Sender: TObject);
var
  NumOrd : integer;
begin
  NumOrd := DM1.tOrdemCompraCodigo.AsInteger;
  DM1.tOrdemCompra.Filtered := False;
  DM1.tOrdemCompra.Filter   := 'Codigo = '''+IntToStr(NumOrd)+'''';
  DM1.tOrdemCompra.Filtered := True;
  fRelOrdemCompra := tfRelOrdemCompra.Create(Self);
  fRelOrdemCompra.QuickRep1.Preview;
  fRelOrdemCompra.QuickRep1.Free;
  DM1.tOrdemCompra.Filtered := False;
  DM1.tOrdemCompra.FindKey([1,NumOrd]);
end;

procedure TfOrdemCompra.FormShow(Sender: TObject);
begin
  DM1.tOrdemCompra.Open;
  DM1.tOrdemCompraItem.Open;
  DM1.tOrdemCompraItemGrade.Open;
  DM1.tOrdemCompraNota.Open;
  DM1.tFornecedores.Open;
  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tProdutoTam.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tTransp.Open;
  DM1.tCondPgto.Open;
  DM1.tCondPgtoItem.Open;
  DM1.tCor.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tMaterialGradeNum.Open;
  DM1.tCidade.Open;
  DM1.tUF.Open;
  DM1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tPedidoGrade.Open;
  DM1.tCalcMaterial.Open;

  tOrdemCompraIns.open;
  tOrdemCompraItemIns.open;
  tAuxOrdemCompra.open;
  tGradeItem.open;
  DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
  DM1.tOrdemCompra.Refresh;
  DM1.tOrdemCompraItem.Refresh;
  DM1.tOrdemCompraItemGrade.Refresh;
  DM1.tOrdemCompra.Last;
  RxDBFilter1.Active := True;
  RxDBFilter2.Active := True;
  fOrdemCompra.Refresh;
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.PopupMenu1Popup(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : PopupMenu1.Items.Items[1].Enabled := False;
    1 : PopupMenu1.Items.Items[1].Enabled := True;
  end;
end;

procedure TfOrdemCompra.Edit2Change(Sender: TObject);
begin
  try
    DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
    DM1.tOrdemCompra.FindKey([1,Edit2.Text]);
    StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
  except
    ShowMessage('Digite só números aqui!');
  end;
end;

procedure TfOrdemCompra.BitBtn16Click(Sender: TObject);
begin
  if (not DM1.tOrdemCompraItem.IsEmpty) and (DM1.tOrdemCompraItemQtdEntregue.AsFloat <= 0) then
    begin
      if RxDBLookupCombo8.Text = '' then
        begin
          vCodMaterial                     := DM1.tOrdemCompraItemCodMaterial.AsInteger;
          vEdit                            := 'S';
          vItem                            := DM1.tOrdemCompraItemItem.AsInteger;
          Edit1.Text                       := DM1.tOrdemCompraItemCodMaterial.AsString;
          if DM1.tOrdemCompraItemCodMaterial.AsInteger > 0 then
            RxDBLookupCombo8.KeyValue      := DM1.tOrdemCompraItemCodMaterial.AsInteger;
          RxDBLookupCombo6Enter(Sender);
          if DM1.tOrdemCompraItemCodCor.AsInteger > 0 then
            RxDBLookupCombo6.KeyValue      := DM1.tOrdemCompraItemCodCor.AsInteger;
          CurrencyEdit1.Value              := DM1.tOrdemCompraItemQtd.AsFloat;
          Edit3.Text                       := DM1.tOrdemCompraItemUnidade.AsString;
          CurrencyEdit2.Value              := DM1.tOrdemCompraItemVlrUnitario.AsFloat;
          CurrencyEdit4.Value              := DM1.tOrdemCompraItemAliqIPI.AsFloat;
          CUrrencyEdit5.Value              := DM1.tOrdemCompraItemVlrIPI.AsFloat;
          DateEdit1.Date                   := DM1.tOrdemCompraItemDtEntrega.AsDateTime;
          CurrencyEdit3.Value              := DM1.tOrdemCompraItemVlrTotal.AsFloat;
          //DM1.tOrdemCompraVlrTotal.AsFloat := DM1.tOrdemCompraVlrTotal.AsFloat - DM1.tOrdemCompraItemVlrTotal.AsFloat;
          tAuxOrdemCompra.First;
          while not tAuxOrdemCompra.EOF do
            tAuxOrdemCompra.Delete;
          tAuxOrdemCompra.Refresh;
          if DM1.tOrdemCompraItemCodGrade.AsInteger > 0 then
            begin
              DM1.tGrade.IndexFieldNames := 'Codigo';
              DM1.tGrade.FindKey([DM1.tOrdemCompraItemCodGrade.AsInteger]);
            end;
          DM1.tOrdemCompraItemGrade.First;
          while not DM1.tOrdemCompraItemGrade.EOF do
            begin
              tAuxOrdemCompra.Insert;
              tAuxOrdemCompraCodGrade.AsInteger  := DM1.tOrdemCompraItemGradeCodGrade.AsInteger;
              tAuxOrdemCompraPosicao.AsInteger   := DM1.tOrdemCompraItemGradePosicao.AsInteger;
              tAuxOrdemCompraQtd.asFloat         := DM1.tOrdemCompraItemGradeQtd.AsFloat;
              tAuxOrdemCompraVlrUnitario.asFloat := DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat;
              tAuxOrdemCompraVlrTotal.asFloat    := DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat * DM1.tOrdemCompraItemGradeQtd.AsFloat;
              tAuxOrdemCompra.Post;
              DM1.tOrdemCompraItemGrade.Next;
            end;
          if DM1.tOrdemCompraItemGrade.RecordCount <> tAuxOrdemCompra.RecordCount then
            begin
              ShowMessage('Problema na hora de alterar o item');
              BitBtn8Click(Sender);
              DM1.tOrdemCompraItemGrade.Refresh;
            end
          else
            begin
              DM1.tOrdemCompraVlrTotal.AsFloat := DM1.tOrdemCompraVlrTotal.AsFloat - DM1.tOrdemCompraItemVlrTotal.AsFloat;
              DM1.tOrdemCompraItemGrade.First;
              while not DM1.tOrdemCompraItemGrade.EOF do
                DM1.tOrdemCompraItemGrade.Delete;
              DM1.tOrdemCompraItem.Delete;
              Edit1.SetFocus;
            end;
        end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado, ou item ja entregue!');
end;

procedure TfOrdemCompra.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.DBEdit1Change(Sender: TObject);
begin
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.RxDBGrid1DblClick(Sender: TObject);
begin
  if DM1.tOrdemCompra.State in [dsBrowse] then
    begin
      fBaixaItOC := TfBaixaItOC.Create(Self);
      fBaixaItOC.ShowModal;
      StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
    end;
end;

procedure TfOrdemCompra.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not (DM1.tOrdemCompraItemQtdRestante.AsFloat > 0) then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end;
  if (DM1.tOrdemCompraItemQtdRestante.AsFloat > 0) and (DM1.tOrdemCompraItemQtdEntregue.AsFloat > 0) then
    begin
      Background  := clAqua;
      AFont.Color := clBlack;
    end;
  if DM1.tOrdemCompraItemQtdRestante.AsFloat = DM1.tOrdemCompraItemQtd.AsFloat then
    begin
      Background  := clWhite;
      AFont.Color := clBlack;
    end;
end;

procedure TfOrdemCompra.RxDBLookupCombo1Click(Sender: TObject);
begin
  Edit2.Text := RxDBLookupCombo1.Text;
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tOrdemCompra.Refresh;
  DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
  Edit2.Text := RxDBLookupCombo1.Text;
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.RxDBLookupCombo1Exit(Sender: TObject);
begin
  Edit2.Text := RxDBLookupCombo1.Text;
  StaticText11.Visible := DM1.tOrdemCompraEntregue.AsBoolean;
end;

procedure TfOrdemCompra.RxDBLookupCombo2CloseUp(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'CodForn';
  if DM1.tOrdemCompraCodFornecedor.AsInteger <> vCodFornecedor then
    DM1.tOrdemCompraCodCondPgto.AsString := DM1.tFornecedoresCodCondPgto.AsString;
end;

procedure TfOrdemCompra.RxDBLookupCombo2DropDown(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfOrdemCompra.RxDBLookupCombo2Enter(Sender: TObject);
begin
  vCodFornecedor := DM1.tOrdemCompraCodFornecedor.AsInteger;
end;

procedure TfOrdemCompra.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
     if DM1.tCondPgtoPrazoVista.AsString = 'P' then
       GroupBox2.Visible := True
     else
       GroupBox2.Visible := False;
end;

procedure TfOrdemCompra.RxDBLookupCombo3DropDown(Sender: TObject);
begin
  DM1.tCondPgto.IndexFieldNames := 'Nome';
end;

procedure TfOrdemCompra.RxDBLookupCombo3CloseUp(Sender: TObject);
begin
  DM1.tCondPgto.IndexFieldNames := 'Codigo';
end;

procedure TfOrdemCompra.RxDBLookupCombo4CloseUp(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Codigo';
end;

procedure TfOrdemCompra.RxDBLookupCombo4DropDown(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Nome';
end;

procedure TfOrdemCompra.RxDBLookupCombo5Exit(Sender: TObject);
begin
  RxDbLookupCombo6.Enabled := DM1.tMaterialLancaCor.AsBoolean;
  CurrencyEdit1.Enabled     := not (DM1.tMaterialLancaGrade.AsBoolean);
  CurrencyEdit2.Enabled     := not (DM1.tMaterialPrecoGrade.AsBoolean);
  Edit3.Text := DM1.tMaterialUnidade.AsString;
  if  RxDBLookupCombo8.Text <> '' then
    begin
      Edit1.Text := DM1.tMaterialCodigo.AsString;
      if DM1.tMaterialLancaGrade.AsBoolean then
        begin
          fOrdemCompraCor := tfOrdemCompraCor.Create(Self);
          fOrdemCompraCor.ShowModal;
        end
      else
        begin
          if vEdit <> 'S' then
            begin
              CurrencyEdit2.Value := DM1.tMaterialPrCusto.AsCurrency;
              CurrencyEdit3.Value := DM1.tMaterialPrCusto.AsCurrency * CurrencyEdit1.Value;
            end;
        end;
    end;
  if DM1.tMaterialLancaCor.AsBoolean then
     RxDBLookupCombo6.SetFocus
   else
   if DM1.tMaterialLancaGrade.AsBoolean = false then
     CurrencyEdit1.SetFocus
   else
   if DM1.tMaterialPrecoGrade.AsBoolean then
     CurrencyEdit4.SetFocus
   else
     CurrencyEdit2.SetFocus;
end;

procedure TfOrdemCompra.RxDBLookupCombo5Click(Sender: TObject);
begin
  if  RxDBLookupCombo8.Text <> '' then
    begin
      Edit1.Text          := DM1.tMaterialCodigo.AsString;
      Edit3.Text          := DM1.tMaterialUnidade.AsString;
      if vEdit <> 'S' then
        begin
          CurrencyEdit1.Value := 1;
          CurrencyEdit2.Value := DM1.tMaterialPrCusto.AsCurrency;
          CurrencyEdit3.Value := DM1.tMaterialPrCusto.AsCurrency * CurrencyEdit1.Value;
        end;
    end;
end;

procedure TfOrdemCompra.RxDBLookupCombo6Enter(Sender: TObject);
begin
  //Query1.Active := False;
  //Query1.Params[0].AsInteger := RxDBLookupCombo8.KeyValue;
  if RxDBLookupCombo8.Text <> '' then
    begin
      Query1.Active := False;
      Query1.Params[0].AsInteger := RxDBLookupCombo8.KeyValue;
      Query1.Active := True;
    end
  else
    Query1.Active := False;
end;

procedure TfOrdemCompra.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfOrdemCompra.RxDBLookupCombo7Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Referencia';
end;

procedure TfOrdemCompra.RxDBLookupCombo7Exit(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Codigo';
end;

procedure TfOrdemCompra.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioProduto.AsBoolean then
    begin
      fProduto := TfProduto.Create(Self);
      fProduto.ShowModal;
    end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não está autorizado a abrir o formulário de produtos!');
end;

procedure TfOrdemCompra.email1Click(Sender: TObject);
var
  NumOrd : integer;
begin
  NumOrd := DM1.tOrdemCompraCodigo.AsInteger;
  Dm1.tFornecedores.Filtered := False;
  Dm1.tFornecedores.Filter   := 'CodForn = '''+IntToStr(Dm1.tOrdemCompraCodFornecedor.AsInteger)+'''';
  Dm1.tFornecedores.Filtered := True;

  DM1.tOrdemCompra.Filtered  := False;
  DM1.tOrdemCompra.Filter    := 'Codigo = '''+IntToStr(NumOrd)+'''';
  DM1.tOrdemCompra.Filtered  := True;

  vEmail_Fortes         := DM1.tFornecedoresEmail.AsString;
  vEmail_Assunto_Fortes := 'Ordem de Compra Nº ' + DM1.tOrdemCompraCodigo.AsString;
  vEmail_Fortes_Corpo   := 'Em anexo Ordem de Compra' + #13
                         + DM1.tFilialEmpresa.AsString + #13
                         + 'CNPJ:' + DM1.tFilialCNPJ.AsString;

  fRelOrdemCompraMail := TfRelOrdemCompraMail.Create(Self);
  fRelOrdemCompraMail.RLReport1.PreviewModal;
  fRelOrdemCompraMail.RLReport1.Free;

  FreeAndNil(fRelOrdemCompraMail);
  DM1.tOrdemCompra.Filtered  := False;
  Dm1.tFornecedores.Filtered := False;
  DM1.tOrdemCompra.FindKey([1,NumOrd]);
  vEmail_Fortes         := '';
  vEmail_Assunto_Fortes := '';
end;

procedure TfOrdemCompra.RxDBLookupCombo6Exit(Sender: TObject);
begin
  if RxDBLookupCombo8.Text <> '' then
    begin
      if (Dm1.tMaterialPrecoCor.AsBoolean) and (RxDBLookupCombo6.Text <> '') then
        CurrencyEdit2.Value := Query1PrCusto.AsFloat
      else
        CurrencyEdit2.Value := Dm1.tMaterialPrCusto.AsFloat;
    end;
end;

procedure TfOrdemCompra.BitBtn15Click(Sender: TObject);
begin
  fCopiarOC := TfCopiarOC.Create(Self);
  fCopiarOC.ShowModal;
end;

procedure TfOrdemCompra.RxDBLookupCombo8Click(Sender: TObject);
begin
  if  RxDBLookupCombo8.Text <> '' then
    begin
      Edit1.Text          := DM1.tMaterialCodigo.AsString;
      Edit3.Text          := DM1.tMaterialUnidade.AsString;
      if vEdit <> 'S' then
        begin
          CurrencyEdit1.Value := 1;
          CurrencyEdit2.Value := DM1.tMaterialPrCusto.AsCurrency;
          CurrencyEdit3.Value := DM1.tMaterialPrCusto.AsCurrency * CurrencyEdit1.Value;
        end;
    end;
end;

procedure TfOrdemCompra.RxDBLookupCombo8Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfOrdemCompra.RxDBLookupCombo8Exit(Sender: TObject);
begin
  RxDbLookupCombo6.Enabled := DM1.tMaterialLancaCor.AsBoolean;
  CurrencyEdit1.Enabled     := not (DM1.tMaterialLancaGrade.AsBoolean);
  CurrencyEdit2.Enabled     := not (DM1.tMaterialPrecoGrade.AsBoolean);
  Edit3.Text := DM1.tMaterialUnidade.AsString;
  if RxDBLookupCombo8.Text <> '' then
    begin
      Edit1.Text := DM1.tMaterialCodigo.AsString;
      if StrToInt(Edit1.Text) <> vCodMaterial then
        vEdit := 'N';
      if DM1.tMaterialLancaGrade.AsBoolean then
        begin
          fOrdemCompraCor := tfOrdemCompraCor.Create(Self);
          fOrdemCompraCor.ShowModal;
          if RxDBLookupCombo6.Enabled then
            RxDBLookupCombo6.SetFocus
          else
            Edit3.SetFocus;
        end
      else
        begin
          if DM1.tMaterialLancaCor.AsBoolean then
            RxDBLookupCombo6.SetFocus
          else
            CurrencyEdit1.SetFocus;
          if vEdit <> 'S' then
            begin
              CurrencyEdit2.Value := DM1.tMaterialPrCusto.AsCurrency;
              CurrencyEdit3.Value := DM1.tMaterialPrCusto.AsCurrency * CurrencyEdit1.Value;
            end;
        end;
    end;
end;

procedure TfOrdemCompra.BitBtn10Click(Sender: TObject);
begin
  Monta_Lotes;
  fOrdemCompraLote := TfOrdemCompraLote.Create(Self);
  fOrdemCompraLote.ShowModal;
end;

end.
