unit UProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, DBCtrls, StdCtrls, Buttons, Mask,
  ToolEdit, CurrEdit, ComCtrls, Db, DBTables, RXLookup, Grids, DBGrids, DBVGrids, MemTable, RxDBComb, ExtDlgs, DBFilter,
  JPEG, RXCtrls, Menus, RXDBCtrl, Variants, RzDBCmbo;

type
  TfProduto = class(TForm)
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
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    tProdutoIns: TTable;
    SpeedButton4: TSpeedButton;
    tProdutoInsCodigo: TIntegerField;
    tProdutoInsCodGrupo: TIntegerField;
    tProdutoInsCodSubGrupo: TIntegerField;
    tProdutoInsNome: TStringField;
    tProdutoInsUnidade: TStringField;
    tProdutoInsCodSitTrib: TIntegerField;
    tProdutoInsQParTalao: TFloatField;
    tProdutoInsPesoLiquido: TFloatField;
    tProdutoInsPesoBruto: TFloatField;
    tProdutoInsCodClasFiscal: TStringField;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    tProdutoInsCodGrade: TIntegerField;
    Label10: TLabel;
    SpeedButton6: TSpeedButton;
    GroupBox2: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    tProdutoInsLancaGrade: TBooleanField;
    tProdutoInsInativo: TBooleanField;
    DBRadioGroup1: TDBRadioGroup;
    OpenPictureDialog1: TOpenPictureDialog;
    Label16: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    SpeedButton7: TSpeedButton;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    DBGrid1: TDBGrid;
    StaticText1: TStaticText;
    BitBtn13: TBitBtn;
    Label17: TLabel;
    DBEdit9: TDBEdit;
    Label18: TLabel;
    SpeedButton9: TSpeedButton;
    Label19: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    tProdutoInsConsumo: TStringField;
    tProdutoInsAliqIcms: TFloatField;
    tProdutoInsAliqIPI: TFloatField;
    tProdutoInsNomeExp: TStringField;
    tProdutoInsCodModelista: TIntegerField;
    tProdutoInsComissaoMod: TFloatField;
    tProdutoInsDescMaterial: TStringField;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    RxDBLookupCombo7: TRxDBLookupCombo;
    RxDBLookupCombo10: TRxDBLookupCombo;
    RxDBLookupCombo11: TRxDBLookupCombo;
    tProdutoInsVlrAtelier: TFloatField;
    Label22: TLabel;
    DBEdit13: TDBEdit;
    Label23: TLabel;
    DBEdit14: TDBEdit;
    Label24: TLabel;
    Label25: TLabel;
    DBEdit16: TDBEdit;
    RxSpeedButton1: TRxSpeedButton;
    TabSheet3: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    SpeedButton10: TSpeedButton;
    BitBtn17: TBitBtn;
    StaticText8: TStaticText;
    CurrencyEdit4: TCurrencyEdit;
    RxDBLookupCombo13: TRxDBLookupCombo;
    StaticText9: TStaticText;
    RxDBLookupCombo14: TRxDBLookupCombo;
    StaticText10: TStaticText;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    RxDBFilter2: TRxDBFilter;
    TabSheet4: TTabSheet;
    Panel6: TPanel;
    DBMemo1: TDBMemo;
    Label26: TLabel;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    Edit2: TEdit;
    Label28: TLabel;
    RxDBLookupCombo16: TRxDBLookupCombo;
    qMat: TQuery;
    qsMat: TDataSource;
    BitBtn16: TBitBtn;
    Label29: TLabel;
    BitBtn20: TBitBtn;
    DBEdit17: TDBEdit;
    OpenPictureDialog2: TOpenPictureDialog;
    Meta: TTabSheet;
    Label30: TLabel;
    RxDBLookupCombo18: TRxDBLookupCombo;
    Label31: TLabel;
    RxDBLookupCombo19: TRxDBLookupCombo;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    CurrencyEdit5: TCurrencyEdit;
    Label32: TLabel;
    BitBtn21: TBitBtn;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    RxDBGrid2: TRxDBGrid;
    Label33: TLabel;
    RxDBLookupCombo20: TRxDBLookupCombo;
    qConstr: TQuery;
    qsConstr: TDataSource;
    DBRadioGroup2: TDBRadioGroup;
    Label34: TLabel;
    RxDBLookupCombo21: TRxDBLookupCombo;
    Tamanhos: TTabSheet;
    Panel7: TPanel;
    Label36: TLabel;
    RxDBLookupCombo22: TRxDBLookupCombo;
    qTamanhos: TQuery;
    qTamanhosTamanho: TStringField;
    qsTamanhos: TDataSource;
    VDBGrid1: TVDBGrid;
    BitBtn22: TBitBtn;
    SpeedButton17: TSpeedButton;
    Label37: TLabel;
    DBEdit18: TDBEdit;
    Label38: TLabel;
    DBEdit19: TDBEdit;
    RxDBLookupCombo23: TRxDBLookupCombo;
    SpeedButton18: TSpeedButton;
    Label35: TLabel;
    RxDBLookupCombo24: TRxDBLookupCombo;
    Label39: TLabel;
    DBDateEdit1: TDBDateEdit;
    BitBtn24: TBitBtn;
    RxDBFilter3: TRxDBFilter;
    qConstrCodigo: TIntegerField;
    qConstrNome: TStringField;
    BitBtn10: TBitBtn;
    DBCheckBox3: TDBCheckBox;
    TabSheet2: TTabSheet;
    Label40: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    BitBtn11: TBitBtn;
    SpeedButton16: TSpeedButton;
    SpeedButton20: TSpeedButton;
    RxDBGrid3: TRxDBGrid;
    StaticText2: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    TabSheet5: TTabSheet;
    RxDBGrid4: TRxDBGrid;
    Panel8: TPanel;
    SpeedButton19: TSpeedButton;
    BitBtn12: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    RxDBLookupCombo3: TRxDBLookupCombo;
    StaticText4: TStaticText;
    BitBtn23: TBitBtn;
    RxDBFilter1: TRxDBFilter;
    StaticText3: TStaticText;
    CurrencyEdit2: TCurrencyEdit;
    RxDBFilter4: TRxDBFilter;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    TabSheet6: TTabSheet;
    Label8: TLabel;
    RxDBLookupCombo8: TRxDBLookupCombo;
    SpeedButton3: TSpeedButton;
    Label9: TLabel;
    RxDBLookupCombo9: TRxDBLookupCombo;
    SpeedButton5: TSpeedButton;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    Label15: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    Label41: TLabel;
    DBEdit15: TDBEdit;
    Label42: TLabel;
    RxDBLookupCombo12: TRxDBLookupCombo;
    Label43: TLabel;
    RxDBLookupCombo15: TRxDBLookupCombo;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    tProdutoInsReferencia: TStringField;
    tProdutoInsReferencia2: TStringField;
    Bevel1: TBevel;
    Image3: TImage;
    Label44: TLabel;
    BitBtn30: TBitBtn;
    DBEdit20: TDBEdit;
    Label45: TLabel;
    DBEdit21: TDBEdit;
    Label46: TLabel;
    DBEdit22: TDBEdit;
    Label47: TLabel;
    RxDBLookupCombo17: TRxDBLookupCombo;
    Label48: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure GroupBox2Exit(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure TabSheet2Enter(Sender: TObject);
    procedure DBCheckBox2Exit(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo2DropDown(Sender: TObject);
    procedure RxDBLookupCombo2CloseUp(Sender: TObject);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure RxDBLookupCombo5DropDown(Sender: TObject);
    procedure RxDBLookupCombo6DropDown(Sender: TObject);
    procedure RxDBLookupCombo6CloseUp(Sender: TObject);
    procedure RxDBLookupCombo7DropDown(Sender: TObject);
    procedure RxDBLookupCombo7CloseUp(Sender: TObject);
    procedure RxDBLookupCombo10DropDown(Sender: TObject);
    procedure RxDBLookupCombo10CloseUp(Sender: TObject);
    procedure RxDBLookupCombo11Exit(Sender: TObject);
    procedure RxDBLookupCombo11Enter(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure RxDBLookupCombo5Change(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure RxDBLookupCombo13Enter(Sender: TObject);
    procedure RxDBLookupCombo13Exit(Sender: TObject);
    procedure RxDBLookupCombo14Enter(Sender: TObject);
    procedure RxDBLookupCombo14Exit(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure RxDBLookupCombo18Enter(Sender: TObject);
    procedure RxDBLookupCombo18Exit(Sender: TObject);
    procedure RxDBLookupCombo19Enter(Sender: TObject);
    procedure RxDBLookupCombo19Exit(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure RxDBLookupCombo20Change(Sender: TObject);
    procedure RxDBLookupCombo21Enter(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo23Enter(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure Panel2Enter(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure Panel8Enter(Sender: TObject);
    procedure Panel8Exit(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure RxDBLookupCombo4Change(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vItem: Integer;
    vFotoJpeg: string;
    vConfirma: String[1];

    procedure Verifica_Material;
    procedure Habilita;
    procedure Opcoes;
    //procedure Posiciona_Foto;
    procedure Posiciona_Foto_Nova;
    procedure Verifica_Setores;
    procedure Limpa_Tabelas;
    procedure Abre_qTipoMaterial;
    procedure prc_Gravar_Produto_Tam;

  public
    { Public declarations }
  end;

var
  fProduto: TfProduto;

implementation

uses UGrupos, UDM1, USubGrupos, UFornecedores, UGrade, UCor, UClasFiscal, USitTributaria, UProdutoGrade, UMaterial,
  UModelista, URelFichaTecnica, UDM2, USetor, UPosicao, UAgendaTelef, UConstrucao, UProdutoComb, UConfirmaProduto,
  UTipoMaterial, UDMTabImposto, UCSTIPI, USitTributariaSimples, UOrigemProd, uIntegracao, uUtilPadrao, UConsProduto,
  UDMTabEnqIPI, USel_EnqIPI;

{$R *.DFM}

procedure TfProduto.Abre_qTipoMaterial;
begin
  DM2.qTipoMaterial.Close;
  DM2.qTipoMaterial.ParamByName('Tipo').AsString := 'P';
  DM2.qTipoMaterial.Open;
end;

procedure TfProduto.Verifica_Material;
begin
  RxDBFilter3.Active := True;
  DM1.tProdutoCor.First;
  while not DM1.tProdutoCor.Eof do
    begin
      if DM1.tProdutoMat.RecordCount > 28 then
        begin
          ShowMessage('Cor: ' + DM1.tProdutoCorlkNomeCor.AsString + ' com mais de 28 materiais!');
          RxDBFilter3.Active := False;
          DM1.tProdutoCor.Last;
        end;
      DM1.tProdutoCor.Next;
    end;
  RxDBFilter3.Active := False;
end;


procedure TfProduto.Habilita;
begin
  Panel2.Enabled            := not(Panel2.Enabled);
  Panel4.Enabled            := not(Panel4.Enabled);
  Panel6.Enabled            := not(Panel6.Enabled);
  Panel7.Enabled            := not(Panel7.Enabled);
  BitBtn1.Enabled           := not(BitBtn1.Enabled);
  BitBtn2.Enabled           := not(BitBtn2.Enabled);
  BitBtn3.Enabled           := not(BitBtn3.Enabled);
  BitBtn4.Enabled           := not(BitBtn4.Enabled);
  BitBtn5.Enabled           := not(BitBtn5.Enabled);
  BitBtn6.Enabled           := not(BitBtn6.Enabled);
  BitBtn7.Enabled           := not(BitBtn7.Enabled);
  BitBtn8.Enabled           := not(BitBtn8.Enabled);
  BitBtn9.Enabled           := not(BitBtn9.Enabled);
  BitBtn10.Enabled          := not(BitBtn10.Enabled);
  BitBtn11.Enabled          := not(BitBtn11.Enabled);
  BitBtn12.Enabled          := not(BitBtn12.Enabled);
  BitBtn13.Enabled          := not(BitBtn13.Enabled);
  BitBtn14.Enabled          := not(BitBtn14.Enabled);
  BitBtn15.Enabled          := not(BitBtn15.Enabled);
  BitBtn17.Enabled          := not(BitBtn17.Enabled);
  BitBtn18.Enabled          := not(BitBtn18.Enabled);
  BitBtn19.Enabled          := not(BitBtn19.Enabled);
  BitBtn21.Enabled          := not(BitBtn21.Enabled);
  BitBtn23.Enabled          := not(BitBtn23.Enabled);
  BitBtn30.Enabled          := not(BitBtn30.Enabled);
  CurrencyEdit1.Enabled     := not(CurrencyEdit1.Enabled);
  CurrencyEdit2.Enabled     := not(CurrencyEdit2.Enabled);
  CurrencyEdit4.Enabled     := not(CurrencyEdit4.Enabled);
  CurrencyEdit5.Enabled     := not(CurrencyEdit5.Enabled);
  DBNavigator1.Enabled      := not(DBNavigator1.Enabled);
  RxDBLookupCombo1.Enabled  := not(RxDBLookupCombo1.Enabled);
  RxDBLookupCombo2.Enabled  := not(RxDBLookupCombo2.Enabled);
  RxDBLookupCombo3.Enabled  := not(RxDBLookupCombo3.Enabled);
  RxDBLookupCombo13.Enabled := not(RxDBLookupCombo13.Enabled);
  RxDBLookupCombo14.Enabled := not(RxDBLookupCombo14.Enabled);
  RxDBLookupCombo18.Enabled := not(RxDBLookupCombo18.Enabled);
  RxDBLookupCombo19.Enabled := not(RxDBLookupCombo19.Enabled);
  SpeedButton7.Enabled      := not(SpeedButton7.Enabled);
  SpeedButton8.Enabled      := not(SpeedButton8.Enabled);
  SpeedButton10.Enabled     := not(SpeedButton10.Enabled);
  SpeedButton11.Enabled     := not(SpeedButton11.Enabled);
  SpeedButton12.Enabled     := not(SpeedButton12.Enabled);
  SpeedButton13.Enabled     := not(SpeedButton13.Enabled);
  SpeedButton14.Enabled     := not(SpeedButton14.Enabled);
  SpeedButton15.Enabled     := not(SpeedButton15.Enabled);
  SpeedButton16.Enabled     := not(SpeedButton16.Enabled);
  SpeedButton19.Enabled     := not(SpeedButton19.Enabled);
  SpeedButton20.Enabled     := not(SpeedButton20.Enabled);
  TabSheet6.Enabled         := not(TabSheet6.Enabled);
end;

procedure TfProduto.Limpa_Tabelas;
begin
  DM1.tProdutoCor.First;
  while not DM1.tProdutoCor.Eof do
    begin
      DM1.tProdutoMat.First;
      while not DM1.tProdutoMat.Eof do
        begin
          DM1.tProdutoMatTam.First;
          while not DM1.tProdutoMatTam.Eof do
            DM1.tProdutoMatTam.Delete;
          DM1.tProdutoMat.Delete;
        end;
      DM1.tProdutoCor.Delete;
    end;
end;

procedure TfProduto.Verifica_Setores;
var
  vRepetido: array[1..8] of Integer;
  i: Integer;
begin
  for i := 1 to 8 do
    vRepetido[i] := 0;
  DM1.tProdutoSetor.First;
  while not DM1.tProdutoSetor.Eof do
  begin
    if not DM1.tProdutoSetorlkImpTalao.AsBoolean then
    begin
      ShowMessage('Este setor não pode ser gravado na ficha técnica!');
      vConfirma := 'N';
      DM1.tProdutoSetor.Last;
    end
    else
    if DM1.tProdutoSetorItem.AsInteger > DM1.tProdutoSetor.RecordCount then
    begin
      ShowMessage('Nº da ordem maior que setores existentes!');
      vConfirma := 'N';
      DM1.tProdutoSetor.Last;
    end
    else
      vRepetido[DM1.tProdutoSetorItem.AsInteger] := vRepetido[DM1.tProdutoSetorItem.AsInteger] + 1;
    DM1.tProdutoSetor.Next;
  end;
  if vConfirma = 'S' then
  begin
    for i := 1 to DM1.tProdutoSetor.RecordCount do
    begin
      if vRepetido[i] > 1 then
      begin
        ShowMessage('A ordem ' + IntToStr(i) + ' foi digitada mais de uma vez!');
        vConfirma := 'N';
      end
      else
      if vRepetido[i] = 0 then
      begin
        ShowMessage('A ordem ' + IntToStr(i) + ' não foi informada!');
        vConfirma := 'N';
      end;
    end;
  end;
end;

procedure TfProduto.Opcoes;
begin
  RxDbLookupCombo10.Enabled := DbCheckBox2.Checked;
end;

procedure Grava_Imagem_JPEG(Tabela:TTable;Campo:TBlobField;Foto:TImage;Dialog:TOpenPictureDialog);
var
  BS: TBlobStream;
  MinhaImagem: TJPEGImage;
begin
  Dialog.InitialDir := 'C:\';
  Dialog.Execute;
  if Dialog.FileName <> '' then
  begin
    if not (DM1.tProduto.State in [dsEdit, dsInsert]) then
      DM1.tProduto.Edit;
    BS := TBlobStream.Create((Campo as TBlobField), BMWrite);
    MinhaImagem := TJPEGImage.Create;
    MinhaImagem.LoadFromFile(Dialog.FileName);
    MinhaImagem.SaveToStream(BS);
    Foto.Picture.Assign(MinhaImagem);
    BS.Free;
    MinhaImagem.Free;
  end;
end;

procedure Le_Imagem_JPEG(Campo:TBlobField;Foto:TImage);
var
  BS: TBlobStream;
  MinhaImagem: TJPEGImage;
begin
  if Campo.AsString <> '' then
  begin
    BS := TBlobStream.Create((Campo as TBlobField), BMRead);
    MinhaImagem := TJPEGImage.Create;
    MinhaImagem.LoadFromStream(BS);
    Foto.Picture.Assign(MinhaImagem);
    BS.Free;
    MinhaImagem.Free;
  end
  else
    Foto.Picture.LoadFromFile('C:\');
end;

procedure Le_Imagem_JPEG2(Campo:TBlobField;Foto:TJPEGImage);
var
  BS: TBlobStream;
  MinhaImagem: TJPEGImage;
begin
  if Campo.AsString <> '' then
  begin
    BS := TBlobStream.Create((Campo as TBlobField), BMRead);
    MinhaImagem := TJPEGImage.Create;
    MinhaImagem.LoadFromStream(BS);
    Foto.Assign(MinhaImagem);
    BS.Free;
    MinhaImagem.Free;
  end
  else
    Foto.LoadFromFile('C:\');
end;

{procedure TfProduto.Posiciona_Foto;
begin
  if DM1.tProdutoFotoJpeg.IsNull then
    Image1.Picture := nil
  else
    Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,Image1);
end;}

procedure TfProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  RxDBFilter2.Active := False;
  DM2.qTipoMaterial.Close;
  DM1.tConstrucaoMat.Filtered := False;
  qTamanhos.Close;
  DM1.tProduto.Filtered := False;
  DM1.tProduto.IndexFieldNames := 'Codigo';
  if Screen.FormCount < 3 then
  begin
    DM1.tProdutoMatTam.Close;
    Dm1.tProdutoSetor.Close;
    Dm1.tAtelier.Close;
    Dm1.tProdutoMeta.Close;
    Dm1.tSetor.Close;
    DM1.tGrupo.Close;
    DM1.tCor.Close;
    DM1.tClasFiscal.Close;
    DM1.tSitTributaria.Close;
    DM1.tGrade.Close;
    DM1.tGradeItem.Close;
    DM1.tProdutoMat.Close;
    DM1.tProdutoCor.Close;
    DM1.tProdutoTam.Close;
    DM1.tProdutoTipoMat.Close;
    DM1.tProdutoSetorAux.Close;
    DM1.tProduto.Close;
    DM1.tFornecedores.Close;
    DM1.tConstrucaoMat.Close;
    DM1.tConstrucao.Close;
    DM1.tConstrucaoGrupo.Close;
    DM1.tUF.Close;
  end;
    
  if DMTabImposto.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabImposto);
  if DMTabEnqIPI.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMTabEnqIPI);

  Action := Cafree;
end;

procedure TfProduto.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfProduto.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioGrupos.AsBoolean then
    begin
      fGrupos := TfGrupos.Create(Self);
      fGrupos.ShowModal;
      DM1.tGrupo.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de grupos!');
end;

procedure TfProduto.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsProduto.AsBoolean then
  begin
    DM1.tProduto.IndexFieldNames := 'Codigo';
    tProdutoIns.IndexFieldNames  := 'Codigo';
    tProdutoIns.Refresh;
    tProdutoIns.Last;
    DM1.tProduto.Refresh;
    DM1.tProduto.Insert;
    DM1.tProdutoCodigo.AsInteger     := tProdutoInsCodigo.AsInteger + 1;
    DM1.tProdutoInativo.AsBoolean    := False;
    DM1.tProdutoConsumo.AsString     := '0';
    DM1.tProdutoLancaGrade.AsBoolean := True;
    DM1.tProdutoMercado.AsString     := 'I';
    DM1.tProdutoProdMat.AsString     := 'P';
    DM1.tProduto.Post;
    DM1.tProduto.Edit;
    Habilita;
    Opcoes;
    DBEdit1.SetFocus;
    PageControl1.ActivePage := TabSheet1;
    Image3.Picture := nil;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfProduto.BitBtn2Click(Sender: TObject);
begin
  if DM1.tUsuarioAltProduto.AsBoolean then
  begin
    BitBtn2.Tag := 1;
    vFotoJpeg   := DM1.tProdutoFotoJpeg.AsString;
    DM1.tProduto.Edit;
    Habilita;
    DBEdit1.SetFocus;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfProduto.BitBtn4Click(Sender: TObject);
begin
  if BitBtn2.Tag = 1 then
  begin
    vConfirma := 'S';
    Verifica_Setores;
    if vConfirma = 'N' then
      PageControl1.ActivePage := TabSheet3
    else
    begin
      DM1.tProdutoFotoJpeg.AsString := vFotoJpeg;
      //Posiciona_Foto;
      Posiciona_Foto_Nova;
      DM1.tProduto.Cancel;
      Habilita;
      PageControl1.ActivePage := TabSheet1;
      BitBtn2.Tag := 0;
    end;
  end
  else
  if BitBtn2.Tag = 0 then
  begin
    DM1.tProdutoSetor.First;
    while not DM1.tProdutoSetor.Eof do
      DM1.tProdutoSetor.Delete;
    DM1.tProdutoCor.First;
    while not DM1.tProdutoCor.Eof do
    begin
      DM1.tProdutoMat.First;
      while not DM1.tProdutoMat.Eof do
      begin
        DM1.tProdutoMatTam.First;
        while not DM1.tProdutoMatTam.Eof do
          DM1.tProdutoMatTam.Delete;
        DM1.tProdutoMat.Delete;
      end;
      DM1.tProdutoCor.Delete;
    end;
    DM1.tProdutoTipoMat.First;
    while not DM1.tProdutoTipoMat.Eof do
      DM1.tProdutoTipoMat.Delete;
    DM1.tProduto.Delete;
    Habilita;
    PageControl1.ActivePage := TabSheet1;
    BitBtn2.Tag := 0;
  end;
  //Posiciona_Foto;
  Posiciona_Foto_Nova;
end;

procedure TfProduto.BitBtn3Click(Sender: TObject);
var
  vCodigo: Integer;
begin
  if DM1.tUsuarioExcProduto.AsBoolean then
  begin
    if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    begin
      DM1.tProdutoSetor.First;
      while not DM1.tProdutoSetor.Eof do
        DM1.tProdutoSetor.Delete;
      DM1.tProdutoCor.First;
      while not DM1.tProdutoCor.Eof do
      begin
        DM1.tProdutoMat.First;
        while not DM1.tProdutoMat.Eof do
        begin
          DM1.tProdutoMatTam.First;
          while not DM1.tProdutoMatTam.Eof do
            DM1.tProdutoMatTam.Delete;
          DM1.tProdutoMat.Delete;
        end;
        DM1.tProdutoCor.Delete;
      end;
      DM1.tProdutoTipoMat.First;
      while not DM1.tProdutoTipoMat.Eof do
        DM1.tProdutoTipoMat.Delete;
      vCodigo := DM1.tProdutoCodigo.AsInteger;
      DM1.tProduto.Delete;
      Prc_Excluir_Produto_FB(vCodigo);
      DM1.tProduto.Refresh;
      DM1.tProdutoCor.Refresh;
      DM1.tProdutoMat.Refresh;
      DM1.tProdutoMatTam.Refresh;
      DM1.tProdutoTipoMat.Refresh;
      Posiciona_Foto_Nova;
    end;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfProduto.BitBtn5Click(Sender: TObject);
begin
  if trim(DM1.tProdutoOrigemProd.AsString) = '' then
  begin
    ShowMessage('Origem do produto não foi informada!');
    exit;
  end;
  if DM1.tProdutoQParTalao.AsFloat <= 0 then
  begin
    PageControl1.ActivePage := TabSheet2;
    DBEdit4.SetFocus;
    ShowMessage('O campo Qtd.Pares por Talão não pode ser igual a zero');
    exit;
  end;

  if DM1.tProduto.State in [dsEdit,dsInsert] then
  begin
    vConfirma := 'S';
    Verifica_Setores;
    if vConfirma = 'N' then
      PageControl1.ActivePage := TabSheet3
    else
    if vConfirma = 'S' then
    begin
      Verifica_Material;
      if vConfirma = 'S' then
      begin
        if DM1.tProdutoTam.RecordCount <= 0 then
          prc_Gravar_Produto_Tam;
        DM1.tProdutoConstrucao.AsString := '';
        if DM1.tProdutoCodConstrucao.AsInteger > 0 then
          if DM1.tConstrucao.Locate('Codigo',DM1.tProdutoCodConstrucao.AsInteger,[loCaseInsensitive]) then
            DM1.tProdutoConstrucao.AsString := DM1.tConstrucaoNome.AsString;
        DM1.tProduto.Post;
        Prc_Gravar_Produto_FB(DM1.tProdutoCodigo.AsInteger);
        DM1.tProduto.Refresh;
        DM1.tProdutoCor.Refresh;
        DM1.tProdutoMat.Refresh;
        DM1.tProdutoMatTam.Refresh;
        Habilita;
        BitBtn1.SetFocus;
        BitBtn2.Tag := 0;
      end;
      PageControl1.ActivePage := TabSheet1;
    end;
  end;
end;

procedure TfProduto.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioSubGrupo.AsBoolean then
  begin
    fSubGrupos := TfSubGrupos.Create(Self);
    fSubGrupos.ShowModal;
    DM1.tSubGrupo.Refresh;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de sub-grupos!');
end;

procedure TfProduto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tProduto.State in [dsEdit] then
  begin
    ShowMessage('Você deve Cancelar ou Confirmar o produto antes de fechar esta janela!');
    CanClose := False;
  end
  else
    CanClose := True;
end;

procedure TfProduto.SpeedButton3Click(Sender: TObject);
begin
  if DM1.tUsuarioClasFiscal.AsBoolean then
  begin
    fClasFiscal := TfClasFiscal.Create(Self);
    fClasFiscal.ShowModal;
    DM1.tClasFiscal.Refresh;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de Clas.fiscal!');
end;

procedure TfProduto.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioSitTrib.AsBoolean then
  begin
    fSitTributaria := TfSitTributaria.Create(Self);
    fSitTributaria.ShowModal;
    DM1.tSitTributaria.Refresh;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de Sit.Tributaria!');
end;

procedure TfProduto.SpeedButton6Click(Sender: TObject);
begin
  if DM1.tUsuarioGrade.AsBoolean then
  begin
    fGrade := TfGrade.Create(Self);
    fGrade.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de grades!');
end;

procedure TfProduto.SpeedButton7Click(Sender: TObject);
begin
  if DM1.tUsuarioCor.AsBoolean then
  begin
    fCor := TfCor.Create(Self);
    fCor.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de cores!');
end;

procedure TfProduto.BitBtn7Click(Sender: TObject);
begin
  if not (RxDBLookupCombo2.Text <> '') then
    ShowMessage('É obrigatório informar o nome da cor!')
  else
  begin
    DM1.tProdutoCor.SetKey;
    DM1.tProdutoCorCodProduto.AsInteger := DM1.tProdutoCodigo.AsInteger;
    if RxDBLookupCombo2.Text <> '' then
      DM1.tProdutoCorCodCor.AsInteger     := RxDBLookupCombo2.KeyValue;
    if DM1.tProdutoCor.GotoKey then
    begin
      ShowMessage('Esta cor já esta lançada para a referência!');
      RxDBLookupCombo2.ClearValue;
      RxDBLookupCombo2.SetFocus;
    end
    else
    begin
      DM1.tProdutoCor.Insert;
      DM1.tProdutoCorCodProduto.AsInteger := DM1.tProdutoCodigo.AsInteger;
      if RxDBLookupCombo2.Text <> '' then
        DM1.tProdutoCorCodCor.AsInteger := RxDBLookupCombo2.KeyValue;
      DM1.tProdutoCor.Post;
      RxDBLookupCombo2.ClearValue;
    end;
  end;
end;

procedure TfProduto.BitBtn8Click(Sender: TObject);
begin
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo2.SetFocus;
end;

procedure TfProduto.BitBtn9Click(Sender: TObject);
begin
  if not DM1.tProdutoCor.IsEmpty then
  begin
    if MessageDlg('Deseja realmente excluir esta cor?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    begin
      DM1.tProdutoMat.First;
      while not DM1.tProdutoMat.Eof do
      begin
        DM1.tProdutoMatTam.First;
        while not DM1.tProdutoMatTam.Eof do
          DM1.tProdutoMatTam.Delete;
        DM1.tProdutoMat.Delete;
      end;
      DM1.tProdutoCor.Delete;
    end;
  end
  else
    ShowMessage('Não há registro para ser excluído!');
end;

procedure TfProduto.GroupBox2Exit(Sender: TObject);
begin
  Opcoes;
end;

procedure TfProduto.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfProduto.TabSheet2Enter(Sender: TObject);
begin
  if DBCheckBox2.Checked then
    if RxDBLookupCombo10.Text = '' then
    begin
      ShowMessage('Esta faltando a grade!');
      RxDBLookupCombo10.SetFocus;
    end;
end;

procedure TfProduto.DBCheckBox2Exit(Sender: TObject);
begin
  if DBCheckBox2.Checked then
  begin
    RxDBLookupCombo10.Enabled := True;
    RxDBLookupCombo10.Refresh;
  end
  else
    RxDBLookupCombo10.Enabled := False;
end;

procedure TfProduto.BitBtn13Click(Sender: TObject);
begin
  //Grava_Imagem_JPEG(DM1.tProduto,DM1.tProdutoFotoJpeg,Image1,OpenPictureDialog1);
end;

procedure TfProduto.FormShow(Sender: TObject);
begin
  //NFe 2.0
  if not Assigned(DMTabImposto) then
    DMTabImposto := TDMTabImposto.Create(Self);
  if not Assigned(DMTabEnqIPI) then
    DMTabEnqIPI := TDMTabEnqIPI.Create(Self);

  DM1.tProduto.Open;
  DM1.tProdutoMatTam.Open;
  DM1.tGrupo.Open;
  DM1.tCor.Open;
  DM1.tClasFiscal.Open;
  DM1.tSitTributaria.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tProdutoCor.Open;
  DM1.tProdutoMat.Open;
  DM1.tProdutoTam.Open;
  DM1.tProdutoTipoMat.Open;
  Dm1.tFornecedores.Open;
  DM1.tUF.Open;
  Dm1.tProdutoSetor.Open;
  Dm1.tProdutoMeta.Open;
  DM1.tProdutoSetorAux.Open;
  Dm1.tAtelier.Open;
  Dm1.tSetor.Open;
  DM1.tConstrucao.Open;
  DM1.tConstrucaoMat.Open;
  DM1.tConstrucaoGrupo.Open;
  DM1.tMaterial.Open;
  qMat.open;
  Abre_qTipoMaterial;
  DMTabEnqIPI.Abre_Tab_EnqIPI(0);

  PageControl1.ActivePage := TabSheet1;
  //aqui ver esquema de foto
  //Le_Imagem_JPEG(DM1.tProdutoFotoJpeg,Image1);
end;

procedure TfProduto.RxDBLookupCombo2DropDown(Sender: TObject);
begin
  DM1.tCor.IndexFieldNames := 'Nome';
end;

procedure TfProduto.RxDBLookupCombo2CloseUp(Sender: TObject);
begin
  DM1.tCor.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Referencia';
end;

procedure TfProduto.SpeedButton9Click(Sender: TObject);
begin
  if DM1.tUsuarioModelista.AsBoolean then
  begin
    fModelista := TfModelista.Create(Self);
    fModelista.ShowModal;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfProduto.DBEdit1Exit(Sender: TObject);
var
  Texto1: String[1];
  i: Integer;
begin
  i := 0;
  while i <= Length(DM1.tProdutoReferencia.AsString) do
  begin
    inc(i);
    Texto1 := Copy(DM1.tProdutoReferencia.AsString,i,1);
    if Texto1 = ' ' then
    begin
      ShowMessage('O código da referência não pode conter espaços');
      i := Length(DM1.tProdutoReferencia.AsString) + 1;
      DM1.tProdutoReferencia.Clear;
      DBEdit1.SetFocus;
    end;
  end;
  {if DM1.tProdutoReferencia.AsString <> '' then
    begin
      if tProdutoIns.Locate('Referencia2',DM1.tProdutoReferencia.AsString,[loCaseInsensitive]) then
        begin
          if tProdutoInsCodigo.AsInteger <> DM1.tProdutoCodigo.AsInteger then
            begin
              ShowMessage('Referência cadastrada como R.C200!');
              DM1.tProdutoReferencia.Clear;
              DBEdit1.SetFocus;
            end;
        end;
    end;}
end;

procedure TfProduto.DBEdit12Exit(Sender: TObject);
var
  Texto1: String[1];
  i: Integer;
begin
  i := 0;
  while i <= Length(DM1.tProdutoReferencia2.AsString) do
  begin
    inc(i);
    Texto1 := Copy(DM1.tProdutoReferencia2.AsString,i,1);
    if Texto1 = ' ' then
    begin
      ShowMessage('O código da referência não pode conter espaços');
      i := Length(DM1.tProdutoReferencia2.AsString) + 1;
      DM1.tProdutoReferencia2.Clear;
      DBEdit12.SetFocus;
    end;
  end;
  if (DM1.tProdutoReferencia2.AsString <> '') and (DM1.tProdutoReferencia2.AsString = DM1.tProdutoReferencia.AsString) then
  begin
    ShowMessage('Referência C200 igual a Referência!');
    DM1.tProdutoReferencia2.Clear;
    DBEdit12.SetFocus;
  end;
  if DM1.tProdutoReferencia2.AsString <> '' then
  begin
    if tProdutoIns.Locate('Referencia',DM1.tProdutoReferencia2.AsString,[loCaseInsensitive]) then
    begin
      ShowMessage('Referência já esta cadastrada!');
      DM1.tProdutoReferencia2.Clear;
      DBEdit12.SetFocus;
    end;
  end;
  if DM1.tProdutoReferencia2.AsString <> '' then
  begin
    if tProdutoIns.Locate('Referencia2',DM1.tProdutoReferencia2.AsString,[loCaseInsensitive]) then
    begin
      ShowMessage('Referência já esta cadastrada como R.C200!');
      DM1.tProdutoReferencia2.Clear;
      DBEdit12.SetFocus;
    end;
  end;
end;

procedure TfProduto.RxDBLookupCombo5DropDown(Sender: TObject);
begin
  DM1.tProduto.Refresh;
  DM1.tProduto.IndexFieldNames := 'Nome';
end;

procedure TfProduto.RxDBLookupCombo6DropDown(Sender: TObject);
begin
  DM1.tGrupo.IndexFieldNames := 'Nome';
end;

procedure TfProduto.RxDBLookupCombo6CloseUp(Sender: TObject);
begin
  DM1.tGrupo.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.RxDBLookupCombo7DropDown(Sender: TObject);
begin
  DM1.tSubGrupo.IndexFieldNames := 'Nome';
end;

procedure TfProduto.RxDBLookupCombo7CloseUp(Sender: TObject);
begin
  DM1.tSubGrupo.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.RxDBLookupCombo10DropDown(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfProduto.RxDBLookupCombo10CloseUp(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.RxDBLookupCombo11Exit(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.RxDBLookupCombo11Enter(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Descricao';
end;

procedure TfProduto.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  //Posiciona_Foto;
  Posiciona_Foto_Nova;
  dm1.tProduto.Refresh;
end;

procedure TfProduto.RxDBLookupCombo5Change(Sender: TObject);
begin
  //Posiciona_Foto;
  Posiciona_Foto_Nova;
end;

procedure TfProduto.RxDBLookupCombo5Exit(Sender: TObject);
begin
  DM1.tProduto.Refresh;
  DM1.tProduto.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.RxDBLookupCombo4Exit(Sender: TObject);
begin
  //Posiciona_Foto;
  Posiciona_Foto_Nova;
end;

procedure TfProduto.SpeedButton10Click(Sender: TObject);
begin
  if not DM1.tProdutoSetor.IsEmpty then
  begin
    if MessageDlg('Deseja realmente excluir o setor selecionado?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
      DM1.tProdutoSetor.Delete;
  end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfProduto.BitBtn17Click(Sender: TObject);
begin
  if CurrencyEdit4.AsInteger < 1 then
    ShowMessage('Falta a ordem do setor')
  else
  if CurrencyEdit4.AsInteger > 8 then
    ShowMessage('Ordem não pode ser maior que 8')
  else
  if RxDBLookupCombo13.Text = '' then
    ShowMessage('Falta o nome do setor')
  else
  if DM1.tProdutoSetor.Locate('CodSetor',DM1.tSetorCodigo.AsInteger,[loCaseInsensitive]) then
    begin
      ShowMessage('Este setor já foi digitado');
      RxDBLookupCombo13.SetFocus;
    end
  else
  begin
    DM1.tProdutoSetor.SetKey;
    DM1.tProdutoSetorCodProduto.AsInteger := DM1.tProdutoCodigo.AsInteger;
    DM1.tProdutoSetorItem.AsInteger       := CurrencyEdit4.AsInteger;
    if DM1.tProdutoSetor.GotoKey then
    begin
      ShowMessage('Ordem já foi digitada');
      CurrencyEdit4.SetFocus;
    end
    else
    begin
      DM1.tProdutoSetor.Insert;
      DM1.tProdutoSetorCodProduto.AsInteger := DM1.tProdutoCodigo.AsInteger;
      DM1.tProdutoSetorItem.AsInteger       := CurrencyEdit4.AsInteger;
      DM1.tProdutoSetorCodSetor.AsInteger   := RxDBLookupCombo13.KeyValue;
      DM1.tProdutoSetorCodAtelier.AsInteger := 0;
      if DM1.tSetorAtelier.AsBoolean then
      begin
        if RxDBLookupCombo14.Text <> '' then
          DM1.tProdutoSetorCodAtelier.AsInteger := RxDBLookupCombo14.KeyValue;
      end;
      DM1.tProdutoSetorCapacidadeDia.AsInteger := CurrencyEdit1.AsInteger;
      DM1.tProdutoSetor.Post;
      BitBtn18Click(Sender);
      CurrencyEdit4.SetFocus;
    end;
  end;
end;

procedure TfProduto.RxDBLookupCombo13Enter(Sender: TObject);
begin
  RxDBFilter2.Active := True;
  DM1.tSetor.IndexFieldNames := 'Nome';
end;

procedure TfProduto.RxDBLookupCombo13Exit(Sender: TObject);
begin
  RxDBFilter2.Active := False;
  DM1.tSetor.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.RxDBLookupCombo14Enter(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Atelier';
end;

procedure TfProduto.RxDBLookupCombo14Exit(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.BitBtn19Click(Sender: TObject);
begin
  if not DM1.tProdutoSetor.IsEmpty then
  begin
    if DM1.tProdutoSetorItem.AsInteger > 0 then
    begin
      if RxDBLookupCombo13.Text = '' then
      begin
        CurrencyEdit1.AsInteger    := DM1.tProdutoSetorCapacidadeDia.AsInteger;
        CurrencyEdit4.AsInteger    := DM1.tProdutoSetorItem.AsInteger;
        RxDBLookupCombo13.KeyValue := DM1.tProdutoSetorCodSetor.AsInteger;
        if DM1.tProdutoSetorCodAtelier.AsInteger > 0 then
          RxDBLookupCombo14.KeyValue := DM1.tProdutoSetorCodAtelier.AsInteger
        else
          RxDBLookupCombo14.ClearValue;
        DM1.tProdutoSetor.Delete;
      end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
    end;
  end
  else
    ShowMessage('Não há registro para ser alterado!');
end;

procedure TfProduto.BitBtn18Click(Sender: TObject);
begin
  CurrencyEdit1.Clear;
  CurrencyEdit4.Clear;
  RxDBLookupCombo13.ClearValue;
  RxDBLookupCombo14.ClearValue;
end;

procedure TfProduto.DBEdit11Exit(Sender: TObject);
begin
  if tProdutoIns.Locate('Referencia;DescMaterial',VarArrayOf([DM1.tProdutoReferencia.AsString,DM1.tProdutoDescMaterial.AsString]),[loCaseInsensitive]) then
  begin
    if tProdutoInsCodigo.AsInteger <> DM1.tProdutoCodigo.AsInteger then
    begin
      ShowMessage('Referência com este material já cadastrada');
      DM1.tProdutoDescMaterial.Clear;
      DBEdit11.SetFocus;
    end;
  end;
end;

procedure TfProduto.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text <> '' then
  begin
    qMat.Active             := False;
    qMat.Params[0].AsString := Edit2.Text;
    qMat.Active             := True;
  end;
end;

procedure TfProduto.BitBtn16Click(Sender: TObject);
begin
  if Edit2.Text <> '' then
    begin
      Limpa_Tabelas;
      if DM2.tProduto.Locate('Referencia;DescMaterial',VarArrayOf([Edit2.Text,RxDBLookupCombo16.Text]),[locaseinsensitive]) then
        begin
          DM1.tProdutoAliqIcms.AsFloat             := DM2.tProdutoAliqIcms.AsFloat;
          DM1.tProdutoAliqIPI.AsFloat              := DM2.tProdutoAliqIPI.AsFloat;
          DM1.tProdutoCodClasFiscal.AsString       := DM2.tProdutoCodClasFiscal.AsString;
          DM1.tProdutoCodGrade.AsInteger           := DM2.tProdutoCodGrade.AsInteger;
          DM1.tProdutoCodGrupo.AsInteger           := DM2.tProdutoCodGrupo.AsInteger;
          DM1.tProdutoCodModelista.AsInteger       := DM2.tProdutoCodModelista.AsInteger;
          DM1.tProdutoCodSitTrib.AsInteger         := DM2.tProdutoCodSitTrib.AsInteger;
          DM1.tProdutoCodSubGrupo.AsInteger        := DM2.tProdutoCodSubGrupo.AsInteger;
          DM1.tProdutoComissaoMod.AsFloat          := DM2.tProdutoComissaoMod.AsFloat;
          DM1.tProdutoCodConstrucao.AsInteger      := DM2.tProdutoCodConstrucao.AsInteger;
          DM1.tProdutoConsumo.AsString             := DM2.tProdutoConsumo.AsString;
          DM1.tProdutoInativo.AsBoolean            := DM2.tProdutoInativo.AsBoolean;
          DM1.tProdutoLancaGrade.AsBoolean         := DM2.tProdutoLancaGrade.AsBoolean;
          DM1.tProdutoNome.AsString                := DM2.tProdutoNome.AsString;
          DM1.tProdutoNomeExp.AsString             := DM2.tProdutoNomeExp.AsString;
          DM1.tProdutoNomeModelo.AsString          := DM2.tProdutoNomeModelo.AsString;
          DM1.tProdutoObs.AsString                 := DM2.tProdutoObs.AsString;
          DM1.tProdutoPalmInterna.AsString         := DM2.tProdutoPalmInterna.AsString;
          DM1.tProdutoPesoBruto.AsFloat            := DM2.tProdutoPesoBruto.AsFloat;
          DM1.tProdutoPesoLiquido.AsFloat          := DM2.tProdutoPesoLiquido.AsFloat;
          DM1.tProdutoQParTalao.AsFloat            := DM2.tProdutoQParTalao.AsFloat;
          DM1.tProdutoUnidade.AsString             := DM2.tProdutoUnidade.AsString;
          DM1.tProdutoVlrAtelier.AsFloat           := DM2.tProdutoVlrAtelier.AsFloat;
          DM1.tProdutoCodForma.AsInteger           := DM2.tProdutoCodForma.AsInteger;
          DM1.tProdutoCodConstrucaoGrupo.AsInteger := DM2.tProdutoCodConstrucaoGrupo.AsInteger;
          DM2.tProdutoSetor.First;
          while not DM2.tProdutoSetor.Eof do
          begin
            DM1.tProdutoSetor.Insert;
            DM1.tProdutoSetorCodProduto.AsInteger := DM1.tProdutoCodigo.AsInteger;
            DM1.tProdutoSetorCodAtelier.AsInteger := DM2.tProdutoSetorCodAtelier.AsInteger;
            DM1.tProdutoSetorCodSetor.AsInteger   := DM2.tProdutoSetorCodSetor.AsInteger;
            DM1.tProdutoSetorItem.AsInteger       := DM2.tProdutoSetorItem.AsInteger;
            DM1.tProdutoSetor.Post;
            DM2.tProdutoSetor.Next;
          end;
          DM2.tProdutoCor.First;
          while not DM2.tProdutoCor.Eof do
          begin
            DM1.tProdutoCor.Insert;
            DM1.tProdutoCorCodProduto.AsInteger := DM1.tProdutoCodigo.AsInteger;
            DM1.tProdutoCorCodCor.AsInteger     := DM2.tProdutoCorCodCor.AsInteger;
            DM1.tProdutoCor.Post;
            DM2.tProdutoMat.First;
            while not DM2.tProdutoMat.Eof do
              begin
                DM1.tProdutoMat.Insert;
                DM1.tProdutoMatCodProduto.AsInteger  := DM1.tProdutoCodigo.AsInteger;
                DM1.tProdutoMatCodCor.AsInteger      := DM2.tProdutoMatCodCor.AsInteger;
                DM1.tProdutoMatCodCorProd.AsInteger  := DM2.tProdutoMatCodCorProd.AsInteger;
                DM1.tProdutoMatCodGrade.AsInteger    := DM2.tProdutoMatCodGrade.AsInteger;
                DM1.tProdutoMatCodMaterial.AsInteger := DM2.tProdutoMatCodMaterial.AsInteger;
                DM1.tProdutoMatCodPosicao.AsInteger  := DM2.tProdutoMatCodPosicao.AsInteger;
                DM1.tProdutoMatImpTalao.AsString     := DM2.tProdutoMatImpTalao.AsString;
                DM1.tProdutoMatItem.AsInteger        := DM2.tProdutoMatItem.AsInteger;
                DM1.tProdutoMatQtd.AsFloat           := DM2.tProdutoMatQtd.AsFloat;
                DM1.tProdutoMatVlrTotal.AsFloat      := DM2.tProdutoMatVlrTotal.AsFloat;
                DM1.tProdutoMatVlrUnitario.AsFloat   := DM2.tProdutoMatVlrUnitario.AsFloat;
                DM1.tProdutoMat.Post;
                DM2.tProdutoMatTam.First;
                while not DM2.tProdutoMatTam.Eof do
                  begin
                    DM1.tProdutoMatTam.Insert;
                    DM1.tProdutoMatTamCodProduto.AsInteger := DM1.tProdutoCodigo.AsInteger;
                    DM1.tProdutoMatTamCodCorProd.AsInteger := DM2.tProdutoMatTamCodCorProd.AsInteger;
                    DM1.tProdutoMatTamCodGrade.AsInteger   := DM2.tProdutoMatTamCodGrade.AsInteger;
                    DM1.tProdutoMatTamItem.AsInteger       := DM2.tProdutoMatTamItem.AsInteger;
                    DM1.tProdutoMatTamItemMat.AsInteger    := DM2.tProdutoMatTamItemMat.AsInteger;
                    DM1.tProdutoMatTamPosicao.AsInteger    := DM2.tProdutoMatTamPosicao.AsInteger;
                    DM1.tProdutoMatTamQtd.AsFloat          := DM2.tProdutoMatTamQtd.AsFloat;
                    DM1.tProdutoMatTamVlrTotal.AsFloat     := DM2.tProdutoMatTamVlrTotal.AsFloat;
                    DM1.tProdutoMatTamVlrUnitario.AsFloat  := DM2.tProdutoMatTamVlrUnitario.AsFloat;
                    DM1.tProdutoMatTam.Post;
                    DM2.tProdutoMatTam.Next;
                  end;
                //DM1.tProdutoMat.Post;
                DM2.tProdutoMat.Next;
              end;
            //DM1.tProdutoCor.Post;
            DM2.tProdutoCor.Next;
          end;
        Edit2.Clear;
        RxDBLookupCombo16.ClearValue;
      end
      else
        begin
          ShowMessage('Não foi encontrada esta referência com este material!');
          Edit2.SetFocus;
        end;
    end
  else
    begin
      ShowMessage('Você deve informar uma referência para executar a cópia!');
      Edit2.SetFocus;
    end;
end;

procedure TfProduto.BitBtn20Click(Sender: TObject);
begin
  OpenPictureDialog2.Execute;
  DM1.tProdutoEndEtiq.AsString := OpenPictureDialog2.FileName;
end;

procedure TfProduto.RxDBLookupCombo18Enter(Sender: TObject);
begin
  DM1.tCor.IndexFieldNames := 'Nome';
end;

procedure TfProduto.RxDBLookupCombo18Exit(Sender: TObject);
begin
  DM1.tCor.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.RxDBLookupCombo19Enter(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Nome';
end;

procedure TfProduto.RxDBLookupCombo19Exit(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Codigo';
end;

procedure TfProduto.SpeedButton12Click(Sender: TObject);
begin
  fSetor := TfSetor.Create(Self);
  fSetor.ShowModal;
end;

procedure TfProduto.BitBtn21Click(Sender: TObject);
begin
  if (RxDBLookupCombo19.KeyValue > 0) and (CurrencyEdit5.Value > 0) then
    begin
      DM1.tProdutoMeta.SetKey;
      DM1.tProdutoMetaCodProd.AsInteger  := DM1.tProdutoCodigo.AsInteger;
      if RxDBLookupCombo18.KeyValue > 0 then
        DM1.tProdutoMetaCodCor.AsInteger := RxDBLookupCombo18.KeyValue
      else
        DM1.tProdutoMetaCodCor.AsInteger := 0;
      DM1.tProdutoMetaCodSetor.AsInteger := RxDBLookupCombo19.KeyValue;
      if not DM1.tProdutoMeta.GotoKey then
        begin
          if RxDBLookupCombo18.KeyValue > 0 then
            begin
              DM1.tProdutoCor.SetKey;
              DM1.tProdutoCorCodProduto.AsInteger  := DM1.tProdutoCodigo.AsInteger;
              DM1.tProdutoCorCodCor.AsInteger      := RxDBLookupCombo18.KeyValue;
              if DM1.tProdutoCor.GotoKey then
                begin
                  DM1.tProdutoMeta.Insert;
                  DM1.tProdutoMetaCodProd.AsInteger    := DM1.tProdutoCodigo.AsInteger;
                  DM1.tProdutoMetaCodCor.AsInteger     := RxDBLookupCombo18.KeyValue;
                  DM1.tProdutoMetaCodSetor.AsInteger   := RxDBLookupCombo19.KeyValue;
                  DM1.tProdutoMetaQtdMetaDia.AsInteger := StrToInt(CurrencyEdit5.Text);
                  DM1.tProdutoMeta.Post;
                  SpeedButton13Click(Sender);
                end
            end
          else
            begin
              DM1.tProdutoMeta.Insert;
              DM1.tProdutoMetaCodProd.AsInteger    := DM1.tProdutoCodigo.AsInteger;
              DM1.tProdutoMetaCodCor.AsInteger     := 0;
              DM1.tProdutoMetaCodSetor.AsInteger   := RxDBLookupCombo19.KeyValue;
              DM1.tProdutoMetaQtdMetaDia.AsInteger := StrToInt(CurrencyEdit5.Text);
              DM1.tProdutoMeta.Post;
              SpeedButton13Click(Sender);
            end;
        end
      else
        begin
          ShowMessage('Já existe uma meta para este setor com esta cor ou sem cor!');
          RxDBLookupCombo18.SetFocus;
        end;
    end
  else
    begin
      ShowMessage('Você deve informar um "Setor" e uma "Meta/Dia", para inserir um registro!');
      RxDBLookupCombo18.SetFocus;
    end;
end;

procedure TfProduto.SpeedButton13Click(Sender: TObject);
begin
  RxDBLookupCombo18.ClearValue;
  RxDBLookupCombo19.ClearValue;
  CurrencyEdit5.Clear;
  RxDBLookupCombo1.SetFocus;
end;

procedure TfProduto.SpeedButton14Click(Sender: TObject);
begin
  if not DM1.tProdutoMeta.IsEmpty then
    begin
      if DM1.tProdutoMetaCodCor.AsInteger > 0 then
        RxDBLookupCombo18.KeyValue := DM1.tProdutoMetaCodCor.AsInteger;
      RxDBLookupCombo19.KeyValue := DM1.tProdutoMetaCodSetor.AsInteger;
      DM1.tProdutoMeta.Delete;
      RxDBLookupCombo18.SetFocus;
    end
  else
    begin
      ShowMessage('Não há meta para ser alterada!');
    end;
end;

procedure TfProduto.SpeedButton15Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esta meta?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    DM1.tProdutoMeta.Delete;
end;

procedure TfProduto.RxDBLookupCombo20Change(Sender: TObject);
begin
  if RxDBLookupCombo20.Text <> '' then
  begin
    Dm1.tProduto.IndexFieldNames := 'Construcao';
    if DM1.tProduto.Locate('CodConstrucao',RxDBLookupCombo20.KeyValue,[loCaseInsensitive]) then
    begin
      //Posiciona_Foto;
      Posiciona_Foto_Nova;
    end;
  end;
end;

procedure TfProduto.RxDBLookupCombo21Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfProduto.BitBtn22Click(Sender: TObject);
begin
  if RxDBLookupCombo22.Text <> '' then
  begin
    DM1.tProdutoTam.SetKey;
    DM1.tProdutoTamCodProd.AsInteger := DM1.tProdutoCodigo.AsInteger;
    DM1.tProdutoTamTam.AsString      := RxDBLookupCombo22.Text;
    if DM1.tProdutoTam.GotoKey then
      ShowMessage('Já existe este tamanho para esse produto!')
    else
    begin
      DM1.tProdutoTam.Insert;
      DM1.tProdutoTamCodProd.AsInteger := DM1.tProdutoCodigo.AsInteger;
      DM1.tProdutoTamTam.AsString      := RxDBLookupCombo22.Text;
      DM1.tProdutoTam.Post;
      RxDBLookupCombo22.ClearValue;
    end;
  end
  else
    ShowMessage('Você deve informar um tamanho para o produto!');
  RxDBLookupCombo22.SetFocus;
end;

procedure TfProduto.SpeedButton17Click(Sender: TObject);
begin
  if not DM1.tProdutoTam.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
        DM1.tProdutoTam.Delete;
    end
  else
    ShowMessage('Não há registro para ser excluído!');
end;

procedure TfProduto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end
  else
  if (Key = Vk_F2) and (DM1.tProduto.State in [dsBrowse]) then
  begin
    vCodProduto_Pos := 0;
    fConsProduto := TfConsProduto.Create(Self);
    fConsProduto.ShowModal;
    if vCodProduto_Pos > 0 then
      DM1.tProduto.Locate('Codigo',vCodProduto_Pos,[loCaseInsensitive]);
  end;
end;

procedure TfProduto.RxDBLookupCombo23Enter(Sender: TObject);
begin
  Dm1.tConstrucao.IndexFieldNames := 'Nome';
end;

procedure TfProduto.SpeedButton18Click(Sender: TObject);
begin
  if DM1.tUsuarioConstrucao.AsBoolean then
    begin
      fConstrucao := TfConstrucao.Create(Self);
      fConstrucao.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfProduto.BitBtn24Click(Sender: TObject);
begin
  if DM1.tProdutoCorCodCor.AsInteger > 0 then
  begin
    fProdutoComb := TfProdutoComb.Create(Self);
    fProdutoComb.ShowModal;
  end;
end;

procedure TfProduto.Panel2Enter(Sender: TObject);
begin
  qConstr.Close;
  qConstr.Open;
end;

procedure TfProduto.BitBtn10Click(Sender: TObject);
begin
  if DM1.tProdutoCadastroCompleto.AsBoolean then
  begin
    ShowMessage('Produto já está completo!');
    exit;
  end;
  fConfirmaProduto := TfConfirmaProduto.Create(Self);
  fConfirmaProduto.ShowModal;
end;

procedure TfProduto.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioTipoMaterialProd.AsBoolean then
  begin
    fTipoMaterial := TfTipoMaterial.Create(Self);
    fTipoMaterial.vTipoMat := 'P';
    fTipoMaterial.ShowModal;
    Abre_qTipoMaterial;
  end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado!');
end;

procedure TfProduto.BitBtn11Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
  begin
    ShowMessage('Tipo do material não informado!');
    exit;
  end;
  if DM1.tProdutoTipoMat.Locate('CodProduto;CodTipoMaterial',VarArrayOf([DM1.tProdutoCodigo.AsInteger,RxDBLookupCombo1.KeyValue]),[loCaseInsensitive]) then
  begin
    ShowMessage('Tipo do material já informado!');
    exit;
  end;
  DM1.tProdutoTipoMat.Insert;
  DM1.tProdutoTipoMatCodProduto.AsInteger      := DM1.tProdutoCodigo.AsInteger;
  DM1.tProdutoTipoMatCodTipoMaterial.AsInteger := RxDBLookupCombo1.KeyValue;
  DM1.tProdutoTipoMat.Post;
end;

procedure TfProduto.SpeedButton16Click(Sender: TObject);
begin
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo1.SetFocus;
end;

procedure TfProduto.SpeedButton20Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este registro?', mtConfirmation,[mbOk,mbNo],0)=mrNO then
    exit;
  DM1.tProdutoTipoMat.Delete;
  DM1.tProdutoTipoMat.Refresh;
end;

procedure TfProduto.Panel8Enter(Sender: TObject);
begin
  RxDBFilter1.Active := True;
end;

procedure TfProduto.Panel8Exit(Sender: TObject);
begin
  RxDBFilter1.Active := False;
end;

procedure TfProduto.BitBtn23Click(Sender: TObject);
begin
  if not DM1.tProdutoSetorAux.IsEmpty then
    begin
      ShowMessage('Já existem setores gerados!');
      exit;
    end;
  DM1.tProdutoSetorAux.Refresh;
  DM1.tProdutoSetorAux.Last;
  vItem := DM1.tProdutoSetorAuxItem.AsInteger;

  DM1.tSetor.First;
  while not DM1.tSetor.Eof do
    begin
      vItem := vItem + 1; 
      if DM1.tProdutoSetorAux.Locate('Item',vItem,[loCaseInsensitive]) then
        DM1.tProdutoSetorAux.Edit
      else
        begin
          DM1.tProdutoSetorAux.Insert;
          DM1.tProdutoSetorAuxCodProduto.AsInteger := DM1.tProdutoCodigo.AsInteger;
          DM1.tProdutoSetorAuxItem.AsInteger       := vItem;
        end;
      DM1.tProdutoSetorAuxCodSetor.AsInteger      := DM1.tSetorCodigo.AsInteger;
      DM1.tProdutoSetorAuxCapacidadeDia.AsInteger := CurrencyEdit2.AsInteger;
      DM1.tProdutoSetorAux.Post;
      DM1.tSetor.Next;
    end;
end;

procedure TfProduto.BitBtn15Click(Sender: TObject);
begin
  if RxDBLookupCombo3.Text = '' then
    begin
      ShowMessage('Setor não informado!');
      exit;
    end;

  if DM1.tProdutoSetorAux.Locate('CodSetor',RxDBLookupCombo3.KeyValue,[loCaseInsensitive]) then
    DM1.tProdutoSetorAux.Edit
  else
    begin
      DM1.tProdutoSetorAux.Refresh;
      DM1.tProdutoSetorAux.Last;
      vItem := DM1.tProdutoSetorAuxItem.AsInteger + 1;
      
      DM1.tProdutoSetorAux.Insert;
      DM1.tProdutoSetorAuxCodProduto.AsInteger    := DM1.tProdutoCodigo.AsInteger;
      DM1.tProdutoSetorAuxItem.AsInteger          := vItem;
    end;
  DM1.tProdutoSetorAuxCodSetor.AsInteger      := RxDBLookupCombo3.KeyValue;
  DM1.tProdutoSetorAuxCapacidadeDia.AsInteger := CurrencyEdit2.AsInteger;
  DM1.tProdutoSetorAux.Post;
  BitBtn14Click(Sender);
  CurrencyEdit2.SetFocus;
end;

procedure TfProduto.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Nome';
end;

procedure TfProduto.BitBtn14Click(Sender: TObject);
begin
  CurrencyEdit2.Clear;
  RxDBLookupCombo3.ClearValue;
end;

procedure TfProduto.BitBtn12Click(Sender: TObject);
begin
  if DM1.tProdutoSetorAux.IsEmpty then
    begin
      ShowMessage('Não existe registro para ser alterado!');
      exit;
    end;
  CurrencyEdit2.AsInteger   := DM1.tProdutoSetorAuxCapacidadeDia.AsInteger;
  RxDBLookupCombo3.KeyValue := DM1.tProdutoSetorAuxCodSetor.AsInteger;
end;

procedure TfProduto.SpeedButton19Click(Sender: TObject);
begin
  if DM1.tProdutoSetorAux.IsEmpty then
    ShowMessage('Não há registro para ser excluído!')
  else
  if MessageDlg('Deseja excluir o setor selecionado?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    DM1.tProdutoSetorAux.Delete;
end;

procedure TfProduto.SpeedButton21Click(Sender: TObject);
begin
  if DM1.tUsuarioSitTrib.AsBoolean then
    begin
      fCSTIPI := TfCSTIPI.Create(Self);
      fCSTIPI.ShowModal;
      DM1.tCSTIPI.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de Clas.fiscal!');
end;

procedure TfProduto.SpeedButton23Click(Sender: TObject);
begin
  if DM1.tUsuarioSitTrib.AsBoolean then
    begin
      fSitTributariaSimples := TfSitTributariaSimples.Create(Self);
      fSitTributariaSimples.ShowModal;
      DM1.tSitTributaria.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de Clas.fiscal!');
end;

procedure TfProduto.SpeedButton22Click(Sender: TObject);
begin
  if DM1.tUsuarioRegimeTrib.AsBoolean then
    begin
      fOrigemProd := TfOrigemProd.Create(Self);
      fOrigemProd.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir o formulário!');
end;

procedure TfProduto.RxDBLookupCombo4Change(Sender: TObject);
begin
  //Posiciona_Foto;
  Posiciona_Foto_Nova;
end;

procedure TfProduto.BitBtn30Click(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
  DM1.tProdutoEndFoto.AsString := OpenPictureDialog1.FileName;
  Posiciona_Foto_Nova;
end;

procedure TfProduto.Posiciona_Foto_Nova;
begin
  if (DM1.tProdutoEndFoto.AsString <> '') and (FileExists(DM1.tProdutoEndFoto.AsString)) then
  begin
    Image3.Picture.LoadFromFile(Dm1.tProdutoEndFoto.AsString);
    //Image4.Picture.LoadFromFile(Dm1.tProdutoEndFoto.AsString);
  end
  else
  begin
    Image3.Picture := nil;
    //Image4.Picture := nil;
  end;
end;

procedure TfProduto.prc_Gravar_Produto_Tam;
begin
  if DM1.tProdutoCodGrade.AsInteger <= 0 then
    exit;
  if not DM1.tGrade.Locate('Codigo',DM1.tProdutoCodGrade.AsInteger,[loCaseInsensitive]) then
    exit;
  DM1.tGradeItem.First;
  while not DM1.tGradeItem.Eof do
  begin
    DM1.tProdutoTam.Insert;
    DM1.tProdutoTamCodProd.AsInteger := DM1.tProdutoCodigo.AsInteger;
    DM1.tProdutoTamTam.AsString      := DM1.tGradeItemTamanho.AsString;
    DM1.tProdutoTam.Post;
    DM1.tGradeItem.Next;
  end;
end;

procedure TfProduto.RxSpeedButton1Click(Sender: TObject);
var
  vProd: Integer;
begin
  DM1.tMaterialGradeNum.Open;
  vProd := DM1.tProdutoCodigo.AsInteger;
  DM1.tProduto.Filtered := False;
  DM1.tProduto.Filter   := 'Codigo = '''+IntToStr(vProd)+'''';
  DM1.tProduto.Filtered := True;
  fRelFichaTecnica      := TfRelFichaTecnica.Create(Self);
  fRelFichaTecnica.QuickRep1.Preview;
  fRelFichaTecnica.QuickRep1.Free;
  DM1.tProduto.Filtered := False;
  DM1.tProduto.IndexFieldNames := 'Codigo';
  DM1.tProduto.FindKey([vProd]);
end;

procedure TfProduto.RxDBLookupCombo17KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F5 then
  begin
    vID_EnqIPI_Pos := 0;
    fSel_EnqIPI := TfSel_EnqIPI.Create(Self);
    fSel_EnqIPI.ShowModal;
    if vID_EnqIPI_Pos > 0 then
      RxDBLookupCombo17.KeyValue := vID_EnqIPI_Pos;
  end;
end;

end.
