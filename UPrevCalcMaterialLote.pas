unit UPrevCalcMaterialLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, DBFilter, RXCtrls, Menus, Grids, DBGrids, RXDBCtrl, Variants,
  DBClient, ComCtrls, ShellApi;

type
  TfPrevCalcMaterialLote = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    dsAuxCalcMaterial: TDataSource;
    dsAuxItCalcMaterial: TDataSource;
    RxDBFilter1: TRxDBFilter;
    RxDBFilter2: TRxDBFilter;
    CurrencyEdit3: TCurrencyEdit;
    Edit2: TEdit;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    BitBtn3: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    StaticText1: TStaticText;
    BitBtn4: TBitBtn;
    RxLabel1: TRxLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RxLabel2: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    mVerificaMat: TMemoryTable;
    mVerificaMatPedido: TIntegerField;
    mVerificaMatItem: TIntegerField;
    mVerificaMatCodMat: TIntegerField;
    mVerificaMatCodCor: TIntegerField;
    mVerificaMatLargura: TStringField;
    msVerificaMat: TDataSource;
    mVerificaMatTalao: TIntegerField;
    mVerificaMatLote: TIntegerField;
    BitBtn5: TBitBtn;
    mMaterial: TClientDataSet;
    mMaterialCodMaterial: TIntegerField;
    mMaterialNomeMaterial: TStringField;
    mMaterialQtdTotal: TFloatField;
    dsmMaterial: TDataSource;
    mMaterialGrade: TClientDataSet;
    dsmMaterialGrade: TDataSource;
    mMaterialGradeCodMaterial: TIntegerField;
    mMaterialGradeTamanho: TStringField;
    mMaterialGradeQtd: TFloatField;
    mMaterialLargura: TStringField;
    mMaterialGradeLargura: TStringField;
    ProgressBar1: TProgressBar;
    mMaterialCodProduto: TIntegerField;
    mMaterialReferencia: TStringField;
    mMaterialDescMaterial: TStringField;
    mMaterialGradeCodProduto: TIntegerField;
    mMaterialPedido: TIntegerField;
    mMaterialItemPedido: TIntegerField;
    mMaterialGradeReferencia: TStringField;
    tAuxCalcMaterial: TClientDataSet;
    tAuxCalcMaterialCodMaterial: TIntegerField;
    tAuxCalcMaterialCodCor: TIntegerField;
    tAuxCalcMaterialLargura: TStringField;
    tAuxCalcMaterialUnidade: TStringField;
    tAuxCalcMaterialQtdPares: TFloatField;
    tAuxCalcMaterialConsumo: TFloatField;
    tAuxCalcMaterialMaterial: TStringField;
    tAuxCalcMaterialCodForn: TIntegerField;
    tAuxCalcMaterialNumOC: TIntegerField;
    tAuxCalcMaterialData1: TDateField;
    tAuxCalcMaterialData2: TDateField;
    tAuxCalcMaterialData3: TDateField;
    tAuxCalcMaterialData4: TDateField;
    tAuxCalcMaterialNumLote: TIntegerField;
    tAuxCalcMaterialNumPedido: TIntegerField;
    tAuxCalcMaterialclUnitario: TFloatField;
    tAuxCalcMateriallkUnidade: TStringField;
    tAuxCalcMateriallkCor: TStringField;
    tAuxCalcMateriallkIpi: TFloatField;
    tAuxItCalcMaterial: TClientDataSet;
    tAuxItCalcMaterialCodMaterial: TIntegerField;
    tAuxItCalcMaterialCodCor: TIntegerField;
    tAuxItCalcMaterialLargura: TStringField;
    tAuxItCalcMaterialTamMaterial: TStringField;
    tAuxItCalcMaterialQtdPares: TFloatField;
    tAuxCalcMaterialImpCalcMaterial: TBooleanField;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure tAuxCalcMaterialCalcFields(DataSet: TDataSet);
    procedure tAuxCalcMaterialNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    vTamMaterial : String[3];
    vLargura     : String[1];

    procedure Controle_Material;
    procedure Controle_Material_Exp;
    procedure Monta_Auxiliar;
    procedure Monta_Auxiliar_Exp;
    procedure Imp_Lote;
    //procedure Gera_OC;
    //procedure Verifica_Pr;
    //procedure Insere_OC;
    //procedure GravaItens_OC;
    procedure Imprimir_Mapa;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;

    procedure Grava_mMaterial;
    procedure Grava_mMaterialGrade(Qtd : Integer);

  public
    { Public declarations }
  end;

var
  fPrevCalcMaterialLote: TfPrevCalcMaterialLote;
  vLancamento, linha, pagina, vQtdPares, vQtdTotal, TotalPr : Integer;
  F: TextFile;
  vPreco : Real;
  vGerar: Boolean;
  texto, NLotes : String;

implementation

uses UDM1, UEscImpressora, UConsLoteExp, UDM2, UConsLote,
  URelTalaoAuxiliar, uIntegracao;

{$R *.DFM}

procedure TfPrevCalcMaterialLote.Grava_mMaterialGrade(Qtd : Integer);
begin
  if mMaterialGrade.Locate('Referencia;CodMaterial;Largura;Tamanho',VarArrayOf([DM1.tPedidoItemlkReferencia.AsString,tAuxCalcMaterialCodMaterial.AsInteger,vLargura,vTamMaterial]),[locaseinsensitive]) then
    mMaterialGrade.Edit
  else
    begin
      mMaterialGrade.Insert;
      mMaterialGradeCodMaterial.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
      mMaterialGradeLargura.AsString      := vLargura;
      mMaterialGradeTamanho.AsString      := vTamMaterial;
      mMaterialGradeReferencia.AsString   := DM1.tPedidoItemlkReferencia.AsString;
    end;
  mMaterialGradeQtd.AsInteger := mMaterialGradeQtd.AsInteger + Qtd;
  mMaterialGrade.Post;

  mMaterial.Edit;
  mMaterialQtdTotal.AsInteger := mMaterialQtdTotal.AsInteger + Qtd;
  mMaterial.Post;
