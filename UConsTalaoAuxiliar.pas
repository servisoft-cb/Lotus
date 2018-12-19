unit UConsTalaoAuxiliar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, SMDBGrid, StdCtrls, Mask, ToolEdit,
  ExtCtrls, DBVGrids, Buttons;

type
  TfConsTalaoAuxiliar = class(TForm)
    qConsTalaoAux: TQuery;
    dsConsTalaoAux: TDataSource;
    SMDBGrid1: TSMDBGrid;
    VDBGrid1: TVDBGrid;
    tTalaoAuxiliarGrade: TTable;
    dsTalaoAuxiliarGrade: TDataSource;
    tTalaoAuxiliarGradeLote: TIntegerField;
    tTalaoAuxiliarGradeCodSetor: TIntegerField;
    tTalaoAuxiliarGradeCodGrade: TIntegerField;
    tTalaoAuxiliarGradePosicao: TIntegerField;
    tTalaoAuxiliarGradeQtd: TIntegerField;
    tTalaoAuxiliarGradeTamanho: TStringField;
    qConsTalaoAuxLote: TIntegerField;
    qConsTalaoAuxTalao: TIntegerField;
    qConsTalaoAuxCodSetor: TIntegerField;
    qConsTalaoAuxCodGrade: TIntegerField;
    qConsTalaoAuxSetor: TStringField;
    qConsTalaoAuxReferencia: TStringField;
    qConsTalaoAuxQtdPares: TIntegerField;
    qConsTalaoAuxCor: TStringField;
    qConsTalaoAuxPedido: TIntegerField;
    qConsTalaoAuxItemPedido: TIntegerField;
    qConsTalaoAuxDtEntrada: TDateField;
    qConsTalaoAuxHrEntrada: TTimeField;
    qConsTalaoAuxDtSaida: TDateField;
    qConsTalaoAuxHrSaida: TTimeField;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    Shape1: TShape;
    Shape2: TShape;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsTalaoAuxiliar: TfConsTalaoAuxiliar;

implementation

{$R *.dfm}

procedure TfConsTalaoAuxiliar.FormShow(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height - 35;
end;

procedure TfConsTalaoAuxiliar.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsTalaoAuxiliar.BitBtn1Click(Sender: TObject);
begin
  qConsTalaoAux.Close;
  qConsTalaoAux.Sql.Text := 'select dbTalaoAuxiliar.Lote, dbTalaoAuxiliar.Talao, dbTalaoAuxiliar.CodSetor, dbTalaoAuxiliar.CodGrade, dbSetor.Nome as Setor, dbProduto.Referencia, '
                            +'dbTalaoAuxiliar.QtdPares, dbCor.Nome as Cor, dbTalaoAuxiliar.Pedido,  dbTalaoAuxiliar.ItemPedido, '
                            +'dbTalaoAuxiliar.DtEntrada, dbTalaoAuxiliar.HrEntrada, dbTalaoAuxiliar.DtSaida, dbTalaoAuxiliar.HrSaida '
                            +'from "dbTalaoAuxiliar.db" dbTalaoAuxiliar '
                            +'left join "dbSetor.db" dbSetor on (dbSetor.Codigo = dbTalaoAuxiliar.CodSetor) '
                            +'left join "dbProduto.db" dbProduto on (dbProduto.Codigo = dbTalaoAuxiliar.CodProduto) '
                            +'left join "dbCor.db" dbCor on (dbCor.Codigo = dbTalaoAuxiliar.CodCor) '
                            +'WHERE 0 = 0 ';
  if (DateEdit1.Text <> '  /  /    ') and (DateEdit2.Text <> '  /  /    ') then
    qConsTalaoAux.Sql.Add(' and DtEntrada between ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.Date)) + ' and '  + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.Date)));
  if (DateEdit3.Text <> '  /  /    ') and (DateEdit4.Text <> '  /  /    ') then
    qConsTalaoAux.Sql.Add(' and DtSaida between ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.Date)) + ' and '  + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.Date)));
  if RadioGroup1.ItemIndex = 0 then
    qConsTalaoAux.Sql.Add(' and DtSaida is null')
  else  
  if RadioGroup1.ItemIndex = 1 then
    qConsTalaoAux.Sql.Add(' and DtSaida is not null');
  qConsTalaoAux.Open;
  tTalaoAuxiliarGrade.Open;
end;

procedure TfConsTalaoAuxiliar.BitBtn2Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  DateEdit3.Clear;
  DateEdit4.Clear;
  RadioGroup1.ItemIndex := 2;
end;

procedure TfConsTalaoAuxiliar.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qConsTalaoAuxDtSaida.AsDateTime > 10 then
    Background := clTeal
  else
  if qConsTalaoAuxDtEntrada.AsDateTime > 10 then
    Background := clYellow;
end;

end.
