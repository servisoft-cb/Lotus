unit UConsLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, RXLookup, StdCtrls, Buttons,
  DBCtrls, Grids, DBGrids, Db, DBTables, DBVGrids, DBFilter, RXCtrls, Menus, MemTable, JPEG, Variants, DBClient, ShellApi;

type
  TfConsLote = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    Bevel1: TBevel;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox3: TGroupBox;
    DBGrid3: TDBGrid;
    GroupBox4: TGroupBox;
    VDBGrid1: TVDBGrid;
    Edit1: TEdit;
    Label2: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    tPedidoMaterial: TTable;
    tPedidoMaterialPedido: TIntegerField;
    tPedidoMaterialItemPed: TIntegerField;
    tPedidoMaterialOrdem: TIntegerField;
    tPedidoMaterialCodCor: TIntegerField;
    tPedidoMaterialCodMaterial: TIntegerField;
    tPedidoMaterialConsumoPr: TFloatField;
    tPedidoMaterialCodPosicao: TIntegerField;
    tPedidoMaterialImpTalao: TStringField;
    RxDBFilter1: TRxDBFilter;
    dsPedidoMaterial: TDataSource;
    tPedidoMateriallkMaterial: TStringField;
    tPedidoMateriallkCor: TStringField;
    tPedidoMateriallkPosicao: TStringField;
    BitBtn1: TBitBtn;
    mTalao: TMemoryTable;
    mTalaoConstrucao: TStringField;
    mTalaoQtdTalao: TIntegerField;
    mTalaoQtdPar: TIntegerField;
    BitBtn2: TBitBtn;
    mLote: TMemoryTable;
    mLoteReferencia: TStringField;
    mLoteConstrucao: TStringField;
    mLoteQtd: TIntegerField;
    msLote: TDataSource;
    RadioGroup2: TRadioGroup;
    BitBtn4: TBitBtn;
    RadioGroup3: TRadioGroup;
    mPedidoAux: TClientDataSet;
    mPedidoAuxNumPedido: TIntegerField;
    dsmPedidoAux: TDataSource;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    ckMetodo_Foto: TCheckBox;
    Label4: TLabel;
    ckIndividual: TCheckBox;
    mAuxImp: TClientDataSet;
    mAuxImpLote: TIntegerField;
    mAuxImpItem: TIntegerField;
    mAuxImpOrdem: TIntegerField;
    mAuxImpTipoTalao: TStringField;
    dsmAuxImp: TDataSource;
    mAuxImpCodTitulo_Via: TIntegerField;
    RxSpeedButton2: TRxSpeedButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
  private
    procedure Gera_Dados_Resumo;
    procedure Imprime_Resumo;
    procedure Imprime_Cab_Res;
    procedure Imprime_Det_Res;
    procedure Imprime_Rod_Res;
    procedure prc_Gravar_mAuxImp(Nome_Via : String ; CodTitulo_Via : Integer);
    { Private declarations }
  public
    { Public declarations }
    vQtdParesLote: Integer;
  end;

var
  fConsLote: TfConsLote;
  vLinha, vPagina, linha, pagina: Integer;
  F: TextFile;
  Texto: String;

implementation

uses UDM1, UQuant, UConsLoteSetorMI, UEscImpressora, UOpcaoTalao, URelTalaoMI, URelLote, UAgendaTelef, URelTalaoMI2,
  UConsLoteOpcao, URelTalaoMI3;

{$R *.DFM}

procedure TfConsLote.Gera_Dados_Resumo;
var
  vNomeConstrucao: String;
