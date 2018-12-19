unit ULancaCPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, ToolEdit, CurrEdit,
  Mask, RXLookup, RXDBCtrl, Db, DbTables, ComCtrls, ALed, Variants, RXCtrls;

type
  TfLancaCPagar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    StaticText1: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel4: TPanel;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    DateEdit1: TDateEdit;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    Label6: TLabel;
    tCPagarIns: TTable;
    tCPagarInsNumCPagar: TIntegerField;
    tCPagarInsNumNotaEnt: TIntegerField;
    tCPagarInsCodForn: TIntegerField;
    tCPagarInsQuitado: TBooleanField;
    tCPagarInsTipoDoc: TStringField;
    tCPagarInsDtGerado: TDateField;
    tCPagarInsHistorico: TStringField;
    StaticText5: TStaticText;
    CurrencyEdit2: TCurrencyEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Panel5: TPanel;
    Label5: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Edit1: TEdit;
    Label7: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    ALed1: TALed;
    Label8: TLabel;
    ALed2: TALed;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit4: TDBEdit;
    tCPagarInsNroDuplicata: TIntegerField;
    Label12: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label14: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    Label15: TLabel;
    DateEdit2: TDateEdit;
    BitBtn11: TBitBtn;
    Label16: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    StaticText4: TStaticText;
    RxLabel1: TRxLabel;
    DBEdit5: TDBEdit;
    Label17: TLabel;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label18: TLabel;
    DBEdit6: TDBEdit;
    tCPagarInsNumSeqNEntrada: TIntegerField;
    tCPagarInsSerie: TStringField;
    DBDateEdit1: TDBDateEdit;
    Label19: TLabel;
    DBDateEdit2: TDBDateEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBLookupCombo1DropDown(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RxDBLookupCombo2Change(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RxDBLookupCombo4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita;
    procedure Verifica_Parcelas;
  public
    { Public declarations }
    vExcluir : Boolean;
  end;

var
  fLancaCPagar: TfLancaCPagar;
  vNumParcela : integer;

implementation

Uses UDM1, UFornecedores, UPlanoContas, UAtelier, UConsLancCPagar,
  UAgendaTelef, UContasPagar2;

{$R *.DFM}

procedure TFLancaCPagar.Habilita;
begin
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn2.Enabled := not(BitBtn2.Enabled);
  BitBtn3.Enabled := not(BitBtn3.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  BitBtn5.Enabled := not(BitBtn5.Enabled);
  BitBtn9.Enabled := not(BitBtn9.Enabled);
  Panel2.Enabled  := not(Panel2.Enabled);
  Panel5.Enabled  := not(Panel5.Enabled);
  DBNavigator1.Enabled := not (DBNavigator1.Enabled);
end;

procedure TfLancaCPagar.Verifica_Parcelas;
begin
  DM1.tCPagarParc.First;
  while not DM1.tCPagarParc.Eof do
    begin
      if DM1.tCPagarParcPgtoParcial.AsFloat > 0 then
        begin
          vExcluir := False;
          DM1.tCPagarParc.Last;
        end;
      DM1.tCPagarParc.Next;
    end;
end;

procedure TfLancaCPagar.BitBtn1Click(Sender: TObject);
begin
  vNumParcela := 0;
  tCPagarIns.Refresh;
  tCPagarIns.Last;
  DM1.tCPagar.IndexFieldNames := 'NumCPagar';
  DM1.tCPagar.Insert;
  DM1.tCPagarNumCPagar.AsInteger := tCPagarInsNumCPagar.AsInteger + 1;
  DM1.tCPagarTipoDoc.AsString    := 'AV';
  DM1.tCPagarDtGerado.AsDateTime := Date;
  DM1.tCPagar.Post;
  DM1.tCPagar.Edit;
  Habilita;
  RxDBLookupCombo4.ClearValue;
  RxDBLookupCombo4.SetFocus;
end;

procedure TfLancaCPagar.BitBtn6Click(Sender: TObject);
Label Final;
begin
  if vNumParcela > 0 then
    begin
      DM1.tCPagarParc.FindKey([DM1.tCPagarNumCPagar.AsInteger,vNumParcela]);
      DM1.tCPagarParc.Edit;
      DM1.tCPagarVlrTotal.AsFloat := DM1.tCPagarVlrTotal.AsFloat - StrToFloat(FormatFloat('0.00',DM1.tCPagarParcVlrParcCPagar.AsFloat));
    end
  else
    begin
      if DM1.tCPagarParc.Locate('NumCPagar;ParcCPagar',VarArrayOf([DM1.tCPagarNumCPagar.AsString,CurrencyEdit2.AsInteger]),[loCaseInsensitive]) then
        begin
          ShowMessage('Parcela digitada já existe!');
          Goto Final;
        end
      else
      if (CurrencyEdit2.Value = 0) or (DateEdit1.Text = '  /  /    ') or (CurrencyEdit1.Value = 0) then
        begin
          ShowMessage('Existe campos em brancos, "Parcela,Data Vecto,Valor"!');
          Goto Final;
        end
      else
        begin
          DM1.tCPagarParc.Insert;
          DM1.tCPagarParcNumCPagar.AsInteger  := DM1.tCPagarNumCPagar.AsInteger;
          DM1.tCPagarParcParcCPagar.AsInteger := StrToInt(CurrencyEdit2.Text)
        end;
    end;
  if RxDBLookupCombo3.Text <> '' then
    DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo3.KeyValue;
  DM1.tCPagarParcVlrParcCPagar.AsFloat   := CurrencyEdit1.Value;
  DM1.tCPagarParcRestParcela.AsFloat     := CurrencyEdit1.Value;
  If RxDBLookupCombo1.Text <> '' then
    DM1.tCPagarParcCodConta.AsInteger    := RxDBLookupCombo1.KeyValue
  else
    DM1.tCPagarParcCodConta.AsInteger    := 0;
  DM1.tCPagarParcDtVencCPagar.AsString   := DateEdit1.Text;
  if RxDBLookupCombo4.Text <> '' then
    DM1.tCPagarParcCodForn.AsInteger       := RxDBLookupCombo4.KeyValue;
  if DM1.tCPagarNroDuplicata.IsNull then
    DM1.tCPagarParcNroDuplicata.AsString   := '0'
  else
    DM1.tCPagarParcNroDuplicata.AsString   := DM1.tCPagarNroDuplicata.AsString;
  DM1.tCPagarParcCodAtelier.AsInteger     := DM1.tCPagarCodAtelier.AsInteger;
  DM1.tCPagarParcSerie.AsString           := DM1.tCPagarSerie.AsString;
  DM1.tCPagarParcNumSeqNEntrada.AsInteger := DM1.tCPagarNumSeqNEntrada.AsInteger;
  if DM1.tCPagarDtGerado.AsDateTime > 10 then
    DM1.tCPagarParcDtGerado.AsDateTime := DM1.tCPagarDtGerado.AsDateTime;
  if DM1.tCPagarDtEmissaoNota.AsDateTime > 10 then
    DM1.tCPagarParcDtEmissaoNota.AsDateTime := DM1.tCPagarDtEmissaoNota.AsDateTime;
  DM1.tCPagarParc.Post;
  DM1.tCPagarVlrTotal.AsFloat := DM1.tCPagarVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',DM1.tCPagarParcVlrParcCPagar.AsFloat));
  Final:
  Bitbtn7.Click;
  CurrencyEdit2.SetFocus;
  vNumParcela := 0;
end;

procedure TfLancaCPagar.BitBtn4Click(Sender: TObject);
begin
  if (DM1.tCPagarCodForn.AsInteger < 1) OR (RxDBLookupCombo4.Text = '') then
    ShowMessage('É obrigatório informar o fornecedor')
  else
  if not DM1.tCPagarParc.IsEmpty then
  begin
    if DM1.tCPagarNroDuplicata.IsNull then
      DM1.tCPagarNroDuplicata.AsInteger := 0;
    if DM1.tCPagarDtEmissaoNota.AsDateTime < 10 then
      DM1.tCPagarDtEmissaoNota.AsDateTime := DM1.tCPagarDtGerado.AsDateTime;
    DM1.tCPagarParc.First;
    while not DM1.tCPagarParc.Eof do
    begin
      DM1.tCPagarParc.Edit;
      DM1.tCPagarParcNroDuplicata.AsInteger   := DM1.tCPagarNroDuplicata.AsInteger;
      DM1.tCPagarParcCodForn.AsInteger        := DM1.tCPagarCodForn.AsInteger;
      DM1.tCPagarParcSerie.AsString           := DM1.tCPagarSerie.AsString;
      DM1.tCPagarParcNumSeqNEntrada.AsInteger := DM1.tCPagarNumSeqNEntrada.AsInteger;
      DM1.tCPagarParcDtGerado.AsDateTime      := DM1.tCPagarDtGerado.AsDateTime;
      DM1.tCPagarParcDtEmissaoNota.AsDateTime := DM1.tCPagarDtEmissaoNota.AsDateTime;
      DM1.tCPagarParc.Post;
      DM1.tCPagarParc.Next;
    end;
    DM1.tCPagar.Post;
    Habilita;
    DM1.tCPagar.Refresh;
    DM1.tCPagarParc.Refresh;
    BitBtn9.Tag := 0;
  end
  else
    MessageDlg('Você não pode confirmar esta Conta a Pagar com as parcelas vazias!',mtInformation,[mbOK],0);
end;

procedure TfLancaCPagar.BitBtn7Click(Sender: TObject);
begin
  vNumParcela := 0;
  DateEdit1.Clear;
  RxDBLookupCombo1.ClearValue;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit2.SetFocus;
end;

procedure TfLancaCPagar.BitBtn8Click(Sender: TObject);
begin
  vNumParcela := 0;
  if not DM1.tCPagarParc.IsEmpty then
    begin
      if DM1.tCPagarParcPgtoParcial.AsFloat > 0 then
        begin
          ShowMessage('Parcela já foi paga!');
          exit;
        end;

      if MessageDlg('Deseja realmente excluir esta parcela?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
        begin
          DM1.tCPagarVlrTotal.AsFloat := DM1.tCPagarVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',DM1.tCPagarParcVlrParcCPagar.AsFloat));
          DM1.tCPagarParc.Delete;
          DateEdit1.SetFocus;
        end;
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfLancaCPagar.BitBtn3Click(Sender: TObject);
begin
  vExcluir := True;
  Verifica_Parcelas;
  if vExcluir then
  begin
    if MessageDlg('Deseja realmente excluir esta Conta a Pagar?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
    begin
      DM1.tCPagarParc.First;
      while not DM1.tCPagarParc.EOF do
      begin
        DM1.tCPagarParcHist.First;
        while not DM1.tCPagarParcHist.Eof do
          DM1.tCPagarParcHist.Delete;
        DM1.tCPagarParc.Delete;
      end;
      DM1.tCPagar.Delete;
    end;
  end
  else
    ShowMessage('Lançamento não pode ser excluido, já foi efetuado pagamentos');
end;

procedure TfLancaCPagar.BitBtn2Click(Sender: TObject);
begin
  if BitBtn9.Tag = 1 then
    begin
      DM1.tCPagar.Cancel;
      if DM1.tCPagarParc.State in [dsEdit,dsInsert] then
        DM1.tCPagarParc.Post;
    end
  else
    begin
      DM1.tCPagarParc.First;
      while not DM1.tCPagarParc.Eof do
        DM1.tCPagarParc.Delete;
      DM1.tCPagar.Delete;
    end;
  BitBtn9.Tag := 0;
  Habilita;
end;

procedure TfLancaCPagar.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfLancaCPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tCPagar.Close;
      DM1.tCPagarParc.Close;
      DM1.tCPagarParcHist.Close;
      DM1.tFornecedores.Close;
      DM1.tPlanoContas.Close;
      DM1.tAtelier.Close;
      DM1.tContas.Close;
      DM1.tHistorico.Close;
      DM1.tNatOperacao.Close;
    end;
  Action := Cafree;
end;

procedure TfLancaCPagar.FormShow(Sender: TObject);
begin
  DM1.tCPagar.Open;
  DM1.tCPagarParc.Open;
  DM1.tCPagarParcHist.Open;
  DM1.tFornecedores.Open;
  DM1.tPlanoContas.Open;
  DM1.tAtelier.Open;
  DM1.tContas.Open;
  DM1.tHistorico.Open;
  DM1.tNatOperacao.Open;
  Edit1.SetFocus;
  DM1.tCPagar.Refresh;
  if Tag = 1 then
    DM1.tCPagar.Locate('NumCPagar',fContasPagar2.qParcelasNumCPagar.AsInteger,[loCaseInsensitive]);
end;

procedure TfLancaCPagar.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
    begin
      fFornecedores := TfFornecedores.Create(Self);
      fFornecedores.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de fornecedores!');
end;

procedure TfLancaCPagar.BitBtn9Click(Sender: TObject);
begin
  if DM1.tCPagarNumCPagar.AsInteger < 1 then
    exit;
  vNumParcela := 0;
  DM1.tCPagar.Edit;
  Habilita;
  CurrencyEdit2.SetFocus;
  BitBtn9.Tag := 1;
end;

procedure TfLancaCPagar.BitBtn10Click(Sender: TObject);
begin
  if not DM1.tCPagarParc.IsEmpty then
    begin
      if DM1.tCPagarParcPgtoParcial.AsFloat > 0 then
        begin
          ShowMessage('Parcela já paga!');
          exit;
        end;

      if DateEdit1.Date > 10 then
        begin
          vNumParcela               := DM1.tCPagarParcParcCPagar.AsInteger;
          CurrencyEdit1.Value       := DM1.tCPagarParcVlrParcCPagar.AsCurrency;
          CurrencyEdit1.Value       := DM1.tCPagarParcRestParcela.AsCurrency;
          CurrencyEdit2.Value       := DM1.tCPagarParcParcCPagar.AsInteger;
          if DM1.tCPagarParcCodConta.AsInteger > 0 then
            RxDBLookupCombo1.KeyValue := DM1.tCPagarParcCodConta.AsInteger;
          DateEdit1.Text            := DM1.tCPagarParcDtVencCPagar.AsString;
          if DM1.tCPagarParcPlanoContas.AsString <> '' then
            RxDBLookupCombo3.KeyValue := DM1.tCPagarParcPlanoContas.AsInteger
          else
            RxDbLookupCombo3.ClearValue;
          CurrencyEdit2.SetFocus;
        end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfLancaCPagar.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('QuitParcCPagar').AsBoolean then
    begin
      Background  := clTeal;
      AFont.Color := clWhite;
    end
  else
    begin
      Background  := clWhite;
      AFont.Color := clBlack;
    end;
end;

procedure TfLancaCPagar.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de plano de contas!');
end;

procedure TfLancaCPagar.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfLancaCPagar.RxDBLookupCombo1DropDown(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'NomeConta';
end;

procedure TfLancaCPagar.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tContas.IndexFieldNames := 'CodConta';
end;

procedure TfLancaCPagar.Edit1Change(Sender: TObject);
begin
  try
    DM1.tCPagar.IndexFieldNames := 'NumCPagar';
    DM1.tCPagar.FindNearest([Edit1.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfLancaCPagar.RxDBLookupCombo2Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo2.Text;
end;

procedure TfLancaCPagar.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCPagar.IndexFieldNames := 'NumCPagar';
  Edit1.Text                  := RxDBLookupCombo2.Text;
end;

procedure TfLancaCPagar.Edit1Exit(Sender: TObject);
begin
  RxDBLookupCombo2.Value := Edit1.Text;
end;

procedure TfLancaCPagar.RxDBLookupCombo4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F2 then
    begin
      if RxDBLookupCombo4.LookupDisplay = 'NomeForn' then
        begin
           RxDBLookupCombo4.CloseUp(True);
           RxDBLookupCombo4.LookupDisplay    := 'Fantasia';
           DM1.tFornecedores.IndexFieldNames := 'Fantasia';
           DM1.tFornecedores.Refresh;
           Label7.Caption := 'Consulta por Fantasia';
        end
      else
      if RxDBLookupCombo4.LookupDisplay = 'Fantasia' then
        begin
          RxDBLookupCombo4.CloseUp(True);
          RxDBLookupCombo4.LookupDisplay    := 'NomeForn';
          DM1.tFornecedores.IndexFieldNames := 'NomeForn';
          DM1.tFornecedores.Refresh;
          Label7.Caption := 'Consulta por Nome';
         end;
       if DM1.tFornecedoresCodForn.AsInteger > 0 then
         RxDBLookupCombo4.KeyValue := DM1.tFornecedoresCodForn.AsInteger;
       RxDBLookupCombo4.Refresh;
    end;
end;

procedure TfLancaCPagar.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfLancaCPagar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tCPagar.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta Cta. a Pagar antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfLancaCPagar.DBEdit1Exit(Sender: TObject);
begin
  if (tCPagarIns.Locate('CodForn;NroDuplicata;Serie',VarArrayOf([DM1.tCPagarCodForn.AsInteger,DM1.tCPagarNroDuplicata.AsInteger,DM1.tCPagarSerie.AsString]),[loCaseInsensitive])) and
     (tCPagarInsNumCPagar.AsInteger <> DM1.tCPagarNumCPagar.AsInteger) then
  begin
    if MessageDlg('Este Documento já existe no lançamento ' + tCPagarInsNumCPagar.AsString + ' do dia ' + tCPagarInsDtGerado.AsString + ' Continuar?',mtConfirmation,[mbOK,mbNo],0) = mrNO then
      DBEdit1.SetFocus;
  end;
end;

procedure TfLancaCPagar.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Atelier';
end;

procedure TfLancaCPagar.RxDBLookupCombo5Exit(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Codigo';
end;

procedure TfLancaCPagar.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioAtelier.AsBoolean then
    begin
      fAtelier := TfAtelier.Create(Self);
      fAtelier.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de atelier!');
end;

procedure TfLancaCPagar.BitBtn11Click(Sender: TObject);
var
  i : Integer;
  vData : TDateTime;
  vParcelaAux : Integer;
begin
  if (CurrencyEdit3.Value > 0) and (CurrencyEdit4.Value > 0) and (CurrencyEdit5.Value > 0) and (DateEdit2.Date > 10) then
    begin
      DM1.tCPagarParc.Refresh;
      DM1.tCPagarParc.Last;
      vParcelaAux := DM1.tCPagarParcParcCPagar.AsInteger + 1;
      DM1.tCPagarParc.Insert;
      DM1.tCPagarParcNumCPagar.AsInteger      := DM1.tCPagarNumCPagar.AsInteger;
      DM1.tCPagarParcParcCPagar.AsInteger     := vParcelaAux;
      if RxDBLookupCombo3.Text <> '' then
        DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo3.KeyValue
      else
        DM1.tCPagarParcPlanoContas.AsInteger := 0;
      DM1.tCPagarParcCodConta.AsInteger       := 0;
      DM1.tCPagarParcCodForn.AsInteger        := DM1.tCPagarCodForn.AsInteger;
      if DM1.tCPagarNroDuplicata.AsInteger > 0 then
        DM1.tCPagarParcNroDuplicata.AsInteger := DM1.tCPagarNroDuplicata.AsInteger
      else
        DM1.tCPagarParcNroDuplicata.AsInteger := 0;
      if DM1.tCPagarCodAtelier.AsInteger > 0 then
        DM1.tCPagarParcCodAtelier.AsInteger := DM1.tCPagarCodAtelier.AsInteger
      else
        DM1.tCPagarParcCodAtelier.AsInteger := 0;
      DM1.tCPagarParcDtVencCPagar.AsDateTime  := DateEdit2.Date;
      DM1.tCPagarParcVlrParcCPagar.AsFloat    := CurrencyEdit3.Value;
      DM1.tCPagarParcRestParcela.AsFloat      := CurrencyEdit3.Value;
      DM1.tCPagarParc.Post;
      vData                                   := DateEdit2.Date;
      for i := 1 to (StrToInt(CurrencyEdit4.Text) - 1) do
        begin
          vParcelaAux := vParcelaAux + 1; 
          vData                                   := vData + CurrencyEdit5.Value;
          DM1.tCPagarParc.Insert;
          DM1.tCPagarParcNumCPagar.AsInteger      := DM1.tCPagarNumCPagar.AsInteger;
          DM1.tCPagarParcParcCPagar.AsInteger     := vParcelaAux;
          if RxDBLookupCombo3.Text <> '' then
            DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo3.KeyValue
          else
            DM1.tCPagarParcPlanoContas.AsInteger := 0;
          DM1.tCPagarParcCodConta.AsInteger       := 0;
          DM1.tCPagarParcCodForn.AsInteger        := DM1.tCPagarCodForn.AsInteger;
          if DM1.tCPagarNroDuplicata.AsInteger > 0 then
            DM1.tCPagarParcNroDuplicata.AsInteger := DM1.tCPagarNroDuplicata.AsInteger
          else
            DM1.tCPagarParcNroDuplicata.AsInteger := 0;
          if DM1.tCPagarCodAtelier.AsInteger > 0 then
            DM1.tCPagarParcCodAtelier.AsInteger := DM1.tCPagarCodAtelier.AsInteger
          else
            DM1.tCPagarParcCodAtelier.AsInteger := 0;
          DM1.tCPagarParcDtVencCPagar.AsDateTime  := vData;
          DM1.tCPagarParcVlrParcCPagar.AsFloat    := CurrencyEdit3.Value;
          DM1.tCPagarParcRestParcela.AsFloat      := CurrencyEdit3.Value;
          DM1.tCPagarParc.Post;
        end;
      CurrencyEdit3.Clear;
      CurrencyEdit4.Clear;
      CurrencyEdit5.Clear;
      DateEdit2.Clear;
    end
  else
  if (CurrencyEdit3.Value > 0) and (CurrencyEdit4.Value > 0) and (CurrencyEdit5.Value <= 0) and (DateEdit2.Date > 10) then
    begin
      DM1.tCPagarParc.Refresh;
      DM1.tCPagarParc.Last;
      vParcelaAux := DM1.tCPagarParcParcCPagar.AsInteger + 1;
      DM1.tCPagarParc.Insert;
      DM1.tCPagarParcNumCPagar.AsInteger      := DM1.tCPagarNumCPagar.AsInteger;
      DM1.tCPagarParcParcCPagar.AsInteger     := vParcelaAux;
      if RxDBLookupCombo3.Text <> '' then
        DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo3.KeyValue
      else
        DM1.tCPagarParcPlanoContas.AsInteger := 0;
      DM1.tCPagarParcCodConta.AsInteger       := 0;
      DM1.tCPagarParcCodForn.AsInteger        := DM1.tCPagarCodForn.AsInteger;
      if DM1.tCPagarNroDuplicata.AsInteger > 0 then
        DM1.tCPagarParcNroDuplicata.AsInteger := DM1.tCPagarNroDuplicata.AsInteger
      else
        DM1.tCPagarParcNroDuplicata.AsInteger := 0;
      if DM1.tCPagarCodAtelier.AsInteger > 0 then
        DM1.tCPagarParcCodAtelier.AsInteger := DM1.tCPagarCodAtelier.AsInteger
      else
        DM1.tCPagarParcCodAtelier.AsInteger := 0;
      DM1.tCPagarParcDtVencCPagar.AsDateTime  := DateEdit2.Date;
      DM1.tCPagarParcVlrParcCPagar.AsFloat    := CurrencyEdit3.Value;
      DM1.tCPagarParcRestParcela.AsFloat      := CurrencyEdit3.Value;
      DM1.tCPagarParc.Post;
      vData                                   := DateEdit2.Date;
      for i := 1 to (StrToInt(CurrencyEdit4.Text) - 1) do
        begin
          vParcelaAux := vParcelaAux + 1;
          vData                                   := IncMonth(vData,1);
          DM1.tCPagarParc.Insert;
          DM1.tCPagarParcNumCPagar.AsInteger      := DM1.tCPagarNumCPagar.AsInteger;
          DM1.tCPagarParcParcCPagar.AsInteger     := vParcelaAux;
          if RxDBLookupCombo3.Text <> '' then
            DM1.tCPagarParcPlanoContas.AsInteger := RxDBLookupCombo3.KeyValue
          else
            DM1.tCPagarParcPlanoContas.AsInteger := 0;
          DM1.tCPagarParcCodConta.AsInteger       := 0;
          DM1.tCPagarParcCodForn.AsInteger        := DM1.tCPagarCodForn.AsInteger;
          if DM1.tCPagarNroDuplicata.AsInteger > 0 then
            DM1.tCPagarParcNroDuplicata.AsInteger := DM1.tCPagarNroDuplicata.AsInteger
          else
            DM1.tCPagarParcNroDuplicata.AsInteger := 0;
          if DM1.tCPagarCodAtelier.AsInteger > 0 then
            DM1.tCPagarParcCodAtelier.AsInteger := DM1.tCPagarCodAtelier.AsInteger
          else
            DM1.tCPagarParcCodAtelier.AsInteger := 0;
          DM1.tCPagarParcDtVencCPagar.AsDateTime  := vData;
          DM1.tCPagarParcVlrParcCPagar.AsFloat    := CurrencyEdit3.Value;
          DM1.tCPagarParcRestParcela.AsFloat      := CurrencyEdit3.Value;
          DM1.tCPagarParc.Post;
        end;
      CurrencyEdit3.Clear;
      CurrencyEdit4.Clear;
      CurrencyEdit5.Clear;
      DateEdit2.Clear;
    end
  else
    begin
      ShowMessage('Deve ser informado "Valor", "Qtd. de Parcelas" e "Data Inicial", p/ executar esta função!');
      CurrencyEdit3.SetFocus;
    end;
end;

procedure TfLancaCPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
  begin
    fAgendaTelef := TfAgendaTelef.Create(Self);
    fAgendaTelef.ShowModal;
  end;
  if (Key = Vk_F2) and (DM1.tCPagar.State in [dsBrowse]) then
  begin
    fConsLancCPagar := TfConsLancCPagar.Create(Self);
    fConsLancCPagar.ShowModal;
  end;
end;

procedure TfLancaCPagar.RxDBLookupCombo6Enter(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'CodNatOper';
end;

end.
