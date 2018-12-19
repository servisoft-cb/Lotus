unit UPgtoComissaoMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXLookup, DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, Db, DBTables,
  ComCtrls, ToolEdit, CurrEdit, Grids, DBGrids,
  RXDBCtrl, ALed;

type
  TfPgtoComissaoMod = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    tExtComissaoModIns: TTable;
    Bevel1: TBevel;
    BitBtn8: TBitBtn;
    Bevel2: TBevel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    StaticText2: TStaticText;
    Panel6: TPanel;
    StaticText1: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    CurrencyEdit5: TCurrencyEdit;
    StaticText3: TStaticText;
    Label1: TLabel;
    Bevel3: TBevel;
    Label4: TLabel;
    DateEdit1: TDateEdit;
    RxDBGrid1: TRxDBGrid;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPgtoComissaoMod: TfPgtoComissaoMod;

implementation

uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfPgtoComissaoMod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tExtComissaoMod.Filtered  := False;
  Dm1.tModelista.Close;
  Dm1.tExtComissaoMod.Close;
  DM1.tCliente.Close;
  DM1.tProduto.Close;
  Action := Cafree;
end;

procedure TfPgtoComissaoMod.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPgtoComissaoMod.BitBtn8Click(Sender: TObject);
var
  vValor : Currency;
begin
  if RxDBLookupCombo3.Text = '' then
    begin
      ShowMessage('Não foi selecionado Modelista!');
      RxDBLookupCombo3.SetFocus;
    end
  else
    begin
      vValor := 0;
      CurrencyEdit1.Clear;
      CurrencyEdit5.Clear;
      DM1.tExtComissaoMod.DisableControls;
      DM1.tExtComissaoMod.First;
      While not DM1.tExtComissaoMod.EOF do
        begin
          if DM1.tExtComissaoModFuncao.AsString = 'D' then
            vValor := vValor - DM1.tExtComissaoModVlrComissao.AsFloat;
          if DM1.tExtComissaoModFuncao.AsString = 'E' then
            vValor := vValor + DM1.tExtComissaoModVlrComissao.AsFloat;
          if DM1.tExtComissaoModFuncao.AsString = 'S' then
            vValor := vValor - DM1.tExtComissaoModVlrComissao.AsFloat;
          DM1.tExtComissaoMod.Next;
        end;
      CurrencyEdit1.Value := vValor;
      DM1.tExtComissaoMod.EnableControls;
    end;
end;

procedure TfPgtoComissaoMod.RxDBLookupCombo3Change(Sender: TObject);
begin
  if RxDBLookupCombo3.Text <> '' then
    begin
      DM1.tExtComissaoMod.Filtered := False;
      DM1.tExtComissaoMod.Filter   := 'CodModelista = '''+DM1.tModelistaCodigo.AsString+'''';
      DM1.tExtComissaoMod.Filtered := True;
      CurrencyEdit1.Clear;
      CurrencyEdit5.Clear;
      BitBtn8Click(Sender);
    end;
end;

procedure TfPgtoComissaoMod.BitBtn6Click(Sender: TObject);
begin
  if CurrencyEdit5.Value > 0 then
    begin
      if DateEdit1.Text <> '  /  /    ' then
        begin
          tExtComissaoModIns.Refresh;
          tExtComissaoModIns.Last;
          DM1.tExtComissaoMod.Insert;
          DM1.tExtComissaoModNroLancamento.AsInteger  := tExtComissaoModInsNroLancamento.AsInteger + 1;
          if RxDBLookupCombo3.Text <> '' then
            DM1.tExtComissaoModCodModelista.AsInteger := RxDBLookupCombo3.KeyValue;
          DM1.tExtComissaoModDtReferencia.AsDateTime  := DateEdit1.Date;
          DM1.tExtComissaoModFuncao.AsString          := 'S';
          DM1.tExtComissaoModVlrComissao.AsFloat      := CurrencyEdit5.Value;
          DM1.tExtComissaoMod.Post;
          CurrencyEdit1.Value                         := CurrencyEdit1.Value - CurrencyEdit5.Value;
          CurrencyEdit5.Clear;
        end
      else
        begin
          ShowMessage('Não foi preenchido o campo data!');
          DateEdit1.SetFocus;
        end;      
    end;
end;

procedure TfPgtoComissaoMod.FormShow(Sender: TObject);
begin
  Dm1.tModelista.Open;
  Dm1.tExtComissaoMod.Open;
  DM1.tCliente.Open;
  DM1.tProduto.Open;
  DM1.tModelista.Filtered := False;
  DateEdit1.Date := Date;
  DM1.tModelista.IndexFieldNames := 'Descricao'; 
  DM1.tModelista.First;
  if DM1.tModelistaCodigo.AsInteger > 0 then
    RxDBLookupCombo3.KeyValue := DM1.tModelistaCodigo.AsInteger;
  RxDBLookupCombo3Change(Sender);
  RxDBLookupCombo3.SetFocus;
end;

procedure TfPgtoComissaoMod.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tModelista.IndexFieldNames := 'Descricao';
end;

procedure TfPgtoComissaoMod.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfPgtoComissaoMod.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
