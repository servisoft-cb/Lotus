unit UPrevRelHistMaterial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, RxLookup, Buttons, Db, DBTables,
  DBCtrls, RzDBCmbo, ShellApi;

type
  TfPrevRelHistMaterial = class(TForm)
    Panel1: TPanel;
    DateEdit1: TDateEdit;
    StaticText2: TStaticText;
    DateEdit2: TDateEdit;
    StaticText3: TStaticText;
    StaticText1: TStaticText;
    StaticText4: TStaticText;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RadioGroup1: TRadioGroup;
    qCor: TQuery;
    dsCor: TDataSource;
    qCorNome: TStringField;
    qCorCodigo: TIntegerField;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    RadioGroup2: TRadioGroup;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    tAuxHistMaterial: TTable;
    tAuxHistMaterialControle: TIntegerField;
    tAuxHistMaterialCodGrade: TIntegerField;
    tAuxHistMaterialData: TDateField;
    tAuxHistMaterialNroDoc: TIntegerField;
    tAuxHistMaterialTipo: TStringField;
    tAuxHistMaterialES: TStringField;
    tAuxHistMaterialQtd: TFloatField;
    tAuxHistMaterialNomeMaterial: TStringField;
    tAuxHistMaterialNomeCor: TStringField;
    tAuxHistMaterialUnidade: TStringField;
    tAuxHistMaterialNomeForn: TStringField;
    tAuxHistMaterialVlrUnit: TFloatField;
    tAuxHistMaterialVlrTotal: TFloatField;
    tAuxHistMaterialCodProd: TIntegerField;
    tAuxHistMateriallkReferencia: TStringField;
    tAuxHistMaterialPercICMS: TFloatField;
    dsAuxHistMaterial: TDataSource;
    tAuxHistMaterialGrade: TTable;
    tAuxHistMaterialGradeControle: TIntegerField;
    tAuxHistMaterialGradeTamanho: TStringField;
    tAuxHistMaterialGradeQtd: TFloatField;
    dsAuxHistMaterialGrade: TDataSource;
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzDBLookupComboBox1Enter(Sender: TObject);
    procedure RzDBLookupComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Le_EstoqueMov;
    procedure Grava_Aux;
    procedure Grava_AuxGrade;
    procedure Exclui_Aux;
    procedure Imprimir;
    procedure Imprime_Cabecalho;
    procedure Imprime_CabMaterial;
    procedure Imprime_Detalhe;
    procedure Imprime_QtdTotal;
    procedure Imprime_Rodape;
  public
    { Public declarations }
  end;

var
  fPrevRelHistMaterial: TfPrevRelHistMaterial;
  vControle, linha, pagina : Integer;
  vNota, vCabMaterial : Boolean;
  F: TextFile;
  vNomeMat, vNomeCor : String;
  vQtdEntrada, vQtdSaida, vVlrTotalMat, vVlrGeral : Real;

implementation

uses UDM1, UDM2, UEscImpressora;

{$R *.DFM}

procedure TfPrevRelHistMaterial.Exclui_Aux;
begin
  tAuxHistMaterial.First;
  while not tAuxHistMaterial.Eof do
    begin
      tAuxHistMaterialGrade.First;
      while not tAuxHistMaterialGrade.Eof do
        tAuxHistMaterialGrade.Delete;
      tAuxHistMaterial.Delete;
    end;
end;

procedure TfPrevRelHistMaterial.Le_EstoqueMov;
var
  vCodCor : Integer;
