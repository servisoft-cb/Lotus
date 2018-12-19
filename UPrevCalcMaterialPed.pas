unit UPrevCalcMaterialPed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, CurrEdit, Db, DBTables,
  MemTable, DBFilter, RXCtrls, Menus, Grids, DBGrids, RXDBCtrl, Variants;

type
  TfPrevCalcMaterialPed = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    tAuxCalcMaterial: TTable;
    dsAuxCalcMaterial: TDataSource;
    tAuxCalcMaterialCodMaterial: TIntegerField;
    tAuxCalcMaterialCodCor: TIntegerField;
    tAuxCalcMaterialUnidade: TStringField;
    tAuxCalcMaterialQtdPares: TFloatField;
    tAuxItCalcMaterial: TTable;
    dsAuxItCalcMaterial: TDataSource;
    tAuxItCalcMaterialCodMaterial: TIntegerField;
    tAuxItCalcMaterialCodCor: TIntegerField;
    tAuxItCalcMaterialQtdPares: TFloatField;
    tAuxCalcMaterialConsumo: TFloatField;
    tAuxCalcMateriallkUnidade: TStringField;
    tAuxCalcMateriallkCor: TStringField;
    tAuxCalcMaterialMaterial: TStringField;
    RxDBFilter1: TRxDBFilter;
    RxDBFilter2: TRxDBFilter;
    CurrencyEdit3: TCurrencyEdit;
    Edit1: TEdit;
    tAuxItCalcMaterialTamMaterial: TStringField;
    tAuxCalcMaterialclUnitario: TFloatField;
    Edit2: TEdit;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    BitBtn2: TBitBtn;
    tAuxCalcMaterialCodForn: TIntegerField;
    tAuxCalcMaterialNumOC: TIntegerField;
    tAuxCalcMateriallkIpi: TFloatField;
    GroupBox1: TGroupBox;       
    tAuxCalcMaterialData1: TDateField;
    tAuxCalcMaterialData2: TDateField;
    tAuxCalcMaterialData3: TDateField;
    tAuxCalcMaterialData4: TDateField;
    BitBtn3: TBitBtn;
    StaticText1: TStaticText;
    tAuxCalcMaterialNumLote: TIntegerField;
    tAuxCalcMaterialNumPedido: TIntegerField;
    RxLabel1: TRxLabel;
    RadioGroup1: TRadioGroup;
    tAuxItCalcMaterialLargura: TStringField;
    tAuxCalcMaterialLargura: TStringField;
    RxDBGrid1: TRxDBGrid;
    mVerificaMat: TMemoryTable;
    mVerificaMatPedido: TIntegerField;
    mVerificaMatItem: TIntegerField;
    mVerificaMatCodMat: TIntegerField;
    mVerificaMatCodCor: TIntegerField;
    mVerificaMatLargura: TStringField;
    tAuxCalcMaterialImpCalcMaterial: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure tAuxCalcMaterialCalcFields(DataSet: TDataSet);
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
  private
    { Private declarations }
    procedure Monta_Auxiliar;
    procedure Imp_Pedido;
    //procedure Gera_OC;
    //procedure Verifica_Pr;
    //procedure Insere_OC;
    //procedure GravaItens_OC;
    procedure Imprimir_Mapa;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;
  public
    { Public declarations }
  end;

var
  fPrevCalcMaterialPed: TfPrevCalcMaterialPed;
  linha, pagina, QtdPares : Integer;
  vPreco : Real;
  vGerar: Boolean;
  vLancamento : Integer;
  F: TextFile;
  texto : String;
  vQtdTotal : Integer;

implementation

uses UDM1, UEscImpressora, UConsLoteExp, UDM2, UConsPedido;

{$R *.DFM}

procedure TfPrevCalcMaterialPed.Imprimir_Mapa;
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
  tAuxCalcMaterial.Filter   := 'ImpCalcMaterial = True';
  tAuxCalcMaterial.Filtered := True;
  tAuxCalcMaterial.Refresh;
  tAuxCalcMaterial.First;
  while not tAuxCalcMaterial.EOF do
    begin
      if linha > 61 then
        Imprime_Cabecalho;
      Imprime_Detalhe;
      tAuxCalcMaterial.Next;
    end;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
    begin
      Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
      WinExec(PChar(Texto),SW_MAXIMIZE);
    end;
  tAuxCalcMaterial.Filtered := False;
end;

