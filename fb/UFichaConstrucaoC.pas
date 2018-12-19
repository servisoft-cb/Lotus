unit UFichaConstrucaoC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, ToolEdit, Grids, DBGrids,
  SMDBGrid, DB, CurrEdit, DBCtrls, RxLookup, DBFilter, DBClient, FMTBcd,
  Provider, SqlExpr;

type
  TfFichaConstrucaoC = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label2: TLabel;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    BitBtn5: TBitBtn;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label5: TLabel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    sdsPosicao_Ficha: TSQLDataSet;
    dspPosicao_Ficha: TDataSetProvider;
    cdsPosicao_Ficha: TClientDataSet;
    dsPosicao_Ficha: TDataSource;
    sdsPosicao_FichaID: TIntegerField;
    sdsPosicao_FichaNOMEPOSICAO: TStringField;
    sdsPosicao_FichaORDEM: TIntegerField;
    sdsPosicao_FichaSOMENTEMATERIAL: TStringField;
    sdsPosicao_FichaINFORMARGRADE: TStringField;
    sdsPosicao_FichaINFORMAROPCAOMAT: TStringField;
    cdsPosicao_FichaID: TIntegerField;
    cdsPosicao_FichaNOMEPOSICAO: TStringField;
    cdsPosicao_FichaORDEM: TIntegerField;
    cdsPosicao_FichaSOMENTEMATERIAL: TStringField;
    cdsPosicao_FichaINFORMARGRADE: TStringField;
    cdsPosicao_FichaINFORMAROPCAOMAT: TStringField;
    sdsFichaConstrucao: TSQLDataSet;
    sdsFichaConstrucaoID: TIntegerField;
    sdsFichaConstrucaoNOMECONSTRUCAO: TStringField;
    sdsFichaConstrucaoNOMEFORMA: TStringField;
    sdsFichaConstrucaoOBS: TMemoField;
    sdsFichaConstrucaoDATA: TDateField;
    sdsFichaConstrucaoUSUARIO: TStringField;
    sdsFichaConstrucaoHRUSUARIO: TTimeField;
    sdsFichaConstrucaoDTUSUARIO: TDateField;
    dspFichaConstrucao: TDataSetProvider;
    cdsFichaConstrucao: TClientDataSet;
    cdsFichaConstrucaoID: TIntegerField;
    cdsFichaConstrucaoNOMECONSTRUCAO: TStringField;
    cdsFichaConstrucaoNOMEFORMA: TStringField;
    cdsFichaConstrucaoOBS: TMemoField;
    cdsFichaConstrucaoDATA: TDateField;
    cdsFichaConstrucaoUSUARIO: TStringField;
    cdsFichaConstrucaoHRUSUARIO: TTimeField;
    cdsFichaConstrucaoDTUSUARIO: TDateField;
    dsFichaConstrucao: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure Gravar_FichaConstrucao_Pos;

  public
    { Public declarations }
    procedure Monta_FichaConstrucaoLoc(Tipo : String ; ID : Integer); //P=Com Parametros   N=Sem Parametros
    procedure Monta_FichaConstrucao(ID : Integer); //P=Com Parametros   N=Sem Parametros
    procedure Inserir_FichaConstrucao;

  end;

var
  fFichaConstrucaoC: TfFichaConstrucaoC;

implementation

uses DateUtils, UDM1, UDMFichaConstrucao, UFichaConstrucao,
  UDMPosicao_Ficha, uIntegracao, URelFichaConstrucao;


{$R *.dfm}

procedure TfFichaConstrucaoC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMFichaConstrucao.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMFichaConstrucao);

  if DMPosicao_Ficha.Owner.ClassName = Self.ClassName then
    FreeAndNil(DMPosicao_Ficha);

  Action := Cafree;
end;

procedure TfFichaConstrucaoC.BitBtn3Click(Sender: TObject);
begin
  Monta_FichaConstrucaoLoc('P',0);
end;