end;

procedure TfPrevCalcMaterialLote.Grava_mMaterial;
begin
  //os campos Pedido e ItemPedido foram incluidos para controlar a soma do
  //total de pares, ele vai sempre verificar se o pedido já foi somado no total
  //if mMaterial.Locate('CodProduto;CodMaterial;Largura',VarArrayOf([DM1.tPedidoItemCodProduto.AsInteger,tAuxCalcMaterialCodMaterial.AsInteger,vLargura]),[locaseinsensitive]) then
  if mMaterial.Locate('Referencia;CodMaterial;Largura',VarArrayOf([DM1.tPedidoItemlkReferencia.AsString,tAuxCalcMaterialCodMaterial.AsInteger,vLargura]),[locaseinsensitive]) then
    mMaterial.Edit
  else
    begin
      mMaterial.Insert;
      mMaterialCodProduto.AsInteger  := DM1.tPedidoItemCodProduto.AsInteger;
      mMaterialCodMaterial.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
      mMaterialLargura.AsString      := vLargura;
      mMaterialNomeMaterial.AsString := DM1.tMaterialNome.AsString;
      mMaterialReferencia.AsString   := DM1.tPedidoItemlkReferencia.AsString;
      mMaterialDescMaterial.AsString := DM1.tPedidoItemlkDescMaterial.AsString;
    end;
  {if (mMaterialPedido.AsInteger <> DM1.tPedidoItemPedido.AsInteger) or
     (mMaterialItemPedido.AsInteger <> DM1.tPedidoItemItem.AsInteger) then
    begin
      if RadioGroup2.ItemIndex = 0 then
        mMaterialQtdTotal.AsInteger    := mMaterialQtdTotal.AsInteger + DM1.tTalaoQtdPar.AsInteger
      else
        mMaterialQtdTotal.AsInteger    := mMaterialQtdTotal.AsInteger + DM1.tPedidoItemQtdPares.AsInteger;
    end;}
  mMaterialPedido.AsInteger     := DM1.tPedidoItemPedido.AsInteger;
  mMaterialItemPedido.AsInteger := DM1.tPedidoItemItem.AsInteger;
  mMaterial.Post;
  
  {if mMaterial.Locate('CodProduto;CodMaterial;Largura',VarArrayOf([DM1.tPedidoItemCodProduto.AsInteger,tAuxCalcMaterialCodMaterial.AsInteger,vLargura]),[locaseinsensitive]) then
    mMaterial.Edit
  else
    begin
      mMaterial.Insert;
      mMaterialCodProduto.AsInteger  := DM1.tPedidoItemCodProduto.AsInteger;
      mMaterialCodMaterial.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
      mMaterialLargura.AsString      := vLargura;
      mMaterialNomeMaterial.AsString := DM1.tMaterialNome.AsString;
      mMaterialReferencia.AsString   := DM1.tPedidoItemlkReferencia.AsString;
      mMaterialDescMaterial.AsString := DM1.tPedidoItemlkDescMaterial.AsString;
      mMaterialQtdTotal.AsInteger    := DM1.tPedidoItemQtdParesRest.AsInteger;
      mMaterial.Post;
    end;}
  //mMaterialQtdTotal.AsFloat := mMaterialQtdTotal.AsFloat + tAuxCalcMaterialConsumo.AsFloat;
end;

procedure TfPrevCalcMaterialLote.Imprimir_Mapa;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);

  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);

  tAuxCalcMaterial.IndexFieldNames := 'Material';
  tAuxCalcMaterial.Filtered := False;
  if CheckBox1.Checked then
  begin
    tAuxCalcMaterial.Filter   := 'ImpCalcMaterial = True';
    tAuxCalcMaterial.Filtered := True;
  end;
  //tAuxCalcMaterial.Refresh;
  tAuxCalcMaterial.First;
  while not tAuxCalcMaterial.EOF do
    begin
      if linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      tAuxCalcMaterial.Next;
    end;
  Imprime_Rodape;
  if RadioGroup2.ItemIndex = 0 then
    begin
      DM1.tLote.First;
      while not DM1.tLote.Eof do
        begin
          DM1.tLote.Edit;
          DM1.tLoteImpCalcMaterial.AsBoolean := True;
          DM1.tLote.Post;
          Prc_Gravar_Lote_FB(DM1.tLoteLote.AsInteger);

          DM1.tLote.Next;
        end;
    end
  else
  if RadioGroup2.ItemIndex = 1 then
    begin
      DM1.tLoteMI.First;
      while not DM1.tLoteMI.Eof do
        begin
          DM1.tLoteMI.Edit;
          DM1.tLoteMIImpCalcMaterial.AsBoolean := True;
          DM1.tLoteMI.Post;
          DM1.tLoteMI.Next;
        end;
    end;

  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
  tAuxCalcMaterial.Filtered := False;
end;

