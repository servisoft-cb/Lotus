unit UConsMaterialParaFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, SMDBGrid, StdCtrls;

type
  TfConsMaterialParaFicha = class(TForm)
    SMDBGrid1: TSMDBGrid;
    qMaterial: TQuery;
    dsqMaterial: TDataSource;
    StaticText1: TStaticText;
    qMaterialCodigo: TIntegerField;
    qMaterialNome: TStringField;
    qMaterialUnidade2: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsMaterialParaFicha: TfConsMaterialParaFicha;

implementation

uses UProdutoMat, UPedidoMat;

{$R *.dfm}

procedure TfConsMaterialParaFicha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qMaterial.Close;
  Action := Cafree;
end;

procedure TfConsMaterialParaFicha.FormShow(Sender: TObject);
begin
  qMaterial.Open;
end;

procedure TfConsMaterialParaFicha.SMDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key = vk_Return) or (Key = Vk_F2) then
     begin
       fProdutoMat.currencyEdit4.AsInteger := qMaterialCodigo.AsInteger;
       Close;
     end;
end;

procedure TfConsMaterialParaFicha.SMDBGrid1DblClick(Sender: TObject);
begin
  if Tag = 0 then
    fProdutoMat.currencyEdit4.AsInteger := qMaterialCodigo.AsInteger
  else
    fPedidoMat.RzDBLookupComboBox1.KeyValue := qMaterialCodigo.AsInteger;
  Close;
end;

end.
