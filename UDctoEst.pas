unit UDctoEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, Mask, ToolEdit, RXDBCtrl, CurrEdit,
  RxLookup, RXCtrls, Grids, DBGrids, Db, DBTables, MemTable, DBVGrids, Variants,
  RxDBComb, RzDBCmbo;

type
  TfDctoEst = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn6: TBitBtn;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    RxLabel1: TRxLabel;
    Edit1: TEdit;
    RxLabel2: TRxLabel;
    SpeedButton5: TSpeedButton;
    RxLabel3: TRxLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton6: TSpeedButton;
    RxLabel4: TRxLabel;
    Edit2: TEdit;
    RxLabel5: TRxLabel;
    CurrencyEdit1: TCurrencyEdit;
    RxDBGrid1: TRxDBGrid;
    RxLabel7: TRxLabel;
    Label4: TLabel;
    DBText2: TDBText;
    StaticText1: TStaticText;
    BitBtn7: TBitBtn;
    CurrencyEdit2: TCurrencyEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    tAuxDctoGrade: TTable;
    tAuxDctoGradeCodGrade: TIntegerField;
    tAuxDctoGradePosicao: TIntegerField;
    tAuxDctoGradeQtd: TFloatField;
    qCor: TQuery;
    qCorCodigo: TIntegerField;
    qCorNome: TStringField;
    qsCor: TDataSource;
    dsAuxDctoGrade: TDataSource;
    tAuxDctoGradelkTamanho: TStringField;
    tAuxDctoGradelkLargura: TStringField;
    RxDBGrid2: TRxDBGrid;
    GroupBox2: TGroupBox;
    VDBGrid2: TVDBGrid;
    qEstoque: TQuery;
    qEstoqueCodMaterial: TIntegerField;
    qEstoqueCodCor: TIntegerField;
    qEstoqueQtd: TFloatField;
    qEstoqueLargura: TStringField;
    qEstoquelkNomeMaterial: TStringField;
    qEstoquelkNomeCor: TStringField;
    dsEstoque: TDataSource;
    qEstoqueGrade: TQuery;
    qEstoqueGradeCodMaterial: TIntegerField;
    qEstoqueGradeCodCor: TIntegerField;
    qEstoqueGradeLargura: TStringField;
    qEstoqueGradeTamanho: TStringField;
    qEstoqueGradeQtd: TFloatField;
    dsEstoqueGrade: TDataSource;
    ComboBox1: TComboBox;
    RxLabel6: TRxLabel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tAuxDctoGradeBeforeInsert(DataSet: TDataSet);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure qEstoqueAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure RzDBLookupComboBox1Enter(Sender: TObject);
    procedure RzDBLookupComboBox1Exit(Sender: TObject);
    procedure RzDBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBRadioGroup1Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Verifica_Total;
    procedure Limpa_Edit;
  public
    { Public declarations }
  end;

var
  fDctoEst: TfDctoEst;
  vProduto : LongInt;
  vItem : Integer;
  vEdit : String[1];

implementation

uses UDM1, UDM2, UDctoGrade, UConsEstoqueMat, UConsDcto, UMaterial, UCor,
  UAgendaTelef;

{$R *.DFM}

