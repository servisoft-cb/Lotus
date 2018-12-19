unit UPrevTransfICMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, ToolEdit, Buttons, RXCtrls, Menus, Db, DBTables;

type
  TfPrevTransfICMS = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    qParcelas: TQuery;
    qParcelasCodForn: TIntegerField;
    qParcelasDtVencCPagar: TDateField;
    qParcelasVlrParcCPagar: TFloatField;
    qParcelasNumNotaEnt: TIntegerField;
    qParcelasParcCPagar: TIntegerField;
    qParcelasNroDuplicata: TIntegerField;
    qParcelaslkFornecedor: TStringField;
    qFornecedores: TQuery;
    ImprimirporFornecedor1: TMenuItem;
    VisualizarpFornecedor1: TMenuItem;
    qItensFornec: TQuery;
    qsFornecedores: TDataSource;
    qsItensFornec: TDataSource;
    qItensFornecCodForn: TIntegerField;
    qItensFornecDtVencCPagar: TDateField;
    qItensFornecVlrParcCPagar: TFloatField;
    qItensFornecNumNotaEnt: TIntegerField;
    qItensFornecParcCPagar: TIntegerField;
    qItensFornecNroDuplicata: TIntegerField;
    qFornecedoresCodForn: TIntegerField;
    qFornecedoresNomeForn: TStringField;
    qParcelasVlrTotal: TFloatField;
    qParcelasDtGerado: TDateField;
    qItensFornecCodNatOper: TIntegerField;
    qParcelasCodNatOper: TIntegerField;
    qItensFornecDtGerado: TDateField;
    qItensFornecVlrTotal: TFloatField;
    qParcelasDtEmissaoNota: TDateField;
    qItensFornecDtEmissaoNota: TDateField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure ImprimirporFornecedor1Click(Sender: TObject);
    procedure VisualizarpFornecedor1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Gera_Dados;
    procedure Gera_Dados2;
  public
    { Public declarations }
  end;

var
  fPrevTransfICMS: TfPrevTransfICMS;

implementation

uses UDM1, URelTransfICMS;

{$R *.DFM}

procedure TfPrevTransfICMS.Gera_Dados;
begin
  qParcelas.Close;
  qParcelas.SQL.Clear;
  qParcelas.SQL.Add('SELECT Dbcpagar.CodForn, Dbcpagarparc.DtVencCPagar, Dbcpagarparc.VlrParcCPagar, Dbcpagarparc.NumNotaEnt, ');
  qParcelas.SQL.Add(' Dbcpagarparc.ParcCPagar, Dbcpagarparc.NroDuplicata, dbCPagar.VlrTotal, dbCPagar.DtGerado, dbCPagar.CodNatOper, dbCPagar.DtEmissaoNota ');
  qParcelas.SQL.Add('FROM "dbCPagar.DB" Dbcpagar');
  qParcelas.SQL.Add('   INNER JOIN "dbCPagarParc.DB" Dbcpagarparc');
  qParcelas.SQL.Add('   ON  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar)');
  //No dia 21/05/2012 foi alterado da data de entrada para a data de emissão conforme a Joice
  //qParcelas.SQL.Add('WHERE Dbcpagar.DtGerado BETWEEN :D1 AND :D2');
  qParcelas.SQL.Add('WHERE Dbcpagar.DtEmissaoNota BETWEEN :D1 AND :D2');
  qParcelas.SQL.Add(' AND Dbcpagarparc.CodConta = 10 ');
  Case RadioGroup1.ItemIndex of
    1 : qParcelas.SQL.Add('AND ((Dbcpagarparc.QuitParcCPagar = False) OR (Dbcpagarparc.QuitParcCPagar IS NULL))');
    2 : qParcelas.SQL.Add('AND Dbcpagarparc.QuitParcCPagar = True');
  end;
  qParcelas.Params[0].AsDateTime := DateEdit1.Date;
  qParcelas.Params[1].AsDateTime := DateEdit2.Date;
  qParcelas.SQL.Add('ORDER BY Dbcpagarparc.DtVencCPagar, Dbcpagarparc.NumNotaEnt, Dbcpagarparc.ParcCPagar');
  qParcelas.Open;
  qParcelas.First;
end;

