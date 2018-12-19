unit UFichaConstrucao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, RxLookup, ToolEdit,
  RXDBCtrl, Grids, DBGrids, SMDBGrid, RxDBComb, RzEdit, RzDBEdit, RzTabs,
  FMTBcd, DB, SqlExpr, Provider, DBClient, DBVGrids, DBFilter, DBTables,
  ExtDlgs;

type
  TfFichaConstrucao = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    RzPageControl1: TRzPageControl;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    TabSheet1: TRzTabSheet;
    VDBGrid1: TVDBGrid;
    Label6: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    TabSheet2: TRzTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    SMDBGrid1: TSMDBGrid;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel5: TPanel;
    SMDBGrid2: TSMDBGrid;
    Panel6: TPanel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    GroupBox1: TGroupBox;
    VDBGrid2: TVDBGrid;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    BitBtn9: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    Image1: TImage;
    BitBtn33: TBitBtn;
    StaticText2: TStaticText;
    DBEdit22: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    Label12: TLabel;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    DBEdit9: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Grava_FichaConstrucao;
    procedure Mostra_Foto;

  public
    { Public declarations }
    vTalaoMC : Integer;

  end;

var
  fFichaConstrucao: TfFichaConstrucao;

implementation

uses UDM1, DmdDatabase, UDMFichaConstrucao, UFichaConstrucao_Pos,
  UFichaConstrucao_Mat;

{$R *.dfm}

procedure TfFichaConstrucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMFichaConstrucao.cdsFichaConstrucao.State in [dsEdit,dsInsert] then
    DMFichaConstrucao.cdsFichaConstrucao.CancelUpdates;
    
  if DMFichaConstrucao.Owner.ClassName  = Self.ClassName then
    FreeAndNil(DMFichaConstrucao);

  Tag    := 0;

  Action := Cafree;
end;

procedure TfFichaConstrucao.BitBtn2Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar a inclusão/alteração?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DMFichaConstrucao.cdsFichaConstrucao.CancelUpdates;
  Close;
end;

procedure TfFichaConstrucao.BitBtn1Click(Sender: TObject);
begin
  if Trim(DMFichaConstrucao.cdsFichaConstrucaoNOMECONSTRUCAO.AsString) = '' then
  begin
    ShowMessage('Construção não foi informada!');
    exit;
  end;

  Grava_FichaConstrucao;

  Close;
end;

procedure TfFichaConstrucao.Grava_FichaConstrucao;
var
  vVlrAux : Real;
begin
  try
    if DMFichaConstrucao.cdsFichaConstrucao.State in [dsEdit,dsInsert] then
      DMFichaConstrucao.cdsFichaConstrucao.Post;

    DMFichaConstrucao.cdsFichaConstrucao.ApplyUpdates(0);

  except
    on E: Exception do
    begin
      ShowMessage('Não foi possível gravar, ' + E.Message + '!');
    end;
  end;
end;

procedure TfFichaConstrucao.BitBtn3Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if trim(Edit1.Text) = '' then
  begin
    ShowMessage('Tamanho não foi informado!');
    exit;
  end;

  DMFichaConstrucao.cdsFichaConstrucao_Tam.Last;
  vItemAux := DMFichaConstrucao.cdsFichaConstrucao_TamITEM.AsInteger;

  DMFichaConstrucao.cdsFichaConstrucao_Tam.Insert;
  DMFichaConstrucao.cdsFichaConstrucao_TamID.AsInteger     := DMFichaConstrucao.cdsFichaConstrucaoID.AsInteger;
  DMFichaConstrucao.cdsFichaConstrucao_TamITEM.AsInteger   := vItemAux + 1;
  DMFichaConstrucao.cdsFichaConstrucao_TamTamanho.AsString := Edit1.Text;
  DMFichaConstrucao.cdsFichaConstrucao_Tam.Post;

  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TfFichaConstrucao.BitBtn4Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  DMFichaConstrucao.cdsFichaConstrucao_Pos.Last;
  vItemAux := DMFichaConstrucao.cdsFichaConstrucao_PosITEM.AsInteger;

  DMFichaConstrucao.cdsFichaConstrucao_Pos.Insert;
  DMFichaConstrucao.cdsFichaConstrucao_PosID.AsInteger := DMFichaConstrucao.cdsFichaConstrucaoID.AsInteger;
  DMFichaConstrucao.cdsFichaConstrucao_PosITEM.AsInteger := vItemAux + 1;

  fFichaConstrucao_Pos := TfFichaConstrucao_Pos.Create(Self);
  fFichaConstrucao_Pos.ShowModal;
end;

