unit UOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, RxLookup, ToolEdit, RXDBCtrl,
  RXCtrls, CurrEdit, Grids, DBGrids, Db, DBTables, MemTable, Menus, Variants,
  RzDBCmbo;

type
  TfOS = class(TForm)
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
    Edit1: TEdit;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    SpeedButton2: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    RxDBGrid1: TRxDBGrid;
    SpeedButton6: TSpeedButton;
    Query1: TQuery;
    dsQuery1: TDataSource;
    StaticText1: TStaticText;
    RadioGroup1: TRadioGroup;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    qExportacao: TQuery;
    qExportacaoLote: TIntegerField;
    qExportacaoCodMaterial: TIntegerField;
    qExportacaoCodCor: TIntegerField;
    qExportacaoConsumoPr: TFloatField;
    qExportacaoQtdPares: TFloatField;
    qExportacaoUnidade: TStringField;
    qInterno: TQuery;
    qExportacaoPedido: TIntegerField;
    qExportacaoItem: TIntegerField;
    qExportacaoLargura: TStringField;
    qExportacaoCodGrade: TIntegerField;
    tTalaoGrade: TTable;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Visualizar1: TMenuItem;
    qMateriais: TQuery;
    qMateriaisCodigo: TIntegerField;
    qMateriaisCodMaterial: TIntegerField;
    qMateriaisNome: TStringField;
    qsMateriais: TDataSource;
    Query1Codigo: TIntegerField;
    Query1CodCor: TIntegerField;
    Query1Nome: TStringField;
    tTalaoGradeLote: TIntegerField;
    tTalaoGradeItem: TIntegerField;
    tTalaoGradeTalao: TIntegerField;
    tTalaoGradeCodGrade: TIntegerField;
    tTalaoGradePosicao: TIntegerField;
    tTalaoGradeQtdPar: TIntegerField;
    tTalaoGradelkTamanho: TStringField;
    RxLabel6: TRxLabel;
    DBEdit3: TDBEdit;
    Email1: TMenuItem;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure RxDBLookupCombo2KeyPress(Sender: TObject; var Key: Char);
    procedure Email1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzDBLookupComboBox1Enter(Sender: TObject);
    procedure RzDBLookupComboBox1Exit(Sender: TObject);
    procedure RzDBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Limpa_Edit;
    procedure Habilita;
    procedure Grava_Itens_MI;
    procedure Grava_Itens_Exp;
  public
    { Public declarations }
  end;

var
  fOS: TfOS;

implementation

uses UDM1, USetor, UMaterial, UCor, UConsEstoqueMat, UDM2, UFornecedores,
  UConsOS, URelOS, UConsOCFornec, UAgendaTelef, URelOSMail, uUtil;

{$R *.DFM}

procedure TfOS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      Dm1.tOS.Close;
      Dm1.tOSItens.Close;
      Dm1.tOSGrade.Close;
      Dm1.tMaterial.Close;
      DM1.tMaterialCor.Close;
      Dm1.tMaterialGradeNum.Close;
      Dm1.tPedido.Close;
      Dm1.tPedidoItem.Close;
      Dm1.tPedidoGrade.Close;
      Dm1.tPedidoMaterial.Close;
      Dm1.tCor.Close;
      Dm1.tLoteMI.Close;
      Dm1.tLotePedidoMI.Close;
      Dm1.tOrdemCompra.Close;
      DM1.tOrdemCompraItem.Close;
      DM1.tOrdemCompraItemGrade.Close;
      Dm1.tFornecedores.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      Dm1.tReq.Close;
      DM1.tReqItem.Close;
      DM1.tReqItemGrade.Close;
      DM1.tProduto.Close;
    end;
  Action := Cafree;
end;

procedure TfOS.Grava_Itens_MI;
var
 vTamMaterial : String[3];
 vLargura : String[1];
 vItemAux : Integer;