procedure TfDctoEst.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn2.Enabled      := not(BitBtn2.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  Panel3.Enabled       := not(Panel3.Enabled);
end;

procedure TfDctoEst.Verifica_Total;
begin
  DM1.tDctoEst.Edit;
  DM1.tDctoEstTotal.AsFloat := 0;
  DM1.tDctoEstItem.First;
  while not DM1.tDctoEstItem.Eof do
    begin
      DM1.tDctoEstTotal.AsFloat := DM1.tDctoEstTotal.AsFloat + DM1.tDctoEstItemVlrTotal.AsFloat;
      DM1.tDctoEstItem.Next;
    end;
  DM1.tDctoEst.Post;
end;

procedure TfDctoEst.Limpa_Edit;
begin
  Edit1.Clear;
  RzDBLookupComboBox1.ClearKeyValue;
  RxDBLookupCombo3.ClearValue;
  Edit2.Clear;
  CurrencyEdit1.Value := 0;
  CurrencyEdit2.Value := 0;
end;

procedure TfDctoEst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tDctoEst.Close;
      DM1.tDctoEstItem.Close;
      DM1.tDctoEstGrade.Close;
      DM1.tProduto.Close;
      DM1.tProdutoCor.Close;
      DM1.tProdutoTam.Close;
      DM1.tCor.Close;
      DM1.tEstoqueMatMov.Close;
      DM1.tEstoqueMatMovGrade.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      DM1.tMaterial.Close;
      DM1.tMaterialCor.Close;
    end;
  qEstoque.Close;
  qEstoqueGrade.Close;
  qCor.Close;
  Action := Cafree;
end;

procedure TfDctoEst.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tDctoEst.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve confirmar ou cancelar antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfDctoEst.BitBtn1Click(Sender: TObject);
var
  vNum : Integer;
begin
  if DM1.tUsuarioInsDctoEst.AsBoolean then
    begin
      qEstoque.Open;
      qEstoqueGrade.Open;

      DM1.tDctoEst.Refresh;
      DM1.tDctoEst.Last;
      vNum := DM1.tDctoEstNumDcto.AsInteger;

      DM1.tDctoEst.Insert;
      DM1.tDctoEstNumDcto.AsInteger := vNum + 1;
      DM1.tDctoEstData.AsDateTime   := Date;
      DM1.tDctoEstUsuario.AsString  := DM1.tUsuarioUsuario.AsString;
      DM1.tDctoEstTipo.AsString     := 'E';
      DM1.tDctoEst.Post;
      DM1.tDctoEst.Edit;
      Habilita;
      DBDateEdit1.SetFocus;
      vEdit                         := 'N';
    end
  else
    ShowMessage('Usuário '+DM1.tUsuarioUsuario.AsString+' não autorizado a fazer inserção!');
end;

procedure TfDctoEst.BitBtn2Click(Sender: TObject);
begin
  vEdit := 'N';
  if not DM1.tDctoEst.IsEmpty then
    begin
      if DM1.tUsuarioAltDctoEst.AsBoolean then
        begin
          //Abre o estoque
          qEstoque.Open;
          qEstoqueGrade.Open;
          //
          DM1.tDctoEst.Edit;
          DM1.tDctoEstItem.First;
          while not DM1.tDctoEstItem.Eof do
            begin
              //*** Apaga movimento do estoque
              DM1.tEstoqueMatMov.IndexFieldNames := 'NumMov';
              DM1.tEstoqueMatMov.SetKey;
              DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tDctoEstItemNumMovEst.AsInteger;
              if DM1.tEstoqueMatMov.GotoKey then
                begin
                  DM1.tEstoqueMatMovGrade.First;
                  while not DM1.tEstoqueMatMovGrade.Eof do
                    DM1.tEstoqueMatMovGrade.Delete;
                  DM1.tEstoqueMatMov.Delete;
                end;
              DM1.tDctoEstItem.Next;
            end;
          Habilita;
          DBDateEdit1.SetFocus;
          BitBtn2.Tag := 1;
          DM1.tEstoqueMatMov.Refresh;
          DM1.tEstoqueMatMovGrade.Refresh;
        end
      else
        ShowMessage('Usuário '+DM1.tUsuarioUsuario.AsString+' não autorizado a fazer alteração!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfDctoEst.BitBtn3Click(Sender: TObject);
var
  vNumMovEst : Integer;
begin
  if BitBtn2.Tag = 1 then
    begin
      DM1.tDctoEst.Cancel;
      DM1.tDctoEstItem.First;
      while not DM1.tDctoEstItem.Eof do
        begin
          //*** Grava o movimento do estoque
          DM1.tEstoqueMatMov.SetKey;
          DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tDctoEstItemNumMovEst.AsInteger;
          if DM1.tEstoqueMatMov.GotoKey then
            begin
              DM1.tEstoqueMatMov.Refresh;
              DM2.tEstoqueMatMov2.Refresh;
              DM2.tEstoqueMatMov2.Last;
              vNumMovEst := DM2.tEstoqueMatMov2NumMov.AsInteger + 1;
            end
          else
            vNumMovEst := DM1.tDctoEstItemNumMovEst.AsInteger;
          DM1.tEstoqueMatMov.Insert;
          DM1.tEstoqueMatMovNumMov.AsInteger      := vNumMovEst;
          DM1.tEstoqueMatMovCodMaterial.AsInteger := DM1.tDctoEstItemCodMaterial.AsInteger;
          DM1.tEstoqueMatMovCodCor.AsInteger      := DM1.tDctoEstItemCodCor.AsInteger;
          DM1.tEstoqueMatMovLargura.AsString      := DM1.tDctoEstItemlkLargura.AsString;
          DM1.tEstoqueMatMovDtMov.AsDateTime      := DM1.tDctoEstData.AsDateTime;
          DM1.tEstoqueMatMovES.AsString           := DM1.tDctoEstTipo.AsString;
          DM1.tEstoqueMatMovTipoMov.AsString      := 'DOC';
          DM1.tEstoqueMatMovNumNota.AsInteger     := DM1.tDctoEstNumDcto.AsInteger;
          DM1.tEstoqueMatMovCodCliForn.AsInteger  := 0;
          DM1.tEstoqueMatMovVlrUnitario.AsFloat   := DM1.tDctoEstItemVlrUnit.AsFloat;
          DM1.tEstoqueMatMovQtd.AsFloat           := StrToFloat(FormatFloat('0.00000',DM1.tDctoEstItemQtd.AsFloat));
          DM1.tEstoqueMatMovUnidade.AsString      := DM1.tDctoEstItemUnidade.AsString;
          DM1.tEstoqueMatMovPercIcms.AsFloat      := DM1.tMaterialICMS.AsFloat;
          DM1.tEstoqueMatMovPercIpi.AsFloat       := DM1.tMaterialIPI.AsFloat;
          DM1.tEstoqueMatMovVlrDesconto.AsFloat   := 0;
          if DM1.tEstoqueMatMovES.AsString = 'E' then
            DM1.tEstoqueMatMovQtd2.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tDctoEstItemQtd.AsFloat))
          else
            DM1.tEstoqueMatMovQtd2.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tDctoEstItemQtd.AsFloat * -1));
          DM1.tEstoqueMatMovMercado.AsString := DM1.tDctoEstItemMercado.AsString;
          DM1.tEstoqueMatMov.Post;

          if DM1.tDctoEstItemCodGrade.AsInteger > 0 then
            begin
              DM1.tDctoEstGrade.First;
              while not DM1.tDctoEstGrade.Eof do
                begin
                  DM1.tEstoqueMatMovGrade.Insert;
                  DM1.tEstoqueMatMovGradeNumMov.AsInteger := vNumMovEst;
                  DM1.tEstoqueMatMovGradeTamanho.AsString := DM1.tDctoEstGradelkTamanho.AsString;
                  DM1.tEstoqueMatMovGradeQtd.AsInteger    := DM1.tDctoEstGradeQtd.AsInteger;
                  if DM1.tEstoqueMatMovES.AsString = 'E' then
                    DM1.tEstoqueMatMovGradeQtd2.AsInteger := DM1.tDctoEstGradeQtd.AsInteger
                  else
                    DM1.tEstoqueMatMovGradeQtd2.AsInteger := DM1.tDctoEstGradeQtd.AsInteger * -1;
                  DM1.tEstoqueMatMovGrade.Post;
                  DM1.tDctoEstGrade.Next;
                end;
            end;

          DM1.tDctoEstItem.Edit;
          DM1.tDctoEstItemNumMovEst.AsInteger := vNumMovEst;
          DM1.tDctoEstItem.Post;
          DM1.tDctoEstItem.Next;
        end;
      Verifica_Total;
    end
  else
    begin
      DM1.tDctoEstItem.First;
      while not DM1.tDctoEstItem.Eof do
        begin
          DM1.tDctoEstGrade.First;
          while not DM1.tDctoEstGrade.Eof do
            DM1.tDctoEstGrade.Delete;
          DM1.tDctoEstItem.Delete;
        end;
      DM1.tDctoEst.Delete;
    end;
  Limpa_Edit;  
  Habilita;
  BitBtn2.Tag := 0;
  DM1.tEstoqueMatMov.Refresh;
  DM1.tEstoqueMatMovGrade.Refresh;
  BitBtn1.SetFocus;
