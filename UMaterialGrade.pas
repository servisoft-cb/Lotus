unit UMaterialGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, CurrEdit, Buttons, Db,
  DBTables, MemTable, Grids, DBVGrids, DBGrids, Variants;

type
  TfMaterialGrade = class(TForm)
    Panel2: TPanel;
    Panel5: TPanel;
    BitBtn6: TBitBtn;
    VDBGrid1: TVDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure MontaGrade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMaterialGrade: TfMaterialGrade;

implementation

uses UMaterial, UDM1;

{$R *.DFM}

procedure TfMaterialGrade.MontaGrade;
begin
  fMaterial.tAuxMaterialGrade.First;
  while not fMaterial.tAuxMaterialGrade.Eof do
    fMaterial.tAuxMaterialGrade.delete;
  DM1.tGradeItem.First;
  while not DM1.tGradeItem.Eof do
    begin
      fMaterial.tAuxMaterialGrade.Insert;
      fMaterial.tAuxMaterialGradeCodGrade.AsInteger   := DM1.tGradeItemCodGrade.AsInteger;
      fMaterial.tAuxMaterialGradePosicao.AsInteger    := DM1.tGradeItemPosicao.AsInteger;
      fMaterial.tAuxMaterialGradeTamanho.AsString     := DM1.tGradeItemTamanho.AsString;
      fMaterial.tAuxMaterialGradeTamMaterial.AsString := '';
      fMaterial.tAuxMaterialGradePeso.AsFloat         := 0;
      fMaterial.tAuxMaterialGrade.Post;
      DM1.tGradeItem.Next;
    end;
  fMaterial.tAuxMaterialGrade.First;
end;

procedure TfMaterialGrade.FormShow(Sender: TObject);
begin
  if (DM1.tMaterialTipoMat.AsString <> 'S') or (DM1.tMaterialTipoSolado.AsString <> 'T') then
    vDBGrid1.Columns[2].Destroy;
  DM1.tGrade.IndexFieldNames := 'Codigo';
  DM1.tGrade.FindKey([fMaterial.RxDBLookupCombo1.KeyValue]);
  MontaGrade;
end;

procedure TfMaterialGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfMaterialGrade.VDBGrid1Enter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfMaterialGrade.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfMaterialGrade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  vTexto : String;
begin
  vTexto := '';
  fMaterial.tAuxMaterialGrade.First;
  while not fMaterial.tAuxMaterialGrade.Eof do
    begin
      if fMaterial.tAuxMaterialGradeTamMaterial.AsString <> '' then
      begin
        if not DM1.tGradeItemlk.Locate('CodGrade;Tamanho',VarArrayOf([DM1.tMaterialCodGrade.AsInteger,fMaterial.tAuxMaterialGradeTamMaterial.AsString]),[locaseinsensitive]) then
        begin
          vTexto := vTexto + '(' + fMaterial.tAuxMaterialGradeTamMaterial.AsString + ') ';
          fMaterial.tAuxMaterialGrade.Edit;
          fMaterial.tAuxMaterialGradeTamMaterial.AsString := '';
          fMaterial.tAuxMaterialGrade.Post;
        end;
      end;
      fMaterial.tAuxMaterialGrade.Next;
    end;
  if vTexto <> '' then
  begin
    ShowMessage('Tamanhos ' + vTexto + ', não existem na grade do material!');
    CanClose := False;
  end
  else
    CanClose := True;
end;

end.