begin
  if DM1.tMaterialCodGrade.AsInteger > 0 then
    vLargura := DM1.tPedidoItemlkLargura.AsString
  else
    vLargura := '';
  if DM1.tOSItens.Locate('NumLote;CodMaterial;CodCor;Mercado;Largura',VarArrayOf([DM1.tLoteMILote.AsInteger,DM1.tPedidoMaterialCodMaterial.AsInteger,DM1.tPedidoMaterialCodCor.AsInteger,'I',vLargura]),[locaseinsensitive]) then
    begin
      DM1.tOSItens.Edit;
      DM1.tOSItensQtde.AsFloat := DM1.tOSItensQtde.AsFloat + (DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tPedidoItemQtdPares.AsFloat);

      DM1.tOSQtde.AsFloat      := DM1.tOSQtde.AsFloat + (DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tPedidoItemQtdPares.AsFloat);

      DM1.tOSItens.Post;
      if DM1.tMaterialCodGrade.AsInteger > 0 then
        begin
          DM1.tPedidoGrade.First;
          while not DM1.tPedidoGrade.Eof do
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
                  DM1.tOSGrade.SetKey;
                  DM1.tOSGradeNumOS.AsInteger  := DM1.tOSNumOS.AsInteger;
                  DM1.tOSGradeItem.AsInteger   := DM1.tOSItensItem.AsInteger;
                  DM1.tOSGradeTamanho.AsString := vTamMaterial;
                  if DM1.tOSGrade.GotoKey then
                    begin
                      DM1.tOSGrade.Edit;
                      DM1.tOSGradeQtde.AsFloat     := DM1.tOSGradeQtde.AsFloat + DM1.tPedidoGradeQtd.AsFloat;
                      DM1.tOSGrade.Post;
                    end
                  else
                    begin
                      DM1.tOSGrade.Insert;
                      DM1.tOSGradeNumOS.AsInteger  := DM1.tOSNumOS.AsInteger;
                      DM1.tOSGradeItem.AsInteger   := DM1.tOSItensItem.AsInteger;
                      DM1.tOSGradeTamanho.AsString := vTamMaterial;
                      DM1.tOSGradeQtde.AsFloat     := DM1.tPedidoGradeQtd.AsFloat;
                      DM1.tOSGrade.Post;
                    end;
                end;
              DM1.tPedidoGrade.Next;
            end;
        end;
    end
  else
    begin
      DM1.tOSItens.Refresh;
      DM1.tOSItens.Last;
      vItemAux := DM1.tOSItensItem.AsInteger;

      DM1.tOSItens.Insert;
      DM1.tOSItensNumOS.AsInteger       := DM1.tOSNumOS.AsInteger;
      DM1.tOSItensItem.AsInteger        := vItemAux + 1;
      DM1.tOSItensNumLote.AsInteger     := DM1.tLoteMILote.AsInteger;
      DM1.tOSItensCodMaterial.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
      DM1.tOSItensCodCor.AsInteger      := DM1.tPedidoMaterialCodCor.AsInteger;
      DM1.tOSItensMercado.AsString      := 'I';
      DM1.tOSItensLargura.AsString      := vLargura;
      DM1.tOSItensQtde.AsFloat          := DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tPedidoItemQtdPares.AsFloat;
      DM1.tOSItensUnidade.AsString      := DM1.tPedidoMateriallkUnidade.AsString;

      DM1.tOSQtde.AsFloat := DM1.tOSQtde.AsFloat + (DM1.tPedidoMaterialConsumoPr.AsFloat * DM1.tPedidoItemQtdPares.AsFloat);

      DM1.tOSItens.Post;
      if DM1.tMaterialCodGrade.AsInteger > 0 then
        begin
          DM1.tPedidoGrade.First;
          while not DM1.tPedidoGrade.Eof do
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
                  DM1.tOSGrade.SetKey;
                  DM1.tOSGradeNumOS.AsInteger  := DM1.tOSNumOS.AsInteger;
                  DM1.tOSGradeItem.AsInteger   := DM1.tOSItensItem.AsInteger;
                  DM1.tOSGradeTamanho.AsString := vTamMaterial;
                  if DM1.tOSGrade.GotoKey then
                    begin
                      DM1.tOSGrade.Edit;
                      DM1.tOSGradeQtde.AsFloat     := DM1.tOSGradeQtde.AsFloat + DM1.tPedidoGradeQtd.AsFloat;
                      DM1.tOSGrade.Post;
                    end
                  else
                    begin
                      DM1.tOSGrade.Insert;
                      DM1.tOSGradeNumOS.AsInteger  := DM1.tOSNumOS.AsInteger;
                      DM1.tOSGradeItem.AsInteger   := DM1.tOSItensItem.AsInteger;
                      DM1.tOSGradeTamanho.AsString := vTamMaterial;
                      DM1.tOSGradeQtde.AsFloat     := DM1.tPedidoGradeQtd.AsFloat;
                      DM1.tOSGrade.Post;
                    end;
                end;
              DM1.tPedidoGrade.Next;
            end;
        end;
    end;