end;

procedure TfDctoEst.BitBtn4Click(Sender: TObject);
begin
  if not DM1.tDctoEst.IsEmpty then
    begin
      if DM1.tUsuarioExcDctoEst.AsBoolean then
        begin
          if MessageDlg('Deseja realmente excluir este Dcto. de Estoque?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
            begin
              DM1.tDctoEstItem.First;
              while not DM1.tDctoEstItem.Eof do
                begin
                  //*** Apaga o movimento do estoque
                  DM1.tEstoqueMatMov.SetKey;
                  DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tDctoEstItemNumMovEst.AsInteger;
                  if DM1.tEstoqueMatMov.GotoKey then
                    begin
                      DM1.tEstoqueMatMovGrade.First;
                      while not DM1.tEstoqueMatMovGrade.Eof do
                        DM1.tEstoqueMatMovGrade.Delete;
                      DM1.tEstoqueMatMov.Delete;
                    end;
                  DM1.tDctoEstGrade.First;
                  while not DM1.tDctoEstGrade.Eof do
                    DM1.tDctoEstGrade.Delete;
                  DM1.tDctoEstItem.Delete;
                end;
              DM1.tDctoEst.Delete;
              DM1.tEstoqueMatMov.Refresh;
              DM1.tEstoqueMatMovGrade.Refresh;
            end;
        end
      else
        ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString + ' não autorizado a fazer exclusão!');
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfDctoEst.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfDctoEst.BitBtn6Click(Sender: TObject);
var
  vNumMovEst : Integer;
