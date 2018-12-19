unit UConsEstoqueMat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Grids, DBGrids, RXDBCtrl, StdCtrls,
  DBVGrids, Db, DBTables, Buttons, RxLookup, Mask, ToolEdit, DBFilter, CurrEdit, Variants, DBCtrls, RzDBCmbo, SMDBGrid,
  ShellApi;

type
  TfConsEstoqueMat = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    qEstoque: TQuery;
    dsEstoque: TDataSource;
    VDBGrid2: TVDBGrid;
    qEstoqueCodMaterial: TIntegerField;
    qEstoqueNomeMaterial: TStringField;
    qEstoqueQtd: TFloatField;
    qEstoqueEstMinimo: TFloatField;
    qEstoqueLargura: TStringField;
    qEstoqueNomeCor: TStringField;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    BitBtn1: TBitBtn;
    qEstoqueGrade: TQuery;
    qEstoqueGradeCodMaterial: TIntegerField;
    qEstoqueGradeCodCor: TIntegerField;
    qEstoqueGradeLargura: TStringField;
    qEstoqueGradeTamanho: TStringField;
    dsEstoqueGrade: TDataSource;
    qEstoqueGradeQtd: TFloatField;
    RadioGroup2: TRadioGroup;
    BitBtn6: TBitBtn;
    RadioGroup1: TRadioGroup;
    qEstoqueCodCor: TIntegerField;
    qOC: TQuery;
    qOCCodMaterial: TIntegerField;
    qOCCodCor: TIntegerField;
    qOCQtdRestante: TFloatField;
    qEstoqueclQtdOC: TFloatField;
    StaticText1: TStaticText;
    RadioGroup3: TRadioGroup;
    SMDBGrid1: TSMDBGrid;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Panel4: TPanel;
    Shape1: TShape;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    qEstoqueSelEstoque: TBooleanField;
    BitBtn4: TBitBtn;
    qEstoquelkSelEstoque: TBooleanField;
    btnCopiar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure qEstoqueAfterScroll(DataSet: TDataSet);
    procedure RadioGroup2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure qEstoqueCalcFields(DataSet: TDataSet);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnCopiarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    vItemDoc : Integer;

    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_Detalhe;
    procedure Imprime_Rodape;

    procedure Monta_SQLEstoque;

    procedure prc_Copiar;

    procedure prc_Selecionar(Selecionado : Boolean);

  public
    { Public declarations }
  end;

var
  fConsEstoqueMat: TfConsEstoqueMat;
  linha, pagina: Integer;
  TextoGrade, TextoHifen, TextoQtd: String;
  F: TextFile;

implementation

uses UDM1, UAgendaTelef, UEscImpressora, URelEstoque, UConsEstoqueOC;

{$R *.DFM}