begin
  Screen.Cursor := crHourGlass;
  DM1.tProduto.IndexFieldNames    := 'Codigo';
  DM1.tConstrucao.IndexFieldNames := 'Codigo';
  mTalao.EmptyTable;
  DM1.tTalaoMI.First;
  while not DM1.tTalaoMI.Eof do
  begin
    vNomeConstrucao := '';
    DM1.tProduto.SetKey;
    DM1.tProdutoCodigo.AsInteger := DM1.tTalaoMICodProduto.AsInteger;
    if DM1.tProduto.GotoKey then
    begin
      DM1.tConstrucao.SetKey;
      DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
      if DM1.tConstrucao.GotoKey then
        vNomeConstrucao := DM1.tConstrucaoNome.AsString;
    end;
    if mTalao.Locate('Construcao',vNomeConstrucao,[loCaseInsensitive]) then
    begin
      mTalao.Edit;
      mTalaoQtdTalao.AsInteger := mTalaoQtdTalao.AsInteger + 1;
      mTalaoQtdPar.AsInteger   := mTalaoQtdPar.AsInteger + DM1.tTalaoMIQtdPar.AsInteger;
      mTalao.Post;
    end
    else
    begin
      mTalao.Insert;
      mTalaoConstrucao.AsString := vNomeConstrucao;
      mTalaoQtdTalao.AsInteger  := 1;
      mTalaoQtdPar.AsInteger    := DM1.tTalaoMIQtdPar.AsInteger;
      mTalao.Post;
    end;
    DM1.tTalaoMI.Next;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfConsLote.Imprime_Cab_Res;
var
 i: Integer;
 texto1: String;