begin
  DM1.tDctoEstItem.First;
  while not DM1.tDctoEstItem.Eof do
    begin
      //*** Gravar movimento do estoque
      if DM1.tDctoEstItemNumMovEst.AsInteger > 0 then
        begin
          DM1.tEstoqueMatMov.Refresh;
          DM1.tEstoqueMatMov.SetKey;
          DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tDctoEstItemNumMovEst.AsInteger;
          if DM1.tEstoqueMatMov.GotoKey then
            begin
              DM2.tEstoqueMatMov2.Refresh;
              DM2.tEstoqueMatMov2.Last;
              vNumMovEst := DM2.tEstoqueMatMov2NumMov.AsInteger + 1;
            end
          else
            vNumMovEst := DM1.tDctoEstItemNumMovEst.AsInteger;
        end
      else
        begin
          DM1.tEstoqueMatMov.Refresh;
          DM2.tEstoqueMatMov2.Refresh;
          DM2.tEstoqueMatMov2.Last;
          vNumMovEst := DM2.tEstoqueMatMov2NumMov.AsInteger + 1;
        end;
      DM1.tEstoqueMatMov.Insert;
      DM1.tEstoqueMatMovNumMov.AsInteger      := vNumMovEst;
      DM1.tEstoqueMatMovCodMaterial.AsInteger := DM1.tDctoEstItemCodMaterial.AsInteger;
      DM1.tEstoqueMatMovCodCor.AsInteger      := DM1.tDctoEstItemCodCor.AsInteger;
      DM1.tEstoqueMatMovLargura.AsString      := DM1.tDctoEstItemlkLargura.AsString;
      DM1.tEstoqueMatMovDtMov.AsDateTime      := DM1.tDctoEstData.AsDateTime;
      DM1.tEstoqueMatMovES.AsString           := DM1.tDctoEstTipo.AsString;
      DM1.tEstoqueMatMovTipoMov.AsString      := 'DOC';
      DM1.tEstoqueMatMovNumNota.AsInteger     := DM1.tDctoEstNumDcto.AsInteger;
      DM1.tEstoqueMatMovCodCliForn.AsInteger  := 0;
      DM1.tEstoqueMatMovVlrUnitario.AsFloat   := DM1.tDctoEstItemVlrUnit.AsFloat;
      DM1.tEstoqueMatMovQtd.AsFloat           := StrToFloat(FormatFloat('0.00000',DM1.tDctoEstItemQtd.AsFloat));
      DM1.tEstoqueMatMovUnidade.AsString      := DM1.tDctoEstItemUnidade.AsString;
      DM1.tEstoqueMatMovMercado.AsString      := DM1.tDctoEstItemMercado.AsString;

      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsInteger := DM1.tDctoEstItemCodMaterial.AsInteger;
      if DM1.tMaterial.GotoKey then
        begin
          DM1.tEstoqueMatMovPercIcms.AsFloat      := DM1.tMaterialICMS.AsFloat;
          DM1.tEstoqueMatMovPercIpi.AsFloat       := DM1.tMaterialIPI.AsFloat;
        end
      else
        begin
          DM1.tEstoqueMatMovPercIcms.AsFloat      := 0;
          DM1.tEstoqueMatMovPercIpi.AsFloat       := 0;
        end;
      DM1.tEstoqueMatMovVlrDesconto.AsFloat   := 0;
      if DM1.tEstoqueMatMovES.AsString = 'E' then
        DM1.tEstoqueMatMovQtd2.AsFloat         := StrToFloat(FormatFloat('0.00000',DM1.tDctoEstItemQtd.AsFloat))
      else
        DM1.tEstoqueMatMovQtd2.AsFloat         := StrToFloat(FormatFloat('0.00000',DM1.tDctoEstItemQtd.AsFloat)) * -1;
      DM1.tEstoqueMatMov.Post;

      if DM1.tDctoEstItemCodGrade.AsInteger > 0 then
      begin
        DM1.tEstoqueMatMovGrade.First;
        while not DM1.tEstoqueMatMovGrade.Eof do
          DM1.tEstoqueMatMovGrade.Delete;
        DM1.tDctoEstGrade.First;
        while not DM1.tDctoEstGrade.Eof do
        begin
          if DM1.tDctoEstGradeQtd.AsInteger > 0 then   
          begin
            if DM1.tEstoqueMatMovGrade.Locate('NumMov;Tamanho',VarArrayOf([vNumMovEst,DM1.tDctoEstGradelkTamanho.AsString]),[locaseinsensitive]) then
              DM1.tEstoqueMatMovGrade.Edit
            else
            begin
              DM1.tEstoqueMatMovGrade.Insert;
              DM1.tEstoqueMatMovGradeNumMov.AsInteger := vNumMovEst;
              DM1.tEstoqueMatMovGradeTamanho.AsString := DM1.tDctoEstGradelkTamanho.AsString;
            end;
            DM1.tEstoqueMatMovGradeQtd.AsInteger    := DM1.tDctoEstGradeQtd.AsInteger;
            if DM1.tEstoqueMatMovES.AsString = 'E' then
              DM1.tEstoqueMatMovGradeQtd2.AsInteger := DM1.tDctoEstGradeQtd.AsInteger
            else
              DM1.tEstoqueMatMovGradeQtd2.AsInteger := DM1.tDctoEstGradeQtd.AsInteger * -1;
            DM1.tEstoqueMatMovGrade.Post;
          end;
          DM1.tDctoEstGrade.Next;
        end;
      end;
      DM1.tDctoEstItem.Edit;
      DM1.tDctoEstItemNumMovEst.AsInteger := vNumMovEst;
      DM1.tDctoEstItem.Post;
      DM1.tDctoEstItem.Next;
    end;
  DM1.tDctoEst.Post;
  DM1.tDctoEst.Refresh;
  DM1.tDctoEstItem.Refresh;
  DM1.tDctoEstGrade.Refresh;
  DM1.tEstoqueMatMov.Refresh;
  DM1.tEstoqueMatMovGrade.Refresh;
  qEstoque.Close;
  qEstoqueGrade.Close;
  Limpa_Edit;
  Habilita;
  BitBtn2.Tag := 0;
  Verifica_Total;
  BitBtn1.SetFocus;