procedure TfPrevTransfICMS.Gera_Dados2;
begin
  qFornecedores.Close;
  qFornecedores.SQL.Clear;
  qFornecedores.SQL.Add('SELECT DISTINCT Dbcpagar.CodForn, Dbfornecedores.NomeForn');
  qFornecedores.SQL.Add('FROM "dbCPagar.DB" Dbcpagar');
  qFornecedores.SQL.Add('   INNER JOIN "dbCPagarParc.DB" Dbcpagarparc');
  qFornecedores.SQL.Add('   ON  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar)');
  qFornecedores.SQL.Add('   INNER JOIN "dbFornecedores.DB" Dbfornecedores');
  qFornecedores.SQL.Add('   ON  (Dbcpagar.CodForn = Dbfornecedores.CodForn)');
  //No dia 21/05/2012 foi alterado da data de entrada para a data de emissão conforme a Joice
  //qFornecedores.SQL.Add('WHERE Dbcpagar.DtGerado BETWEEN :D1 AND :D2 AND Dbcpagarparc.CodConta = 10');
  qFornecedores.SQL.Add('WHERE Dbcpagar.DtEmissaoNota BETWEEN :D1 AND :D2 AND Dbcpagarparc.CodConta = 10');
  Case RadioGroup1.ItemIndex of
    1 : qFornecedores.SQL.Add('AND ((Dbcpagarparc.QuitParcCPagar = False) OR (Dbcpagarparc.QuitParcCPagar IS NULL))');
    2 : qFornecedores.SQL.Add('AND Dbcpagarparc.QuitParcCPagar = True');
  end;
  qFornecedores.Params[0].AsDateTime := DateEdit1.Date;
  qFornecedores.Params[1].AsDateTime := DateEdit2.Date;
  qFornecedores.SQL.Add('GROUP BY Dbcpagar.CodForn, Dbfornecedores.NomeForn');
  qFornecedores.SQL.Add('ORDER BY Dbfornecedores.NomeForn');
  qFornecedores.Open;
  qFornecedores.First;
end;

procedure TfPrevTransfICMS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      DM1.tFornecedores.Close;
      DM1.tContas.Close;
      DM1.tNatOperacao.Close;
    end;
  Action := Cafree;
end;

procedure TfPrevTransfICMS.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevTransfICMS.BitBtn1Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  RadioGroup1.ItemIndex := 0;
  DateEdit1.SetFocus;
end;

procedure TfPrevTransfICMS.Imprimir1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 1) and (DateEdit2.Date > 1) then
    begin
      Screen.Cursor  := crHourGlass;
      Gera_Dados;
      Screen.Cursor  := crDefault;
      fRelTransfICMS := TfRelTransfICMS.Create(Self);
      fRelTransfICMS.QuickRep1.Print;
      fRelTransfICMS.QuickRep1.Free;
    end
  else
    begin
      ShowMessage('Você deve informar datas "inicial" e "final" p/ gerar o relatório!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevTransfICMS.Visualizar1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 1) and (DateEdit2.Date > 1) then
  begin
    Screen.Cursor  := crHourGlass;
    Gera_Dados;
    Screen.Cursor  := crDefault;
    fRelTransfICMS := TfRelTransfICMS.Create(Self);
    fRelTransfICMS.QuickRep1.Preview;
    fRelTransfICMS.QuickRep1.Free;
  end
  else
  begin
    ShowMessage('Você deve informar datas "inicial" e "final" p/ gerar o relatório!');
    DateEdit1.SetFocus;
  end;
end;

procedure TfPrevTransfICMS.ImprimirporFornecedor1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 1) and (DateEdit2.Date > 1) then
    begin
      Screen.Cursor  := crHourGlass;
      Gera_Dados2;
      Screen.Cursor  := crDefault;
      fRelTransfICMS := TfRelTransfICMS.Create(Self);
      fRelTransfICMS.QuickRep2.Print;
      fRelTransfICMS.QuickRep2.Free;
    end
  else
    begin
      ShowMessage('Você deve informar datas "inicial" e "final" p/ gerar o relatório!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevTransfICMS.VisualizarpFornecedor1Click(Sender: TObject);
begin
  if (DateEdit1.Date > 1) and (DateEdit2.Date > 1) then
    begin
      Screen.Cursor  := crHourGlass;
      Gera_Dados2;
      Screen.Cursor  := crDefault;
      fRelTransfICMS := TfRelTransfICMS.Create(Self);
      fRelTransfICMS.QuickRep2.Preview;
      fRelTransfICMS.QuickRep2.Free;
    end
  else
    begin
      ShowMessage('Você deve informar datas "inicial" e "final" p/ gerar o relatório!');
      DateEdit1.SetFocus;
    end;
end;

procedure TfPrevTransfICMS.FormShow(Sender: TObject);
begin
  DM1.tFornecedores.Open;
  DM1.tContas.Open;
  DM1.tNatOperacao.Open;
end;

end.
