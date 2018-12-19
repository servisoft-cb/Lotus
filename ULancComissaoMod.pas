unit ULancComissaoMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, db,
  Grids, DBGrids, ExtCtrls, StdCtrls, ALed, RXDBCtrl, RXLookup, CurrEdit,
  Mask, ToolEdit, Buttons, DBTables, Variants;

type
  TfLancComissaoMod = class(TForm)
    Bevel2: TBevel;
    RxDBGrid1: TRxDBGrid;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    DateEdit1: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    Edit1: TEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText5: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label4: TLabel;
    tExtComissaoModIns: TTable;
    tExtComissaoModInsNroLancamento: TIntegerField;
    tExtComissaoModInsCodModelista: TIntegerField;
    tExtComissaoModInsDtReferencia: TDateField;
    tExtComissaoModInsNumNota: TIntegerField;
    tExtComissaoModInsCodProduto: TIntegerField;
    tExtComissaoModInsFuncao: TStringField;
    tExtComissaoModInsVlrBase: TFloatField;
    tExtComissaoModInsPercComissao: TFloatField;
    tExtComissaoModInsVlrComissao: TFloatField;
    tExtComissaoModInsTipo: TStringField;
    StaticText10: TStaticText;
    RxDBLookupCombo3: TRxDBLookupCombo;
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
    procedure CurrencyEdit7Enter(Sender: TObject);
    procedure CurrencyEdit7Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLancComissaoMod: TfLancComissaoMod;
  vTipo, vCodigo : String;
  vAlterar       : Boolean;  

implementation

uses UDM1, UAgendaTelef, USenhaExc;

{$R *.DFM}

procedure TfLancComissaoMod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      Dm1.tProduto.Close;
      Dm1.tCliente.Close;
      Dm1.tExtComissaoMod.Close;
      Dm1.tModelista.Close;
    end;
  Action := caFree;
end;

procedure TfLancComissaoMod.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tProduto.IndexFieldNames := 'Referencia';
end;

procedure TfLancComissaoMod.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfLancComissaoMod.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Descricao';
end;