end;

procedure TfDctoEst.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsString  := Edit1.Text;
      if DM1.tMaterial.GotoKey then
        begin
          RzDBLookupComboBox1.KeyValue := DM1.tMaterialCodigo.AsInteger;
          vProduto                  := DM1.tMaterialCodigo.AsInteger;
          Edit2.Text                := DM1.tMaterialUnidade.AsString;
          if (not DM1.tMaterialPrecoCor.AsBoolean) and ((BitBtn2.Tag <> 1) or (CurrencyEdit2.Value = 0)) then
            CurrencyEdit2.Value := DM1.tMaterialPrCusto.AsFloat;
          CurrencyEdit1.Enabled     := not (DM1.tMaterialLancaGrade.AsBoolean);
        end
      else
        begin
          ShowMessage('Material não encontrado, ou inativo!');
          Edit1.SetFocus;
        end;
    end;
end;

procedure TfDctoEst.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfDctoEst.RxDBLookupCombo3Enter(Sender: TObject);
begin
  qCor.Active := False;
  if RzDBLookupComboBox1.Text <> '' then
    begin
      qCor.Params[0].AsInteger := RzDBLookupComboBox1.KeyValue;
      qCor.Active := True;
    end;
end;

procedure TfDctoEst.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if (DM1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo3.Text <> '') then
    qEstoqueGrade.Locate('CodMaterial;CodCor',VarArrayOf([RzDBLookupComboBox1.KeyValue,RxDBLookupCombo3.KeyValue]),[locaseinsensitive]);
  if (DM1.tMaterialLancaCor.AsBoolean) and (DM1.tMaterialPrecoCor.AsBoolean) and
     (RxDBLookupCombo3.Text <> '') and ((BitBtn2.Tag <> 1) or (CurrencyEdit2.Value = 0)) then
    begin
      if DM1.tMaterialCor.Locate('CodMaterial;CodCor',VarArrayOf([RzDBLookupComboBox1.KeyValue,RxDBLookupCombo3.KeyValue]),[locaseinsensitive]) then
        CurrencyEdit2.Value := DM1.tMaterialCorPrCusto.AsFloat;
    end;
