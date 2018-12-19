unit UCadNotaFiscal_Itens_DrawBack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, RxLookup, ToolEdit, RXDBCtrl, DB, 
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, CurrEdit, Grids, DBGrids, SMDBGrid, UDMNotaFiscalFB;

type
  TfrmCadNotaFiscal_Itens_DrawBack = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    Edit3: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    SMDBGrid3: TSMDBGrid;
    Panel1: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    vItemDrawBack : Integer;
    
    procedure prc_Limpar;

  public
    { Public declarations }
    fDMNotaFiscalFB : TDMNotaFiscalFB;
    vEdicao : Boolean;

    vID_Loc, vItem_Loc : Integer;

  end;

var
  frmCadNotaFiscal_Itens_DrawBack: TfrmCadNotaFiscal_Itens_DrawBack;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmCadNotaFiscal_Itens_DrawBack.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadNotaFiscal_Itens_DrawBack.FormShow(Sender: TObject);
begin
  fDMNotaFiscalFB := TDMNotaFiscalFB.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMNotaFiscalFB);
  vItemDrawBack  := 0;
  Label7.Caption := IntToStr(vItem_Loc);
  fDMNotaFiscalFB.prc_Localizar_Itens_DrawBack(vID_Loc,vItem_Loc);

  BitBtn1.Enabled := vEdicao;
  BitBtn3.Enabled := vEdicao;
  BitBtn4.Enabled := vEdicao;
end;

procedure TfrmCadNotaFiscal_Itens_DrawBack.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadNotaFiscal_Itens_DrawBack.BitBtn1Click(Sender: TObject);
begin
  if trim(Edit2.Text) = '' then
  begin
    MessageDlg('*** Nº Registro Exportação não informado', mtError, [mbOk], 0);
    exit;
  end;
  if vItemDrawBack > 0 then
  begin
    if fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBack.Locate('ITEM_DRAWBACK',vItemDrawBack ,[loCaseInsensitive]) then
      fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBack.Edit;
  end;
  if not(fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBack.State in [dsEdit]) then
    fDMNotaFiscalFB.prc_Inserir_Itens_DrawBack(vID_Loc,vItem_Loc);
  fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackNUM_DRAWBACK.AsString         := Edit1.Text;
  fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackNUM_REG_EXPORTACAO.AsString   := Edit2.Text;
  fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackNUM_CHAVE_ACESSO_NFE.AsString := Edit3.Text;
  fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackQTD.AsFloat                   := CurrencyEdit1.Value;
  fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBack.Post;
  fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBack.ApplyUpdates(0);
  prc_Limpar;
  Edit1.SetFocus;
end;

procedure TfrmCadNotaFiscal_Itens_DrawBack.prc_Limpar;
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  CurrencyEdit1.Clear;
  vItemDrawBack := 0;
end;

procedure TfrmCadNotaFiscal_Itens_DrawBack.BitBtn3Click(Sender: TObject);
begin
  if fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackID.AsInteger <= 0 then
    exit;
  Edit1.Text := fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackNUM_DRAWBACK.AsString;
  Edit2.Text := fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackNUM_REG_EXPORTACAO.AsString;
  CurrencyEdit1.Value := fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackQTD.AsFloat;
  Edit3.Text          := fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackNUM_CHAVE_ACESSO_NFE.AsString;
  Edit1.SetFocus;
end;

procedure TfrmCadNotaFiscal_Itens_DrawBack.BitBtn4Click(Sender: TObject);
begin
  if fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBackID.AsInteger <= 0 then
    exit;

  if MessageDlg('Deseja realmente excluir este registro?',mtConfirmation,[mbOK,mbNo],0) = mrNo then
    exit;

  fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBack.Delete;
  fDMNotaFiscalFB.cdsNotaFiscal_Itens_DrawBack.ApplyUpdates(0);
end;

end.
