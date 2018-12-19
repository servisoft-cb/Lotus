unit UPosicaoFichaC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, Grids, DBGrids,
  SMDBGrid, DB, CurrEdit, DBCtrls, RxLookup, DBFilter, DBClient, FMTBcd,
  Provider, SqlExpr;

type
  TfPosicaoFichaC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label5: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure Monta_PosicaoFicha(Tipo : String ; ID : Integer); //P=Com Parametros   N=Sem Parametros
    procedure Inserir_PosicaoFicha;

  end;

var
  fPosicaoFichaC: TfPosicaoFichaC;

implementation

uses DateUtils, UDM1, UPosicaoFicha, UDMPosicao_Ficha, uIntegracao;

{$R *.dfm}

procedure TfPosicaoFichaC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMPosicao_Ficha.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMPosicao_Ficha);

  Action := Cafree;
end;

procedure TfPosicaoFichaC.BitBtn3Click(Sender: TObject);
begin
  Monta_PosicaoFicha('P',0);
end;

procedure TfPosicaoFichaC.Monta_PosicaoFicha(Tipo : String ; ID : Integer); //P=Com Parametros   N=Sem Parametros
begin
   DMPosicao_Ficha.cdsPosicao_Ficha.Close;

  if ID > 0 then
  begin
    DMPosicao_Ficha.sdsPosicao_Ficha.CommandText := ctPosicao_Ficha
                                            + ' WHERE ID = ' + IntToStr(ID);
  end
  else
  if Tipo = 'P' then
  begin
    DMPosicao_Ficha.sdsPosicao_Ficha.CommandText := ctPosicao_Ficha
                                            + ' WHERE 0=0 ';
    if Trim(Edit1.Text) <> '' then
      DMPosicao_Ficha.sdsPosicao_Ficha.CommandText := DMPosicao_Ficha.sdsPosicao_Ficha.CommandText
                                              + ' AND NOMEPOSICAO = ' + Edit1.Text;
  end
  else
    DMPosicao_Ficha.sdsPosicao_Ficha.CommandText := ctPosicao_Ficha
                                            + ' WHERE ID = 0';

  DMPosicao_Ficha.cdsPosicao_Ficha.Open;
end;

procedure TfPosicaoFichaC.BitBtn2Click(Sender: TObject);
begin
  if DMPosicao_Ficha.cdsPosicao_Ficha.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DMPosicao_Ficha.cdsPosicao_Ficha.Delete;
  DMPosicao_Ficha.cdsPosicao_Ficha.ApplyUpdates(0);
end;

procedure TfPosicaoFichaC.BitBtn1Click(Sender: TObject);
begin
  if not DMPosicao_Ficha.cdsPosicao_Ficha.Active then
    Monta_PosicaoFicha('N',0);

  Inserir_PosicaoFicha;

  fPosicaoFicha := TfPosicaoFicha.Create(Self);
  fPosicaoFicha.Tag := 0;
  fPosicaoFicha.ShowModal;
end;

procedure TfPosicaoFichaC.FormShow(Sender: TObject);
begin
  if not Assigned(DMPosicao_Ficha) then
    DMPosicao_Ficha := TDMPosicao_Ficha.Create(Self);

  BitBtn1.Enabled := DM1.tUsuarioInsPosicaoFicha.AsBoolean;
  BitBtn2.Enabled := DM1.tUsuarioExcPosicaoFicha.AsBoolean;
end;

procedure TfPosicaoFichaC.SMDBGrid1DblClick(Sender: TObject);
begin
  if DMPosicao_Ficha.cdsPosicao_Ficha.IsEmpty then
    exit;
  if not DM1.tUsuarioAltPosicaoFicha.AsBoolean then
  begin                           
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ' não autorizado a fazer a alteração!');
    exit;
  end;
    
  DMPosicao_Ficha.cdsPosicao_Ficha.Edit;
  fPosicaoFicha := TfPosicaoFicha.Create(Self);                    
  fPosicaoFicha.Tag := 0;
  fPosicaoFicha.ShowModal;
end;

procedure TfPosicaoFichaC.BitBtn5Click(Sender: TObject);
begin
  Close;                                              
end;

procedure TfPosicaoFichaC.Inserir_PosicaoFicha;
var
  vNumAux : Integer;
begin
  vNumAux := ProximaSequencia('POSICAO_FICHA',0);

  DMPosicao_Ficha.cdsPosicao_Ficha.Insert;
  DMPosicao_Ficha.cdsPosicao_FichaID.AsInteger := vNumAux;
  DMPosicao_Ficha.cdsPosicao_FichaINFORMARGRADE.AsString    := 'N';
  DMPosicao_Ficha.cdsPosicao_FichaINFORMAROPCAOMAT.AsString := 'N';
  DMPosicao_Ficha.cdsPosicao_FichaSOMENTEMATERIAL.AsString  := 'N';
end;

end.