procedure TfPrevCalcMaterialLote.Imprime_Cabecalho;
var
 i : Integer;
 texto1, texto2 : String;
 vMercado : String[1];
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

  texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 116 - Length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Pag.: ' + IntToStr(Pagina);
  Writeln(F,Texto1);

  texto1 := '                                                CALCULO DOS MATERIAS POR LOTE                                   Data: ';
  texto1 := texto1 + DateToStr(Date);
  Writeln(F,Texto1);

  texto1 := 'LOTE No..: ' ;
  texto2 := NLotes;
  Case RadioGroup2.ItemIndex of
    0: vMercado := 'E';
    1: vMercado := 'I';
  end;
  texto1 := texto1 + texto2 + ' / ' +vMercado;
  Writeln(F,Texto1);

  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  //Writeln(F,'Material                             Cor             Un. C.Unitario      C.Total O.Compra   Data1      Data2     Data3      Data4');
  Writeln(F,'Material                             Cor             Un. C.Unitario      C.Total          Consumo REAL       Consumo CONSERTOS   ');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  linha := 6;
end;

procedure TfPrevCalcMaterialLote.Imprime_Detalhe;
var
  texto1, texto2, texto3, texto5 : String;
  i : Integer;
begin
  texto2 := copy(tAuxCalcMaterialMaterial.AsString,1,36);
  for i := 1 to 36 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto2 + ' ';
  texto2 := tAuxCalcMateriallkCor.AsString;
  for i := 1 to 15 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := tAuxCalcMaterialUnidade.AsString;
  for i := 1 to 3 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('###0.00000',tAuxCalcMaterialclUnitario.AsFloat);
  for i := 1 to 10 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';
  texto2 := FormatFloat('##,##0.00000',tAuxCalcMaterialConsumo.AsFloat);
  for i := 1 to 12 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '  ';
  writeln(F,Texto1);
  linha := linha + 1;

  if tAuxItCalcMaterial.RecordCount > 0  then
    begin
      if tAuxCalcMaterialLargura.AsString <> '' then
        begin
          texto2 := tAuxCalcMaterialLargura.AsString;
          texto2 := '   Larg: ' + texto2 +  '     Tam: ';
        end
      else
        texto2 := '               Tam: ';
      texto3 := '               Qtd: ';
      tAuxItCalcMaterial.First;
      while not tAuxItCalcMaterial.EOF do
        begin
          if tAuxItCalcMaterialQtdPares.AsInteger > 0 then
            begin
              texto5 := tAuxItCalcMaterialTamMaterial.AsString;
              for i := 1 to 4 - length(texto5) do
                texto5 := ' ' + texto5;
              texto2 := texto2 + texto5 + '  ';
//              if tAuxItCalcMaterialTamMaterial.AsString <> '' then {Adicionei esse if para mostrar somente os q tem qtd cadastro}
              texto5 := tAuxItCalcMaterialQtdPares.AsString;
//                texto5 := FloatToStr(tAuxItCalcMaterialQtdPares.AsFloat * tAuxCalcMaterialclUnitario.AsFloat);
              for i := 1 to 4 - length(tAuxItCalcMaterialQtdPares.AsString) do
                texto5 := ' ' + texto5;
              texto3 := texto3 + texto5 + '  ';
            end;
          tAuxItCalcMaterial.Next
        end;
      writeln(F, texto2);
      writeln(F, texto3);
      linha := linha + 2;
    end;
end;

procedure TfPrevCalcMaterialLote.Imprime_Rodape;
var
  texto1 : String;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  texto1 := 'Total de Pares: ' + IntToStr(vQtdPares);
  Writeln(F,Texto1);
  Linha := Linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

{procedure TfPrevCalcMaterialLote.Insere_OC;
begin
  DM1.tOrdemCompra2.Refresh;
  DM1.tOrdemCompra2.Last;
  DM1.tOrdemCompra.Insert;
  DM1.tOrdemCompraCodigo.AsInteger          := DM1.tOrdemCompra2Codigo.AsInteger + 1;
  DM1.tOrdemCompraCodFornecedor.AsInteger   := tAuxCalcMaterialCodForn.AsInteger;
  DM1.tOrdemCompraDtEmissao.AsDateTime      := Date;
  DM1.tOrdemCompraEntregue.AsBoolean        := False;
  DM1.tOrdemCompra.Post;
  DM1.tOrdemCompra.Edit;
end;}

