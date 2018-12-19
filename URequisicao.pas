unit URequisicao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, RxLookup, ToolEdit, RXDBCtrl,
  RXCtrls, CurrEdit, Grids, DBGrids, Db, DBTables, MemTable, Variants;

type
  TfRequisicao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Edit1: TEdit;
    RxLabel1: TRxLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxLabel4: TRxLabel;
    Edit2: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    RxLabel5: TRxLabel;
    BitBtn2: TBitBtn;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    RxDBGrid1: TRxDBGrid;
    tAuxReqGrade: TTable;
    tAuxReqGradeCodGrade: TIntegerField;
    tAuxReqGradePosicao: TIntegerField;
    tAuxReqGradeQtd: TFloatField;
    dsAuxReqGrade: TDataSource;
    tReqItemIns: TTable;
    tReqItemInsNroReq: TIntegerField;
    tReqItemInsItem: TIntegerField;
    tReqItemInsCodMaterial: TIntegerField;
    tReqItemInsCodCor: TIntegerField;
    tReqItemInsCodGrade: TIntegerField;
    tReqItemInsUnidade: TStringField;
    tReqItemInsQtd: TFloatField;
    SpeedButton6: TSpeedButton;
    tAuxReqGradelkTamanho: TStringField;
    Query1: TQuery;
    Query1Codigo: TIntegerField;
    Query1Nome: TStringField;
    dsQuery1: TDataSource;
    mSaldo: TMemoryTable;
    mSaldoCodMaterial: TIntegerField;
    mSaldoCodCor: TIntegerField;
    mSaldoQtd: TFloatField;
    StaticText1: TStaticText;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    StaticText2: TStaticText;
    RxLabel6: TRxLabel;
    DBEdit5: TDBEdit;
    CurrencyEdit2: TCurrencyEdit;
    RxLabel7: TRxLabel;
    DBRadioGroup2: TDBRadioGroup;
    Bevel1: TBevel;
    tReqItemInsEstoque: TBooleanField;
    tReqItemInsVlrUnitario: TFloatField;
    mSaldoLargura: TStringField;
    tAuxReqGradelkLargura: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure tAuxReqGradeBeforeInsert(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RxDBLookupCombo2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Limpa_Edit;
    procedure Habilita;
    procedure Limpa_Memo;
    procedure Atualiza_Memo;
    procedure Verifica_Total;
  public
    { Public declarations }
  end;

var
  fRequisicao: TfRequisicao;
  vProduto : LongInt;
  vItem : Integer;
  vEdit : String[1];

implementation

uses UDM1, USetor, UMaterial, UCor, URequisicaoGrade, UConsReq,
  UConsEstoqueMat, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfRequisicao.Atualiza_Memo;
begin
  {if mSaldo.Locate('CodMaterial;CodCor;Largura',VarArrayOf([DM1.tReqItemCodMaterial.AsInteger,DM1.tReqItemCodCor.AsInteger,DM1.tReqItemlkLargura.AsString]),[locaseinsensitive]) then
    begin
      mSaldo.Edit;
      mSaldoQtd.AsFloat := StrToFloat(FormatFloat('0.00000',mSaldoQtd.AsFloat)) + StrToFloat(FormatFloat('0.00000',DM1.tReqItemQtd.AsFloat));
      mSaldo.Post;
    end;}
end;

procedure tfRequisicao.Limpa_Memo;
begin
  mSaldo.EmptyTable;
end;

procedure TfRequisicao.Verifica_Total;
begin
  DM1.tReq.Edit;
  DM1.tReqVlrTotal.AsFloat := 0;
  DM1.tReqItem.First;
  while not DM1.tReqItem.Eof do
    begin
      DM1.tReqVlrTotal.AsFloat := DM1.tReqVlrTotal.AsFloat + (DM1.tReqItemVlrUnitario.AsFloat * DM1.tReqItemQtd.AsFloat);
      DM1.tReqItem.Next;
    end;
  DM1.tReq.Post;
end;

procedure TfRequisicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;
  if Screen.FormCount < 3 then
    begin
      DM1.tSetor.Close;
      DM1.tCliente.Close;
      DM1.tCor.Close;
      DM1.tEstoqueMatMov.Close;
      DM1.tEstoqueMatMovGrade.Close;
      DM1.tReq.Close;
      DM1.tReq2.Close;
      DM1.tReqItem.Close;
      DM1.tReqItem2.Close;
      DM1.tReqItemGrade.Close;
      DM1.tReqItemGrade2.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      DM1.tMaterial.Close;
      DM1.tMaterialCor.Close;
      DM1.tFornecedores.Close;
    end;
  Limpa_Memo;
  Action := Cafree;
end;

procedure TfRequisicao.Habilita;
begin
  DBNavigator1.Enabled := not(DBNavigator1.Enabled);
  BitBtn1.Enabled      := not(BitBtn1.Enabled);
  BitBtn3.Enabled      := not(BitBtn3.Enabled);
  BitBtn4.Enabled      := not(BitBtn4.Enabled);
  BitBtn5.Enabled      := not(BitBtn5.Enabled);
  BitBtn6.Enabled      := not(BitBtn6.Enabled);
  BitBtn8.Enabled      := not(BitBtn8.Enabled);
  Panel3.Enabled       := not(Panel3.Enabled);
end;

procedure TfRequisicao.Limpa_Edit;
begin
  Edit1.Clear;
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo3.ClearValue;
  Edit2.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  Edit1.SetFocus;
end;

procedure TfRequisicao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Nome';
end;

procedure TfRequisicao.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Codigo';
end;

procedure TfRequisicao.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioSetor.AsBoolean then
    begin
      fSetor := TfSetor.Create(Self);
      fSetor.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfRequisicao.SpeedButton6Click(Sender: TObject);
begin
  if DM1.tUsuarioCor.AsBoolean then
    begin
      fCor := TfCor.Create(Self);
      fCor.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfRequisicao.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
    begin
      fMaterial := TfMaterial.Create(Self);
      fMaterial.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfRequisicao.tAuxReqGradeBeforeInsert(DataSet: TDataSet);
var
 icount : integer;
begin
  i2 := 0;
  icount := tAuxReqGrade.RecordCount;
  if icount >= DM1.tGradeItem.RecordCount then
    begin
      fRequisicaoGrade.BitBtn5.SetFocus;
      Abort;
    end;
end;

procedure TfRequisicao.BitBtn1Click(Sender: TObject);
begin
  if DM1.tUsuarioInsRequisicao.AsBoolean then
    begin
      BitBtn8.Tag := 0;
      Habilita;
      DM1.tReq.IndexFieldNames := 'NroReq';
      DM1.tReq.Insert;
      DBEdit1.ReadOnly := False;
      DBEdit1.SetFocus;
      DM1.tReqDtMov.AsDateTime := Date;
      DM1.tReqTipo.AsString    := 'R';
      DM1.tReqMercado.AsString := 'I';
      vEdit := 'N';
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfRequisicao.BitBtn8Click(Sender: TObject);
begin
  vEdit := 'N';
  if DM1.tUsuarioAltRequisicao.AsBoolean then
    begin
      BitBtn8.Tag := 1;
      DM1.tReq.Edit;
      Habilita;
      DM1.tReqItem.First;
      while not DM1.tReqItem.Eof do
        begin
          //*** Apaga o movimento do estoque;
          DM1.tEstoqueMatMov.SetKey;
          DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tReqItemNumMovEst.AsInteger;
          if DM1.tEstoqueMatMov.GotoKey then
            begin
              DM1.tEstoqueMatMovGrade.First;
              while not DM1.tEstoqueMatMovGrade.Eof do
                DM1.tEstoqueMatMovGrade.Delete;
              DM1.tEstoqueMatMov.Delete;
            end;
          //******

          DM1.tReqItem.Next;
        end;
      DM1.tEstoqueMatMov.Refresh;
      DBEdit1.ReadOnly := True;
      RxDBLookupCombo1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfRequisicao.BitBtn5Click(Sender: TObject);
var
  vNumMovEst : Integer;
begin
  if BitBtn8.Tag = 0 then
    begin
      DM1.tReqItem.First;
      while not DM1.tReqItem.Eof do
        begin
          DM1.tReqItemGrade.First;
          while not DM1.tReqItemGrade.Eof do
            DM1.tReqItemGrade.Delete;
          DM1.tReqItem.Delete;
        end;
      DM1.tReq.Delete;
    end
  else
  if BitBtn8.Tag = 1 then
    begin
      DM1.tReq.Cancel;
      DM1.tReqItem.First;
      while not DM1.tReqItem.Eof do
        begin
          //*** Grava o movimento do estoque
          if DM1.tReqItemNumMovEst.AsInteger > 0 then
            begin
              DM1.tEstoqueMatMov.Refresh;
              DM1.tEstoqueMatMov.SetKey;
              DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tReqItemNumMovEst.AsInteger;
              if DM1.tEstoqueMatMov.GotoKey then
                begin
                  DM2.tEstoqueMatMov2.Refresh;
                  DM2.tEstoqueMatMov2.Last;
                  vNumMovEst := DM2.tEstoqueMatMov2NumMov.AsInteger + 1;
                end
              else
                vNumMovEst := DM1.tReqItemNumMovEst.AsInteger;
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
          DM1.tEstoqueMatMovCodMaterial.AsInteger := DM1.tReqItemCodMaterial.AsInteger;
          DM1.tEstoqueMatMovCodCor.AsInteger      := DM1.tReqItemCodCor.AsInteger;
          DM1.tEstoqueMatMovLargura.AsString      := DM1.tReqItemlkLargura.AsString;
          DM1.tEstoqueMatMovDtMov.AsDateTime      := DM1.tReqDtMov.AsDateTime;
          if DM1.tReqTipo.AsString = 'R' then
            begin
              DM1.tEstoqueMatMovES.AsString       := 'S';
              DM1.tEstoqueMatMovQtd2.AsFloat      := StrToFloat(FormatFloat('0.00000',DM1.tReqItemQtd.AsFloat * -1));
            end
          else
            begin
              DM1.tEstoqueMatMovES.AsString       := 'E';
              DM1.tEstoqueMatMovQtd2.AsFloat      := StrToFloat(FormatFloat('0.00000',DM1.tReqItemQtd.AsFloat));
            end;
          DM1.tEstoqueMatMovTipoMov.AsString      := 'REQ';
          DM1.tEstoqueMatMovNumNota.AsInteger     := DM1.tReqItemNroReq.AsInteger;
          DM1.tEstoqueMatMovCodCliForn.AsInteger  := DM1.tReqCodSetor.AsInteger;
          DM1.tEstoqueMatMovVlrUnitario.AsFloat   := DM1.tReqItemVlrUnitario.AsFloat;
          DM1.tEstoqueMatMovQtd.AsFloat           := DM1.tReqItemQtd.AsFloat;
          DM1.tEstoqueMatMovUnidade.AsString      := DM1.tReqItemUnidade.AsString;
          DM1.tMaterial.IndexFieldNames := 'Codigo';
          DM1.tMaterial.SetKey;
          DM1.tMaterialCodigo.AsInteger := DM1.tReqItemCodMaterial.AsInteger;
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
          DM1.tEstoqueMatMovMercado.AsString      := DM1.tReqMercado.AsString;
          DM1.tEstoqueMatMov.Post;

          if DM1.tReqItemCodGrade.AsInteger > 0 then
            begin
              DM1.tReqItemGrade.First;
              while not DM1.tReqItemGrade.Eof do
                begin
                  DM1.tEstoqueMatMovGrade.Insert;
                  DM1.tEstoqueMatMovGradeNumMov.AsInteger   := vNumMovEst;
                  DM1.tEstoqueMatMovGradeTamanho.AsString   := DM1.tReqItemGradelkTamanho.AsString;
                  DM1.tEstoqueMatMovGradeQtd.AsInteger      := DM1.tReqItemGradeQtd.AsInteger;
                  if DM1.tReqTipo.AsString = 'R' then
                    DM1.tEstoqueMatMovGradeQtd2.AsInteger   := DM1.tReqItemGradeQtd.AsInteger * -1
                  else
                    DM1.tEstoqueMatMovGradeQtd2.AsInteger   := DM1.tReqItemGradeQtd.AsInteger;
                  DM1.tEstoqueMatMovGrade.Post;
                  DM1.tReqItemGrade.Next;
                end;
            end;
          DM1.tReqItem.Edit;
          DM1.tReqItemNumMovEst.AsInteger := vNumMovEst;
          DM1.tReqItem.Post;
          //************************************

          DM1.tReqItem.Next;
        end;
    end;
  Verifica_Total;
  Limpa_Memo;
  Limpa_Edit;
  Habilita;
  BitBtn8.Tag := 0;
  DM1.tReq.Refresh;
  DM1.tReqItem.Refresh;
  DM1.tReqItemGrade.Refresh;
  DM1.tEstoqueMatMov.Refresh;
  BitBtn1.SetFocus;
end;

procedure TfRequisicao.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcRequisicao.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir esta Requisicao?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
        begin
          DM1.tReqItem.First;
          while not DM1.tReqItem.Eof do
            begin
              //*** Exclui o movimento do estoque
              DM1.tEstoqueMatMov.SetKey;
              DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tReqItemNumMovEst.AsInteger;
              if DM1.tEstoqueMatMov.GotoKey then
                begin
                  DM1.tEstoqueMatMovGrade.First;
                  while not DM1.tEstoqueMatMovGrade.Eof do
                    DM1.tEstoqueMatMovGrade.Delete;
                  DM1.tEstoqueMatMov.Delete;
                end;
              //******************************
              
              DM1.tReqItemGrade.First;
              while not DM1.tReqItemGrade.Eof do
                DM1.tReqItemGrade.Delete;
              DM1.tReqItem.Delete;
            end;
          Limpa_Memo;
          DM1.tReq.Delete;
          DM1.tReq.Refresh;
          DM1.tReqItem.Refresh;
          DM1.tReqItemGrade.Refresh;
          DM1.tEstoqueMatMov.Refresh;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfRequisicao.BitBtn6Click(Sender: TObject);
var
  vNumMovEst : Integer;
begin
  if (RxDBLookupCombo1.Text <> '') and (DBDateEdit1.Date > 1) and (DbEdit2.Text <> '') and (DBEdit3.Text <> '') then
    begin
      DM1.tReq.Post;
      DM1.tReqItem.First;
      while not DM1.tReqItem.Eof do
        begin
          //*** Grava movimento do estoque
          if DM1.tReqItemNumMovEst.AsInteger > 0 then
            begin
              DM1.tEstoqueMatMov.SetKey;
              DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tReqItemNumMovEst.AsInteger;
              if DM1.tEstoqueMatMov.GotoKey then
                begin
                  DM1.tEstoqueMatMov.Refresh;
                  DM2.tEstoqueMatMov2.Refresh;
                  DM2.tEstoqueMatMov2.Last;
                  vNumMovEst := DM2.tEstoqueMatMov2NumMov.AsInteger + 1;
                end
              else
                vNumMovEst := DM1.tReqItemNumMovEst.AsInteger;
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
          DM1.tEstoqueMatMovCodMaterial.AsInteger := DM1.tReqItemCodMaterial.AsInteger;
          DM1.tEstoqueMatMovCodCor.AsInteger      := DM1.tReqItemCodCor.AsInteger;
          DM1.tEstoqueMatMovLargura.AsString      := DM1.tReqItemlkLargura.AsString;
          DM1.tEstoqueMatMovDtMov.AsDateTime      := DM1.tReqDtMov.AsDateTime;
          if DM1.tReqTipo.AsString = 'R' then
            begin
              DM1.tEstoqueMatMovES.AsString       := 'S';
              DM1.tEstoqueMatMovQtd2.AsFloat      := StrToFloat(FormatFloat('0.00000',DM1.tReqItemQtd.AsFloat * -1));
            end
          else
            begin
              DM1.tEstoqueMatMovES.AsString       := 'E';
              DM1.tEstoqueMatMovQtd2.AsFloat      := StrToFloat(FormatFloat('0.00000',DM1.tReqItemQtd.AsFloat));
            end;
          DM1.tEstoqueMatMovTipoMov.AsString      := 'REQ';
          DM1.tEstoqueMatMovNumNota.AsInteger     := DM1.tReqItemNroReq.AsInteger;
          DM1.tEstoqueMatMovCodCliForn.AsInteger  := DM1.tReqCodSetor.AsInteger;
          DM1.tEstoqueMatMovVlrUnitario.AsFloat   := DM1.tReqItemVlrUnitario.AsFloat;
          DM1.tEstoqueMatMovQtd.AsFloat           := DM1.tReqItemQtd.AsFloat;
          DM1.tEstoqueMatMovUnidade.AsString      := DM1.tReqItemUnidade.AsString;
          DM1.tMaterial.IndexFieldNames := 'Codigo';
          DM1.tMaterial.SetKey;
          DM1.tMaterialCodigo.AsInteger := DM1.tReqItemCodMaterial.AsInteger;
          if DM1.tMaterial.GotoKey then
            begin
              DM1.tEstoqueMatMovPercIcms.AsFloat  := DM1.tMaterialICMS.AsFloat;
              DM1.tEstoqueMatMovPercIpi.AsFloat   := DM1.tMaterialIPI.AsFloat;
            end
          else
            begin
              DM1.tEstoqueMatMovPercIcms.AsFloat  := 0;
              DM1.tEstoqueMatMovPercIpi.AsFloat   := 0;
            end;
          DM1.tEstoqueMatMovVlrDesconto.AsFloat   := 0;
          DM1.tEstoqueMatMovMercado.AsString       := DM1.tReqMercado.AsString;
          DM1.tEstoqueMatMov.Post;
          
          if DM1.tReqItemCodGrade.AsInteger > 0 then
            begin
              DM1.tReqItemGrade.First;
              while not DM1.tReqItemGrade.Eof do
                begin
                  DM1.tEstoqueMatMovGrade.Insert;
                  DM1.tEstoqueMatMovGradeNumMov.AsInteger := vNumMovEst;
                  DM1.tEstoqueMatMovGradeTamanho.AsString := DM1.tReqItemGradelkTamanho.AsString;
                  DM1.tEstoqueMatMovGradeQtd.AsInteger    := DM1.tReqItemGradeQtd.AsInteger;
                  if DM1.tReqTipo.AsString = 'R' then
                    DM1.tEstoqueMatMovGradeQtd2.AsInteger    := DM1.tReqItemGradeQtd.AsInteger * -1
                  else
                    DM1.tEstoqueMatMovGradeQtd2.AsInteger    := DM1.tReqItemGradeQtd.AsInteger;
                  DM1.tEstoqueMatMovGrade.Post;
                  DM1.tReqItemGrade.Next;
                end;
            end;
          DM1.tReqItem.Edit;
          DM1.tReqItemNumMovEst.AsInteger := vNumMovEst;
          DM1.tReqItem.Post;
          //**************************

          DM1.tReqItem.Next;
        end;
      Limpa_Edit;
      Habilita;
      Limpa_Memo;
      BitBtn1.SetFocus;
      DBEdit1.ReadOnly := False;
      Verifica_Total;
    end
  else
    begin
      ShowMessage('Há Campos obrigatórios em "Branco"!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfRequisicao.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsString  := Edit1.Text;
      if DM1.tMaterial.GotoKey then
        begin
          RxDBLookUpCombo2.KeyValue := DM1.tMaterialCodigo.AsInteger;
          vProduto                  := DM1.tMaterialCodigo.AsInteger;
          Edit2.Text                := DM1.tMaterialUnidade.AsString;
          if (not DM1.tMaterialPrecoCor.AsBoolean) and ((BitBtn8.Tag <> 1) or (CurrencyEdit2.Value = 0)) then
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

procedure TfRequisicao.RxDBLookupCombo2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if RxDbLookUpCombo2.Text <> '' then
    Edit1.Text := DM1.tMaterialCodigo.AsString;
end;

procedure TfRequisicao.RxDBLookupCombo2Exit(Sender: TObject);
begin
  CurrencyEdit1.Enabled     := not (DM1.tMaterialLancaGrade.AsBoolean);
  if RxDbLookUpCombo2.Text <> '' then
    begin
      Edit1.Text   := DM1.tMaterialCodigo.AsString;
      Edit2.Text   := DM1.tMaterialUnidade.AsString;
      if DM1.tMaterialLancaCor.AsBoolean then
        RxDBLookupCombo3.SetFocus
      else
      if not DM1.tMaterialLancaGrade.AsBoolean then
        Edit2.SetFocus
      else
        Edit2.SetFocus;
      if (not DM1.tMaterialPrecoCor.AsBoolean) and ((BitBtn8.Tag <> 1) or (CurrencyEdit2.Value = 0)) then
        CurrencyEdit2.Value := DM1.tMaterialPrCusto.AsFloat;
    end;
end;

procedure TfRequisicao.BitBtn2Click(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    vProduto := RxDBLookupCombo2.KeyValue;
  if (CurrencyEdit1.Value <= 0) or (DBEdit1.Text = '') or (vProduto = 0) or (Edit1.Text = '') or (RxDBLookupCombo1.Text = '') or (Edit2.Text = '') then
    begin
      ShowMessage(' Há campos requeridos em branco, você deve acertar p/gravar' + #13 +
                  '"Quant.", "Material", "U.M."  ou "Nº Requisição"');
      Edit1.SetFocus;
    end
  else
    begin
      if (Query1.Active) and (RxDBLookupCombo3.Text = '') and not(Query1.IsEmpty) then
        begin
          ShowMessage('Não pode ser confirmado este item s/ "Cor"!');
          RxDBLookupCombo3.SetFocus;
        end
      else
        begin
          DM1.tReqItem2.Refresh;
          DM1.tReqItem2.Last;
          DM1.tReqItem.Insert;
          DM1.tReqItemNroReq.AsInteger := DM1.tReqNroReq.AsInteger;
          if vEdit = 'S' then
            DM1.tReqItemItem.AsInteger := vItem
          else
            DM1.tReqItemItem.AsInteger := DM1.tReqItem2Item.AsInteger + 1;
          DM1.tReqItemCodMaterial.AsInteger := vProduto;
          if RxDBLookupCombo3.Text <> '' then
            DM1.tReqItemCodCor.AsInteger    := RxDBLookupCombo3.KeyValue;
          DM1.tReqItemQtd.AsFloat           := CurrencyEdit1.Value;
          DM1.tReqItemUnidade.AsString      := Edit2.Text;
          DM1.tReqItemVlrUnitario.AsFloat   := CurrencyEdit2.Value;
          DM1.tReqVlrTotal.AsFloat          := DM1.tReqVlrTotal.AsFloat + (DM1.tReqItemVlrUnitario.AsFloat * DM1.tReqItemQtd.AsFloat);
          tAuxReqGrade.First;
          if not tAuxReqGrade.IsEmpty then
            DM1.tReqItemCodGrade.AsInteger  := tAuxReqGradeCodGrade.AsInteger
          else
            DM1.tReqItemCodGrade.AsInteger  := 0;
          DM1.tReqItem.Post;
    // grava a grade nos itens
          if DM1.tMaterialLancaGrade.AsBoolean then
            begin
              tAuxReqGrade.First;
              while not tAuxReqGrade.IsEmpty do
                begin
                  DM1.tReqItemGrade.Insert;
                  DM1.tReqItemGradeNroReq.AsInteger   := DM1.tReqNroReq.AsInteger;
                  DM1.tReqItemGradeItem.AsInteger     := DM1.tReqItemItem.AsInteger;
                  DM1.tReqItemGradeCodGrade.AsInteger := tAuxReqGradeCodGrade.AsInteger;
                  DM1.tReqItemGradePosicao.AsInteger  := tAuxReqGradePosicao.AsInteger;
                  DM1.tReqItemGradeQtd.AsInteger      := tAuxReqGradeQtd.AsInteger;
                  DM1.tReqItemGrade.Post;
                  tAuxReqGrade.Delete;
                end;
            end;
          Limpa_Edit;
          vEdit := 'N';
          Query1.Active := False;
        end;
    end;
end;

procedure TfRequisicao.SpeedButton2Click(Sender: TObject);
begin
  Limpa_Edit;
  Query1.Active := False;
  RxDBLookupCombo2.SetFocus;
  vEdit         := 'N';
end;

procedure TfRequisicao.SpeedButton3Click(Sender: TObject);
var
  vAux : Real;
begin
  if not DM1.tReqItem.IsEmpty then
    begin
      if RxDBLookupCombo2.Text = '' then
        begin
          vEdit := 'S';
          vAux                               := 0;
          Edit1.Text                         := DM1.tReqItemCodMaterial.AsString;
          RxDBLookupCombo2.KeyValue          := DM1.tReqItemCodMaterial.AsInteger;
          if DM1.tReqItemCodCor.AsInteger > 0 then
            RxDBLookupCombo3.KeyValue        := DM1.tReqItemCodCor.AsInteger;
          CurrencyEdit1.Value                := DM1.tReqItemQtd.AsFloat;
          CurrencyEdit2.Value                := DM1.tReqItemVlrUnitario.AsFloat;
          vItem                              := DM1.tReqItemItem.AsInteger;
          tAuxReqGrade.First;
          while not tAuxReqGrade.EOF do
            tAuxReqGrade.Delete;
          DM1.tReqItemGrade.First;
          while not DM1.tReqItemGrade.EOF do
            begin
              tAuxReqGrade.Insert;
              tAuxReqGradeCodGrade.AsInteger := DM1.tReqItemGradeCodGrade.AsInteger;
              tAuxReqGradePosicao.AsInteger  := DM1.tReqItemGradePosicao.AsInteger;
              tAuxReqGradeQtd.asFloat        := DM1.tReqItemGradeQtd.AsFloat;
              vAux                           := vAux + DM1.tReqItemGradeQtd.AsFloat;
              tAuxReqGrade.Post;
              DM1.tReqItemGrade.Delete;
            end;
          if vAux > 0 then
            CurrencyEdit1.Value := vAux;
          DM1.tReqVlrTotal.AsFloat := DM1.tReqVlrTotal.AsFloat - (DM1.tReqItemVlrUnitario.AsFloat * DM1.tReqItemQtd.AsFloat);
          Atualiza_Memo;
          DM1.tReqItem.Delete;
          //Edit1.OnExit(Sender);
          Edit1.SetFocus;
        end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfRequisicao.SpeedButton4Click(Sender: TObject);
begin
  if not DM1.tReqItem.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este material da Requisição?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
        begin
          while not Dm1.tReqItemGrade.IsEmpty do
            Dm1.tReqItemGrade.Delete;
          DM1.tReqVlrTotal.AsFloat := DM1.tReqVlrTotal.AsFloat - (DM1.tReqItemVlrUnitario.AsFloat * DM1.tReqItemQtd.AsFloat);
          Atualiza_Memo;
          DM1.tReqItem.Delete;
        end;
    end
  else
    ShowMessage('Não há o que apagar da requisição!');
end;

procedure TfRequisicao.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfRequisicao.DBEdit1Exit(Sender: TObject);
begin
  if (BitBtn8.Tag <> 1) and (DM1.tReqNroReq.AsInteger > 0) then
    begin
      DM1.tReq2.First;
      DM1.tReq2.SetKey;
      DM1.tReq2NroReq.AsInteger := StrToInt(DBEdit1.Text);
      if DM1.tReq2.GotoKey then
        begin
          ShowMessage('Já foi dada entrada desta Requisição!');
          DBEdit1.SetFocus;
        end;
    end;
end;

procedure TfRequisicao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tReq.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar a requisição antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfRequisicao.RxDBLookupCombo3Enter(Sender: TObject);
begin
  Query1.Active := False;
  Query1.Params[0].AsInteger := RxDBLookupCombo2.KeyValue;
  Query1.Active := True;
end;

procedure TfRequisicao.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfRequisicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 65) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if (Key = Vk_F2) and (DM1.tReq.State in [dsBrowse]) then
    begin
      fConsReq := TfConsReq.Create(Self);
      fConsReq.ShowModal;
    end;
  if Key = Vk_F3 then
    begin
      if DM1.tUsuarioConsEstoqueMat.AsBoolean then
        begin
          fConsEstoqueMat := TfConsEstoqueMat.Create(Self);
          fConsEstoqueMat.ShowModal;
        end
      else
        ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir esta consulta!');
    end;
end;

procedure TfRequisicao.Edit2Exit(Sender: TObject);
begin
  if DM1.tMaterialLancaGrade.AsBoolean then
    begin
      fRequisicaoGrade := tfRequisicaoGrade.Create(Self);
      fRequisicaoGrade.ShowModal;
    end;
end;

procedure TfRequisicao.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if (DM1.tMaterialLancaCor.AsBoolean) and (DM1.tMaterialPrecoCor.AsBoolean) and
     (RxDBLookupCombo3.Text <> '') and ((BitBtn8.Tag <> 1) or (CurrencyEdit2.Value = 0)) then
    begin
      if DM1.tMaterialCor.Locate('CodMaterial;CodCor',VarArrayOf([RxDBLookupCombo2.KeyValue,RxDBLookupCombo3.KeyValue]),[locaseinsensitive]) then
        CurrencyEdit2.Value := DM1.tMaterialCorPrCusto.AsFloat;
    end;
end;

procedure TfRequisicao.FormShow(Sender: TObject);
begin
  DM1.tSetor.Open;
  DM1.tCliente.Open;
  DM1.tCor.Open;
  DM1.tEstoqueMatMov.Open;
  DM1.tEstoqueMatMovGrade.Open;
  DM1.tReq.Open;
  DM1.tReq2.Open;
  DM1.tReqItem.Open;
  DM1.tReqItem2.Open;
  DM1.tReqItemGrade.Open;
  DM1.tReqItemGrade2.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  DM1.tFornecedores.Open;
end;

end.