end;

procedure TfDctoEst.Edit2Exit(Sender: TObject);
begin
  if DM1.tMaterialLancaGrade.AsBoolean then
    begin
      fDctoGrade := tfDctoGrade.Create(Self);
      fDctoGrade.ShowModal;
    end;
end;

procedure TfDctoEst.BitBtn7Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if RzDBLookupComboBox1.Text <> '' then
    vProduto := RzDBLookupComboBox1.KeyValue;
  if (CurrencyEdit1.Value <= 0) or (vProduto = 0) or (Edit1.Text = '') or (Edit2.Text = '') then
    begin
      ShowMessage(' Há campos requeridos em branco, você deve acertar p/gravar' + #13 +
                  '"Quant.", "Material" ou "U.M."!');
      Edit1.SetFocus;
    end
  else
    begin
      if (qCor.Active) and (RxDBLookupCombo3.Text = '') and not(qCor.IsEmpty) then
        begin
          ShowMessage('Não pode ser confirmado este item s/ "Cor"!');
          RxDBLookupCombo3.SetFocus;
        end
      else
        begin
          DM1.tMaterial.IndexFieldNames := 'Codigo';
          DM1.tMaterial.FindKey([RzDBLookupComboBox1.KeyValue]);
          DM1.tDctoEstItem.Refresh;
          DM1.tDctoEstItem.Last;
          vItemAux := DM1.tDctoEstItemItem.AsInteger;

          DM1.tDctoEstItem.Insert;
          DM1.tDctoEstItemNumDcto.AsInteger := DM1.tDctoEstNumDcto.AsInteger;
          if vEdit = 'S' then
            DM1.tDctoEstItemItem.AsInteger := vItem
          else
            DM1.tDctoEstItemItem.AsInteger := vItemAux + 1;
          DM1.tDctoEstItemCodMaterial.AsInteger := vProduto;
          if RxDBLookupCombo3.Text <> '' then
            DM1.tDctoEstItemCodCor.AsInteger    := RxDBLookupCombo3.KeyValue
          else
            DM1.tDctoEstItemCodCor.AsInteger    := 0;
          DM1.tDctoEstItemQtd.AsFloat           := CurrencyEdit1.Value;
          DM1.tDctoEstItemUnidade.AsString      := Edit2.Text;
          DM1.tDctoEstItemVlrUnit.AsFloat       := CurrencyEdit2.Value;
          DM1.tDctoEstItemVlrTotal.AsFloat      := DM1.tDctoEstItemVlrUnit.AsFloat * DM1.tDctoEstItemQtd.AsFloat;
          case ComboBox1.ItemIndex of
            0 : DM1.tDctoEstItemMercado.AsString := 'E';
            1 : DM1.tDctoEstItemMercado.AsString := 'I';
          end;
          DM1.tDctoEstTotal.AsFloat             := DM1.tDctoEstTotal.AsFloat + DM1.tDctoEstItemVlrTotal.AsFloat;
          DM1.tDctoEStItemCodGrade.AsInteger    := 0;
          if DM1.tMaterialLancaGrade.AsBoolean then
            begin
              tAuxDctoGrade.First;
              if not tAuxDctoGrade.IsEmpty then
                DM1.tDctoEstItemCodGrade.AsInteger  := tAuxDctoGradeCodGrade.AsInteger;
            end;
          DM1.tDctoEStItem.Post;
          if DM1.tMaterialLancaGrade.AsBoolean then
            begin
              tAuxDctoGrade.First;
              while not tAuxDctoGrade.IsEmpty do
                begin
                  DM1.tDctoEstGrade.Insert;
                  DM1.tDctoEstGradeNumDcto.AsInteger  := DM1.tDctoEstNumDcto.AsInteger;
                  DM1.tDctoEstGradeItem.AsInteger     := DM1.tDctoEstItemItem.AsInteger;
                  DM1.tDctoEstGradeCodGrade.AsInteger := tAuxDctoGradeCodGrade.AsInteger;
                  DM1.tDctoEstGradePosicao.AsInteger  := tAuxDctoGradePosicao.AsInteger;
                  DM1.tDctoEstGradeQtd.AsInteger      := tAuxDctoGradeQtd.AsInteger;
                  DM1.tDctoEstGrade.Post;
                  tAuxDctoGrade.Delete;
                end;
            end;
          Limpa_Edit;
          vEdit       := 'N';
          Edit1.SetFocus;
          qCor.Active := False;
        end;
    end;
