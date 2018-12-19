unit ULancComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db,
  Grids, DBGrids, ExtCtrls, StdCtrls, ALed, RXDBCtrl, RXLookup, CurrEdit,
  Mask, ToolEdit, Buttons, DBTables;

type
  TfLancComissao = class(TForm)
    Bevel2: TBevel;
    RxDBGrid1: TRxDBGrid;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Edit1: TEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label4: TLabel;
    tExtComissaoIns: TTable;
    tExtComissaoInsNroLancamento: TIntegerField;
    tExtComissaoInsCodVendedor: TIntegerField;
    tExtComissaoInsDtReferencia: TDateField;
    tExtComissaoInsNroDoc: TIntegerField;
    tExtComissaoInsParcDoc: TIntegerField;
    tExtComissaoInsCodCliente: TIntegerField;
    tExtComissaoInsFuncao: TStringField;
    tExtComissaoInsVlrBase: TFloatField;
    tExtComissaoInsPercDescDupl: TFloatField;
    tExtComissaoInsPercComissao: TFloatField;
    tExtComissaoInsVlrComissao: TFloatField;
    tExtComissaoInsTipo: TStringField;
    tExtComissaoInsSuspensa: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLancComissao: TfLancComissao;
  vTipo, vCodigo : String;
  vAlterar       : Boolean;  

implementation

uses UDM1, UAgendaTelef, USenhaExc;

{$R *.DFM}

procedure TfLancComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tExtComissao.Close;
      DM1.tVendedor.Close;
      DM1.tCliente.Close;
    end;
  Action := caFree;
end;

procedure TfLancComissao.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

procedure TfLancComissao.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfLancComissao.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tVendedor.IndexFieldNames := 'Nome';
end;

