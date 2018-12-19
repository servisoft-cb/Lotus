unit UVerificaGradeMateriais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBClient, ComCtrls, Grids, DBGrids,
  SMDBGrid;

type
  TfVerificaGradeMateriais = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    mVerifica: TClientDataSet;
    mVerificaCodMaterial: TIntegerField;
    mVerificaCodGrade: TIntegerField;
    mVerificaTamReferencia: TStringField;
    mVerificaTamMaterial: TStringField;
    mVerificaNomeGrade: TStringField;
    ProgressBar1: TProgressBar;
    SMDBGrid1: TSMDBGrid;
    dsmVerifica: TDataSource;
    mVerificaNomeMaterial: TStringField;
    BitBtn3: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Grava_mVerifica;
  public
    { Public declarations }
  end;

var
  fVerificaGradeMateriais: TfVerificaGradeMateriais;

implementation

uses UDM1, URelVerificaGradeMat;

{$R *.dfm}

procedure TfVerificaGradeMateriais.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfVerificaGradeMateriais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfVerificaGradeMateriais.BitBtn1Click(Sender: TObject);
begin
  DM1.tMaterial.Open;
  DM1.tMaterialGradeNum.Open;
  mVerifica.EmptyDataSet;
  ProgressBar1.Max      := DM1.tMaterial.RecordCount;
  ProgressBar1.Position := 0;

  mVerifica.IndexFieldNames := 'CodMaterial';
  DM1.tMaterial.First;
  while not DM1.tMaterial.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if DM1.tMaterialCodGrade.AsInteger > 0 then
    begin
      DM1.tMaterialGradeNum.First;
      while not DM1.tMaterialGradeNum.Eof do
      begin
        if (CheckBox1.Checked) and (Trim(DM1.tMaterialGradeNumTamMaterial.AsString) = '') then
          Grava_mVerifica
        else
        if Trim(DM1.tMaterialGradeNumTamMaterial.AsString) <> '' then
        begin
          if not DM1.tGradeItemlk.Locate('CodGrade;Tamanho',VarArrayOf([DM1.tMaterialCodGrade.AsInteger,DM1.tMaterialGradeNumTamMaterial.AsString]),[locaseinsensitive]) then
            Grava_mVerifica;
        end;
        DM1.tMaterialGradeNum.Next;
      end;
    end;
    DM1.tMaterial.Next;
  end;
  if CheckBox3.Checked then
  begin
    DM1.tMaterial.IndexFieldNames := 'Codigo';
    mVerifica.First;
    while not mVerifica.Eof do
    begin
      if DM1.tMaterial.FindKey([mVerificaCodMaterial.AsInteger]) then
      begin
        DM1.tMaterial.Edit;
        DM1.tMaterialCorreto.AsBoolean := False;
        DM1.tMaterial.Post;
      end;
      mVerifica.Next
    end;
  end;
end;

procedure TfVerificaGradeMateriais.Grava_mVerifica;
var
  vGravarAux : Boolean;
begin
  vGravarAux := True;
  if (CheckBox2.Checked) and (mVerifica.FindKey([DM1.tMaterialCodigo.AsInteger])) then
    vGravarAux := False;

  if not vGravarAux then
    exit;

  mVerifica.Insert;
  mVerificaCodMaterial.AsInteger := DM1.tMaterialCodigo.AsInteger;
  mVerificaNomeMaterial.AsString := DM1.tMaterialNome.AsString;
  if DM1.tGrade.Locate('Codigo',DM1.tMaterialGradeNumCodGrade.AsInteger,[loCaseInsensitive]) then
    mVerificaNomeGrade.AsString := DM1.tGradeNome.AsString;
  mVerificaCodGrade.AsInteger := DM1.tMaterialGradeNumCodGrade.AsInteger;
  mVerificaTamReferencia.AsString := DM1.tMaterialGradeNumTamanho.AsString;
  mVerificaTamMaterial.AsString   := DM1.tMaterialGradeNumTamMaterial.AsString;
  mVerifica.Post;
end;

procedure TfVerificaGradeMateriais.BitBtn3Click(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fRelVerificaGradeMat := TfRelVerificaGradeMat.Create(Self);
  fRelVerificaGradeMat.RLReport1.Preview;
  fRelVerificaGradeMat.RLReport1.Free;
  SMDBGrid1.EnableScroll;
end;

procedure TfVerificaGradeMateriais.FormShow(Sender: TObject);
begin
  DM1.tGradeItemlk.Open;
end;

procedure TfVerificaGradeMateriais.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
    CheckBox3.Visible := not(CheckBox3.Visible);
end;

end.