procedure TfFichaConstrucaoC.Monta_FichaConstrucaoLoc(Tipo : String ; ID : Integer); //P=Com Parametros   N=Sem Parametros
begin
   cdsFichaConstrucao.Close;

   sdsFichaConstrucao.CommandText := ' SELECT * FROM FICHACONSTRUCAO ';
  if ID > 0 then
  begin
    sdsFichaConstrucao.CommandText := sdsFichaConstrucao.CommandText
                                    + ' WHERE ID = ' + IntToStr(ID);
  end
  else
  if Tipo = 'P' then
  begin
    sdsFichaConstrucao.CommandText := sdsFichaConstrucao.CommandText
                                    + ' WHERE 0=0 ';
    if DateEdit1.Date > 0 then
      sdsFichaConstrucao.CommandText := sdsFichaConstrucao.CommandText
                                      + ' AND DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
    if DateEdit2.Date > 0 then
      sdsFichaConstrucao.CommandText := sdsFichaConstrucao.CommandText
                                      + ' AND DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
    if Trim(Edit1.Text) <> '' then
      sdsFichaConstrucao.CommandText := sdsFichaConstrucao.CommandText
                                      + ' AND NOMECONSTRUCAO = ' + QuotedStr('%'+Edit1.Text+'%');
    if Trim(Edit2.Text) <> '' then
      sdsFichaConstrucao.CommandText := sdsFichaConstrucao.CommandText
                                      + ' AND NOMEFORMA LIKE ' + QuotedStr('%'+Edit2.Text+'%');

    sdsFichaConstrucao.CommandText := sdsFichaConstrucao.CommandText
                                    + ' ORDER BY DATA, ID ';
  end
  else
    sdsFichaConstrucao.CommandText := ctFichaConstrucao
                                    + ' WHERE ID = 0';

  cdsFichaConstrucao.Open;
end;

procedure TfFichaConstrucaoC.Monta_FichaConstrucao(ID : Integer); 
begin
  DMFichaConstrucao.cdsFichaConstrucao.Close;

  DMFichaConstrucao.sdsFichaConstrucao.CommandText := ctFichaConstrucao
                                                    + ' WHERE ID = ' + IntToStr(ID);

  DMFichaConstrucao.cdsFichaConstrucao.Open;
end;

procedure TfFichaConstrucaoC.BitBtn2Click(Sender: TObject);
begin
  if cdsFichaConstrucao.IsEmpty then
    exit;

  Monta_FichaConstrucao(cdsFichaConstrucaoID.AsInteger);

  if DMFichaConstrucao.cdsFichaConstrucao.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  DMFichaConstrucao.cdsFichaConstrucao.Delete;
  DMFichaConstrucao.cdsFichaConstrucao.ApplyUpdates(0);
end;

procedure TfFichaConstrucaoC.BitBtn1Click(Sender: TObject);
begin
  Monta_FichaConstrucao(0);

  Inserir_FichaConstrucao;

  Gravar_FichaConstrucao_Pos;

  fFichaConstrucao := TfFichaConstrucao.Create(Self);
  fFichaConstrucao.Tag := 0;
  fFichaConstrucao.ShowModal;
end;

procedure TfFichaConstrucaoC.FormShow(Sender: TObject);
var
  vData : TDateTime;
begin
  if not Assigned(DMFichaConstrucao) then
    DMFichaConstrucao := TDMFichaConstrucao.Create(Self);

  if not Assigned(DMPosicao_Ficha) then
    DMPosicao_Ficha := TDMPosicao_Ficha.Create(Self);

  vData          := EncodeDate(YearOf(Date),MonthOf(Date),01);
  DateEdit1.Date := vData;
  DateEdit2.Date := Date;

  BitBtn1.Enabled := DM1.tUsuarioInsFichaConstrucao.AsBoolean;
  BitBtn2.Enabled := DM1.tUsuarioExcFichaConstrucao.AsBoolean;
end;