procedure TfLancComissao.BitBtn4Click(Sender: TObject);
begin
  if DM1.tExtComissaoNroLancamento.AsInteger > 0 then
    begin
      if DM1.tVendedor.Locate('Codigo',DM1.tExtComissaoCodVendedor.AsInteger,[loCaseInsensitive]) then
        begin
          if DM1.tVendedorDtEncerramentoCom.AsDateTime >= DM1.tExtComissaoDtReferencia.AsDateTime then
            ShowMessage('Comissão já encerrada nesta data para este vendedor!')
          else
            begin
              fSenhaExc := TfSenhaExc.Create(Self);
              fSenhaExc.ShowModal;
              if (DM1.tParametrosSenhaExc.AsString = '') or (DM1.tParametrosSenhaExc.AsString <> vSenhaExc) then
                ShowMessage('Senha inválida!')
              else
              if MessageDlg('Deseja realmente excluir esta comissão?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                begin
                  DM1.Grava_ExcComissaoVend;
                  DM1.tExtComissao.Delete;
                end;
            end;
        end
      else
        ShowMessage('Vendedor não cadastrado ou excluido!');
    end
  else
    ShowMessage('Não existe comissão para excluir!');
end;

procedure TfLancComissao.BitBtn3Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    ShowMessage('Falta informar o vendedor!')
  else
  if DM1.tExtComissaoNroLancamento.AsInteger > 0 then
    begin
      DM1.tVendedor.Locate('Codigo',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
      if DM1.tVendedorDtEncerramentoCom.AsDateTime >= DM1.tExtComissaoDtReferencia.AsDateTime then
        ShowMessage('Comissão já encerrada nesta data para este vendedor!')
      else
        begin
          fSenhaExc := TfSenhaExc.Create(Self);
          fSenhaExc.ShowModal;
          if (DM1.tParametrosSenhaExc.AsString = '') or (DM1.tParametrosSenhaExc.AsString <> vSenhaExc) then
            ShowMessage('Senha inválida!')
          else
            begin
              if MessageDlg('Deseja realmente alterar esta comissão?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                begin
                  RxDBLookupCombo2.KeyValue := DM1.tExtComissaoCodCliente.AsInteger;
                  DateEdit1.Text            := DM1.tExtComissaoDtReferencia.AsString;
                  CurrencyEdit1.Value       := DM1.tExtComissaoNroDoc.AsInteger;
                  CurrencyEdit2.Value       := DM1.tExtComissaoParcDoc.AsInteger;
                  Edit1.Text                := DM1.tExtComissaoFuncao.AsString;
                  CurrencyEdit4.Value       := DM1.tExtComissaoPercComissao.AsFloat;
                  CurrencyEdit5.Value       := DM1.tExtComissaoVlrBase.AsFloat;
                  CurrencyEdit6.Value       := DM1.tExtComissaoVlrComissao.AsFloat;
                  vTipo                     := DM1.tExtComissaoTipo.AsString;
                  vCodigo                   := DM1.tExtComissaoNroLancamento.AsString;
                  DM1.Grava_ExcComissaoVend;
                  DM1.tExtComissao.Delete;
                  vAlterar := True;
                end;
            end;
        end;
    end;
end;

procedure TfLancComissao.BitBtn2Click(Sender: TObject);
begin
  if (RxDBLookupCombo1.Text <> '') and (DateEdit1.Date > 1) and (CurrencyEdit6.Text <> '') then
    begin
      DM1.tVendedor.Locate('Codigo',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
      if DM1.tVendedorDtEncerramentoCom.AsDateTime >= DateEdit1.Date then
        ShowMessage('Comissão já encerrada nesta data para este vendedor!')
      else
        begin
          tExtComissaoIns.Refresh;
          tExtComissaoIns.Last;
          DM1.tExtComissao.Insert;
          if vAlterar then
            begin
              DM1.tExtComissaoNroLancamento.AsInteger := StrToInt(vCodigo);
              vAlterar := False;
            end
          else
            DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
          DM1.tExtComissaoCodVendedor.AsInteger   := RxDBLookupCombo1.KeyValue;
          if RxDBLookupCombo2.Text <> '' then
            DM1.tExtComissaoCodCliente.AsInteger    := RxDBLookupCombo2.KeyValue;
          DM1.tExtComissaoDtReferencia.AsString   := DateEdit1.Text;
          if CurrencyEdit1.Text = '' then
            DM1.tExtComissaoNroDoc.AsInteger      :=  0
          else
            DM1.tExtComissaoNroDoc.AsInteger      := StrToInt(CurrencyEdit1.Text);
          if CurrencyEdit2.Text = '' then
            DM1.tExtComissaoParcDoc.AsInteger     :=  0
          else
            DM1.tExtComissaoParcDoc.AsInteger     :=  StrToInt(CurrencyEdit2.Text);
          DM1.tExtComissaoFuncao.AsString       :=  Edit1.Text;
          DM1.tExtComissaoPercComissao.AsFloat  :=  CurrencyEdit4.Value;
          DM1.tExtComissaoVlrBase.AsFloat       :=  CurrencyEdit5.Value;
          DM1.tExtComissaoVlrComissao.AsFloat   :=  CurrencyEdit6.Value;
          if vTipo <> '' then
            DM1.tExtComissaoTipo.AsString         :=  vTipo
          else
            DM1.tExtComissaoTipo.AsString         :=  'M';
          DM1.tExtComissao.Post;
          DM1.tExtComissao.Refresh;
          RxDBLookupCombo2.ClearValue;
          CurrencyEdit1.Clear;
          CurrencyEdit2.Clear;
          CurrencyEdit4.Clear;
          CurrencyEdit5.Clear;
          CurrencyEdit6.Clear;
          DateEdit1.Clear;
          Edit1.Text := 'E';
          RxDBLookupCombo2.SetFocus;
        end;
    end
  else
    begin
      ShowMessage('Existem campos não preenchidos, "VENDEDOR", "CLIENTE", "DATA" ou "COMISSÃO" !');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfLancComissao.RxDBLookupCombo1Change(Sender: TObject);
begin
  DM1.tExtComissao.Filtered := False;
  DM1.tExtComissao.Filter   := 'CodVendedor = '''+DM1.tVendedorCodigo.AsString+'''';
  DM1.tExtComissao.Filtered := True;
end;

procedure TfLancComissao.CurrencyEdit5Exit(Sender: TObject);
var
vValorBase, vValorCom : Currency;
begin
  if CurrencyEdit4.Value > 0 then
    begin
      vValorBase := CurrencyEdit5.Value;
      vValorCom  := (vValorBase * CurrencyEdit4.Value) / 100;
      CurrencyEdit6.Value := vValorCom;
    end;
end;

procedure TfLancComissao.FormShow(Sender: TObject);
begin
  DM1.tExtComissao.Open;
  DM1.tVendedor.Open;
  DM1.tCliente.Open;
  DM1.tExtComissao.IndexFieldNames := 'NroLancamento';
  RxDBLookupCombo1Change(Sender);
  vTipo    := '';
  vCodigo  := '';
  vAlterar := False;
end;

procedure TfLancComissao.Edit1Exit(Sender: TObject);
begin
  if (Edit1.Text <> 'E') and (Edit1.Text <> 'S') and (Edit1.Text <> 'D') then
    begin
      ShowMessage('Essa função não é valida!');
      Edit1.Clear;
      Edit1.SetFocus;
    end;
end;

procedure TfLancComissao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