procedure TfConsEstoqueMat.Monta_SQLEstoque;
begin
  qEstoque.Close;
  qEstoque.SQL.Clear;
  qEstoque.SQL.Add('SELECT DISTINCT Dbmaterial.Codigo CodMaterial, Dbmaterial.Nome NomeMaterial, Dbestoquematmov.CodCor, ');
  qEstoque.SQL.Add('SUM(Dbestoquematmov.Qtd2) Qtd, Dbmaterial.EstMinimo, Dbestoquematmov.Largura, Dbcor.Nome NomeCor, Dbmaterial.SelEstoque');
  qEstoque.SQL.Add('FROM "dbMaterial.DB" Dbmaterial');
  qEstoque.SQL.Add(' INNER JOIN "dbEstoqueMatMov.DB" Dbestoquematmov ON (Dbmaterial.Codigo = Dbestoquematmov.CodMaterial)');
  qEstoque.SQL.Add(' FULL JOIN "dbCor.DB" Dbcor ON (Dbestoquematmov.CodCor = Dbcor.Codigo)');
  qEstoque.SQL.Add('WHERE Dbestoquematmov.DtMov <= :Data');
  if RadioGroup3.ItemIndex < 2 then
  begin
    qEstoque.SQL.Add('  AND Dbestoquematmov.Mercado = :Mercado');
    case RadioGroup3.ItemIndex of
      0: qEstoque.ParamByName('Mercado').AsString := 'E';
      1: qEstoque.ParamByName('Mercado').AsString := 'I';
    end;
  end;
  qEstoque.ParamByName('Data').AsDate := DateEdit1.Date;
  if RxDBLookupCombo1.Text <> '' then
  begin
    qEstoque.SQL.Add('  AND dbMaterial.Grupo = :Grupo');
    qEstoque.ParamByName('Grupo').AsInteger := RxDBLookupCombo1.KeyValue;
  end;
  qEstoque.SQL.Add('GROUP BY Dbmaterial.Codigo, Dbmaterial.Nome, Dbestoquematmov.CodCor, Dbmaterial.EstMinimo, Dbestoquematmov.Largura, Dbcor.Nome, Dbmaterial.SelEstoque');
  qEstoque.SQL.Add('ORDER BY NomeMaterial, NomeCor');
  qEstoque.Open;

  qEstoqueGrade.Close;
  qEstoqueGrade.SQL.Clear;
  qEstoqueGrade.SQL.Add('SELECT Dbestoquematmov.CodMaterial, Dbestoquematmov.CodCor, Dbestoquematmov.Largura, ');
  qEstoqueGrade.SQL.Add('SUM( Dbestoquematmovgrade.Qtd2 ) Qtd, Dbestoquematmovgrade.Tamanho');
  qEstoqueGrade.SQL.Add('FROM "dbEstoqueMatMov.DB" Dbestoquematmov');
  qEstoqueGrade.SQL.Add(' INNER JOIN "dbEstoqueMatMovGrade.DB" Dbestoquematmovgrade ON (Dbestoquematmov.NumMov = Dbestoquematmovgrade.NumMov)');
  qEstoqueGrade.SQL.Add('WHERE  Dbestoquematmov.DtMov <= :Data');
  if RadioGroup3.ItemIndex < 2 then
  begin
    qEstoqueGrade.SQL.Add('  AND Dbestoquematmov.Mercado = :Mercado');
    case RadioGroup3.ItemIndex of
      0: qEstoqueGrade.ParamByName('Mercado').AsString := 'E';
      1: qEstoqueGrade.ParamByName('Mercado').AsString := 'I';
    end;
  end;
  qEstoqueGrade.ParamByName('Data').AsDate := DateEdit1.Date;
  qEstoqueGrade.SQL.Add('GROUP BY Dbestoquematmov.CodMaterial, Dbestoquematmov.CodCor, Dbestoquematmov.Largura, Dbestoquematmovgrade.Tamanho');
  qEstoqueGrade.Open;
end;

procedure TfConsEstoqueMat.Imprime_Cabecalho;
var
  Texto1: String;
  I: Integer;
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
  Texto1 := '                                 RELATORIO DO ESTOQUE DOS MATERIAIS                                                  Pag: ';
  Texto1 := texto1 + IntToStr(pagina);
  Writeln(F,Texto1);
  Texto1 := '';
  for i := 1 to 116 do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Data: ' + DateToStr(Date);
  Writeln(F,Texto1);
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Material Descricao                                   Larg.  Cor                      Quantidade');
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  linha := 5;
end;

procedure TfConsEstoqueMat.Imprime_Detalhe;
var
 i: Integer;
 texto1, Texto2, Texto5: string;
begin
  if linha > 61 then
    Imprime_Cabecalho;
  Texto1 := qEstoqueCodMaterial.AsString;
  for i := 1 to 7 - Length(Texto1) do
    Texto1 := ' ' + Texto1;
  Texto2 := Copy(qEstoqueNomeMaterial.AsString,1,43);
  for i := 1 to 43 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + '  ' + Texto2 + '   ';
  texto2 := qEstoqueLargura.AsString;
  For i := 1 to 1 - Length(texto2) do
    texto2 := texto2 + ' ';
  texto1 := texto1 + texto2 + '    ';
  Texto2 := '';
  Texto2 := qEstoqueNomeCor.AsString;
  for i := 1 to 15 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + '   ';
  texto2 := formatFloat('###,###,##0.00000',qEstoqueQtd.AsFloat);
  for i := 1 to 14 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + '  ';
  texto1 := texto1 + '  __________________________';
  Writeln(F,texto1);
  linha := linha + 1;

  //*** Le a tabela de grade do estoque para buscar a quantidade
 // qEstoqueGrade.EmptyTable;
  //qEstoqueGrade.Filtered := False;
  //qEstoqueGrade.Filter  := 'CodMaterial = '''+qEstoqueCodMaterial.AsString+''' and CodCor = '''+qEstoqueCodCor.AsString+''' and Largura = '''+qEstoqueLargura.AsString+'''';
  //qEstoqueGrade.Filtered := True;
  if qEstoqueGrade.RecordCount > 0 then
  begin
    TextoGrade := '    Tamanho...: ';
    TextoHifen := '                ';
    TextoQtd   := '    Quantidade: ';
    qEstoqueGrade.First;
    while not qEstoqueGrade.Eof do
      begin
        texto5 := qEstoqueGradeTamanho.AsString;
        for i := 1 to 6 - length(texto5) do
          texto5 := ' ' + texto5;
        textoGrade := TextoGrade + texto5 + ' ';
        textoHifen := textoHifen + '------ ';
        texto5 := IntToStr(qEstoqueGradeQtd.AsInteger);
        for i := 1 to 6 - length(texto5) do
          texto5 := ' ' + texto5;
        textoQtd   := TextoQtd + texto5 + ' ';
        qEstoqueGrade.Next;
      end;
    WriteLn(F,TextoGrade);
    WriteLn(F,TextoHifen);
    WriteLn(F,TextoQtd);
    linha := linha + 3;
  end;
