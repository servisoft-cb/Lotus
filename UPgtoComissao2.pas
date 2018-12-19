unit UPgtoComissao2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXLookup, DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, Db, DBTables,
  ComCtrls, ToolEdit, CurrEdit, Grids, DBGrids,
  RXDBCtrl, ALed, DBFilter;

type
  TfPgtoComissao2 = class(TForm)
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
    Panel6: TPanel;
    Label4: TLabel;
    StaticText1: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    StaticText3: TStaticText;
    DateEdit1: TDateEdit;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPgtoComissao2: TfPgtoComissao2;

implementation

uses UDM1, UConsComissao;

{$R *.DFM}

procedure TfPgtoComissao2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tVendedor.IndexFieldNames := 'Codigo';
  Action := Cafree;
end;

procedure TfPgtoComissao2.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfPgtoComissao2.BitBtn6Click(Sender: TObject);
begin
  if CurrencyEdit5.Value > 0 then
    begin
      if DateEdit1.Text <> '  /  /    ' then
        begin
          DM1.Verifica_ComissaoEnc(fConsComissao.RxDBLookupCombo1.KeyValue,DateEdit1.Date);
          if not vEncComissao then
            begin
              tExtComissaoIns.Refresh;
              tExtComissaoIns.Last;
              DM1.tExtComissao.Insert;
              DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
              DM1.tExtComissaoCodVendedor.AsInteger   := fConsComissao.RxDBLookupCombo1.KeyValue;
              DM1.tExtComissaoDtReferencia.AsDateTime := DateEdit1.Date;
              DM1.tExtComissaoFuncao.AsString         := 'S';
              DM1.tExtComissaoVlrComissao.AsFloat     := CurrencyEdit5.Value;
              DM1.tExtComissaoTipo.AsString           := 'M';
              DM1.tExtComissao.Post;
              CurrencyEdit1.Value                     := CurrencyEdit1.Value - CurrencyEdit5.Value;
              CurrencyEdit5.Clear;
            end;
          Close;
        end
      else
        begin
          ShowMessage('Não foi preenchido o campo data!');
          DateEdit1.SetFocus;
        end;      
    end;
end;

procedure TfPgtoComissao2.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if DM1.tExtComissaoSuspensa.AsBoolean then
    Background := ClRed;
end;

procedure TfPgtoComissao2.RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

end.