procedure TfPrevCalcMaterialPed.Imprime_Cabecalho;
var
 i : Integer;
 texto1, texto2 : String;
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

  texto1 := 'PEDIDO No: ' ;
  texto2 := IntToStr(CurrencyEdit3.AsInteger);
  for i := 1 to 8 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' / ';
  texto2 := Edit1.Text;
  for i := 1 to 2 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + '                        CALCULO DOS MATERIAS POR PEDIDO                                     Data: ';
  texto1 := texto1 + DateToStr(Date);
  Writeln(F,Texto1);

  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  //Writeln(F,'Material                             Cor             Un. C.Unitario      C.Total O.Compra   Data1      Data2     Data3      Data4');
  Writeln(F,'Material                             Cor             Un. C.Unitario      C.Total          Consumo REAL       Consumo CONSERTOS   ');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');

  linha := 5;
end;

procedure TfPrevCalcMaterialPed.Imprime_Detalhe;
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

  //Foi tirado dia 03/07/2008 e incluida as colunas de Consumo Real e Consumo Conserto
  //no lugar, conforme solicitou a Patricia
  {texto2 := tAuxCalcMaterialNumOC.AsString;
  for i := 1 to 6 - Length(texto2) do
    texto2 := ' ' + texto2;
  texto1 := texto1 + texto2 + ' ';
  texto2 := tAuxCalcMaterialData1.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := tAuxCalcMaterialData2.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := tAuxCalcMaterialData3.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + ' ';
  texto2 := tAuxCalcMaterialData4.AsString;
  for i := 1 to 10 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2;}
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
              texto5 := tAuxItCalcMaterialQtdPares.AsString;
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

procedure TfPrevCalcMaterialPed.Imprime_Rodape;
var
  texto1 : String;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  texto1 := 'Total de Pares: ' + Edit2.Text;
  Writeln(F,Texto1);
  Linha := Linha + 2;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