end;

procedure TfConsEstoqueMat.Imprime_Rodape;
begin
  while linha < 66 do
  begin
    Linha := Linha + 1;
    Writeln(F);
  end;
end;

procedure TfConsEstoqueMat.Imprimir;
var
  Texto: String;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);

  SMDBGrid1.DataSource := nil;
  VDBGrid2.DataSource  := nil;
  qEstoque.First;
  while not qEstoque.Eof do
    begin
      Imprime_Detalhe;
      qEstoque.Next;
    end;
  Imprime_Rodape;

  SMDBGrid1.DataSource := dsEstoque;
  VDBGrid2.DataSource  := dsEstoqueGrade;

  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfConsEstoqueMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tMaterial.IndexFieldNames := 'Codigo';
  qEstoque.Close;
  qOC.Close;
  //DM1.tProduto.IndexFieldNames  := 'Codigo';
  //DM1.tProduto.Close;
  //DM1.tProdutoCor.Close;
  //DM1.tProdutoTam.Close;
  //DM1.tMaterial.Close;
  //DM1.tMaterialCor.Close;
  qOC.Close;
  qEstoque.Close;
  qEstoqueGrade.Close;
  Action := Cafree;
end;

procedure TfConsEstoqueMat.VDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfConsEstoqueMat.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsEstoqueMat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end;
end;

procedure TfConsEstoqueMat.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;

  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tProdutoTam.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tGrupo.Open;
  DateEdit1.Date := Date;
end;

procedure TfConsEstoqueMat.BitBtn1Click(Sender: TObject);
begin
  Screen.Cursor   := crHourGlass;
  if DateEdit1.Text = '  /  /    ' then
    DateEdit1.Date := Date;
  //*** Monta o sql do estoque
  qOC.Close;
  qOC.Open;

  Monta_SQLEstoque;

  qEstoqueGrade.Close;
  qEstoqueGrade.Params[0].AsDate := DateEdit1.Date;
  qEstoqueGrade.Open;
  Screen.Cursor   := crDefault;
end;