end;

procedure TfOS.Grava_Itens_Exp;
var
 vTamMaterial : String[3];
 vLargura : String[1];
 vItemAux : Integer;
begin
  if DM1.tMaterialCodGrade.AsInteger > 0 then
    vLargura := qExportacaoLargura.AsString
  else
    vLargura := '';
  if DM1.tOSItens.Locate('NumLote;CodMaterial;CodCor;Mercado;Largura',VarArrayOf([qExportacaoLote.AsInteger,qExportacaoCodMaterial.AsInteger,qExportacaoCodCor.AsInteger,'E',vLargura]),[locaseinsensitive]) then
    ShowMessage('Já existe este material cadastrado nesta OS no item = ' + DM1.tOSItensItem.AsString)
  else
    begin
      DM1.tOSItens.Refresh;
      DM1.tOSItens.Last;
      vItemAux := DM1.tOSItensItem.AsInteger;
      DM1.tOSItens.Insert;
      DM1.tOSItensNumOS.AsInteger       := DM1.tOSNumOS.AsInteger;
      DM1.tOSItensItem.AsInteger        := vItemAux + 1;
      DM1.tOSItensNumLote.AsInteger     := qExportacaoLote.AsInteger;
      DM1.tOSItensCodMaterial.AsInteger := qExportacaoCodMaterial.AsInteger;
      DM1.tOSItensMercado.AsString      := 'E';
      if qExportacaoCodCor.AsInteger > 0 then
        DM1.tOSItensCodCor.AsInteger := qExportacaoCodCor.AsInteger
      else
        DM1.tOSItensCodCor.AsInteger := 0;
      DM1.tOSItensLargura.AsString := vLargura;
      DM1.tOSItensQtde.AsFloat     := qExportacaoConsumoPr.AsFloat * qExportacaoQtdPares.AsFloat;
      DM1.tOSItensUnidade.AsString := qExportacaoUnidade.AsString;

      DM1.tOSQtde.AsFloat      := DM1.tOSQtde.AsFloat + (qExportacaoConsumoPr.AsFloat * qExportacaoQtdPares.AsFloat);

      DM1.tOSItens.Post;
      if DM1.tMaterialCodGrade.AsInteger > 0 then
        begin
          tTalaoGrade.Filtered := False;
          tTalaoGrade.Filter   := 'Lote = '''+IntToStr(qExportacaoLote.AsInteger)+'''';
          tTalaoGrade.Filtered := True;
          tTalaoGrade.First;
          while not tTalaoGrade.Eof do
            begin
              if tTalaoGradeQtdPar.AsInteger > 0 then
                begin
                  DM1.tMaterialGradeNum.SetKey;
                  DM1.tMaterialGradeNumCodMaterial.AsInteger := qExportacaoCodMaterial.AsInteger;
                  DM1.tMaterialGradeNumCodGrade.AsInteger    := tTalaoGradeCodGrade.AsInteger;
                  DM1.tMaterialGradeNumPosicao.AsInteger     := tTalaoGradePosicao.AsInteger;
                  if not DM1.tMaterialGradeNum.GotoKey then
                    vTamMaterial := tTalaoGradelkTamanho.AsString
                  else
                    vTamMaterial := DM1.tMaterialGradeNumTamMaterial.AsString;
                  DM1.tOSGrade.SetKey;
                  DM1.tOSGradeNumOS.AsInteger  := DM1.tOSNumOS.AsInteger;
                  DM1.tOSGradeItem.AsInteger   := DM1.tOSItensItem.AsInteger;
                  DM1.tOSGradeTamanho.AsString := vTamMaterial;
                  if DM1.tOSGrade.GotoKey then
                    begin
                      DM1.tOSGrade.Edit;
                      DM1.tOSGradeQtde.AsFloat := DM1.tOSGradeQtde.AsFloat + tTalaoGradeQtdPar.AsFloat;
                      DM1.tOSGrade.Post;
                    end
                  else
                    begin
                      DM1.tOSGrade.Insert;
                      DM1.tOSGradeNumOS.AsInteger  := DM1.tOSNumOS.AsInteger;
                      DM1.tOSGradeItem.AsInteger   := DM1.tOSItensItem.AsInteger;
                      DM1.tOSGradeTamanho.AsString := vTamMaterial;
                      DM1.tOSGradeQtde.AsFloat     := tTalaoGradeQtdPar.AsFloat;
                      DM1.tOSGrade.Post;
                    end;
                end;
              tTalaoGrade.Next;
            end;
        end;
    end;
end;

procedure TfOS.Habilita;
begin
  RxSpeedButton1.Enabled := not(RxSpeedButton1.Enabled);
  DBNavigator1.Enabled   := not(DBNavigator1.Enabled);
  BitBtn1.Enabled        := not(BitBtn1.Enabled);
  BitBtn3.Enabled        := not(BitBtn3.Enabled);
  BitBtn4.Enabled        := not(BitBtn4.Enabled);
  BitBtn5.Enabled        := not(BitBtn5.Enabled);
  BitBtn6.Enabled        := not(BitBtn6.Enabled);
  BitBtn8.Enabled        := not(BitBtn8.Enabled);
  Panel3.Enabled         := not(Panel3.Enabled);
end;

procedure TfOS.Limpa_Edit;
begin
  Edit1.Clear;
  RzDBLookupComboBox1.ClearkeyValue;
  RxDBLookupCombo3.ClearValue;
  Edit1.SetFocus;
end;

procedure TfOS.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
    begin
      fFornecedores := TfFornecedores.Create(Self);
      fFornecedores.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfOS.SpeedButton6Click(Sender: TObject);
begin
  if DM1.tUsuarioCor.AsBoolean then
    begin
      fCor := TfCor.Create(Self);
      fCor.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfOS.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
    begin
      fMaterial := TfMaterial.Create(Self);
      fMaterial.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfOS.BitBtn1Click(Sender: TObject);
var
  vNum : Integer;
begin
  if DM1.tUsuarioInsOS.AsBoolean then
    begin
      BitBtn8.Tag                 := 0;
      DM1.tOS.IndexFieldNames     := 'NumOS';
      DM1.tOS.Refresh;
      DM1.tOS.Last;
      vNum := DM1.tOSNumOS.AsInteger;

      DM1.tOS.Insert;
      DM1.tOSNumOS.AsInteger      := vNum + 1;
      DM1.tOSDtEmissao.AsDateTime := Date;
      DM1.tOSQtde.AsFloat         := 0;
      DM1.tOS.Post;
      DM1.tOS.Edit;
      DBEdit2.ReadOnly := False;
      Habilita;
      DBDateEdit1.SetFocus;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer inserção!');
end;

procedure TfOS.BitBtn8Click(Sender: TObject);
begin
  if DM1.tUsuarioAltOS.AsBoolean then
    begin
      BitBtn8.Tag := 1;
      DM1.tOS.Edit;
      Habilita;
      DBDateEdit1.SetFocus;
      DBEdit2.ReadOnly := True;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer alteração!');
end;

procedure TfOS.BitBtn5Click(Sender: TObject);
begin
  if BitBtn8.Tag = 0 then
    begin
      DM1.tOSItens.First;
      while not DM1.tOSItens.Eof do
        begin
          DM1.tOSGrade.First;
          while not DM1.tOSGrade.Eof do
            DM1.tOSGrade.Delete;
          DM1.tOSItens.Delete;
        end;
      DM1.tOS.Delete;
    end
  else
  if BitBtn8.Tag = 1 then
    DM1.tOS.Cancel;
  Limpa_Edit;
  Habilita;
  BitBtn8.Tag := 0;
  DM1.tOS.Refresh;
  DM1.tOSItens.Refresh;
  DM1.tOSGrade.Refresh;
  BitBtn1.SetFocus;
end;

procedure TfOS.BitBtn3Click(Sender: TObject);
begin
  if DM1.tUsuarioExcOS.AsBoolean then
    begin
      if MessageDlg('Deseja realmente excluir este Registro?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
        begin
          DM1.tOSItens.First;
          while not DM1.tOSItens.Eof do
            begin
              DM1.tOSGrade.First;
              while not DM1.tOSGrade.Eof do
                DM1.tOSGrade.Delete;
              DM1.tOSItens.Delete;
            end;
          DM1.tOS.Delete;
          DM1.tOS.Refresh;
          DM1.tOSItens.Refresh;
          DM1.tOSGrade.Refresh;
        end;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a fazer exclusão!');
end;

procedure TfOS.BitBtn6Click(Sender: TObject);
begin
  if (RxDBLookupCombo1.Text <> '') and (DBDateEdit1.Date > 1) then
    begin
      DM1.tOS.Post;
      BitBtn8.Tag := 0;
      Limpa_Edit;
      Habilita;
      BitBtn1.SetFocus;
    end
  else
    begin
      ShowMessage('Há Campos obrigatórios em "Branco"!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfOS.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      qMateriais.Active              := False;
      qMateriais.Params[0].AsInteger := DM1.tOSNumOC.AsInteger;
      qMateriais.Active              := True;
      if qMateriais.Locate('CodMaterial',StrToInt(Edit1.Text),[loCaseInsensitive]) then
        RzDBLookupComboBox1.KeyValue := StrToInt(Edit1.Text)
      else
        begin
          ShowMessage('Material não encontrado!');
          Edit1.SetFocus;
        end;
    end;
end;

procedure TfOS.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RzDBLookupComboBox1.Text <> '' then
    Edit1.Text := IntToStr(RzDBLookupComboBox1.KeyValue);
end;

procedure TfOS.BitBtn2Click(Sender: TObject);
begin
  if RzDBLookupComboBox1.Text <> '' then
    begin
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsInteger := RzDBLookupComboBox1.KeyValue;
      if (DM1.tMaterial.GotoKey) and ((DM1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo3.Text = '')) then
        begin
          ShowMessage('Falta lançar a cor');
          RxDBLookupCombo3.SetFocus;
        end
      else
      if DM1.tMaterial.GotoKey then
        begin
          Screen.Cursor := crHourGlass;
          //*** Exportação
          if RadioGroup1.ItemIndex = 0 then
            begin
              qExportacao.Close;
              qExportacao.Params[0].AsInteger := CurrencyEdit3.AsInteger;
              qExportacao.Params[1].AsInteger := CurrencyEdit4.AsInteger;
              qExportacao.Params[2].AsInteger := RzDBLookupComboBox1.KeyValue;
              qExportacao.Open;
              while not qExportacao.Eof do
                begin
                  if (RxDBLookupCombo3.Text = '') and (qExportacaoCodCor.AsInteger < 1) then
                    Grava_Itens_Exp
                  else
                  if (RxDBLookupCombo3.Text <> '') and (RxDBLookupCombo3.KeyValue = qExportacaoCodCor.AsInteger) then
                    Grava_Itens_Exp;
                  qExportacao.Next;
                end;
              qExportacao.Close;
            end
          else
          //*** Mercado Interno
            begin
              DM1.tLoteMI.Filtered := False;
              DM1.tLoteMI.Filter   := 'Lote >= '''+CurrencyEdit3.Text+''' and Lote <= '''+CurrencyEdit4.Text+'''';
              DM1.tLoteMI.Filtered := True;
              DM1.tLoteMI.First;
              while not DM1.tLoteMI.Eof do
                begin
                  DM1.tLotePedidoMI.First;
                  while not DM1.tLotePedidoMI.Eof do
                    begin
                      DM1.tPedido.IndexFieldNames := 'Pedido';
                      DM1.tPedido.SetKey;
                      DM1.tPedidoPedido.AsInteger := DM1.tLotePedidoMIPedido.AsInteger;
                      if DM1.tPedido.GotoKey then
                        begin
                          DM1.tPedidoItem.First;
                          while not DM1.tPedidoItem.Eof do
                            begin
                              DM1.tPedidoMaterial.First;
                              while not DM1.tPedidoMaterial.Eof do
                                begin
                                  if DM1.tPedidoMaterialCodMaterial.AsInteger = RzDBLookupComboBox1.KeyValue then
                                    begin
                                      if ((RxDBLookupCombo3.Text <> '') and (RxDBLookupCombo3.KeyValue = DM1.tPedidoMaterialCodCor.AsInteger)) or
                                         ((RxDBLookupCombo3.Text = '') and (DM1.tPedidoMaterialCodCor.AsInteger < 1)) then
                                        Grava_Itens_MI;
                                    end;
                                  DM1.tPedidoMaterial.Next;
                                end;
                              DM1.tPedidoItem.Next;
                            end;
                        end;
                      DM1.tLotePedidoMI.Next;
                    end;
                  DM1.tLoteMI.Next;
                end;
              DM1.tLoteMI.Filtered := False;
            end;
          Screen.Cursor := crDefault;
        end;
    end;
  Limpa_Edit;
end;

procedure TfOS.SpeedButton2Click(Sender: TObject);
begin
  Limpa_Edit;
  Query1.Active := False;
  RzDBLookupComboBox1.SetFocus;
end;

procedure TfOS.SpeedButton4Click(Sender: TObject);
begin
  if not DM1.tOSItens.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este material da Requisição?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
        begin
          while not Dm1.tOSGrade.IsEmpty do
            Dm1.tOSGrade.Delete;
          DM1.tOSQtde.AsFloat := DM1.tOSQtde.AsFloat - DM1.tOSItensQtde.AsFloat;
          DM1.tOSItens.Delete;
        end;
    end
  else
    ShowMessage('Não há o que apagar da requisição!');
end;

procedure TfOS.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfOS.FormCloseQuery(Sender: TObject;
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

procedure TfOS.RxDBLookupCombo3Enter(Sender: TObject);
begin
  if (DM1.tOSNumOC.AsInteger > 0) and (RzDBLookupComboBox1.Text <> '') then
    begin
      Query1.Active              := False;
      Query1.Params[0].AsInteger := DM1.tOSNumOC.AsInteger;
      Query1.Params[1].AsInteger := RzDBLookupComboBox1.KeyValue;
      Query1.Active              := True;
    end
  else
    begin
      ShowMessage('Deve ser informado uma Ordem de Compra p/ e um material p/ selecionar uma cor!');
      DBEdit2.SetFocus;
    end;
end;

procedure TfOS.RxDBLookupCombo2Enter(Sender: TObject);
begin
  if DM1.tOSNumOC.AsInteger > 0 then
    begin
      if Edit1.Text = '' then
        begin
          qMateriais.Active              := False;
          qMateriais.Params[0].AsInteger := DM1.tOSNumOC.AsInteger;
          qMateriais.Active              := True;
        end;
    end
  else
    begin
      ShowMessage('Deve ser informado uma Ordem de Compra p/ selecionar um material!');
      DBEdit2.SetFocus;
    end;
end;

procedure TfOS.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if (Key = Vk_F2) and (DM1.tOS.State in [dsBrowse]) then
    begin
      fConsOS := TfConsOS.Create(Self);
      fConsOS.ShowModal;
    end;
  if (Key = Vk_F3) and (DM1.tOS.State in [dsEdit]) and (DM1.tOSCodFornecedor.AsInteger > 0) then
    begin
      fConsOCFornec := TfConsOCFornec.Create(Self);
      fConsOCFornec.ShowModal;
      DBEdit2.SetFocus;
    end;
  if (Key = Vk_F3) and ((DM1.tOS.State in [dsBrowse]) or (DM1.tOSCodFornecedor.AsInteger < 1)) then
    ShowMessage('Você deve estar editandou ou inserindo uma "OS" e/ou um fornecedor selecionado p/ chamar esta consulta!');
end;

procedure TfOS.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tOS.IndexFieldNames := 'NumOS';
end;

procedure TfOS.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfOS.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'CodForn'
end;

procedure TfOS.DBEdit2Exit(Sender: TObject);
begin
  if (DBEdit2.Text <> '') and (DM1.tOSCodFornecedor.AsInteger > 0) then
    begin
      DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
      DM1.tOrdemCompra.SetKey;
      DM1.tOrdemCompraFilial.AsInteger := 1;
      DM1.tOrdemCompraCodigo.AsInteger := StrToInt(DBEdit2.Text);
      if not(DM1.tOrdemCompra.GotoKey) or (DM1.tOrdemCompraCodFornecedor.AsInteger <> DM1.tOSCodFornecedor.AsInteger) then
        begin
          ShowMessage('Não existe "Ordem de Compra" c/ esse nº p/ o fornecedor informado!');
          DBEdit2.SetFocus;
        end;
    end
  else
    ShowMessage('É necessário informar o fornecedor e um nº p/ Ordem de Compra!');
end;

procedure TfOS.Visualizar1Click(Sender: TObject);
begin
  fRelOS := TfRelOS.Create(Self);
  fRelOS.QuickRep1.Preview;
  fRelOS.QuickRep1.Free;
end;

procedure TfOS.FormCreate(Sender: TObject);
begin
  DM1.tOS.Open;
  DM1.tOS.IndexFieldNames := 'NumOS';
  DM1.tOS.Last;
end;

procedure TfOS.Edit1Enter(Sender: TObject);
begin
  if DM1.tOSNumOC.AsInteger < 1 then
    begin
      ShowMessage('Deve ser informado uma Ordem de Compra p/ selecionar um material!');
      DBEdit2.SetFocus;
    end;
end;

procedure TfOS.RxDBLookupCombo2KeyPress(Sender: TObject; var Key: Char);
begin
  if RzDBLookupComboBox1.Text <> '' then
    Edit1.Text := IntToStr(RzDBLookupComboBox1.KeyValue);
end;

procedure TfOS.Email1Click(Sender: TObject);
var
  NumOrd : integer;
begin
  NumOrd := DM1.tOSNumOS.AsInteger;
  Dm1.tFornecedores.Filtered := False;
  Dm1.tFornecedores.Filter   := 'CodForn = '''+IntToStr(Dm1.tOSCodFornecedor.AsInteger)+'''';
  Dm1.tFornecedores.Filtered := True;

  DM1.tOS.Filtered  := False;
  DM1.tOS.Filter    := 'NumOS = '''+IntToStr(NumOrd)+'''';
  DM1.tOS.Filtered  := True;

  vEmail_Fortes         := DM1.tFornecedoresEmail.AsString;
  vEmail_Assunto_Fortes := 'OS Nº ' + IntToStr(NumOrd);
  vEmail_Fortes_Corpo   := 'Em anexo OS' + #13
                         + DM1.tFilialEmpresa.AsString + #13
                         + 'CNPJ:' + DM1.tFilialCNPJ.AsString;

  fRelOSMail := TfRelOSMail.Create(Self);
  fRelOSMail.RLReport1.PreviewModal;
  fRelOSMail.RLReport1.Free;

  DM1.tOS.Filtered  := False;
  Dm1.tFornecedores.Filtered := False;
  Dm1.tOS.FindKey([NumOrd]);
  vEmail_Fortes         := '';
  vEmail_Assunto_Fortes := '';
end;

procedure TfOS.FormShow(Sender: TObject);
begin
  Dm1.tOS.Open;
  Dm1.tOSItens.Open;
  Dm1.tOSGrade.Open;
  Dm1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  Dm1.tMaterialGradeNum.Open;
  Dm1.tPedido.Open;
  Dm1.tPedidoItem.Open;
  Dm1.tPedidoGrade.Open;
  Dm1.tPedidoMaterial.Open;
  Dm1.tCor.Open;
  Dm1.tLoteMI.Open;
  Dm1.tLotePedidoMI.Open;
  Dm1.tOrdemCompra.Open;
  DM1.tOrdemCompraItem.Open;
  DM1.tOrdemCompraItemGrade.Open;
  Dm1.tFornecedores.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  Dm1.tReq.Open;
  DM1.tReqItem.Open;
  DM1.tReqItemGrade.Open;
  DM1.tProduto.Open;
end;

procedure TfOS.RzDBLookupComboBox1Enter(Sender: TObject);
begin
  if DM1.tOSNumOC.AsInteger > 0 then
    begin
      if Edit1.Text = '' then
        begin
          qMateriais.Active              := False;
          qMateriais.Params[0].AsInteger := DM1.tOSNumOC.AsInteger;
          qMateriais.Active              := True;
        end;
    end
  else
    begin
      ShowMessage('Deve ser informado uma Ordem de Compra p/ selecionar um material!');
      DBEdit2.SetFocus;
    end;
end;

procedure TfOS.RzDBLookupComboBox1Exit(Sender: TObject);
begin
  if RzDbLookUpComboBox1.Text <> '' then
    Edit1.Text := IntToStr(RzDbLookUpComboBox1.KeyValue);
end;

procedure TfOS.RzDBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if RzDbLookUpComboBox1.Text <> '' then
    Edit1.Text := IntToStr(RzDbLookUpComboBox1.KeyValue);
end;

end.