procedure TfFichaConstrucao.BitBtn5Click(Sender: TObject);
begin
  if DMFichaConstrucao.cdsFichaConstrucao_Pos.IsEmpty then
  begin
    ShowMessage('Não existe registro para excluir!');
    exit;
  end;

  if MessageDlg('Deseja exlcuir a posição?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DMFichaConstrucao.cdsFichaConstrucao_Pos.Delete;
end;

procedure TfFichaConstrucao.BitBtn6Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  DMFichaConstrucao.cdsFichaConstrucao_Mat.Last;
  vItemAux := DMFichaConstrucao.cdsFichaConstrucao_MatITEMMATERIAL.AsInteger;

  DMFichaConstrucao.cdsFichaConstrucao_Mat.Insert;
  DMFichaConstrucao.cdsFichaConstrucao_MatID.AsInteger           := DMFichaConstrucao.cdsFichaConstrucaoID.AsInteger;
  DMFichaConstrucao.cdsFichaConstrucao_MatITEMPOSICAO.AsInteger  := DMFichaConstrucao.cdsFichaConstrucao_PosITEM.AsInteger;
  DMFichaConstrucao.cdsFichaConstrucao_MatITEMMATERIAL.AsInteger := vItemAux + 1;


  if DMFichaConstrucao.cdsFichaConstrucao_PosINFORMARGRADE.AsString = 'S' then
  begin
    vItemAux := 0;
    DMFichaConstrucao.cdsFichaConstrucao_Tam.First;
    while not DMFichaConstrucao.cdsFichaConstrucao_Tam.Eof do
    begin
      vItemAux := vItemAux + 1;
      DMFichaConstrucao.cdsFichaConstrucao_MatTam.Insert;
      DMFichaConstrucao.cdsFichaConstrucao_MatTamID.AsInteger           := DMFichaConstrucao.cdsFichaConstrucaoID.AsInteger;
      DMFichaConstrucao.cdsFichaConstrucao_MatTamITEMPOSICAO.AsInteger  := DMFichaConstrucao.cdsFichaConstrucao_PosITEM.AsInteger;
      DMFichaConstrucao.cdsFichaConstrucao_MatTamITEMMATERIAL.AsInteger := DMFichaConstrucao.cdsFichaConstrucao_MatITEMMATERIAL.AsInteger;
      DMFichaConstrucao.cdsFichaConstrucao_MatTamITEMTAM.AsInteger      := vItemAux;
      DMFichaConstrucao.cdsFichaConstrucao_MatTamTAMREF.AsString        := DMFichaConstrucao.cdsFichaConstrucao_TamTAMANHO.AsString;
      DMFichaConstrucao.cdsFichaConstrucao_MatTam.Post;
      DMFichaConstrucao.cdsFichaConstrucao_Tam.Next;
    end;
  end;

  fFichaConstrucao_Mat := TfFichaConstrucao_Mat.Create(Self);
  fFichaConstrucao_Mat.ShowModal;
end;

procedure TfFichaConstrucao.BitBtn8Click(Sender: TObject);
begin
  if DMFichaConstrucao.cdsFichaConstrucao_Mat.IsEmpty then
  begin
    ShowMessage('Não existe registro para alterar!');
    exit;
  end;
  DMFichaConstrucao.cdsFichaConstrucao_Mat.Edit;
  fFichaConstrucao_Mat := TfFichaConstrucao_Mat.Create(Self);
  fFichaConstrucao_Mat.ShowModal;
end;

procedure TfFichaConstrucao.BitBtn7Click(Sender: TObject);
begin
  if DMFichaConstrucao.cdsFichaConstrucao_Mat.IsEmpty then
  begin
    ShowMessage('Não existe registro para excluir!');
    exit;
  end;
  if MessageDlg('Deseja exlcuir o material?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DMFichaConstrucao.cdsFichaConstrucao_Mat.Delete;
end;

procedure TfFichaConstrucao.BitBtn9Click(Sender: TObject);
begin
  if DMFichaConstrucao.cdsFichaConstrucao_Pos.IsEmpty then
  begin
    ShowMessage('Não existe registro para alterar!');
    exit;
  end;

  DMFichaConstrucao.cdsFichaConstrucao_Pos.Edit;
  fFichaConstrucao_Pos := TfFichaConstrucao_Pos.Create(Self);
  fFichaConstrucao_Pos.ShowModal;
end;

procedure TfFichaConstrucao.BitBtn33Click(Sender: TObject);
begin
  OpenPictureDialog1.Execute;
  DMFichaConstrucao.cdsFichaConstrucaoENDFOTO.AsString := OpenPictureDialog1.FileName;
  Mostra_Foto;
end;

procedure TfFichaConstrucao.FormShow(Sender: TObject);
begin
  Mostra_Foto;
end;

procedure TfFichaConstrucao.Mostra_Foto;
begin
  Image1.Picture := nil;

  if Trim(DMFichaConstrucao.cdsFichaConstrucaoENDFOTO.AsString) = '' then
    exit;

  if FileExists(DMFichaConstrucao.cdsFichaConstrucaoENDFOTO.AsString) then
    Image1.Picture.LoadFromFile(DMFichaConstrucao.cdsFichaConstrucaoENDFOTO.AsString);
end;

end.
