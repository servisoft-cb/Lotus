unit UEscFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RxLookup, Buttons;

type
  TfEscFornecedor = class(TForm)
    Label1: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEscFornecedor: TfEscFornecedor;

implementation

uses UPrevCalcMaterialLote2, rsDBUtils;

{$R *.DFM}

procedure TfEscFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfEscFornecedor.BitBtn2Click(Sender: TObject);
begin
  fPrevCalcMaterialLote2.vCodFornecedorSel := 0;
  Close;
end;

procedure TfEscFornecedor.BitBtn1Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    fPrevCalcMaterialLote2.vCodFornecedorSel := RxDBLookupCombo1.KeyValue
  else
    fPrevCalcMaterialLote2.vCodFornecedorSel := 0;
  Close;
end;

procedure TfEscFornecedor.FormShow(Sender: TObject);
begin
  fPrevCalcMaterialLote2.vCodFornecedorSel := 0;
end;

procedure TfEscFornecedor.FormCreate(Sender: TObject);
begin
  oDBUtils.OpenTables(True,Self);
end;

end.