procedure TfFichaConstrucaoC.SMDBGrid1DblClick(Sender: TObject);
begin
  if cdsFichaConstrucao.IsEmpty then
    exit;

  Monta_FichaConstrucao(cdsFichaConstrucaoID.AsInteger);

  if DMFichaConstrucao.cdsFichaConstrucao.IsEmpty then
    exit;
  if not DM1.tUsuarioAltFichaConstrucao.AsBoolean then
  begin                           
    ShowMessage('Usuário ' + DM1.tUsuarioUsuario.AsString + ' não autorizado a fazer a alteração!');
    exit;
  end;
    
  DMFichaConstrucao.cdsFichaConstrucao.Edit;
  fFichaConstrucao := TfFichaConstrucao.Create(Self);
  fFichaConstrucao.Tag := 1;
  fFichaConstrucao.ShowModal;
end;

procedure TfFichaConstrucaoC.BitBtn5Click(Sender: TObject);
begin
  Close;                                              
end;

procedure TfFichaConstrucaoC.Inserir_FichaConstrucao;
var
  vNumAux : Integer;
begin
  vNumAux := ProximaSequencia('FICHACONSTRUCAO',0);

  DMFichaConstrucao.cdsFichaConstrucao.Insert;
  DMFichaConstrucao.cdsFichaConstrucaoID.AsInteger          := vNumAux;
  DMFichaConstrucao.cdsFichaConstrucaoDATA.AsDateTime       := Date;
  DMFichaConstrucao.cdsFichaConstrucaoUSUARIO.AsString      := DM1.tUsuarioUsuario.AsString;
  DMFichaConstrucao.cdsFichaConstrucaoDTUSUARIO.AsDateTime  := Date;
  DMFichaConstrucao.cdsFichaConstrucaoHRUSUARIO.AsDateTime  := Now;
  DMFichaConstrucao.cdsFichaConstrucaoUSUARIO.AsString      := DM1.tUsuarioUsuario.AsString;
end;

procedure TfFichaConstrucaoC.BitBtn4Click(Sender: TObject);
begin
  if cdsFichaConstrucao.IsEmpty then
    exit;

  Monta_FichaConstrucao(cdsFichaConstrucaoID.AsInteger);

  fRelFichaConstrucao := TfRelFichaConstrucao.Create(Self);
  fRelFichaConstrucao.RLReport1.Preview;
  fRelFichaConstrucao.RLReport1.Free;
end;

procedure TfFichaConstrucaoC.Gravar_FichaConstrucao_Pos;
var
  vItemAux : Integer;
begin
  vItemAux := 0;
  cdsPosicao_Ficha.Close;
  cdsPosicao_Ficha.Open;

  cdsPosicao_Ficha.First;
  while not cdsPosicao_Ficha.Eof do
  begin
    vItemAux := vItemAux + 1;
    DMFichaConstrucao.cdsFichaConstrucao_Pos.Insert;
    DMFichaConstrucao.cdsFichaConstrucao_PosID.AsInteger              := DMFichaConstrucao.cdsFichaConstrucaoID.AsInteger;
    DMFichaConstrucao.cdsFichaConstrucao_PosITEM.AsInteger            := vItemAux;
    DMFichaConstrucao.cdsFichaConstrucao_PosNOMEPOSICAO.AsString      := cdsPosicao_FichaNomePosicao.AsString;
    DMFichaConstrucao.cdsFichaConstrucao_PosSOMENTEMATERIAL.AsString  := cdsPosicao_FichaSOMENTEMATERIAL.AsString;
    DMFichaConstrucao.cdsFichaConstrucao_PosINFORMARGRADE.AsString    := cdsPosicao_FichaINFORMARGRADE.AsString;
    DMFichaConstrucao.cdsFichaConstrucao_PosINFORMAROPCAOMAT.AsString := cdsPosicao_FichaINFORMAROPCAOMAT.AsString;
    DMFichaConstrucao.cdsFichaConstrucao_Pos.Post;
    cdsPosicao_Ficha.Next;
  end;
end;

end.