procedure TfConsEstoqueMat.qEstoqueAfterScroll(DataSet: TDataSet);
begin
  qEstoqueGrade.Filtered := False;
  if qEstoqueCodMaterial.AsInteger > 0 then
  begin
    qEstoqueGrade.Filter   := 'CodMaterial = '''+qEstoqueCodMaterial.AsString+''' and CodCor = ''' +
                              qEstoqueCodCor.AsString+''' and Largura = '''+qEstoqueLargura.AsString+'''';
    qEstoqueGrade.Filtered := True;
  end;
end;

procedure TfConsEstoqueMat.RadioGroup2Click(Sender: TObject);
var
  vQtd: Real;
begin
  if qEstoque.Active then
  begin
    vQtd := 0.00001;
    qEstoque.Filtered := False;
    case RadioGroup2.ItemIndex of
      0: begin
           qEstoque.Filter   := 'Qtd > ''' +FloatToStr(vQtd)+ '''';
           qEstoque.Filtered := True;
         end;
    end;
  end
  else
    qEstoque.Filtered := False;
end;

procedure TfConsEstoqueMat.BitBtn6Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    Imprimir
  else
  begin
    qEstoque.First;
    fRelEstoque := TfRelEstoque.Create(Self);
    fRelEstoque.QuickRep1.Preview;
    fRelEstoque.QuickRep1.Free;
  end;
end;

procedure TfConsEstoqueMat.qEstoqueCalcFields(DataSet: TDataSet);
begin
  if qOC.Locate('CodMaterial;CodCor',VarArrayOf([qEstoqueCodMaterial.AsInteger,qEstoqueCodCor.AsInteger]),[locaseinsensitive]) then
    qEstoqueclQtdOC.AsFloat := qOCQtdRestante.AsFloat;
end;

procedure TfConsEstoqueMat.SMDBGrid1DblClick(Sender: TObject);
begin
  if (qEstoqueclQtdOC.AsInteger > 0) and (not(btnCopiar.Visible)) then
  begin
    Screen.Cursor  := crHourGlass;
    fConsEstoqueOC := TfConsEstoqueOC.Create(Self);
    fConsEstoqueOC.Edit1.Text := qEstoqueNomeMaterial.AsString;
    fConsEstoqueOC.Edit2.Text := qEstoqueNomeCor.AsString;
    fConsEstoqueOC.qOCPendente.Close;
    fConsEstoqueOC.qOCPendente.Params[0].AsInteger := qEstoqueCodMaterial.AsInteger;
    fConsEstoqueOC.qOCPendente.Params[1].AsInteger := qEstoqueCodCor.AsInteger;
    fConsEstoqueOC.qOCPendente.Open;
    Screen.Cursor := crDefault;
    fConsEstoqueOC.ShowModal;
  end
  else
  begin
    if qEstoquelkSelEstoque.AsBoolean then
      prc_Selecionar(False)
    else
      prc_Selecionar(True);
  end;
end;

procedure TfConsEstoqueMat.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  vQtd: Real;
begin
  vQtd := 0;
  if StrToFloat(FormatFloat('0.00000',qEstoqueQtd.AsFloat)) >= StrToFloat(FormatFloat('0.00000',vQtd)) then
  begin
    if qEstoquelkSelEstoque.AsBoolean then
    begin
      Background  := $00FFFF80;
      AFont.Color := clWindowText;
    end
    else
    begin
      Background  := clWindow;
      AFont.Color := clWindowText;
    end;
  end
  else
  begin
    Background  := clRed;
    AFont.Color := clWhite;
  end;
end;

procedure TfConsEstoqueMat.btnCopiarClick(Sender: TObject);
begin
  //SMDBGrid1.DisableScroll;
  DM1.tDctoEstItem.Refresh;
  DM1.tDctoEstItem.Last;
  vItemDoc := DM1.tDctoEstItemItem.AsInteger;

  qEstoque.First;
  while not qEstoque.Eof do
  begin
    if (qEstoquelkSelEstoque.AsBoolean) and (StrToFloat(FormatFloat('0.00000',qEstoqueQtd.AsFloat)) > 0) then
      prc_Copiar;
    qEstoque.Next;
  end;
  //SMDBGrid1.EnableScroll;
  ShowMessage('Materiais Copiados');
  Close;
end;

procedure TfConsEstoqueMat.prc_Copiar;
var
  vPosAux : Integer;
begin
  if not(DM1.tDctoEst.State in [dsEdit,dsInsert]) then
    exit;

  DM1.tMaterial.Locate('Codigo',qEstoqueCodMaterial.AsInteger,([LocaseInsensitive]));

  //DM1.tDctoEstItem.Last;
  vItemDoc := vItemDoc + 1;

  DM1.tDctoEstItem.Insert;
  DM1.tDctoEstItemNumDcto.AsInteger := DM1.tDctoEstNumDcto.AsInteger;
  DM1.tDctoEstItemItem.AsInteger    := vItemDoc;
  DM1.tDctoEstItemCodMaterial.AsInteger := qEstoqueCodMaterial.AsInteger;
  DM1.tDctoEstItemCodGrade.AsInteger := DM1.tMaterialCodGrade.AsInteger;  
  if qEstoqueCodCor.AsInteger > 0 then
    DM1.tDctoEstItemCodCor.AsInteger    := qEstoqueCodCor.AsInteger
  else
    DM1.tDctoEstItemCodCor.AsInteger    := 0;
  DM1.tDctoEstItemQtd.AsFloat           := StrToFloat(FormatFloat('0.00000',qEstoqueQtd.AsFloat));
  DM1.tDctoEstItemUnidade.AsString      := DM1.tMaterialUnidade.AsString;
  DM1.tDctoEstItemVlrUnit.AsFloat       := DM1.tMaterialPrCusto.AsFloat;
  DM1.tDctoEstItemVlrTotal.AsFloat      := DM1.tDctoEstItemVlrUnit.AsFloat * DM1.tDctoEstItemQtd.AsFloat;
  DM1.tDctoEstItemMercado.AsString      := 'E';
  //case ComboBox1.ItemIndex of
  //  0 : DM1.tDctoEstItemMercado.AsString := 'E';
  //  1 : DM1.tDctoEstItemMercado.AsString := 'I';
  //end;
  DM1.tDctoEstTotal.AsFloat             := DM1.tDctoEstTotal.AsFloat + DM1.tDctoEstItemVlrTotal.AsFloat;

  qEstoqueGrade.Filtered := False;
  qEstoqueGrade.Filter   := 'CodMaterial = ' + QuotedStr(qEstoqueCodMaterial.AsString) + ' and ' + ' CodCor = '  + QuotedStr(qEstoqueCodCor.AsString);
  qEstoqueGrade.Filtered := True;
  qEstoqueGrade.First;
  while not qEstoqueGrade.Eof do
  begin
    if StrToFloat(FormatFloat('0.00000',qEstoqueGradeQtd.AsFloat)) > 0 then
    begin
      vPosAux := 1;
      if DM1.tGradeItemlk.Locate('CodGrade;Tamanho',VarArrayOf([DM1.tMaterialCodGrade.AsInteger,qEstoqueGradeTamanho.AsString]),[locaseinsensitive]) then
        vPosAux := DM1.tGradeItemlkPosicao.AsInteger;

      if DM1.tDctoEstGrade.Locate('NumDcto;Item;CodGrade;Posicao',VarArrayOf([DM1.tDctoEstNumDcto.AsInteger,
                                                                             DM1.tDctoEstItemItem.AsInteger,
                                                                             DM1.tMaterialCodGrade.AsInteger,
                                                                             vPosAux]),[locaseinsensitive]) then
        DM1.tDctoEstGrade.Edit
      else
      begin
        DM1.tDctoEstGrade.Insert;
        DM1.tDctoEstGradeNumDcto.AsInteger  := DM1.tDctoEstNumDcto.AsInteger;
        DM1.tDctoEstGradeItem.AsInteger     := DM1.tDctoEstItemItem.AsInteger;
        DM1.tDctoEstGradeCodGrade.AsInteger := DM1.tMaterialCodGrade.AsInteger;
        DM1.tDctoEstGradePosicao.AsInteger  := vPosAux;
        DM1.tDctoEstGradeQtd.AsInteger      := 0;
      end;
      DM1.tDctoEstGradeQtd.AsInteger      := DM1.tDctoEstGradeQtd.AsInteger + qEstoqueGradeQtd.AsInteger;
      DM1.tDctoEstGrade.Post;
    end;
    qEstoqueGrade.Next;
  end;

  DM1.tDctoEstItem.Post;
end;

procedure TfConsEstoqueMat.BitBtn2Click(Sender: TObject);
begin
  qEstoque.First;
  while not qEstoque.Eof do
  begin
    prc_Selecionar(True);
    qEstoque.Next;
  end;
end;

procedure TfConsEstoqueMat.prc_Selecionar(Selecionado: Boolean);
begin
  if DM1.tMaterial.Locate('Codigo',qEstoqueCodMaterial.AsInteger,([LocaseInsensitive])) then
  begin
    DM1.tMaterial.Edit;
    DM1.tMaterialSelEstoque.AsBoolean := Selecionado;
    DM1.tMaterial.Post;

    qEstoque.Refresh;

    //qEstoque.Edit;
    //qEstoqueclSelEstoque.AsBoolean := DM1.tMaterialSelEstoque.AsBoolean;
    //qEstoque.Post;
  end;
end;

procedure TfConsEstoqueMat.BitBtn4Click(Sender: TObject);
begin
  qEstoque.First;
  while not qEstoque.Eof do
  begin
    prc_Selecionar(False);
    qEstoque.Next;
  end;
end;

end.
