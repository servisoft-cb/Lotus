unit UDevolucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, RxLookup, Mask, ToolEdit, RXDBCtrl,
  DBFilter, Db, DBTables, Grids, DBGrids, CurrEdit, Variants, RzDBCmbo;

type
  TfDevolucao = class(TForm)
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
    StaticText1: TStaticText;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label4: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label5: TLabel;
    DBDateEdit3: TDBDateEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    RxDBFilter1: TRxDBFilter;
    Label9: TLabel;
    SpeedButton2: TSpeedButton;
    qMatRef: TQuery;
    dsqMatRef: TDataSource;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label10: TLabel;
    qCorRef: TQuery;
    qCorRefCodCor: TIntegerField;
    qCorRefNome: TStringField;
    dsqCorRef: TDataSource;
    Label11: TLabel;
    Edit1: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Label12: TLabel;
    BitBtn7: TBitBtn;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label13: TLabel;
    DBText2: TDBText;
    StaticText2: TStaticText;
    RxDBGrid1: TRxDBGrid;
    Label14: TLabel;
    DBDateEdit4: TDBDateEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    Label16: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SpeedButton5: TSpeedButton;
    Label17: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    RxDBLookupCombo6: TRxDBLookupCombo;
    SpeedButton6: TSpeedButton;
    Label18: TLabel;
    SpeedButton7: TSpeedButton;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    tDevolucaoProd2: TTable;
    tDevolucaoProd2NumMov: TIntegerField;
    tDevolucaoProd2Item: TIntegerField;
    tDevolucaoProd2CodProduto: TIntegerField;
    tDevolucaoProd2CodCor: TIntegerField;
    tDevolucaoProd2Tamanho: TStringField;
    tDevolucaoProd2QtdPares: TFloatField;
    tDevolucaoProd2QtdParesInd: TFloatField;
    tDevolucaoProd2QtdParesCons: TFloatField;
    tDevolucaoProd2DtIndenizado: TDateField;
    tDevolucaoProd2DtConserto: TDateField;
    tDevolucaoProd2QtdParesSub: TFloatField;
    tDevolucaoProd2DtSubstituicao: TDateField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure RxDBLookupCombo6Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure RzDBLookupComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Mostra_Resolvido;
    procedure Verifica_Resolvido;
    procedure Habilita;
  public
    { Public declarations }
  end;

var
  fDevolucao: TfDevolucao;

implementation

uses UDM1, UDM2, UCliente, UProduto, UDevolucaoBaixa, UConsDevolucao,
  UTransp, UDefeitos, UPendencias, UAgendaTelef;

{$R *.DFM}

procedure TfDevolucao.Mostra_Resolvido;
begin
  StaticText2.Visible := DM1.tDevolucaoResolvido.AsBoolean;
end;

procedure TfDevolucao.Habilita;
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

procedure TfDevolucao.Verifica_Resolvido;
var
  vResolvido : Boolean;
begin
  vResolvido := True;
  tDevolucaoProd2.Refresh;
  if tDevolucaoProd2.IsEmpty then
    vResolvido := False
  else
    begin
      tDevolucaoProd2.First;
      while not tDevolucaoProd2.Eof do
        begin
          if (tDevolucaoProd2QtdPares.AsFloat <> (tDevolucaoProd2QtdParesCons.AsFloat + tDevolucaoProd2QtdParesInd.AsFloat + tDevolucaoProd2QtdParesSub.AsFloat)) then
            vResolvido := False;
          tDevolucaoProd2.Next;
        end;
    end;
  DM1.tDevolucaoResolvido.AsBoolean := vResolvido;
end;

procedure TfDevolucao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm1.tDevolucao.Close;
  Dm1.tCliente.Close;
  Dm1.tProduto.Close;
  Dm1.tDevolucaoProd.Close;
  Dm1.tTransp.Close;
  Dm1.tDefeitos.Close;
  Action := Cafree;
end;

procedure TfDevolucao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfDevolucao.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Codigo';
end;

procedure TfDevolucao.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioClientes.AsBoolean then
    begin
      fCliente := TfCliente.Create(Self);
      fCliente.ShowModal;
    end
  else
    ShowMessage('Usário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir este formulário!');
end;

