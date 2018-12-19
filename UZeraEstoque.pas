unit UZeraEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBTables, StdCtrls, Buttons, Grids, DBGrids,
  SMDBGrid;

type
  TfZeraEstoque = class(TForm)
    qEstoqueMatMovGrade: TQuery;
    qEstoqueMatMovGradecodmaterial: TIntegerField;
    qEstoqueMatMovGradecodcor: TIntegerField;
    qEstoqueMatMovGradeqtd2: TFloatField;
    qEstoqueMatMovGradetamanho: TStringField;
    qEstoqueMatMov: TQuery;
    qEstoqueMatMovcodmaterial: TIntegerField;
    qEstoqueMatMovcodcor: TIntegerField;
    qEstoqueMatMovqtd2: TFloatField;
    qEstoqueMatMovunidade: TStringField;
    qEstoqueMatMovicms: TFloatField;
    qEstoqueMatMovipi: TFloatField;
    qEstoqueMatMovNOME: TStringField;
    dsqEstoqueMatMov: TDataSource;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fZeraEstoque: TfZeraEstoque;

implementation

uses UDM1;

{$R *.dfm}

procedure TfZeraEstoque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfZeraEstoque.BitBtn2Click(Sender: TObject);
begin
  if not fDMImportarPdx.qEstoqueMatMov.Active then
    exit;

  fDMImportarPdx.qEstoqueMatMov.First;
  while not fDMImportarPdx.qEstoqueMatMov.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) and (StrToFloat(FormatFloat('0.00000',fDMImportarPdx.qEstoqueMatMovqtd2.AsFloat)) > 0) then
      prc_Zerar_Estoque;

    fDMImportarPdx.qEstoqueMatMov.Next;
  end;

  ShowMessage('Estoque Zerado dos Materiais Selecionados!');
end;

end.