begin
  if RxDBLookupCombo2.KeyValue > 0 then
    vCodCor := RxDBLookupCombo2.KeyValue
  else
    vCodCor := 0;
  Case RadioGroup2.ItemIndex of
    0 : begin
          Case RadioGroup1.ItemIndex of
            0 : begin
                  DM1.tEstoqueMatMov.Filtered := False;
                  DM1.tEstoqueMatMov.Filter   := 'DtMov >= '''+DateEdit1.Text+''' and DtMov <= '''+DateEdit2.Text+''' and ES = ''E'' and CodMaterial = '''+IntToStr(RzDBLookupComboBox1.KeyValue)+''' and CodCor = '''+IntToStr(vCodCor)+'''';
                  DM1.tEstoqueMatMov.Filtered := True;
                end;
            1 : begin
                  DM1.tEstoqueMatMov.Filtered := False;
                  DM1.tEstoqueMatMov.Filter   := 'DtMov >= '''+DateEdit1.Text+''' and DtMov <= '''+DateEdit2.Text+''' and ES = ''E''';
                  DM1.tEstoqueMatMov.Filtered := True;
                end;
          end;
        end;
    1 : begin
          Case RadioGroup1.ItemIndex of
            0 : begin
                  DM1.tEstoqueMatMov.Filtered := False;
                  DM1.tEstoqueMatMov.Filter   := 'DtMov >= '''+DateEdit1.Text+''' and DtMov <= '''+DateEdit2.Text+''' and ES = ''S'' and CodMaterial = '''+IntToStr(RzDBLookupComboBox1.KeyValue)+''' and CodCor = '''+IntToStr(vCodCor)+'''';
                  DM1.tEstoqueMatMov.Filtered := True;
                end;
            1 : begin
                  DM1.tEstoqueMatMov.Filtered := False;
                  DM1.tEstoqueMatMov.Filter   := 'DtMov >= '''+DateEdit1.Text+''' and DtMov <= '''+DateEdit2.Text+''' and ES = ''S''';
                  DM1.tEstoqueMatMov.Filtered := True;
                end;
          end;
        end;
    2 : begin
          Case RadioGroup1.ItemIndex of
            0 : begin
                  DM1.tEstoqueMatMov.Filtered := False;
                  DM1.tEstoqueMatMov.Filter   := 'DtMov >= '''+DateEdit1.Text+''' and DtMov <= '''+DateEdit2.Text+''' and CodMaterial = '''+IntToStr(RzDBLookupComboBox1.KeyValue)+''' and CodCor = '''+IntToStr(vCodCor)+'''';
                  DM1.tEstoqueMatMov.Filtered := True;
                end;
            1 : begin
                  DM1.tEstoqueMatMov.Filtered := False;
                  DM1.tEstoqueMatMov.Filter   := 'DtMov >= '''+DateEdit1.Text+''' and DtMov <= '''+DateEdit2.Text+'''';
                  DM1.tEstoqueMatMov.Filtered := True;
                end;
          end;
        end;
  end;

  DM1.tEstoqueMatMov.First;
  while not DM1.tEstoqueMatMov.Eof do
    begin
      if ((DM1.tEstoqueMatMovTipoMov.AsString = 'NTE') and (CheckBox1.Checked)) or
         ((DM1.tEstoqueMatMovTipoMov.AsString = 'NTS') and (CheckBox2.Checked)) or
         ((DM1.tEstoqueMatMovTipoMov.AsString = 'DOC') and (CheckBox3.Checked)) or
         ((DM1.tEstoqueMatMovTipoMov.AsString = 'REQ') and (CheckBox4.Checked)) or
         ((DM1.tEstoqueMatMovTipoMov.AsString = 'ACE') and (CheckBox5.Checked)) then
        begin
          Grava_Aux;
          DM1.tEstoqueMatMovGrade.First;
          while not DM1.tEstoqueMatMovGrade.Eof do
            begin
              Grava_AuxGrade;
              DM1.tEstoqueMatMovGrade.Next
            end;
        end;
      DM1.tEstoqueMatMov.Next;
    end;
  DM1.tEstoqueMatMov.Filtered := False;
end;

procedure TfPrevRelHistMaterial.Grava_Aux;
begin
  vControle := vControle + 1;
  tAuxHistMaterial.SetKey;
  tAuxHistMaterialControle.AsInteger := vControle;
  if tAuxHistMaterial.GotoKey then
    begin
      tAuxHistMaterialGrade.First;
      while not tAuxHistMaterialGrade.Eof do
        tAuxHistMaterialGrade.Delete;
      tAuxHistMaterial.Delete;
    end;
  tAuxHistMaterial.Insert;
  tAuxHistMaterialControle.AsInteger    := vControle;
  tAuxHistMaterialData.AsDateTime       := DM1.tEstoqueMatMovDtMov.AsDateTime;
  tAuxHistMaterialNroDoc.AsInteger      := DM1.tEstoqueMatMovNumNota.AsInteger;
  tAuxHistMaterialTipo.AsString         := DM1.tEstoqueMatMovTipoMov.AsString;
  tAuxHistMaterialES.AsString           := DM1.tEstoqueMatMovES.AsString;
  if DM1.tEstoqueMatMovCodProd.AsInteger > 0 then
    tAuxHistMaterialCodProd.AsInteger := DM1.tEstoqueMatMovCodProd.AsInteger;
  if DM1.tEstoqueMatMovTipoMov.AsString = 'NTE' then
    begin
      DM1.tFornecedores.IndexFieldNames := 'CodForn';
      DM1.tFornecedores.SetKey;
      DM1.tFornecedoresCodForn.AsInteger := DM1.tEstoqueMatMovCodCliForn.AsInteger;
      if DM1.tFornecedores.GotoKey then
        tAuxHistMaterialnomeforn.AsString := DM1.tFornecedoresNomeForn.AsString;
    end
  else
  if DM1.tEstoqueMatMovTipoMov.AsString = 'NTS' then
    begin
      DM1.tCliente.IndexFieldNames := 'Codigo';
      DM1.tCliente.SetKey;
      DM1.tClienteCodigo.AsInteger := DM1.tEstoqueMatMovCodCliForn.AsInteger;
      if DM1.tCliente.GotoKey then
        tAuxHistMaterialnomeforn.AsString := DM1.tClienteNome.AsString;
    end
  else
  if DM1.tEstoqueMatMovTipoMov.AsString = 'REQ' then
    begin
      DM1.tSetor.IndexFieldNames := 'Codigo';
      DM1.tSetor.SetKey;
      DM1.tSetorCodigo.AsInteger := DM1.tEstoqueMatMovCodCliForn.AsInteger;
      if DM1.tSetor.GotoKey then
        tAuxHistMaterialnomeforn.AsString := DM1.tSetorNome.AsString;
    end;
  tAuxHistMaterialQtd.AsFloat           := DM1.tEstoqueMatMovQtd.AsFloat;
  tAuxHistMaterialNomeMaterial.AsString := DM1.tEstoqueMatMovlkNomeMaterial.AsString;
  tAuxHistMaterialNomeCor.AsString      := DM1.tEstoqueMatMovlkCor.AsString;
  tAuxHistMaterialUnidade.AsString      := DM1.tEstoqueMatMovUnidade.AsString;
  if DM1.tEstoqueMatMovVlrDesconto.AsFloat > 0 then
    tAuxHistMaterialVlrUnit.AsFloat := DM1.tEstoqueMatMovVlrUnitario.AsFloat - DM1.tEstoqueMatMovVlrDesconto.AsFloat
  else
    tAuxHistMaterialVlrUnit.AsFloat := DM1.tEstoqueMatMovVlrUnitario.AsFloat;
  tAuxHistMaterialVlrTotal.AsFloat      := tAuxHistMaterialVlrUnit.AsFloat * DM1.tEstoqueMatMovQtd.AsFloat;
  tAuxHistMaterialPercICMS.AsFloat      := DM1.tEstoqueMatMovPercIcms.AsFloat;
  tAuxHistMaterial.Post;
end;

procedure TfPrevRelHistMaterial.Grava_AuxGrade;
begin
  tAuxHistMaterialGrade.Insert;
  tAuxHistMaterialGradeControle.AsInteger := vControle;
  tAuxHistMaterialGradeTamanho.AsString   := DM1.tEstoqueMatMovGradeTamanho.AsString;
  tAuxHistMaterialGradeQtd.asFloat        := DM1.tEstoqueMatMovGradeQtd.AsFloat;
  tAuxHistMaterialGrade.Post;
end;

procedure TfPrevRelHistMaterial.Imprime_Cabecalho;
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
  texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 114 - length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Pagina.: ';
  texto1 := texto1 + IntToStr(pagina);
  Writeln(F,Texto1);

  texto1 := 'Periodo: ' + DateEdit1.Text + ' a ' + DateEdit2.Text;
  for i := 1 to 11 do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'HISTORICO DO MATERIAL';
  for i := 1 to 44 do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Emissao: ' + DateToStr(Date);
  Writeln(F,Texto1);

  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  Writeln(F,'Dt. Movto.  Documento  Tipo  E/S  Fornecedor/Setor                   Ref.      Unid.      Qtd.Movto.   Vlr.Unit.    Vlr.Total  %ICMS');

  linha := 4;
  if vCabMaterial then
    begin
      Imprime_CabMaterial;
      vCabMaterial := False;
    end;
end;

procedure TfPrevRelHistMaterial.Imprime_CabMaterial;
var
 i : Integer;
 texto1 : String;
begin
  Writeln(F,'------------------------------------------------------------------------------------------------------------------------------------');
  texto1 := 'Material: ' + tAuxHistMaterialNomeMaterial.AsString;
  for i := 1 to 74 - length(texto1) do
    texto1 := texto1 + ' ';
  texto1 := texto1 + 'Cor: ' + tAuxHistMaterialNomeCor.AsString;
  Writeln(F,texto1);
  linha := linha + 2;
end;

procedure TfPrevRelHistMaterial.Imprime_Detalhe;
var
 i : Integer;
 texto1, texto2, texto3, texto4, texto5 : string;
begin
  Texto1 := tAuxHistMaterialData.AsString;
  for i := 1 to 11 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto2 := tAuxHistMaterialNroDoc.AsString;
  for i := 1 to 10 - length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + '  ';
  Texto2 :=  tAuxHistMaterialTipo.AsString;
  for i := 1 to 7 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := tAuxHistMaterialES.AsString;
  for i := 1 to 4 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := Copy(tAuxHistMaterialNomeForn.AsString,1,33);
  for i := 1 to 34 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2 + ' ';
  Texto2 := tAuxHistMateriallkReferencia.AsString;
  for i := 1 to 10 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := tAuxHistMaterialUnidade.AsString;
  for i := 1 to 5 - length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto1 + Texto2;
  Texto2 := FormatFloat('##,###,##0.00000',tAuxHistMaterialQtd.AsFloat);
  for i := 1 to 16 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Texto2 := FormatFloat('#,###,##0.00',tAuxHistMaterialVlrUnit.AsFloat);
  for i := 1 to 12 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Texto2 := FormatFloat('##,###,##0.00',tAuxHistMaterialVlrTotal.AsFloat);
  for i := 1 to 13 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + '  ';
  Texto2 := FormatFloat('0.00',tAuxHistMaterialPercICMS.AsFloat);
  for i := 1 to 4 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;

  Writeln(F,texto1);
  linha := linha + 1;
  vVlrTotalMat := vVlrTotalMat + tAuxHistMaterialVlrTotal.AsFloat;
  texto2 := ' ';
  for i := 1 to 37 do
    texto2 := texto2 + ' ';
  texto3 := texto2;
  texto4 := texto2;
  if tAuxHistMaterialGrade.RecordCount > 0 then
    begin
      tAuxHistMaterialGrade.First;
      while not tAuxHistMaterialGrade.Eof do
        begin
          texto5 := tAuxHistMaterialGradeTamanho.AsString;
          for i := 1 to 4 - length(texto5) do
            texto5 := ' ' + texto5;
          texto2 := texto2 + texto5 + ' ';
          texto5 := tAuxHistMaterialGradeQtd.AsString;
          for i := 1 to 4 - length(texto5) do
            texto5 := ' ' + texto5;
          texto3 := texto3 + texto5 + ' ';
          texto4 := texto4 + '---- ';
          tAuxHistMaterialGrade.Next;
        end;
      Writeln(F,texto2);
      Writeln(F,texto4);
      Writeln(F,texto3);
      linha := linha + 3;
    end;
  if tAuxHistMaterialES.AsString = 'E' then
    vQtdEntrada := vQtdEntrada + tAuxHistMaterialQtd.AsFloat;
  if tAuxHistMaterialES.AsString = 'S' then
    vQtdSaida := vQtdSaida + tAuxHistMaterialQtd.AsFloat;
end;

procedure TfPrevRelHistMaterial.Imprime_QtdTotal;
var
 i : Integer;
 texto1, texto2 : string;
 vQtdAux : Real;
begin
  Writeln(F,'  ----------------------------------------------------------------------------------------------------------------------------------');
  Texto1 := '  Totais =  Entrada: ';
  Texto2 := FormatFloat('##,###,##0.00000',vQtdEntrada);
  for i := 1 to 16 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + '  Saidas: ';
  Texto2 := FormatFloat('##,###,##0.00000',vQtdSaida);
  for i := 1 to 16 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + '  Saldo: ';
  vQtdAux := vQtdEntrada - vQtdSaida;
  Texto2 := FormatFloat('###,###,##0.00000',vQtdAux);
  for i := 1 to 17 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2 + '  Vlr.Total: ';
  Texto2 := FormatFloat('##,###,###,##0.00',vVlrTotalMat);
  for i := 1 to 17 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Writeln(F,texto1);
  vVlrGeral    := vVlrGeral + vVlrTotalMat;
  vQtdEntrada  := 0;
  vQtdSaida    := 0;
  vVlrTotalMat := 0;
  Writeln(F);
  linha       := linha + 3;
end;

procedure TfPrevRelHistMaterial.Imprime_Rodape;
var
  texto1 : String;
  i : Integer;
begin
  if RadioGroup1.ItemIndex = 1 then
    begin
      Texto1 := FormatFloat('##,###,###,##0.00',vVlrGeral);
      for i := 1 to 17 - Length(Texto1) do
        Texto1 := ' ' + Texto1;
      texto1 := '                                                                                           Vlr.Geral: ' + texto1;
      Writeln(F,texto1);
      linha := linha + 1;
    end;
  while linha < 66 do
    begin
      Linha := Linha + 1;
      Writeln(F);
    end;
end;

procedure TfPrevRelHistMaterial.Imprimir;
var
  Texto : String;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  linha  := 99;
  pagina := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  tAuxHistMaterial.IndexFieldNames := 'NomeMaterial;NomeCor;Data';
  tAuxHistMaterial.First;
  vNomeMat     := '';
  vNomeCor     := '';
  vCabMaterial := True;
  while not tAuxHistMaterial.Eof do
    begin
      if linha > 61 then
        begin
          Imprime_Cabecalho;
          if vCabMaterial = False then
            begin
              Imprime_QtdTotal;
              Imprime_CabMaterial;
            end;
        end
      else
      if vNomeMat <> tAuxHistMaterialNomeMaterial.AsString then
        begin
          Imprime_QtdTotal;
          Imprime_CabMaterial;
        end
      else
      if vNomeCor <> tAuxHistMaterialNomeCor.AsString then
        begin
          Imprime_QtdTotal;
          Imprime_CabMaterial;
        end;
      Imprime_Detalhe;
      vNomeMat := tAuxHistMaterialNomeMaterial.AsString;
      vNomeCor := tAuxHistMaterialNomeCor.AsString;
      tAuxHistMaterial.Next;
    end;
  Imprime_QtdTotal;
  Imprime_Rodape;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfPrevRelHistMaterial.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfPrevRelHistMaterial.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Codigo';
end;

procedure TfPrevRelHistMaterial.BitBtn6Click(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  tAuxHistMaterial.IndexFieldNames := 'Controle';
  vQtdEntrada  := 0;
  vQtdSaida    := 0;
  vVlrTotalMat := 0;
  vVlrGeral    := 0;
  Exclui_Aux;
  if DateEdit1.Date < 1 then
    ShowMessage('Falta informar a data inicial')
  else
  if DateEdit2.Date < 1 then
    ShowMessage('Falta informar a data final')
  else
  if DateEdit1.Date > DateEdit2.Date then
    begin
      ShowMessage('Data inicial maior que final');
      DateEdit1.SetFocus;
    end
  else
  if RadioGroup1.ItemIndex = 0 then
    begin
      if RzDBLookupComboBox1.Text = '' then
        ShowMessage('Falta informar o material')
      else
      if (DM1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo2.Text = '') then
        ShowMessage('Falta informar a cor')
      else
        Le_EstoqueMov;
    end
  else
  if RadioGroup1.ItemIndex = 1 then
    begin
      if (RzDBLookupComboBox1.Text <> '') or (RxDBLookupCombo2.Text <> '') then
        ShowMessage('Quando opção for geral não pode informar material e cor')
      else
        Le_EstoqueMov;
    end;
  Screen.Cursor := crDefault;
  if tAuxHistMaterial.RecordCount > 0 then
    Imprimir;
end;

procedure TfPrevRelHistMaterial.RxDBLookupCombo2Enter(Sender: TObject);
begin
  qCor.Active := False;
  if RzDBLookupComboBox1.Text <> '' then
    begin
      qCor.Params[0].AsInteger := RzDBLookupComboBox1.KeyValue;
      qCor.Active := True;
    end;
end;

procedure TfPrevRelHistMaterial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tAuxHistMaterial.IndexFieldNames := 'Controle';
  if Screen.FormCount < 3 then
    begin
      DM1.tEstoqueMatMov.Close;
      DM1.tEstoqueMatMovGrade.Close;
      DM1.tFornecedores.Close;
      DM1.tCliente.Close;
      DM1.tSetor.Close;
      DM1.tMaterial.Close;
      DM1.tMaterialCor.Close;
      DM1.tCor.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevRelHistMaterial.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelHistMaterial.FormShow(Sender: TObject);
begin
  DM1.tEstoqueMatMov.Open;
  DM1.tEstoqueMatMovGrade.Open;
  DM1.tFornecedores.Open;
  DM1.tCliente.Open;
  DM1.tSetor.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tCor.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
end;

procedure TfPrevRelHistMaterial.RzDBLookupComboBox1Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfPrevRelHistMaterial.RzDBLookupComboBox1Exit(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Codigo';
end;

end.
