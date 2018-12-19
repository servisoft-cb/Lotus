unit ULancaCReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, ToolEdit, CurrEdit,
  Mask, RXLookup, RXDBCtrl, Db, DbTables, ComCtrls, ALed, RXCtrls;

type
  TfLancaCReceber = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    StaticText1: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    StaticText2: TStaticText;
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
    Label3: TLabel;
    DBEdit1: TDBEdit;
    SpeedButton2: TSpeedButton;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Label6: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    SpeedButton8: TSpeedButton;
    tCReceberIns: TTable;
    tCReceberInsNumCReceber: TIntegerField;
    tCReceberInsNumNota: TIntegerField;
    tCReceberInsQuitado: TBooleanField;
    tCReceberInsCodCli: TIntegerField;
    tCReceberInsTipoDoc: TStringField;
    tCReceberInsDtGerado: TDateField;
    tCReceberInsHistorico: TStringField;
    tCReceberParcIns: TTable;
    tCReceberParcInsNumCReceber: TIntegerField;
    tCReceberParcInsParcCReceber: TIntegerField;
    tCReceberParcInsVlrParcCReceber: TFloatField;
    tCReceberParcInsDtVencCReceber: TDateField;
    tCReceberParcInsQuitParcCReceber: TBooleanField;
    tCReceberParcInsJurosParcCReceber: TFloatField;
    tCReceberParcInsDtPagParcCReceber: TDateField;
    tCReceberParcInsCodCli: TIntegerField;
    tCReceberParcInsNumNota: TIntegerField;
    tCReceberParcInsDesconto: TFloatField;
    tCReceberParcInsPgtoParcial: TFloatField;
    tCReceberParcInsRestParcela: TFloatField;
    tCReceberParcInsContaDupl: TSmallintField;
    tCReceberParcInsSelecionado: TBooleanField;
    tCReceberParcInsCodVendedor: TIntegerField;
    tCReceberParcInsBaixada: TBooleanField;
    tCReceberParcInsPercComissao: TFloatField;
    tCReceberParcInsVlrComissao: TFloatField;
    tCReceberParcInsPlanoContas: TIntegerField;
    tCReceberParcInsTitPortador: TStringField;
    tCReceberParcInsCodTipoCobranca: TIntegerField;
    tCReceberParcInsDespesas: TFloatField;
    tCReceberParcInsAbatimentos: TFloatField;
    tCReceberParcInsCodConta: TIntegerField;
    tCReceberParcInsPgCartorio: TBooleanField;
    tCReceberParcInsDiasAtraso: TFloatField;
    tCReceberParcInsLetraCambio: TBooleanField;
    tCReceberParcInsAgencia: TStringField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label4: TLabel;
    Panel5: TPanel;
    Label5: TLabel;
    Edit1: TEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Shape1: TShape;
    Panel6: TPanel;
    ALed1: TALed;
    Label8: TLabel;
    ALed2: TALed;
    Label9: TLabel;
    RxLabel1: TRxLabel;
    DBEdit3: TDBEdit;
    Label11: TLabel;
    DBEdit5: TDBEdit;
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
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vMercado : String;
    procedure Habilita;
    procedure Verifica_Parcelas;
  public
    { Public declarations }
    vExcluir : Boolean;
  end;

var
  fLancaCReceber: TfLancaCReceber;
  vNumParcela : integer;

implementation

Uses UDM1, UCliente, UPlanoContas, UConsLancCReceber, UAgendaTelef;

{$R *.DFM}