procedure TfDevolucao.RxDBLookupCombo2Enter(Sender: TObject);
begin
//  RxDBFilter1.Active           := True;
  DM1.tProduto.IndexFieldNames := 'Referencia';
end;

procedure TfDevolucao.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    begin
      qMatRef.Active             := False;
      qMatRef.Params[0].AsString := RxDBLookupCombo2.Text;
      qMatRef.Active             := True;
      RzDBLookupComboBox1.SetFocus;
    end;
//  RxDBFilter1.Active := False;
end;

procedure TfDevolucao.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    begin
      if DM1.tProduto.Locate('Referencia;DescMaterial',VarArrayOf([RxDBLookupCombo2.Text,RzDBLookupComboBox1.Text]),[loCaseInsensitive]) then
        begin
          // monta a query da cor da referência
          DM1.tProdutoCor.Refresh;
          qCorRef.Active              := False;
          qCorRef.Params[0].AsInteger := DM1.tProdutoCodigo.AsInteger;
          qCorRef.Active              := True;
        end
      else
        begin
          ShowMessage('Referência não encontrada!');
          RxDBLookupCombo2.ClearValue;
          RxDBLookupCombo2.SetFocus;
        end;
    end;
end;

procedure TfDevolucao.FormShow(Sender: TObject);
begin
  Dm1.tDevolucao.Open;
  Dm1.tCliente.Open;
  Dm1.tProduto.Open;
  Dm1.tDevolucaoProd.Open;
  Dm1.tTransp.Open;
  Dm1.tDefeitos.Open; 
  Mostra_Resolvido;
end;

procedure TfDevolucao.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioProduto.AsBoolean then
    begin
      fProduto := TfProduto.Create(self);
      fProduto.ShowModal;
    end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir este formulário!');
end;

procedure TfDevolucao.FormCreate(Sender: TObject);
begin
  Dm1.tProdutoCor.Open;
  Dm1.tDevolucao.Open;
  Dm1.tCliente.Open;
  Dm1.tProduto.Open;
  Dm1.tDevolucaoProd.Open;
  Dm1.tTransp.Open;
  Dm1.tDefeitos.Open;
  Dm1.tMaterial.Open;
  DM1.tDevolucao.Last;
end;

procedure TfDevolucao.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  Mostra_Resolvido;
end;

procedure TfDevolucao.BitBtn1Click(Sender: TObject);
var
  vNum : Integer;
begin
  if DM1.tUsuarioInsDevolucao.AsBoolean then
    begin
      DM1.tDevolucao.Refresh;
      DM1.tDevolucao.Last;
      vNum := DM1.tDevolucaoNumMov.AsInteger;
      DM1.tDevolucao.Insert;
      DM1.tDevolucaoNumMov.AsInteger    := vNum + 1;
      DM1.tDevolucaoResolvido.AsBoolean := False;
      DM1.tDevolucaoColeta.AsBoolean    := False;
      DM1.tDevolucao.Post;
      DM1.tDevolucao.Edit;
      Mostra_Resolvido;
      Habilita;
      RxDBLookupCombo1.SetFocus;
    end
  else
    ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a fazer inserção!');
end;

procedure TfDevolucao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tDevolucao.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve cancelar ou confirmar o registro antes de fechar este formulário!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfDevolucao.BitBtn2Click(Sender: TObject);
begin
  if not DM1.tDevolucao.IsEmpty then
    begin
      if DM1.tUsuarioAltDevolucao.AsBoolean then
        begin
          DM1.tDevolucao.Edit;
          BitBtn2.Tag := 1;
          Habilita;
          RxDBLookupCombo1.SetFocus;
        end
      else
        ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a fazer alteração!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfDevolucao.BitBtn3Click(Sender: TObject);
begin
  if BitBtn2.Tag = 1 then
    DM1.tDevolucao.Cancel
  else
    begin
      DM1.tDevolucaoProd.First;
      while not DM1.tDevolucaoProd.Eof do
        DM1.tDevolucaoProd.Delete;
      DM1.tDevolucao.Delete;
    end;
  Habilita;
  BitBtn2.Tag := 0;
  Mostra_Resolvido;
  BitBtn1.SetFocus;
end;