begin
  Write(F,#18);
  vPagina := vPagina + 1;
  if vPagina > 1 then
  begin
    while vLinha < 66 do
    begin
      vLinha := vLinha + 1;
      Writeln(F);
    end;
  end;
  Texto1 := DM1.tEmpresaEmpresa.AsString;
  for i := 1 to 64 - Length(texto1) do
    Texto1 := Texto1 + ' ';
  texto1 := Texto1 + 'Pag.: ' + IntToStr(vPagina);
  Writeln(F,Texto1);

  Texto1 := ' ';
  for i := 1 to 32 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'RESUMO DE TALOES';
  for i := 1 to 64 - Length(Texto1) do
    Texto1 := Texto1 + ' ';
  Texto1 := Texto1 + 'Data: ' + DateToStr(Date);
  Writeln(F,Texto1);

  Writeln(F,'--------------------------------------------------------------------------------');
  Writeln(F,'Construcao                                        Qtd. de Taloes   Qtd. de Pares');
  Writeln(F,'--------------------------------------------------------------------------------');

  vLinha := 5;
end;

procedure TfConsLote.Imprime_Det_Res;
var
  Texto1, Texto2: String;
  i: Integer;
begin
  Texto2 := Copy(mTalaoConstrucao.AsString,1,20);
  for i := 1 to 50 - Length(Texto2) do
    Texto2 := Texto2 + ' ';
  Texto1 := Texto2;
  texto2 := mTalaoQtdTalao.AsString;
  for i := 1 to 14 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  Texto2 := mTalaoQtdPar.AsString;
  for i := 1 to 16 - Length(Texto2) do
    Texto2 := ' ' + Texto2;
  Texto1 := Texto1 + Texto2;
  writeln(F,Texto1);
  vLinha := vLinha + 1;
end;

procedure TfConsLote.Imprime_Rod_Res;
var
  Texto1: String;
begin
  Writeln(F,'--------------------------------------------------------------------------------');
  Texto1 := 'Total de Pares: ' + IntToStr(DM1.tLoteMIQtdPares.AsInteger);
  Writeln(F,Texto1);
  vLinha := vLinha + 2;
  while vlinha < 66 do
  begin
    vLinha := vLinha + 1;
    Writeln(F);
  end;
end;

procedure TfConsLote.Imprime_Resumo;
begin
  fEscImpressora := TfEscImpressora.Create(Self);
  fEscImpressora.ShowModal;
  vLinha         := 99;
  vPagina        := 0;
  AssignFile(F,DM1.tImpressoraEndereco.AsString);
  ReWrite(F);
  if not DM1.tImpressoraVisualizar.AsBoolean then
    Write(F,#15);
  mTalao.First;
  while not mTalao.EOF do
  begin
    if vLinha > 61 then
      Imprime_Cab_Res;
    Imprime_Det_Res;
    mTalao.Next;
  end;
  Imprime_Rod_Res;
  CloseFile(F);
  if DM1.tImpressoraVisualizar.AsBoolean then
  begin
    Texto := DM1.tImpressoraPrograma.AsString + '.EXE ' + DM1.tImpressoraEndereco.AsString;
    //WinExec(PChar(Texto),SW_MAXIMIZE);
    ShellExecute(Application.Handle, 'Open', PChar(DM1.tImpressoraEndereco.AsString), nil, nil, SW_SHOWMAXIMIZED);
  end;
end;

procedure TfConsLote.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsLote.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
  begin
    DM1.tLotePedidoMI.First;
    while not DM1.tLotePedidoMI.EOF do
    begin
      DM1.tPedido.IndexFieldNames := 'Pedido';
      DM1.tPedido.SetKey;
      DM1.tPedidoPedido.AsInteger := DM1.tLotePedidoMIPedido.AsInteger;
      if DM1.tPedido.GotoKey then
      begin
        DM1.tPedido.Edit;
        DM1.tPedidoNumLote.AsInteger   := 0;
        DM1.tPedidoGerarLote.AsInteger := 2;
        DM1.tPedido.Post;
      end;
      DM1.tLotePedidoMI.Delete;
    end;
    DM1.tLoteSetorMI.First;
    while not DM1.tLoteSetorMI.EOF do
      DM1.tLoteSetorMI.Delete;
    DM1.tTalaoMI.First;
    while not DM1.tTalaoMI.EOF do
    begin
      DM1.tTalaoGradeMI.First;
      while not DM1.tTalaoGradeMI.EOF do
        DM1.tTalaoGradeMI.Delete;
      DM1.tTalaoMI.Delete;
    end;
    DM1.tLoteMI.Delete;
  end;
end;

procedure TfConsLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
  begin
    Dm1.tProduto.Close;
    Dm1.tConstrucao.Close;
    Dm1.tTalaoMI.Close;
    DM1.tTalaoGradeMI.Close;
    Dm1.tPedido.Close;
    DM1.tPedidoItem.Close;
    DM1.tPedidoMaterial.Close;
    DM1.tPedidoGrade.Close;
    Dm1.tLoteMI.Close;
    Dm1.tLotePedidoMI.Close;
    Dm1.tLoteSetorMI.Close;
    DM1.tGrade.Close;
    DM1.tGradeItem.Close;
    DM1.tMaterial.Close;
    DM1.tCor.Close;
    DM1.tPosicao.Close;
    DM1.tGrupo.Close;
    DM1.tSubGrupo.Close;
    DM1.tSetor.Close;
    DM1.tAtelier.Close;
  end;
  Action := Cafree;
end;

procedure TfConsLote.FormShow(Sender: TObject);
begin
  Dm1.tProduto.Open;
  Dm1.tConstrucao.Open;
  Dm1.tTalaoMI.Open;
  DM1.tTalaoGradeMI.Open;
  Dm1.tPedido.Open;
  DM1.tPedidoItem.Open;
  DM1.tPedidoMaterial.Open;
  DM1.tPedidoGrade.Open;
  Dm1.tLoteMI.Open;
  Dm1.tLotePedidoMI.Open;
  Dm1.tLoteSetorMI.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tMaterial.Open;
  DM1.tCor.Open;
  DM1.tPosicao.Open;
  DM1.tGrupo.Open;
  DM1.tSubGrupo.Open;
  DM1.tSetor.Open;
  DM1.tAtelier.Open;

  DM1.tLoteMI.Refresh;
  DM1.tLotePedidoMI.Refresh;

  WindowState := wsMaximized;
end;

procedure TfConsLote.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo1.Text;
end;

procedure TfConsLote.Edit1Change(Sender: TObject);
begin
  try
    DM1.tLoteMI.IndexFieldNames := 'Lote';
    DM1.tLoteMI.FindNearest([Edit1.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfConsLote.Imprimir1Click(Sender: TObject);
var
  vNovo: Boolean;
begin
  vTalaoInicial  := 0;
  vTalaoFinal    := 0;
  vimprimeFolha1 := False;
  if MessageDlg('Imprimir o Lote '+DM1.tLoteMILote.AsString+' ?', mtConfirmation,[mbOk,mbNo],0)=mrNo then
    exit;
  vNovo := False;
  if MessageDlg('Imprimir no layout novo?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    vNovo := True;

  fOpcaoTalao := TfOpcaoTalao.Create(Self);
  fOpcaoTalao.ShowModal;
  DM1.tLoteMI.Edit;
  DM1.tLoteMIImpresso.AsBoolean := True;
  DM1.tLoteMI.Post;
  DM1.tLotePedidoMI.First;
  DM1.tTalaoMI.Filtered := False;
  DM1.tTalaoMI.Filter   := 'Item >= '''+IntToStr(vTalaoInicial)+''' and Item <= '''+IntToStr(vTalaoFinal)+'''';
  DM1.tTalaoMI.Filtered := True;

  //22/08/2015
  //Gravar primeiro em uma tabela auxiliar
  mAuxImp.EmptyDataSet;
  DM1.tTalaoMI.First;
  while not DM1.tTalaoMI.Eof do
  begin
    //prc_Gravar_mAuxImp(ComboBox1.Text);

    mAuxImp.Insert;
    mAuxImpLote.AsInteger     := DM1.tTalaoMILote.AsInteger;
    mAuxImpItem.AsInteger     := DM1.tTalaoMIItem.AsInteger;
    mAuxImpOrdem.AsInteger    := 1;
    mAuxImpTipoTalao.AsString := 'Pre a';
    mAuxImp.Post;

    DM1.tTalaoMI.Next;
  end;
  //
  fRelTalaoMI3 := TfRelTalaoMI3.Create(Self);
  fRelTalaoMI3.vMetodoNovo_Imagem := ckMetodo_Foto.Checked;
  fRelTalaoMI3.vTitulo_Via    := 'Via Para ' + ComboBox1.Text;
  //fRelTalaoMI3.vCodTitulo_Via := ComboBox1.ItemIndex;
  fRelTalaoMI3.QuickRep2.Preview;
  fRelTalaoMI3.QuickRep2.Free;
  exit;


  if DM1.tTalaoMI.IsEmpty then
  begin
    ShowMessage('Talão inicial e final não existem na tabela');
    exit;
  end;

  if (vNovo) and (ComboBox1.ItemIndex = 0) then
  begin
    fRelTalaoMI2 := TfRelTalaoMI2.Create(Self);
    fRelTalaoMI2.vMetodoNovo_Imagem := ckMetodo_Foto.Checked;
    fRelTalaoMI2.QuickRep1.Preview;
    fRelTalaoMI2.QuickRep1.Free;
  end
  else
  begin
    if ComboBox1.ItemIndex < 4 then
    begin
      fRelTalaoMI := TfRelTalaoMI.Create(Self);
      fRelTalaoMI.vMetodoNovo_Imagem := ckMetodo_Foto.Checked;
    end
    else
    begin
      fRelTalaoMI3 := TfRelTalaoMI3.Create(Self);
      fRelTalaoMI3.vMetodoNovo_Imagem := ckMetodo_Foto.Checked;
    end;
    Case ComboBox1.ItemIndex of
      0: begin
            fRelTalaoMI.QuickRep1.Preview;
            fRelTalaoMI.QuickRep1.Free;
          end;
      1: begin
            fRelTalaoMI.QuickRep2.Preview;
            fRelTalaoMI.QuickRep2.Free;
          end;
      2: begin
            fRelTalaoMI.QuickRep3.Preview;
            fRelTalaoMI.QuickRep3.Free;
          end;
      3: begin
            fRelTalaoMI.QuickRep4.Preview;
            fRelTalaoMI.QuickRep4.Free;
          end;
      4,5,6: begin
            fRelTalaoMI3.vTitulo_Via    := 'Via Para ' + ComboBox1.Text;
            //fRelTalaoMI3.vCodTitulo_Via := ComboBox1.ItemIndex;
            fRelTalaoMI3.QuickRep2.Preview;
            fRelTalaoMI3.QuickRep2.Free;
          end;
    end;
  end;
  DM1.tTalaoMI.Filtered := False;
  DM1.tLoteMI.Refresh;
end;

procedure TfConsLote.DBGrid1DblClick(Sender: TObject);
begin
  fConsLoteSetorMI := TfConsLoteSetorMI.Create(Self);
  fConsLoteSetorMI.ShowModal;
end;

procedure TfConsLote.BitBtn1Click(Sender: TObject);
begin
  if not DM1.tLoteMI.IsEmpty then
  begin
    Gera_Dados_Resumo;
    Imprime_Resumo;
  end
  else
    ShowMessage('Não um lote para gerar este relatório!');
end;

procedure TfConsLote.BitBtn2Click(Sender: TObject);
var
  vNomeConstrucao: String;
  vReferencia    : String;
  vImprimir      : Boolean;
begin
  Screen.Cursor := crHourGlass;
  vQtdParesLote := 0;
  DM1.tProduto.IndexFieldNames    := 'Codigo';
  DM1.tConstrucao.IndexFieldNames := 'Codigo';
  mLote.EmptyTable;
  DM1.tTalaoMI.First;
  while not DM1.tTalaoMI.Eof do
  begin
    vImprimir := True;
    if (CheckBox1.Checked) and (mPedidoAux.Locate('NumPedido',DM1.tTalaoMINumPedido.AsInteger,[loCaseInsensitive])) then
      vImprimir := False;

    if vImprimir then
    begin
      vQtdParesLote := vQtdParesLote + DM1.tTalaoMIQtdPar.AsInteger; 

      vNomeConstrucao := '';
      DM1.tProduto.SetKey;
      DM1.tProdutoCodigo.AsInteger := DM1.tTalaoMICodProduto.AsInteger;
      if DM1.tProduto.GotoKey then
      begin
        DM1.tConstrucao.SetKey;
        DM1.tConstrucaoCodigo.AsInteger := DM1.tProdutoCodConstrucao.AsInteger;
        if DM1.tConstrucao.GotoKey then
          vNomeConstrucao := DM1.tConstrucaoNome.AsString;
      end;
      case RadioGroup2.ItemIndex of
        0: vReferencia := DM1.tTalaoMIlkReferencia.AsString;
        1: vReferencia := DM1.tTalaoMIlkNomeModelo.AsString;
      end;
      if mLote.Locate('Referencia;Construcao',VarArrayOf([vReferencia,vNomeConstrucao]),[locaseinsensitive]) then
      begin
        mLote.Edit;
        mLoteQtd.AsInteger := mLoteQtd.AsInteger + DM1.tTalaoMIQtdPar.AsInteger;
        mLote.Post;
      end
      else
      begin
        mLote.Insert;
        mLoteReferencia.AsString := vReferencia;
        mLoteConstrucao.AsString := vNomeConstrucao;
        mLoteQtd.AsInteger       := DM1.tTalaoMIQtdPar.AsInteger;
        mLote.Post;
      end;
    end;
    DM1.tTalaoMI.Next;
  end;
  Screen.Cursor := crDefault;
  fRelLote      := TfRelLote.Create(Self);
  fRelLote.QuickRep1.Preview;
  fRelLote.QuickRep1.Free;
end;

procedure TfConsLote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end;
end;

procedure TfConsLote.BitBtn5Click(Sender: TObject);
begin
  if not CheckBox1.Checked then
  begin
    ShowMessage('Marcar a opção acima para poder informar os pedidos!');
    exit;
  end;
  fConsLoteOpcao := TfConsLoteOpcao.Create(Self);
  fConsLoteOpcao.ShowModal;
end;

procedure TfConsLote.FormCreate(Sender: TObject);
begin
  Position := poDefault;
end;

procedure TfConsLote.prc_Gravar_mAuxImp(Nome_Via : String ; CodTitulo_Via : Integer);
begin
  mAuxImp.Insert;
  mAuxImpLote.AsInteger          := DM1.tTalaoMILote.AsInteger;
  mAuxImpItem.AsInteger          := DM1.tTalaoMIItem.AsInteger;
  mAuxImpOrdem.AsInteger         := CodTitulo_Via;
  mAuxImpTipoTalao.AsString      := Nome_Via;
  mAuxImpCodTitulo_Via.AsInteger := CodTitulo_Via;
  mAuxImp.Post;
end;

procedure TfConsLote.RxSpeedButton2Click(Sender: TObject);
var
  vNovo: Boolean;
  vImpIndice : Integer;
begin
  vTalaoInicial  := 0;
  vTalaoFinal    := 0;
  vimprimeFolha1 := False;
  if MessageDlg('Imprimir o Lote '+DM1.tLoteMILote.AsString+' ?', mtConfirmation,[mbOk,mbNo],0)=mrNo then
    exit;
  vNovo := False;
  if MessageDlg('Imprimir no layout novo?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    vNovo := True;

  fOpcaoTalao := TfOpcaoTalao.Create(Self);
  fOpcaoTalao.ShowModal;
  DM1.tLoteMI.Edit;
  DM1.tLoteMIImpresso.AsBoolean := True;
  DM1.tLoteMI.Post;
  DM1.tLotePedidoMI.First;
  DM1.tTalaoMI.Filtered := False;
  DM1.tTalaoMI.Filter   := 'Item >= '''+IntToStr(vTalaoInicial)+''' and Item <= '''+IntToStr(vTalaoFinal)+'''';
  DM1.tTalaoMI.Filtered := True;

  //22/08/2015
  //Gravar primeiro em uma tabela auxiliar
  vImpIndice := ComboBox2.ItemIndex;
  if not ckIndividual.Checked then
  begin
    if ComboBox2.ItemIndex in [1,3,5,7,9] then
      vImpIndice := ComboBox2.ItemIndex - 1;
  end;
  mAuxImp.EmptyDataSet;
  DM1.tTalaoMI.First;
  while not DM1.tTalaoMI.Eof do
  begin
    //prc_Gravar_mAuxImp(ComboBox2.Items[ComboBox2.ItemIndex],ComboBox2.ItemIndex);
    prc_Gravar_mAuxImp(ComboBox2.Items[vImpIndice],vImpIndice);
    if not(ckIndividual.Checked) and (vImpIndice < 10) then
      prc_Gravar_mAuxImp(ComboBox2.Items[vImpIndice + 1],vImpIndice+1);
    DM1.tTalaoMI.Next;
  end;
  //
  fRelTalaoMI3 := TfRelTalaoMI3.Create(Self);
  fRelTalaoMI3.vMetodoNovo_Imagem := ckMetodo_Foto.Checked;
  fRelTalaoMI3.vTitulo_Via    := 'Via Para ' + ComboBox1.Text;
  //fRelTalaoMI3.vCodTitulo_Via := ComboBox1.ItemIndex;
  fRelTalaoMI3.QuickRep2.Preview;
  fRelTalaoMI3.QuickRep2.Free;
  DM1.tTalaoMI.Filtered := False;
  DM1.tLoteMI.Refresh;

  {if DM1.tTalaoMI.IsEmpty then
  begin
    ShowMessage('Talão inicial e final não existem na tabela');
    exit;
  end;

  if (vNovo) and (ComboBox1.ItemIndex = 0) then
  begin
    fRelTalaoMI2 := TfRelTalaoMI2.Create(Self);
    fRelTalaoMI2.vMetodoNovo_Imagem := ckMetodo_Foto.Checked;
    fRelTalaoMI2.QuickRep1.Preview;
    fRelTalaoMI2.QuickRep1.Free;
  end
  else
  begin
    if ComboBox1.ItemIndex < 4 then
    begin
      fRelTalaoMI := TfRelTalaoMI.Create(Self);
      fRelTalaoMI.vMetodoNovo_Imagem := ckMetodo_Foto.Checked;
    end
    else
    begin
      fRelTalaoMI3 := TfRelTalaoMI3.Create(Self);
      fRelTalaoMI3.vMetodoNovo_Imagem := ckMetodo_Foto.Checked;
    end;
    Case ComboBox1.ItemIndex of
      0: begin
            fRelTalaoMI.QuickRep1.Preview;
            fRelTalaoMI.QuickRep1.Free;
          end;
      1: begin
            fRelTalaoMI.QuickRep2.Preview;
            fRelTalaoMI.QuickRep2.Free;
          end;
      2: begin
            fRelTalaoMI.QuickRep3.Preview;
            fRelTalaoMI.QuickRep3.Free;
          end;
      3: begin
            fRelTalaoMI.QuickRep4.Preview;
            fRelTalaoMI.QuickRep4.Free;
          end;
      4,5,6: begin
            fRelTalaoMI3.vTitulo_Via    := 'Via Para ' + ComboBox1.Text;
            fRelTalaoMI3.vCodTitulo_Via := ComboBox1.ItemIndex;
            fRelTalaoMI3.QuickRep2.Preview;
            fRelTalaoMI3.QuickRep2.Free;
          end;
    end;
  end;
  DM1.tTalaoMI.Filtered := False;
  DM1.tLoteMI.Refresh;}
end;

end.