end;

procedure TfDctoEst.SpeedButton1Click(Sender: TObject);
var
  vAux : Real;
begin
  if not DM1.tDctoEstItem.IsEmpty then
    begin
      if RzDBLookupComboBox1.Text = '' then
        begin
          vEdit                              := 'S';
          vAux                               := 0;
          Edit1.Text                         := DM1.tDctoEstItemCodMaterial.AsString;
          RzDBLookupComboBox1.KeyValue          := DM1.tDctoEstItemCodMaterial.AsInteger;
          if DM1.tDctoEstItemCodCor.AsInteger > 0 then
            RxDBLookupCombo3.KeyValue        := DM1.tDctoEstItemCodCor.AsInteger;
          Edit2.Text                         := DM1.tDctoEstItemUnidade.AsString;
          CurrencyEdit1.Value                := DM1.tDctoEstItemQtd.AsFloat;
          CurrencyEdit2.Value                := DM1.tDctoEstItemVlrUnit.AsFloat;
          if DM1.tDctoEstItemMercado.AsString = 'I' then
            ComboBox1.ItemIndex := 1
          else
            ComboBox1.ItemIndex := 0;
          vItem                              := DM1.tDctoEstItemItem.AsInteger;
          tAuxDctoGrade.First;
          while not tAuxDctoGrade.EOF do
            tAuxDctoGrade.Delete;
          DM1.tDctoEstGrade.First;
          while not DM1.tDctoEstGrade.EOF do
            begin
              tAuxDctoGrade.Insert;
              tAuxDctoGradeCodGrade.AsInteger := DM1.tDctoEstGradeCodGrade.AsInteger;
              tAuxDctoGradePosicao.AsInteger  := DM1.tDctoEstGradePosicao.AsInteger;
              tAuxDctoGradeQtd.asFloat        := StrToFloat(FormatFloat('0.00000',DM1.tDctoEstGradeQtd.AsFloat));
              vAux                            := StrToFloat(FormatFloat('0.00000',vAux)) + StrToFloat(FormatFloat('0.00000',DM1.tDctoEstGradeQtd.AsFloat));
              tAuxDctoGrade.Post;
              DM1.tDctoEstGrade.Delete;
            end;
          if vAux > 0 then
            CurrencyEdit1.Value := vAux;
          DM1.tDctoEstTotal.AsFloat := DM1.tDctoEstTotal.AsFloat - DM1.tDctoEstItemVlrTotal.AsFloat;
          DM1.tDctoEstItem.Delete;
          DM1.tDctoEstItem.Refresh;
          Edit1.SetFocus;
        end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfDctoEst.SpeedButton2Click(Sender: TObject);
begin
  Limpa_Edit;
  qCor.Active := False;
  RzDBLookupComboBox1.SetFocus;
  vEdit       := 'N';
  Edit1.SetFocus;
end;