{procedure TfPrevCalcMaterialLote.GravaItens_OC;
begin
  DM1.tOrdemCompraItem.Refresh;
  DM1.tOrdemCompraItem2.Refresh;
  DM1.tOrdemCompraItem2.Last;
  DM1.tOrdemCompraItem.Insert;
  DM1.tOrdemCompraItemCodigo.AsInteger      := DM1.tOrdemCompraCodigo.AsInteger;
  DM1.tOrdemCompraItemItem.AsInteger        := DM1.tOrdemCompraItem2Item.AsInteger + 1;
  DM1.tOrdemCompraItemCodMaterial.AsInteger := tAuxCalcMaterialCodMaterial.AsInteger;
  DM1.tOrdemCompraItemCodCor.AsInteger      := tAuxCalcMaterialCodCor.AsInteger;
  DM1.tOrdemCompraItemQtd.AsFloat           := tAuxCalcMaterialConsumo.AsFloat;
  DM1.tOrdemCompraItemQtdRestante.AsFloat   := tAuxCalcMaterialConsumo.AsFloat;
  DM1.tOrdemCompraItemQtdEntregue.AsFloat   := 0;
  DM1.tOrdemCompraItemUnidade.AsString      := tAuxCalcMateriallkUnidade.AsString;
  DM1.tOrdemCompraItemCodGrade.AsInteger    := tAuxCalcMaterialGrade.AsInteger;
  if tAuxCalcMaterialGrade.AsInteger > 0 then
    begin
      tAuxItCalcMaterial.First;
      while not tAuxItCalcMaterial.Eof do
        begin
          DM1.tOrdemCompraItemGrade.Insert;
          DM1.tOrdemCompraItemGradeCodigo.AsInteger    := DM1.tOrdemCompraCodigo.AsInteger;
          DM1.tOrdemCompraItemGradeItem.AsInteger      := DM1.tOrdemCompraItemItem.AsInteger;
          DM1.tOrdemCompraItemGradeCodGrade.AsInteger  := tAuxItCalcMaterialGrade.AsInteger;
          DM1.tOrdemCompraItemGradePosicao.AsInteger   := tAuxItCalcMaterialPosicao.AsInteger;
          DM1.tOrdemCompraItemGradeQtd.AsFloat         := tAuxItCalcMaterialQtdPares.AsFloat;
          DM1.tOrdemCompraItemGradeQtdRestante.AsFloat := tAuxItCalcMaterialQtdPares.AsFloat;
          DM1.tOrdemCompraItemGradeQtdEntregue.AsFloat := 0;
          DM1.tOrdemCompraItemGrade.Post;
          tAuxItCalcMaterial.Next;
        end;
    end;
  Verifica_Pr;
  DM1.tOrdemCompraItemAliqIPI.AsFloat     := tAuxCalcMateriallkIpi.AsFloat;
  DM1.tOrdemCompraItemVlrIPI.AsFloat      := (vPreco * DM1.tOrdemCompraItemAliqIPI.AsFloat) / 100;
  DM1.tOrdemCompraItemVlrUnitario.AsFloat := vPreco + DM1.tOrdemCompraItemVlrIPI.AsFloat;
  DM1.tOrdemCompraItemVlrTotal.AsFloat    := DM1.tOrdemCompraItemQtd.AsFloat * DM1.tOrdemCompraItemVlrUnitario.AsFloat;
  DM1.tOrdemCompraItem.Post;
  DM1.tOrdemCompraVlrTotal.AsFloat        := DM1.tOrdemCompraVlrTotal.AsFloat + DM1.tOrdemCompraItemVlrTotal.AsFloat;
end;}

{procedure TfPrevCalcMaterialLote.Verifica_Pr;
begin
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  DM1.tMaterial.FindKey([tAuxCalcMaterialCodMaterial.AsInteger]);
  if DM1.tMaterialPrecoCor.AsBoolean then
    begin
      if DM1.tMaterialCor.Locate('CodMaterial;CodCor',VarArrayOf([tAuxCalcMaterialCodMaterial.AsInteger,tAuxCalcMaterialCodCor.AsInteger]),[locaseinsensitive]) then
        vPreco := DM1.tMaterialCorPrCusto.AsFloat
      else
        vPreco := DM1.tMaterialPrCusto.AsFloat;
    end
  else
    vPreco := DM1.tMaterialPrCusto.AsFloat;
end;}

procedure TfPrevCalcMaterialLote.Controle_Material;
begin
  DM1.tLotePedidoMI.First;
  while not DM1.tLotePedidoMI.EOF do
    begin
      DM1.tPedido.IndexFieldNames := 'Pedido';
      DM1.tPedido.SetKey;
      DM1.tPedidoPedido.AsInteger := DM1.tLotePedidoMIPedido.AsInteger;
      if DM1.tPedido.GotoKey then
        begin
          DM1.tPedidoItem.First;
          while not DM1.tPedidoItem.EOF do
            begin
              if (DM1.tPedidoItemCancelado.AsBoolean <> True) and (DM1.tPedidoItemReposicao.AsBoolean <> True) then
                begin
                  DM1.tPedidoMaterial.First;
                  while not DM1.tPedidoMaterial.EOF do
                    begin
                      if DM1.tPedidoMateriallkCalcMaterial.AsBoolean then
                        Monta_Auxiliar;
                      DM1.tPedidoMaterial.Next;
                    end;
                end;
              DM1.tPedidoItem.Next;
            end;
        end;
      DM1.tLotePedidoMI.Next;
    end;
end;