procedure TfLancaCReceber.Habilita;
begin
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn2.Enabled := not(BitBtn2.Enabled);
  BitBtn3.Enabled := not(BitBtn3.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  BitBtn5.Enabled := not(BitBtn5.Enabled);
  BitBtn9.Enabled := not(BitBtn9.Enabled);
  Panel2.Enabled  := not(Panel2.Enabled);
  Panel5.Enabled  := not(Panel5.Enabled);
end;

procedure TfLancaCReceber.Verifica_Parcelas;
begin
  DM1.tCReceberParc.First;
  while not DM1.tCReceberParc.Eof do
    begin
      if DM1.tCReceberParcPgtoParcial.AsFloat > 0 then
        begin
          vExcluir := False;
          DM1.tCReceberParc.Last;
        end;
      DM1.tCReceberParc.Next;
    end;
end;

procedure TfLancaCReceber.BitBtn1Click(Sender: TObject);
begin
  vNumParcela := 0;
  tCReceberIns.Refresh;
  tCReceberIns.Last;
  DM1.tCReceber.IndexFieldNames := 'NumCReceber';
  DM1.tCReceber.Insert;
  DM1.tCReceberNumCReceber.AsInteger := tCReceberInsNumCReceber.AsInteger + 1;
  DM1.tCReceberTipoDoc.AsString      := 'AV';
  DM1.tCReceberDtGerado.AsDateTime   := Date;
  DM1.tCReceberCancelado.AsBoolean   := False;
  DM1.tCReceberMercado.AsString      := 'O';
  DM1.tCReceberNumSeqNota.AsInteger  := 0;
  DM1.tCReceberSerie.AsString        := '';
  DM1.tCReceber.Post;
  DM1.tCReceber.Edit;
  Habilita;
  RxDBLookupCombo1.Enabled := True;
  RxDBLookupCombo1.ClearValue;
  RxDBLookupCombo1.SetFocus;
  DBEdit1.Enabled := True;
end;

procedure TfLancaCReceber.BitBtn6Click(Sender: TObject);
begin
  if (DateEdit1.Text <> '  /  /    ') and (CurrencyEdit1.Value > 0) then
    begin
      tCReceberParcIns.Refresh;
      tCReceberParcIns.Last;
      DM1.tCReceberParc.Insert;
      DM1.tCReceberParcNumCReceber.AsInteger   := DM1.tCReceberNumCReceber.AsInteger;
      if vNumParcela > 0 then
        DM1.tCReceberParcParcCReceber.AsInteger  := vNumParcela
      else
        DM1.tCReceberParcParcCReceber.AsInteger  := tCReceberParcInsParcCReceber.AsInteger + 1;
      DM1.tCReceberParcCancelado.AsBoolean     := False;
      DM1.tCReceberParcTitProtestado.AsBoolean := False;
      if RxDBLookupCombo3.Text <> '' then
        DM1.tCReceberParcPlanoContas.AsInteger := RxDBLookupCombo3.KeyValue;
      DM1.tCReceberParcDtGerado.AsDateTime     := DM1.tCReceberDtGerado.AsDateTime;
      DM1.tCReceberParcVlrParcCReceber.AsFloat := CurrencyEdit1.Value;
      DM1.tCReceberVlrTotal.AsFloat            := DM1.tCReceberVlrTotal.AsFloat + DM1.tCReceberParcVlrParcCReceber.AsFloat;
      DM1.tCReceberParcRestParcela.AsFloat     := CurrencyEdit1.Value;
      DM1.tCReceberParcDtVencCReceber.AsString := DateEdit1.Text;
      if RxDBLookupCombo1.Text <> '' then
        DM1.tCReceberParcCodCli.AsInteger      := RxDBLookupCombo1.KeyValue;
      DM1.tCReceberParcTipoDoc.AsString        := DM1.tCReceberTipoDoc.AsString;
      DM1.tCReceberParcMercado.AsString        := DM1.tCReceberMercado.AsString;
      DM1.tCReceberParcSerie.AsString          := DM1.tCReceberSerie.AsString;
      DM1.tCReceberParcNumSeqNota.AsInteger    := DM1.tCReceberNumSeqNota.AsInteger;
      DM1.tCReceberParc.Post;
      Bitbtn7.Click;
      DateEdit1.SetFocus;
      vNumParcela := 0;
    end
  else
    begin
      ShowMessage('Não pode ser confirmado parcela s/ dt. de vencto. e valor zerado!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfLancaCReceber.BitBtn4Click(Sender: TObject);
var
  vVlrTotal : Real;
begin
  if DM1.tCReceberCodCli.AsInteger < 1 then
    ShowMessage('Falta o nome do cliente')
  else
    begin
      if not DM1.tCReceberParc.IsEmpty then
        begin
          vVlrTotal := 0;
          DM1.tCReceberParc.First;
          while not DM1.tCReceberParc.Eof do
            begin        
              DM1.tCReceberParc.Edit;
              DM1.tCReceberParcNumNota.AsInteger    := DM1.tCReceberNumNota.AsInteger;
              DM1.tCReceberParcDtGerado.AsDateTime  := DM1.tCReceberDtGerado.AsDateTime;
              DM1.tCReceberParcSerie.AsString       := DM1.tCReceberSerie.AsString;
              DM1.tCReceberParcNumSeqNota.AsInteger := DM1.tCReceberNumSeqNota.AsInteger;
              vVlrTotal := vVlrTotal + DM1.tCReceberParcVlrParcCReceber.AsFloat;
              DM1.tCReceberParc.Post;
              DM1.tCReceberParc.Next;
            end;
          DM1.tCReceberVlrTotal.AsFloat := vVlrTotal;
          DM1.tCReceber.Post;
          DateEdit1.Clear;
          CurrencyEdit1.Clear;
          Habilita;
          BitBtn9.Tag := 0;
        end
      else
        MessageDlg('Você não pode confirmar esta Conta a Receber com as parcelas vazias!',mtInformation,[mbOK],0);
    end;
end;

procedure TfLancaCReceber.BitBtn7Click(Sender: TObject);
begin
  vNumParcela := 0;
  DateEdit1.Clear;
  CurrencyEdit1.Clear;
  DateEdit1.SetFocus;
end;

procedure TfLancaCReceber.BitBtn8Click(Sender: TObject);
begin
  vNumParcela := 0;
  if not DM1.tCReceberParc.IsEmpty then
    begin
      if not DM1.tCReceberParcQuitParcCReceber.AsBoolean  then
        begin
          if MessageDlg('Deseja realmente excluir esta parcela?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
            begin
              DM1.tCReceberVlrTotal.AsFloat := DM1.tCReceberVlrTotal.AsFloat - DM1.tCReceberParcVlrParcCReceber.AsFloat;
              DM1.tCReceberParc.Delete;
              DateEdit1.SetFocus;
            end;
        end
      else
        ShowMessage('Parcela já quitada. Não pode ser excluída! Ou há parcela sendo alterada!');
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfLancaCReceber.BitBtn3Click(Sender: TObject);
begin
  if DM1.tCReceberTipoDoc.AsString = 'NF' then
    ShowMessage('Lançamento gerado nas notas fiscais')
  else
    begin
      vExcluir := True;
      Verifica_Parcelas;
      if vExcluir then
        begin
            DM1.tCReceberParc.First;
            while not DM1.tCReceberParc.EOF do
              begin
                DM1.tCReceberParcHist.First;
                while not DM1.tCReceberParcHist.Eof do
                  DM1.tCReceberParcHist.Delete;
                DM1.tCReceberParc.Delete;
              end;
            DM1.tCReceber.Delete;
        end
      else
        ShowMessage('Lançamento não pode ser excluido, pois já houve pagtos');
    end;
end;

procedure TfLancaCReceber.BitBtn2Click(Sender: TObject);
var
  vVlrTotal : Real;
begin
  if BitBtn9.Tag = 1 then
    begin
      if DM1.tCReceberParc.State in [dsEdit,dsInsert] then
        DM1.tCReceberParc.Post;
      vVlrTotal := 0;
      DM1.tCReceberParc.First;
      while not DM1.tCReceberParc.Eof do
        begin
          vVlrTotal := vVlrTotal + DM1.tCReceberParcVlrParcCReceber.AsFloat;
          DM1.tCReceberParc.Next;
        end;
      DM1.tCReceberVlrTotal.AsFloat := vVlrTotal;
      DM1.tCReceber.Post;
    end
  else
    begin
      DM1.tCReceberParc.First;
      while not DM1.tCReceberParc.Eof do
        DM1.tCReceberParc.Delete;
      DM1.tCReceber.Delete;
    end;
  DateEdit1.Clear;
  CurrencyEdit1.Clear;
  Habilita;
  BitBtn9.Tag := 0;
end;

procedure TfLancaCReceber.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfLancaCReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tCReceber.Close;
      DM1.tCReceberParc.Close;
      DM1.tCReceberParcHist.Close;
      DM1.tContas.Close;
      DM1.tCliente.Close;
      DM1.tVendedor.Close;
      DM1.tPlanoContas.Close;
    end;
  Action := Cafree;
end;

procedure TfLancaCReceber.FormShow(Sender: TObject);
begin
  DM1.tCReceber.Open;
  DM1.tCReceberParc.Open;
  DM1.tCReceberParcHist.Open;
  DM1.tContas.Open;
  DM1.tCliente.Open;
  DM1.tVendedor.Open;
  DM1.tPlanoContas.Open;
  DM1.tCReceber.Refresh;
  DM1.tCReceber.Last;
end;

procedure TfLancaCReceber.SpeedButton2Click(Sender: TObject);
begin
  if DM1.tUsuarioClientes.AsBoolean then
    begin
      fCliente := TfCliente.Create(Self);
      fCliente.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de clientes!');
end;

procedure TfLancaCReceber.BitBtn9Click(Sender: TObject);
begin
  vExcluir := True;
  Verifica_Parcelas;
  if vExcluir then
    begin
      vNumParcela              := 0;
      DM1.tCReceber.Edit;
      Habilita;
      RxDBLookupCombo1.Enabled := False;
      DBEdit1.Enabled          := False;
      DateEdit1.SetFocus;
      BitBtn9.Tag              := 1;
    end
  else
    ShowMessage('Lançamento não pode ser alterado, pois já houve pagtos');
end;

procedure TfLancaCReceber.BitBtn10Click(Sender: TObject);
begin
  if not DM1.tCReceberParc.IsEmpty then
    begin
      if not DM1.tCReceberParcQuitParcCReceber.AsBoolean then
        begin
          if DateEdit1.Text = '  /  /    ' then
            begin
              vNumParcela         := DM1.tCReceberParcParcCReceber.AsInteger;
              CurrencyEdit1.Value := DM1.tCReceberParcVlrParcCReceber.AsCurrency;
              DM1.tCReceberVlrTotal.AsFloat := DM1.tCReceberVlrTotal.AsFloat - DM1.tCReceberParcVlrParcCReceber.AsCurrency;
              CurrencyEdit1.Value := DM1.tCReceberParcRestParcela.AsCurrency;
              DateEdit1.Text      := DM1.tCReceberParcDtVencCReceber.AsString;
              if DM1.tCReceberParcPlanoContas.AsString <> '' then
                RxDBLookupCombo3.KeyValue := DM1.tCReceberParcPlanoContas.AsInteger
              else
                RxDbLookupCombo3.ClearValue;
              DateEdit1.SetFocus;
              DM1.tCReceberParc.Delete;
            end
          else
            ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
        end
      else
        ShowMessage('Parcela já quitada. Não pode ser alterada!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfLancaCReceber.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('QuitParcCReceber').AsBoolean then
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

procedure TfLancaCReceber.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de plano de contas!');
end;

procedure TfLancaCReceber.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfLancaCReceber.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfLancaCReceber.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F2 then
    begin
      if RxDBLookupCombo1.LookupDisplay = 'Nome' then
        begin
           RxDBLookupCombo1.CloseUp(True);
           RxDBLookupCombo1.LookupDisplay    := 'Fantasia';
           DM1.tCliente.IndexFieldNames := 'Fantasia';
           DM1.tCliente.Refresh;
           Label4.Caption := 'Consulta por Fantasia';
        end
      else
      if RxDBLookupCombo1.LookupDisplay = 'Fantasia' then
        begin
          RxDBLookupCombo1.CloseUp(True);
          RxDBLookupCombo1.LookupDisplay    := 'Nome';
          DM1.tCliente.IndexFieldNames := 'Nome';
          DM1.tCliente.Refresh;
          Label4.Caption := 'Consulta por Nome';
         end;
       if DM1.tClienteCodigo.AsInteger > 0 then
         RxDBLookupCombo1.KeyValue := DM1.tClienteCodigo.AsInteger;
       RxDBLookupCombo1.Refresh;
    end;
end;

procedure TfLancaCReceber.Edit1Change(Sender: TObject);
begin
  try
    DM1.tCReceber.IndexFieldNames := 'NumCReceber';
    DM1.tCReceber.FindNearest([Edit1.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfLancaCReceber.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tCReceber.State in [dsInsert,dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar esta Cta. a Receber antes de Fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfLancaCReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if (Key = Vk_F2) and (DM1.tCReceber.State in [dsBrowse]) then
    begin
      fConsLancCReceber := TfConsLancCReceber.Create(Self);
      fConsLancCReceber.ShowModal;
    end;
end;

end.