procedure TfDctoEst.SpeedButton3Click(Sender: TObject);
begin
  if not DM1.tDctoEstItem.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este material do Dcto. de Estoque?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
        begin
          while not Dm1.tDctoEstGrade.IsEmpty do
            Dm1.tDctoEstGrade.Delete;
          DM1.tDctoEstTotal.AsFloat := DM1.tDctoEstTotal.AsFloat - DM1.tDctoEstItemVlrTotal.AsFloat;
          DM1.tDctoEstItem.Delete;
          DM1.tDctoEstItem.Refresh;
        end;
    end
  else
    ShowMessage('Não há o que apagar do Dcto. de Estoque!');
end;

procedure TfDctoEst.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if (Key = Vk_F2) and (DM1.tDctoEst.State in [dsBrowse]) then
    begin
      fConsDcto := TfConsDcto.Create(Self);
      fConsDcto.ShowModal;
    end;
  if Key = Vk_F3 then
    begin
      if DM1.tUsuarioConsEstoqueMat.AsBoolean then
        begin
          fConsEstoqueMat := TfConsEstoqueMat.Create(Self);
          if DM1.tDctoEst.State in [dsEdit,dsInsert] then
          begin
            fConsEstoqueMat.btnCopiar.Visible := True;
            fConsEstoqueMat.Panel4.Visible    := True;
          end;
          fConsEstoqueMat.ShowModal;
        end
      else
        ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir esta consulta!');
    end;
end;

procedure TfDctoEst.tAuxDctoGradeBeforeInsert(DataSet: TDataSet);
var
 icount : integer;
begin
  icount := tAuxDctoGrade.RecordCount;
  if icount >= DM1.tGradeItem.RecordCount then
    begin
      fDctoGrade.BitBtn5.SetFocus;
      Abort;
    end;
end;

procedure TfDctoEst.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioInsMaterial.AsBoolean then
    begin
      fMaterial := TfMaterial.Create(Self);
      fMaterial.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfDctoEst.SpeedButton6Click(Sender: TObject);
begin
  if DM1.tUsuarioInsCor.AsBoolean then
    begin
      fCor := TfCor.Create(Self);
      fCor.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfDctoEst.qEstoqueAfterScroll(DataSet: TDataSet);
begin
  qEstoqueGrade.Filtered := False;
  qEstoqueGrade.Filter   := 'CodMaterial = '''+qEstoqueCodMaterial.AsString+''' and CodCor = '''+qEstoqueCodCor.AsString+''' and Largura = '''+qEstoqueLargura.AsString+'''';
  qEstoqueGrade.Filtered := True;
end;

procedure TfDctoEst.FormShow(Sender: TObject);
begin
  DM1.tDctoEst.Open;
  DM1.tDctoEstItem.Open;
  DM1.tDctoEstGrade.Open;
  DM1.tProduto.Open;
  DM1.tProdutoCor.Open;
  DM1.tProdutoTam.Open;
  DM1.tCor.Open;
  DM1.tEstoqueMatMov.Open;
  DM1.tEstoqueMatMovGrade.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tDctoEst.Last;
end;

procedure TfDctoEst.RzDBLookupComboBox1Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfDctoEst.RzDBLookupComboBox1Exit(Sender: TObject);
begin
   CurrencyEdit1.Enabled     := not (DM1.tMaterialLancaGrade.AsBoolean);
  if RzDBLookUpComboBox1.Text <> '' then
    begin
      Edit1.Text   := DM1.tMaterialCodigo.AsString;
      Edit2.Text   := DM1.tMaterialUnidade.AsString;
      qEstoque.Locate('CodMaterial',RzDBLookUpComboBox1.KeyValue,([LocaseInsensitive]));
      if DM1.tMaterialLancaCor.AsBoolean then
        RxDBLookupCombo3.SetFocus
      else
      if not DM1.tMaterialLancaGrade.AsBoolean then
        Edit2.SetFocus
      else
        Edit2.SetFocus;
      if (not DM1.tMaterialPrecoCor.AsBoolean) and ((BitBtn2.Tag <> 1) or (CurrencyEdit2.Value = 0)) then
        CurrencyEdit2.Value := DM1.tMaterialPrCusto.AsFloat;
    end;
end;

procedure TfDctoEst.RzDBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if RzDbLookUpComboBox1.Text <> '' then
    Edit1.Text := DM1.tMaterialCodigo.AsString;
end;

procedure TfDctoEst.DBRadioGroup1Enter(Sender: TObject);
begin
  DBRadioGroup1.ReadOnly := not(DM1.tDctoEstItem.IsEmpty);
end;

end.