procedure TfLancComissaoMod.BitBtn4Click(Sender: TObject);
begin
  fSenhaExc := TfSenhaExc.Create(Self);
  fSenhaExc.ShowModal;
  if DM1.tParametrosSenhaExc.AsString <> vSenhaExc then
    ShowMessage('Senha inválida!')
  else
  if MessageDlg('Deseja realmente excluir esta comissão?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      DM1.Grava_ExcComissaoMod;
      DM1.tExtComissaoMod.Delete;
    end;
end;

procedure TfLancComissaoMod.BitBtn3Click(Sender: TObject);
begin
  fSenhaExc := TfSenhaExc.Create(Self);
  fSenhaExc.ShowModal;
  if DM1.tParametrosSenhaExc.AsString <> vSenhaExc then
    ShowMessage('Senha inválida!')
  else
  if RxDBLookupCombo1.Text <> '' then
    begin
      if MessageDlg('Deseja realmente alterar esta comissão?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
          if DM1.tExtComissaoModCodProduto.AsInteger > 0 then
            RxDBLookupCombo2.KeyValue := DM1.tExtComissaoModCodProduto.AsInteger;
          if DM1.tExtComissaoModCodCliente.AsInteger > 0 then
            RxDBLookupCombo3.KeyValue := DM1.tExtComissaoModCodCliente.AsInteger;
          DateEdit1.Text            := DM1.tExtComissaoModDtReferencia.AsString;
          CurrencyEdit1.Value       := DM1.tExtComissaoModNumNota.AsInteger;
          Edit1.Text                := DM1.tExtComissaoModFuncao.AsString;
          CurrencyEdit4.Value       := DM1.tExtComissaoModPercComissao.AsFloat;
          CurrencyEdit5.Value       := DM1.tExtComissaoModVlrBase.AsFloat;
          CurrencyEdit6.Value       := DM1.tExtComissaoModVlrComissao.AsFloat;
          vTipo                     := DM1.tExtComissaoModTipo.AsString;
          vCodigo                   := DM1.tExtComissaoModNroLancamento.AsString;
          DM1.Grava_ExcComissaoMod;
          DM1.tExtComissaoMod.Delete;
          vAlterar := True;
        end;
    end
  else
    begin
      ShowMessage('Não foi preenchido campo Modelista!');
      RxDBLookupCombo1.SetFocus;
    end;  
end;

procedure TfLancComissaoMod.BitBtn2Click(Sender: TObject);
begin
  if (RxDBLookupCombo1.Text <> '') and (DateEdit1.Text <> '  /  /    ') and (CurrencyEdit6.Text <> '') then
    begin                          
      tExtComissaoModIns.Refresh;
      tExtComissaoModIns.Last;
      DM1.tExtComissaoMod.Insert;
      if vAlterar then
        begin
          DM1.tExtComissaoModNroLancamento.AsInteger := StrToInt(vCodigo);
          vAlterar := False;
        end
      else
        DM1.tExtComissaoModNroLancamento.AsInteger := tExtComissaoModInsNroLancamento.AsInteger + 1;
      DM1.tExtComissaoModCodModelista.AsInteger    := RxDBLookupCombo1.KeyValue;
      if RxDBLookupCombo2.Text <> '' then
        DM1.tExtComissaoModCodProduto.AsInteger    := RxDBLookupCombo2.KeyValue;
      if RxDBLookupCombo3.Text <> '' then
        DM1.tExtComissaoModCodCliente.AsInteger       := RxDBLookupCombo3.KeyValue;
      DM1.tExtComissaoModDtReferencia.AsDateTime   := DateEdit1.Date;
      DM1.tExtComissaoModNumNota.AsInteger         := CurrencyEdit1.AsInteger;
      DM1.tExtComissaoModFuncao.AsString           := Edit1.Text;
      DM1.tExtComissaoModPercComissao.AsCurrency   := CurrencyEdit4.Value;
      DM1.tExtComissaoModVlrBase.AsCurrency        := CurrencyEdit5.Value;
      DM1.tExtComissaoModVlrComissao.AsCurrency    := CurrencyEdit6.Value;
      if vTipo <> '' then
        DM1.tExtComissaoModTipo.AsString           :=  vTipo
      else
        DM1.tExtComissaoModTipo.AsString           :=  'M';
      DM1.tExtComissaoMod.Post;
      DM1.tExtComissaoMod.Refresh;
      RxDBLookupCombo2.ClearValue;
      RxDBLookupCombo3.ClearValue;
      CurrencyEdit1.Clear;
      CurrencyEdit4.Clear;
      CurrencyEdit5.Clear;
      CurrencyEdit6.Clear;
      DateEdit1.Clear;
      Edit1.Text := 'E';
      RxDBLookupCombo2.SetFocus;
    end
  else
    begin
      ShowMessage('Existem campos não preenchidos, "Modelista", "CLIENTE", "DATA" ou "COMISSÃO" !');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfLancComissaoMod.RxDBLookupCombo1Change(Sender: TObject);
begin
  DM1.tExtComissaoMod.Filtered := False;
  DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+DM1.tModelistaCodigo.AsString+'''';
  DM1.tExtComissaoMod.Filtered := True;
end;

procedure TfLancComissaoMod.CurrencyEdit5Exit(Sender: TObject);
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

procedure TfLancComissaoMod.FormShow(Sender: TObject);
begin
  Dm1.tProduto.Open;
  Dm1.tCliente.Open;
  Dm1.tExtComissaoMod.Open;
  Dm1.tModelista.Open;
  DM1.tExtComissaoMod.IndexFieldNames := 'NroLancamento';
  RxDBLookupCombo1Change(Sender);
  vTipo    := '';
  vCodigo  := '';
  vAlterar := False;
end;

procedure TfLancComissaoMod.Edit1Exit(Sender: TObject);
begin
  if (Edit1.Text <> 'E') and (Edit1.Text <> 'S') and (Edit1.Text <> 'D') then
    begin
      ShowMessage('Essa função não é valida!');
      Edit1.Clear;
      Edit1.SetFocus;
    end;
end;

procedure TfLancComissaoMod.CurrencyEdit7Enter(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    begin
      ShowMessage('É obrigatório infomar o código do modelista!');
      RxDBLookupCombo1.SetFocus;
    end;
end;

procedure TfLancComissaoMod.CurrencyEdit7Change(Sender: TObject);
begin
  DM1.tExtComissaoMod.Locate('NroLancamento;CodModelista',VarArrayOf([CurrencyEdit1.Value,RxDBLookupCombo1.KeyValue]),[loCaseInsensitive]);
end;

procedure TfLancComissaoMod.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfLancComissaoMod.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tCliente.IndexFieldNames := 'Nome';
end;

end.