{procedure TfPrevCalcMaterialPed.Insere_OC;
begin
  DM1.tOrdemCompra.Refresh;
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

{procedure TfPrevCalcMaterialPed.GravaItens_OC;
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

{procedure TfPrevCalcMaterialPed.Verifica_Pr;
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

procedure tfPrevCalcMaterialPed.Imp_Pedido;
begin
  vGerar   := True;
  QtdPares := 0;
  DM1.tPedidoItem.First;
  while not DM1.tPedidoItem.EOF do
    begin
      if (DM1.tPedidoItemCancelado.AsBoolean <> True) and (DM1.tPedidoItemReposicao.AsBoolean <> True) then
        begin
          DM1.tPedidoMaterial.First;
          while not DM1.tPedidoMaterial.EOF do
            begin
              Monta_Auxiliar;
              DM1.tPedidoMaterial.Next;
            end;
          QtdPares := QtdPares + DM1.tPedidoItemQtdPares.AsInteger;
        end;
      DM1.tPedidoItem.Next;
    end;
end;

{procedure TfPrevCalcMaterialPed.Gera_OC;
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

procedure TfPrevCalcMaterialPed.Monta_Auxiliar;
var
 vTamMaterial : String[3];
 vLargura : String[1];
begin
  vTamMaterial := '';
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  DM1.tMaterial.FindKey([DM1.tPedidoMaterialCodMaterial.AsInteger]);
  tAuxCalcMaterial.Refresh;
  tAuxCalcMaterial.SetKey;
  tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
  tAuxCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
  if DM1.tMaterialCodGrade.AsInteger > 0 then
    vLargura := DM1.tPedidoItemlkLargura.AsString
  else
    vLargura := '';
  tAuxCalcMaterialLargura.AsString := vLargura;
  if tAuxCalcMaterial.GotoKey then
    begin   // Encontra material e soma quantidade
      tAuxCalcMaterial.Edit;
      tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      tAuxCalcMaterialMaterial.AsString     := DM1.tPedidoMateriallkNomeMaterial.AsString;
      tAuxCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
      tAuxCalcMaterialLargura.AsString      := vLargura;
      tAuxCalcMaterialUnidade.AsString      := DM1.tPedidoMateriallkUnidade.AsString;
      tAuxCalcMaterialImpCalcMaterial.AsBoolean := DM1.tMaterialImpCalcMaterial.AsBoolean;
      if DM1.tMaterialCodGrade.AsInteger > 0 then
        begin     // Verifica se material tem grade
          DM1.tPedidoGrade.First;
          while not DM1.tPedidoGrade.EOF do
            begin
              if DM1.tPedidoGradeQtd.AsInteger > 0 then
                begin     //  Produto com grade
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
                  if not tAuxItCalcMaterial.GotoKey then
                    begin     // Não encontra material na posição da grade e insere
                      tAuxItCalcMaterial.Insert;
                      tAuxItCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                      tAuxItCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                      tAuxItCalcMaterialLargura.AsString      := vLargura;
                      tAuxItCalcMaterialTamMaterial.AsString  := vTamMaterial;
                      tAuxItCalcMaterialQtdPares.AsInteger    := DM1.tPedidoGradeQtd.AsInteger;
                      tAuxItCalcMaterial.Post;
                    end
                  else
                    begin     // Encontra material na posição da grade e soma
                      tAuxItCalcMaterial.Edit;
                      tAuxItCalcMaterialQtdPares.AsInteger    := tAuxItCalcMaterialQtdPares.AsInteger +
                                                                 DM1.tPedidoGradeQtd.AsInteger;
                      tAuxItCalcMaterial.Post;
                    end;
                end;
              DM1.tPedidoGrade.Next
            end;
        end;
      tAuxCalcMaterialConsumo.AsFloat  := tAuxCalcMaterialConsumo.AsFloat + (DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tPedidoItemQtdPares.AsInteger);
      if not mVerificaMat.Locate('Pedido;Item;CodMat;CodCor;Largura;',VarArrayOf([DM1.tPedidoPedido.AsInteger,DM1.tPedidoItemItem.AsInteger,DM1.tPedidoMaterialCodMaterial.AsInteger,DM1.tPedidoMaterialCodCor.AsInteger,vLargura]),[locaseinsensitive]) then
        tAuxCalcMaterialQtdPares.AsFloat := tAuxCalcMaterialQtdPares.AsFloat + DM1.tPedidoItemQtdPares.AsFloat;
      tAuxCalcMaterial.Post;
    end
  else
    begin   // Não encontra material e insere
      tAuxCalcMaterial.Insert;
      tAuxCalcMaterialNumPedido.AsInteger   := DM1.tPedidoPedido.AsInteger;
      tAuxCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      tAuxCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
      tAuxCalcMaterialLargura.AsString      := vLargura;
      tAuxCalcMaterialMaterial.AsString     := DM1.tPedidoMateriallkNomeMaterial.AsString;
      tAuxCalcMaterialUnidade.AsString      := DM1.tPedidoMateriallkUnidade.AsString;
      tAuxCalcMaterialCodForn.AsInteger     := DM1.tMaterialFornecedor.AsInteger;
      tAuxCalcMaterialImpCalcMaterial.AsBoolean := DM1.tMaterialImpCalcMaterial.AsBoolean;
      if DM1.tMaterialCodGrade.AsInteger > 0 then
        begin     // Verifica se material tem grade
          DM1.tPedidoGrade.First;
          while not DM1.tPedidoGrade.EOF do
            begin
              if DM1.tPedidoGradeQtd.AsInteger > 0 then
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
                  if not tAuxItCalcMaterial.GotoKey then
                    begin     // Não encontra material na posição da grade e insere
                      tAuxItCalcMaterial.Insert;
                      tAuxItCalcMaterialCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
                      tAuxItCalcMaterialCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
                      tAuxItCalcMaterialLargura.AsString      := vLargura;
                      tAuxItCalcMaterialTamMaterial.AsString  := vTamMaterial;
                      tAuxItCalcMaterialQtdPares.AsInteger    := DM1.tPedidoGradeQtd.AsInteger;
                      tAuxItCalcMaterial.Post;
                    end
                  else
                    begin     // Encontra material na posição da grade e soma
                      tAuxItCalcMaterial.Edit;
                      tAuxItCalcMaterialQtdPares.AsInteger    := tAuxItCalcMaterialQtdPares.AsInteger +
                                                                 DM1.tPedidoGradeQtd.AsInteger;
                      tAuxItCalcMaterial.Post;
                    end;
                end;
              DM1.tPedidoGrade.Next;
            end;
        end;
      tAuxCalcMaterialConsumo.AsFloat  := DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tPedidoItemQtdPares.AsInteger;
      tAuxCalcMaterialQtdPares.AsFloat := DM1.tPedidoItemQtdPares.AsFloat;
      tAuxCalcMaterial.Post;
    end;
  if not mVerificaMat.Locate('Pedido;Item;CodMat;CodCor;Largura',VarArrayOf([DM1.tPedidoPedido.AsInteger,DM1.tPedidoItemItem.AsInteger,DM1.tPedidoMaterialCodMaterial.AsInteger,DM1.tPedidoMaterialCodCor.AsInteger,vLargura]),[locaseinsensitive]) then
    begin
      mVerificaMat.Insert;
      mVerificaMatPedido.AsInteger := DM1.tPedidoPedido.AsInteger;
      mVerificaMatItem.AsInteger   := DM1.tPedidoItemItem.AsInteger;
      mVerificaMatCodMat.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      mVerificaMatCodCor.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
      mVerificaMatLargura.AsString := vLargura;
      mVerificaMat.Post;
    end;
end;


procedure TfPrevCalcMaterialPed.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tPedido.IndexFieldNames := 'Pedido';
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
      DM1.tMaterial2.Close;
      Dm1.tMaterialGradeNum.Close;
      DM1.tCor.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      DM1.tGradeItemlk.Close;
      DM1.tFornecedores.Close;
      DM1.tFornecedores2.Close;
      DM1.tProduto.Close;
    end;

  Action := Cafree;
end;

procedure TfPrevCalcMaterialPed.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevCalcMaterialPed.tAuxCalcMaterialCalcFields(DataSet: TDataSet);
begin
  if (tAuxCalcMaterialConsumo.AsFloat > 0) and (tAuxCalcMaterialQtdPares.AsFloat > 0) then
    tAuxCalcMaterialclUnitario.AsFloat := tAuxCalcMaterialConsumo.AsFloat / tAuxCalcMaterialQtdPares.AsFloat;
end;

procedure TfPrevCalcMaterialPed.Visualizar1Click(Sender: TObject);
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

procedure TfPrevCalcMaterialPed.Imprimir1Click(Sender: TObject);
begin
  if tAuxCalcMaterial.RecordCount < 1 then
    begin
      ShowMessage('Não foi gerado o auxiliar');
      BitBtn3.SetFocus;
    end
  else
  if RadioGroup1.ItemIndex = 0 then
    Imprimir_Mapa
  else
    begin
      {Case RadioGroup1.ItemIndex of
        0 : begin
              fRelCalcMaterial := TfRelCalcMaterial.Create(Self);
              fRelCalcMaterial.QuickRep1.Print;
              fRelCalcMaterial.QuickRep1.Free;
            end;
        1 : begin
              fRelCalcMaterial := TfRelCalcMaterial.Create(Self);
              fRelCalcMaterial.QuickRep2.Print;
              fRelCalcMaterial.QuickRep2.Free;
            end;
      end;}
      BitBtn1.SetFocus;
    end;
end;

procedure TfPrevCalcMaterialPed.BitBtn2Click(Sender: TObject);
begin
//*** Este botao gera as Ordens de Compras
//*** Foi desativado, porque o sistema junta os materiais por largura e a ordem de compra
//*** e por grade. (Cleomar 27/04/2003)

  {Screen.Cursor := crHourglass;
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

procedure TfPrevCalcMaterialPed.BitBtn3Click(Sender: TObject);
begin
  RxDBGrid1.DataSource := Nil;
  if CurrencyEdit3.AsInteger > 0 then
    begin
      vLancamento   := 0;
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
      DM1.tPedido.IndexFieldNames := 'PedidoCliente;PedCliDif';
      DM1.tPedido.SetKey;
      DM1.tPedidoPedidoCliente.AsString := CurrencyEdit3.Text;
      DM1.tPedidoPedCliDif.AsString     := Edit1.Text;
      if DM1.tPedido.GotoKey then
        begin
          if DM1.tPedidoCancelado.AsBoolean then
            ShowMessage('Pedido esta cancelado!')
          else
          if DM1.tPedidoSuspenso.AsBoolean then
            ShowMessage('Pedido esta suspenso!')
          else
            begin
              Imp_Pedido;
              tAuxCalcMaterial.IndexFieldNames := 'Material';
              Edit2.Text    := IntToStr(QtdPares);
            end;
        end
      else
        ShowMessage('Pedido não cadastrado');
      Screen.Cursor := crDefault;
    end
  else
    ShowMessage('Falta informar o número do pedido');
  RxDBGrid1.DataSource := dsAuxCalcMaterial;
end;

procedure TfPrevCalcMaterialPed.FormShow(Sender: TObject);
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

procedure TfPrevCalcMaterialPed.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfPrevCalcMaterialPed.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F2 then
    begin         
      fConsPedido := TfConsPedido.Create(Self);
      fConsPedido.ShowModal;
    end;
end;

procedure TfPrevCalcMaterialPed.PopupMenu1Popup(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0 : PopupMenu1.Items.Items[1].Enabled := False;
    1 : PopupMenu1.Items.Items[1].Enabled := True;
  end;
end;

end.