procedure TfPrevCalcMaterialLote.Controle_Material_Exp;
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  DM1.tPedido.SetKey;
  DM1.tPedidoPedido.AsInteger := DM1.tLoteNroPedido.AsInteger;
  if DM1.tPedido.GotoKey then
    begin
      DM1.tTalao.First;
      while not DM1.tTalao.Eof do
        begin
          DM1.tPedidoItem.Filtered := False;
          DM1.tPedidoItem.Filter   := 'Pedido = '''+DM1.tLoteNroPedido.AsString+''' and Item = '''+DM1.tLoteItemPed.AsString+'''';
          DM1.tPedidoItem.Filtered := True;
          DM1.tPedidoItem.First;
          while not DM1.tPedidoItem.Eof do
            begin
              DM1.tPedidoMaterial.First;
              while not DM1.tPedidoMaterial.Eof do
                begin
                  if (DM1.tPedidoMateriallkCalcMaterial.AsBoolean) and (DM1.tPedidoMaterialConsumoPr.AsFloat > 0) then
                    Monta_Auxiliar_Exp;
                  DM1.tPedidoMaterial.Next;
                end;
              DM1.tPedidoItem.Next;
            end;
          DM1.tTalao.Next;
        end;
      DM1.tPedidoItem.Filtered := False;
    end;
end;

procedure TfPrevCalcMaterialLote.Imp_Lote;
var
  vGerado : Boolean;
begin
  NLotes  := '';
  TotalPr := 0;
  if RadioGroup2.ItemIndex = 0 then
    begin
      vGerar                := True;
      vGerado               := False;
      vQtdPares             := 0;
      DM1.tLote.Filtered    := False;
      DM1.tLote.Filter      := 'Lote >= '''+CurrencyEdit3.Text+''' and Lote <= '''+CurrencyEdit1.Text+'''';
      DM1.tLote.Filtered    := True;

      ProgressBar1.Max      := DM1.tLote.RecordCount;
      ProgressBar1.Position := 0;

      DM1.tLote.First;
      if vGerado = False then
        begin
          while not DM1.tLote.EOF do
            begin
              ProgressBar1.Position := ProgressBar1.Position + 1;
              if vGerar = True then
                begin
                  Controle_Material_Exp;
                  vQtdPares := vQtdPares + DM1.tLoteQtdPares.AsInteger;
                  TotalPr   := TotalPr + DM1.tLoteQtdPares.AsInteger;
                  if Nlotes = '' then
                    NLotes   := DM1.tLoteLote.AsString
                  else
                    NLotes   := NLotes + ', ' + DM1.tLoteLote.AsString;
                end;
              DM1.tLote.Next;
            end;
        end;
    end
  else
    begin
      vQtdPares             := 0;
      DM1.tLoteMI.Filtered  := False;
      DM1.tLoteMI.Filter    := 'Lote >= '''+CurrencyEdit3.Text+''' and Lote <= '''+CurrencyEdit1.Text+'''';
      DM1.tLoteMI.Filtered  := True;
      
      ProgressBar1.Max      := DM1.tLoteMI.RecordCount;
      ProgressBar1.Position := 0;

      DM1.tLoteMI.First;
      while not DM1.tLoteMI.EOF do
        begin
          ProgressBar1.Position := ProgressBar1.Position + 1;

          vGerar := True;
          if vGerar = True then
            begin
              Controle_Material;
              vQtdPares := vQtdPares + DM1.tLoteMIQtdPares.AsInteger;
              TotalPr   := TotalPr + DM1.tLoteMIQtdPares.AsInteger;
              if Nlotes = '' then
                NLotes   := DM1.tLoteMILote.AsString
              else
                NLotes   := NLotes + ', ' + DM1.tLoteMILote.AsString;
            end;
          DM1.tLoteMI.Next;
        end;
    end;
end;

{procedure TfPrevCalcMaterialLote.Gera_OC;
var
  vCodForn : Integer;
begin
  vCodForn := 0;
  tAuxCalcMaterial.IndexFieldNames := 'CodForn';
  tAuxCalcMaterial.First;
  while not tAuxCalcMaterial.Eof do
    begin
      if tAuxCalcMaterialNumOC.AsInteger < 1 then
        begin
          if (vCodForn = 0) or (vCodForn <> tAuxCalcMaterialCodForn.AsInteger) then
            Insere_OC;
          GravaItens_OC;
          tAuxCalcMaterial.Edit;
          tAuxCalcMaterialNumOC.AsInteger := DM1.tOrdemCompraCodigo.AsInteger;
          tAuxCalcMaterial.Post;
          vCodForn := tAuxCalcMaterialCodForn.AsInteger;
        end;
      tAuxCalcMaterial.Next;
    end;
  if DM1.tOrdemCompra.State in [dsEdit,dsInsert] then
    DM1.tOrdemCompra.Post;
end;}

procedure TfPrevCalcMaterialLote.Monta_Auxiliar;
begin
  vTamMaterial := '';
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  DM1.tMaterial.FindKey([DM1.tPedidoMaterialCodMaterial.AsInteger]);
//  tAuxCalcMaterial.Refresh;
  tAuxCalcMaterial.SetKey;
  tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
  tAuxCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
  if DM1.tMaterialCodGrade.AsInteger > 0 then
    vLargura := DM1.tPedidoItemlkLargura.AsString
  else
    vlargura := '';
  tAuxCalcMaterialLargura.AsString := vLargura;
  if tAuxCalcMaterial.GotoKey then
    tAuxCalcMaterial.Edit
  else
    begin
      tAuxCalcMaterial.Insert;
      tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      tAuxCalcMaterialMaterial.AsString     := DM1.tPedidoMateriallkNomeMaterial.AsString;
      tAuxCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
      tAuxCalcMaterialLargura.AsString      := vLargura;
      tAuxCalcMaterialUnidade.AsString      := DM1.tPedidoMateriallkUnidade.AsString;
      tAuxCalcMaterialCodForn.AsInteger     := DM1.tMaterialFornecedor.AsInteger;
      tAuxCalcMaterialImpCalcMaterial.AsBoolean := DM1.tMaterialImpCalcMaterial.AsBoolean;
    end;
  tAuxCalcMaterialConsumo.AsFloat  := tAuxCalcMaterialConsumo.AsFloat + (DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
  if DM1.tMaterialImpTalaoAuxiliar.AsBoolean then
    Grava_mMaterial;

  if (DM1.tMaterialCodGrade.AsInteger > 0) or (DM1.tMaterialImpTalaoAuxiliar.AsBoolean) then
    begin     // Verifica se material tem grade
      DM1.tPedidoGrade.First;
      while not DM1.tPedidoGrade.EOF do
        begin
          if DM1.tPedidoGradeQtd.AsInteger > 0 then
            begin     //  Produto com grade
              if DM1.tMaterialCodGrade.AsInteger > 0 then
                begin
                  DM1.tMaterialGradeNum.SetKey;
                  DM1.tMaterialGradeNumCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                  DM1.tMaterialGradeNumCodGrade.AsInteger    := DM1.tPedidoGradeCodGrade.AsInteger;
                  DM1.tMaterialGradeNumPosicao.AsInteger     := DM1.tPedidoGradePosicao.AsInteger;
                  if not DM1.tMaterialGradeNum.GotoKey then
                    vTamMaterial := DM1.tPedidoGradelkTamanho.AsString
                  else
                    vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString;

                  tAuxItCalcMaterial.SetKey;
                  tAuxItCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                  tAuxItCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                  tAuxItCalcMaterialLargura.AsString      := vLargura;
                  tAuxItCalcMaterialTamMaterial.AsString  := vTamMaterial;
                  if tAuxItCalcMaterial.GotoKey then
                    tAuxItCalcMaterial.Edit
                  else
                    begin     // Não encontra material na posição da grade e insere
                      tAuxItCalcMaterial.Insert;
                      tAuxItCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                      tAuxItCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                      tAuxItCalcMaterialLargura.AsString      := vLargura;
                      tAuxItCalcMaterialTamMaterial.AsString  := vTamMaterial;
                    end;
                  tAuxItCalcMaterialQtdPares.AsInteger    := tAuxItCalcMaterialQtdPares.AsInteger +
                                                             DM1.tPedidoGradeQtd.AsInteger;
                  tAuxItCalcMaterial.Post;
                end;
              if DM1.tMaterialImpTalaoAuxiliar.AsBoolean then
                begin
                  if DM1.tMaterialCodGrade.AsInteger < 1 then
                    vTamMaterial := DM1.tPedidoGradelkTamanho.AsString;
                  Grava_mMaterialGrade(DM1.tPedidoGradeQtd.AsInteger);
                end;

            end;
          DM1.tPedidoGrade.Next
        end;
    end;

  if not mVerificaMat.Locate('Pedido;Item;CodMat;CodCor;Largura',VarArrayOf([DM1.tPedidoPedido.AsInteger,DM1.tPedidoItemItem.AsInteger,DM1.tPedidoMaterialCodMaterial.AsInteger,DM1.tPedidoMaterialCodCor.AsInteger,vLargura]),[locaseinsensitive]) then
    begin
      tAuxCalcMaterialQtdPares.AsFloat := tAuxCalcMaterialQtdPares.AsFloat + DM1.tPedidoItemQtdPares.AsFloat;
      tAuxCalcMaterial.Post;

      mVerificaMat.Insert;
      mVerificaMatPedido.AsInteger := DM1.tPedidoPedido.AsInteger;
      mVerificaMatItem.AsInteger   := DM1.tPedidoItemItem.AsInteger;
      mVerificaMatCodMat.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      mVerificaMatCodCor.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
      mVerificaMatLargura.AsString := vLargura;
      mVerificaMat.Post;
    end;
end;

procedure TfPrevCalcMaterialLote.Monta_Auxiliar_Exp;
begin
  vTamMaterial := '';
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  DM1.tMaterial.FindKey([DM1.tPedidoMaterialCodMaterial.AsInteger]);

  {tAuxCalcMaterial.SetKey;
  tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
  tAuxCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;}
  if DM1.tMaterialCodGrade.AsInteger > 0 then
    vLargura := DM1.tPedidoItemlkLargura.AsString
  else
    vLargura := '';
  //tAuxCalcMaterialLargura.AsString := vLargura;
  if tAuxCalcMaterial.FindKey([DM1.tPedidoMaterialCodMaterial.AsInteger,DM1.tPedidoMaterialCodCor.AsInteger,vLargura]) then
  //if tAuxCalcMaterial.GotoKey then
    tAuxCalcMaterial.Edit
  else
    begin
      tAuxCalcMaterial.Insert;
      tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      tAuxCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
      tAuxCalcMaterialLargura.AsString      := vLargura;
      tAuxCalcMaterialMaterial.AsString     := DM1.tPedidoMateriallkNomeMaterial.AsString;
      tAuxCalcMaterialUnidade.AsString      := DM1.tPedidoMateriallkUnidade.AsString;
      tAuxCalcMaterialCodForn.AsInteger     := DM1.tMaterialFornecedor.AsInteger;
      tAuxCalcMaterialImpCalcMaterial.AsBoolean := DM1.tMaterialImpCalcMaterial.AsBoolean;
    end;
  tAuxCalcMaterialConsumo.AsFloat  := tAuxCalcMaterialConsumo.AsFloat + (DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tTalaoQtdPar.AsInteger);

  if DM1.tMaterialImpTalaoAuxiliar.AsBoolean then
    Grava_mMaterial;

  if (DM1.tMaterialCodGrade.AsInteger > 0) or (DM1.tMaterialImpTalaoAuxiliar.AsBoolean) then
    begin     // Verifica se material tem grade
      DM1.tTalaoGrade.First;
      while not DM1.tTalaoGrade.EOF do
        begin
          if DM1.tTalaoGradeQtdPar.AsInteger > 0 then
            begin     //  Produto com grade
              if DM1.tMaterialCodGrade.AsInteger > 0 then
                begin
                  DM1.tMaterialGradeNum.SetKey;
                  DM1.tMaterialGradeNumCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                  DM1.tMaterialGradeNumCodGrade.AsInteger    := DM1.tTalaoGradeCodGrade.AsInteger;
                  DM1.tMaterialGradeNumPosicao.AsInteger     := DM1.tTalaoGradePosicao.AsInteger;
                  if not DM1.tMaterialGradeNum.GotoKey then
                    vTamMaterial := DM1.tTalaoGradelkTamanho.AsString
                  else
                    vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString;
                  tAuxItCalcMaterial.SetKey;
                  tAuxItCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                  tAuxItCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                  tAuxItCalcMaterialLargura.AsString      := vLargura;
                  tAuxItCalcMaterialTamMaterial.AsString  := vTamMaterial;
                  if tAuxItCalcMaterial.GotoKey then
                    tAuxItCalcMaterial.Edit
                  else
                    begin     // Não encontra material na posição da grade e insere
                      tAuxItCalcMaterial.Insert;
                      tAuxItCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                      tAuxItCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                      tAuxItCalcMaterialLargura.AsString      := vLargura;
                      tAuxItCalcMaterialTamMaterial.AsString  := vTamMaterial;
                    end;
                  tAuxItCalcMaterialQtdPares.AsInteger    := tAuxItCalcMaterialQtdPares.AsInteger +
                                                             DM1.tTalaoGradeQtdPar.AsInteger;
                  tAuxItCalcMaterial.Post;
                end;

              if DM1.tMaterialImpTalaoAuxiliar.AsBoolean then
                begin
                  if DM1.tMaterialCodGrade.AsInteger < 1 then
                    vTamMaterial := DM1.tTalaoGradelkTamanho.AsString;
                  Grava_mMaterialGrade(DM1.tTalaoGradeQtdPar.AsInteger);
                end;

            end;
          DM1.tTalaoGrade.Next
        end;
    end;

  if not mVerificaMat.Locate('Pedido;Item;CodMat;CodCor;Talao;Lote;Largura',VarArrayOf([DM1.tPedidoPedido.AsInteger,DM1.tPedidoItemItem.AsInteger,DM1.tPedidoMaterialCodMaterial.AsInteger,DM1.tPedidoMaterialCodCor.AsInteger,DM1.tTalaoItem.AsInteger,DM1.tTalaoLote.AsInteger,vLargura]),[locaseinsensitive]) then
    begin
      tAuxCalcMaterialQtdPares.AsFloat := tAuxCalcMaterialQtdPares.AsFloat + DM1.tTalaoQtdPar.AsFloat;
      tAuxCalcMaterial.Post;
      mVerificaMat.Insert;
      mVerificaMatPedido.AsInteger := DM1.tPedidoPedido.AsInteger;
      mVerificaMatItem.AsInteger   := DM1.tPedidoItemItem.AsInteger;
      mVerificaMatCodMat.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      mVerificaMatCodCor.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
      mVerificaMatTalao.AsInteger  := DM1.tTalaoItem.AsInteger;
      mVerificaMatLote.AsInteger   := DM1.tTalaoLote.AsInteger;
      mVerificaMatLargura.AsString := vLargura;
      mVerificaMat.Post;
    end;
end;

procedure TfPrevCalcMaterialLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
  DM1.tLote.Filtered := False;
  DM1.tLoteMI.Filtered := False;
  if Screen.FormCount < 3 then
    begin
      Dm1.tLote.Close;
      Dm1.tLoteMI.Close;
      Dm1.tLotePedidoMI.Close;
      DM1.tTalao.Close;
      DM1.tTalaoGrade.Close;
      DM1.tTalaoMI.Close;
      DM1.tTalaoGradeMI.Close;
      Dm1.tPedido.Close;
      Dm1.tPedidoItem.Close;
      Dm1.tPedidoMaterial.Close;
      Dm1.tPedidoGrade.Close;
      Dm1.tMaterial.Close;
      Dm1.tMaterialGradeNum.Close;
      DM1.tCor.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      DM1.tFornecedores.Close;
      DM1.tFornecedores2.Close;
      DM1.tProduto.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevCalcMaterialLote.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevCalcMaterialLote.Visualizar1Click(Sender: TObject);
begin
  if tAuxCalcMaterial.RecordCount < 1 then
    begin
      ShowMessage('Não foi gerado o auxiliar');
      BitBtn3.SetFocus;
    end
  else
    begin
      {Case RadioGroup1.ItemIndex of
        0 : begin
              fRelCalcMaterial := TfRelCalcMaterial.Create(Self);
              fRelCalcMaterial.QuickRep1.Preview;
              fRelCalcMaterial.QuickRep1.Free;
            end;
        1 : begin
              fRelCalcMaterial := TfRelCalcMaterial.Create(Self);
              fRelCalcMaterial.QuickRep2.Preview;
              fRelCalcMaterial.QuickRep2.Free;
            end;
      end;}
      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevCalcMaterialLote.Imprimir1Click(Sender: TObject);
begin
  if tAuxCalcMaterial.RecordCount < 1 then
    begin
      ShowMessage('Não foi gerado o auxiliar');
      BitBtn3.SetFocus;
    end
  else
    begin
      if RadioGroup1.ItemIndex = 0 then
        Imprimir_Mapa
      else
        begin
        {begin
              fRelCalcMaterial := TfRelCalcMaterial.Create(Self);
              fRelCalcMaterial.QuickRep1.Print;
              fRelCalcMaterial.QuickRep1.Free;
            end;
        begin
              fRelCalcMaterial := TfRelCalcMaterial.Create(Self);
              fRelCalcMaterial.QuickRep2.Print;
              fRelCalcMaterial.QuickRep2.Free;
            end;}
        end;
      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevCalcMaterialLote.BitBtn2Click(Sender: TObject);
begin
//*** Este botao gera as Ordens de Compras
//*** Foi desativado, porque o sistema junta os materiais por largura e a ordem de compra
//*** e por grade. (Cleomar 27/04/2003)

{  Screen.Cursor := crHourglass;
  if tAuxCalcMaterial.RecordCount < 1 then
    begin
      ShowMessage('Não foi gerado o auxiliar');
      BitBtn3.SetFocus;
    end
  else
    begin
      Gera_OC;
      Screen.Cursor := crDefault;
      if MessageDlg('Deseja imprimir o Cálculo de Material?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        begin
          tAuxCalcMaterial.IndexFieldNames := 'Material';
          {fRelCalcMaterial := TfRelCalcMaterial.Create(Self);
          fRelCalcMaterial.QuickRep1.Preview;
          fRelCalcMaterial.QuickRep1.Free;}
          {tAuxCalcMaterial.IndexFieldNames := 'CodMaterial;CodCor;Largura;Grade';
        end;
    end;
  Screen.Cursor := crDefault;}
end;

procedure TfPrevCalcMaterialLote.BitBtn3Click(Sender: TObject);
var
  vMercado : String[1];
  i : Integer;
  vLoteMapaIni, vLoteMapaFin : Integer;
begin
  mVerificaMat.EmptyTable;
  mMaterial.First;
  while not mMaterial.Eof do
    begin
      mMaterialGrade.First;
      while not mMaterialGrade.Eof do
        mMaterialGrade.Delete;
      mMaterial.Delete;
    end;

  RxDBGrid1.DataSource := Nil;
  Case RadioGroup2.ItemIndex of
    0: vMercado := 'E';
    1: vMercado := 'I';
  end;
  vLancamento := 0;
  if CurrencyEdit3.AsInteger > 0 then
    begin
      Screen.Cursor := crHourglass;
      tAuxCalcMaterial.IndexFieldNames := 'CodMaterial;CodCor;Largura';
      tAuxCalcMaterial.First;
      while not tAuxCalcMaterial.EOF do
        begin
          tAuxItCalcMaterial.First;
          while not tAuxItCalcMaterial.EOF do
            tAuxItCalcMaterial.Delete;
          tAuxCalcMaterial.Delete;
        end;
      vGerar := True;
      if vGerar then
        begin
          begin
            Imp_Lote;
            Screen.Cursor := crDefault;
          end;
          tAuxCalcMaterial.IndexFieldNames := 'Material';
          Edit2.Text    := IntToStr(vQtdPares);
          Screen.Cursor := crDefault;
        end;
    end
  else
    ShowMessage('Falta informar o número do Lote');
  Screen.Cursor := crDefault;
  RxDBGrid1.DataSource := dsAuxCalcMaterial;
end;

procedure TfPrevCalcMaterialLote.FormShow(Sender: TObject);
begin
  Dm1.tLote.Open;
  Dm1.tLoteMI.Open;
  Dm1.tLotePedidoMI.Open;
  DM1.tTalao.Open;
  DM1.tTalaoGrade.Open;
  DM1.tTalaoMI.Open;
  DM1.tTalaoGradeMI.Open;
  Dm1.tPedido.Open;
  Dm1.tPedidoItem.Open;
  Dm1.tPedidoMaterial.Open;
  Dm1.tPedidoGrade.Open;
  Dm1.tMaterial.Open;
  DM1.tMaterial2.Open;
  Dm1.tMaterialGradeNum.Open;
  DM1.tCor.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tFornecedores.Open;
  DM1.tFornecedores2.Open;
  DM1.tProduto.Open;
  tAuxCalcMaterial.Open;
  tAuxItCalcMaterial.Open;
  tAuxCalcMaterial.IndexFieldNames := 'CodMaterial;CodCor;Largura';
  tAuxCalcMaterial.First;
  while not tAuxCalcMaterial.EOF do
    begin
      tAuxItCalcMaterial.First;
      while not tAuxItCalcMaterial.EOF do
        tAuxItCalcMaterial.Delete;
      tAuxCalcMaterial.Delete;
    end;
end;

procedure TfPrevCalcMaterialLote.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfPrevCalcMaterialLote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F2 then
    begin
      if RadioGroup2.ItemIndex = 0 then
        begin
          fConsLoteExp := TfConsLoteExp.Create(Self);
          fConsLoteExp.ShowModal;
        end
      else
        begin
          fConsLote := TfConsLote.Create(Self);
          fConsLote.ShowModal;
        end;
    end;
end;

procedure TfPrevCalcMaterialLote.PopupMenu1Popup(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : PopupMenu1.Items.Items[1].Enabled := False;
    1 : PopupMenu1.Items.Items[1].Enabled := True;
  end;
end;

procedure TfPrevCalcMaterialLote.CurrencyEdit3Exit(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger = 0 then
    CurrencyEdit1.AsInteger := CurrencyEdit3.AsInteger;
end;

procedure TfPrevCalcMaterialLote.BitBtn5Click(Sender: TObject);
begin
  if mMaterial.RecordCount < 1 then
    begin
      ShowMessage('Não existe material para imprimir o talão auxiliar!');
      BitBtn3.SetFocus;
      exit;
    end;
  fRelTalaoAuxiliar := TfRelTalaoAuxiliar.Create(Self);
  fRelTalaoAuxiliar.RLReport1.Preview;
  FreeAndNil(fRelTalaoAuxiliar);
end;

procedure TfPrevCalcMaterialLote.tAuxCalcMaterialCalcFields(
  DataSet: TDataSet);
begin
  if (tAuxCalcMaterialConsumo.AsFloat > 0) and (tAuxCalcMaterialQtdPares.AsFloat > 0) then
    tAuxCalcMaterialclUnitario.AsFloat := tAuxCalcMaterialConsumo.AsFloat / tAuxCalcMaterialQtdPares.AsFloat;
end;

procedure TfPrevCalcMaterialLote.tAuxCalcMaterialNewRecord(
  DataSet: TDataSet);
begin
  tAuxCalcMaterialQtdPares.AsFloat := 0;
  tAuxCalcMaterialConsumo.AsFloat  := 0;
end;

end.