procedure TfDevolucao.BitBtn4Click(Sender: TObject);
begin
  if not DM1.tDevolucao.IsEmpty then
    begin
      if DM1.tUsuarioExcDevolucao.AsBoolean then
        begin
          if MessageDlg('Deseja realmente excluir este registro?',mtconfirmation,[mbok,mbno],0)=mrok then
            begin
              DM1.tDevolucaoProd.First;
              while not DM1.tDevolucaoProd.Eof do
                DM1.tDevolucaoProd.Delete;
              DM1.tDevolucao.Delete;
            end;
          Mostra_Resolvido;
        end
      else
        ShowMessage('Usuário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a fazer exclusão!');
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfDevolucao.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfDevolucao.BitBtn6Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      Verifica_Resolvido;
      DM1.tDevolucao.Post;
      Habilita;
      Mostra_Resolvido;
      BitBtn2.Tag := 0;
      BitBtn1.SetFocus;
    end
  else
    begin
      ShowMessage('Você deve informar um cliente para confirmar o registro!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfDevolucao.BitBtn7Click(Sender: TObject);
begin
  if (RxDBLookupCombo2.Text <> '') and (Edit1.Text <> '') and (CurrencyEdit1.Value > 0) then
    begin
      tDevolucaoProd2.Refresh;
      tDevolucaoProd2.Last;
      DM1.tDevolucaoProd.Insert;
      DM1.tDevolucaoProdNumMov.AsInteger     := DM1.tDevolucaoNumMov.AsInteger;
      DM1.tDevolucaoProdItem.AsInteger       := tDevolucaoProd2Item.AsInteger + 1;
      if RxDBLookupCombo4.Text <> '' then
        DM1.tDevolucaoProdCodCor.AsInteger := RxDBLookupCombo4.KeyValue
      else
        DM1.tDevolucaoProdCodCor.AsInteger := 0;
      if RxDBLookupCombo6.Text <> '' then
        DM1.tDevolucaoProdCodDefeito.AsInteger := RxDBLookupCombo6.KeyValue
      else
        DM1.tDevolucaoProdCodDefeito.AsInteger := 0;
      DM1.tDevolucaoProdCodProduto.AsInteger := RxDBLookupCombo2.KeyValue;
      DM1.tDevolucaoProdQtdPares.AsFloat     := CurrencyEdit1.Value;
      DM1.tDevolucaoQtdPares.AsFloat         := DM1.tDevolucaoQtdPares.AsFloat + DM1.tDevolucaoProdQtdPares.AsFloat;
      DM1.tDevolucaoProdTamanho.AsString     := Edit1.Text;
      DM1.tDevolucaoProdVlrTotal.AsFloat     := CurrencyEdit2.Value;
      DM1.tDevolucaoProd.Post;
      SpeedButton3Click(Sender);
      Verifica_Resolvido;
      Mostra_Resolvido;
    end
  else
    begin
      ShowMessage('Você deve informar uma "referência", "tamanho" e "qtd. de pares" p/ confirmar o item!');
      RxDBLookupCombo2.SetFocus;
    end;
end;

procedure TfDevolucao.SpeedButton3Click(Sender: TObject);
begin
  RxDBLookupCombo2.ClearValue;
  RzDBLookupComboBox1.ClearKeyValue;
  RxDBLookupCombo4.ClearValue;
  RxDBLookupCombo6.ClearValue;
  Edit1.Clear;
  CurrencyEdit1.Value := 0;
  CurrencyEdit2.Value := 0;
  RxDBLookupCombo2.SetFocus;
end;

procedure TfDevolucao.SpeedButton4Click(Sender: TObject);
begin
  if not DM1.tDevolucaoProd.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este registro?',mtconfirmation,[mbok,mbno],0)=mrok then
        begin
          DM1.tDevolucaoQtdPares.AsFloat := DM1.tDevolucaoQtdPares.AsFloat - DM1.tDevolucaoProdQtdPares.AsFloat;
          DM1.tDevolucaoProd.Delete;
        end;
      Verifica_Resolvido;
      Mostra_Resolvido;
    end
  else
    ShowMessage('Não há registro para ser excluído!');
end;

procedure TfDevolucao.RxDBGrid1DblClick(Sender: TObject);
begin
  if (DM1.tDevolucao.State in [dsEdit]) and not(DM1.tDevolucaoProd.IsEmpty) then
    begin
      fDevolucaoBaixa := TfDevolucaoBaixa.Create(Self);
      if DM1.tDevolucaoProdQtdParesInd.AsFloat > 0 then
        fDevolucaoBaixa.CurrencyEdit1.Value := DM1.tDevolucaoProdQtdParesInd.AsFloat;
      if DM1.tDevolucaoProdDtIndenizado.AsDateTime > 1 then
        fDevolucaoBaixa.DateEdit1.Date := DM1.tDevolucaoProdDtIndenizado.AsDateTime;
      if DM1.tDevolucaoProdQtdParesCons.AsFloat > 0 then
        fDevolucaoBaixa.CurrencyEdit2.Value := DM1.tDevolucaoProdQtdParesCons.AsFloat;
      if DM1.tDevolucaoProdDtConserto.AsDateTime > 1 then
        fDevolucaoBaixa.DateEdit2.Date := DM1.tDevolucaoProdDtConserto.AsDateTime;
      if DM1.tDevolucaoProdQtdParesSub.AsFloat > 0 then
        fDevolucaoBaixa.CurrencyEdit3.Value := DM1.tDevolucaoProdQtdParesSub.AsFloat;
      if DM1.tDevolucaoProdDtSubstituicao.AsDateTime > 1 then
        fDevolucaoBaixa.DateEdit3.Date := DM1.tDevolucaoProdDtSubstituicao.AsDateTime;
      fDevolucaoBaixa.Edit1.Text := DM1.tDevolucaoProdBanco.AsString;
      fDevolucaoBaixa.Edit2.Text := DM1.tDevolucaoProdPgto.AsString;
      fDevolucaoBaixa.ShowModal;
      Verifica_Resolvido;
      Mostra_Resolvido;
    end;
end;

procedure TfDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if (Key = Vk_F2) and (DM1.tDevolucao.State in [dsBrowse]) then
    begin
      fConsDevolucao := TfConsDevolucao.Create(Self);
      fConsDevolucao.ShowModal;
      Mostra_Resolvido;
    end;
end;

procedure TfDevolucao.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Nome';
end;

procedure TfDevolucao.RxDBLookupCombo5Exit(Sender: TObject);
begin
  DM1.tTransp.IndexFieldNames := 'Codigo';
end;

procedure TfDevolucao.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioTransp.AsBoolean then
    begin
      fTransp := TfTransp.Create(Self);
      fTransp.ShowModal;
    end
  else
    ShowMessage('Usário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir este formulário!');
end;

procedure TfDevolucao.SpeedButton6Click(Sender: TObject);
begin
  if DM1.tUsuarioDefeitos.AsBoolean then
    begin
      fDefeitos := TfDefeitos.Create(Self);
      fDefeitos.ShowModal;
    end
  else
    ShowMessage('Usário "'+DM1.tUsuarioUsuario.AsString+'" não autorizado a abrir este formulário!');
end;

procedure TfDevolucao.RxDBLookupCombo6Enter(Sender: TObject);
begin
  DM1.tDefeitos.IndexFieldNames := 'Nome';
end;

procedure TfDevolucao.RxDBLookupCombo6Exit(Sender: TObject);
begin
  DM1.tDefeitos.IndexFieldNames := 'Codigo';
end;

procedure TfDevolucao.SpeedButton7Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    begin
      fPendencias:= TfPendencias.Create(Self);
      fPendencias.ShowModal;
    end
  else
    begin
      ShowMessage('Deve haver um cliente selecionado para consultar as pendências!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfDevolucao.RzDBLookupComboBox1Exit(Sender: TObject);
begin
   if RxDBLookupCombo2.Text <> '' then
    begin
      if DM1.tProduto.Locate('Referencia;DescMaterial',VarArrayOf([RxDBLookupCombo2.Text,RzDBLookupComboBox1.Text]),[loCaseInsensitive]) then
        begin
          // monta a query da cor da referência
          DM1.tProdutoCor.Refresh;
          qCorRef.Active              := False;
          qCorRef.Params[0].AsInteger := DM1.tProdutoCodigo.AsInteger;
          qCorRef.Active              := True;
        end
      else
        begin
          ShowMessage('Referência não encontrada!');
          RxDBLookupCombo2.ClearValue;
          RxDBLookupCombo2.SetFocus;
        end;
    end;
end;

end.
