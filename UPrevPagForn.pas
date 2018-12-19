unit UPrevPagForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, RXCtrls, ExtCtrls, StdCtrls, Mask, ToolEdit, Menus, Printers,
  Db, DBTables, MemTable;

type
  TfPrevPagForn = class(TForm)
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    DateEdit2: TDateEdit;
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    qPagar: TQuery;
    dsPagar: TDataSource;
    qPagarCodForn: TIntegerField;
    qPagarNomeForn: TStringField;
    qPagarVlrParcCPagar: TFloatField;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    qPagarFornecedorOutros: TStringField;
    Query1: TQuery;
    Query1NomeForn: TStringField;
    Query1DtUltPgto: TDateField;
    Query1VlrUltPgto: TFloatField;
    tMemo1: TMemoryTable;
    tMemo1Nome: TStringField;
    tMemo1Valor: TFloatField;
    dsMemo1: TDataSource;
    qPagarDesconto: TFloatField;
    qPagarAbatimentos: TFloatField;
    tMemo1CodForn: TIntegerField;
    Query1CodForn: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Enter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure Executa_SQL1;
    procedure Executa_SQL2;
    procedure Gera_Memo;
    procedure Limpa_Memo;
  public
    { Public declarations }
  end;

var
  fPrevPagForn: TfPrevPagForn;

implementation

uses UDM1, URelPagForn;

{$R *.DFM}

procedure TfPrevPagForn.Limpa_Memo;
begin
  tMemo1.EmptyTable;
end;

procedure TfPrevPagForn.Executa_SQL1;
begin
  qPagar.Active := False;
  qPagar.SQL.Clear;
  qPagar.SQL.Add('SELECT DISTINCT DbcPagarparc.CodForn, SUM( DbcPagarparc.VlrParcCPagar ) VlrParcCPagar, SUM( DbcPagarparc.Desconto ) Desconto, SUM( DbcPagarparc.Abatimentos) Abatimentos, Dbfornecedores.NomeForn, Dbfornecedores.FornecedorOutros');
  qPagar.SQL.Add('FROM "dbCPagarParc.DB" DbcPagarparc');
  qPagar.SQL.Add(' INNER JOIN "DBFORNECEDORES.DB" DbFornecedores');
  qPagar.SQL.Add(' ON  (DbcPagarparc.CodForn = DbFornecedores.CodForn)');
  if RadioGroup2.ItemIndex = 0 then
    begin
      qPagar.SQL.Add(' INNER JOIN "dbCPagar.DB" Dbcpagar');
      qPagar.SQL.Add(' ON  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar)');
    end;
  if RadioGroup2.ItemIndex = 1 then
    begin
      Case RadioGroup1.ItemIndex of
        0 : begin
              if DateEdit2.Text = '  /  /    ' then
                begin
                  qPagar.SQL.Add('WHERE  DtVencCPagar >= :DtInicial');
                  qPagar.Params[0].AsDate := DateEdit1.Date;
                end
              else
                begin
                  qPagar.SQL.Add('WHERE  DtVencCPagar BETWEEN :DtInicial AND :DtFinal');
                  qPagar.Params[0].AsDate := DateEdit1.Date;
                  qPagar.Params[1].AsDate := DateEdit2.Date;
                end;
            end;
        1: begin
              qPagar.SQL.Add('WHERE  DtVencCPagar <= :DtInicial');
              qPagar.Params[0].AsDate := DateEdit1.Date;
            end;
      end
    end
  else
    begin
      if RadioGroup1.ItemIndex = 0 then
        begin
          if DateEdit2.Text = '  /  /    ' then
            begin
              qPagar.SQL.Add('WHERE  dbcPagar.DtGerado <= :DtInicial AND dbCPagarParc.DtVencCPagar >= :DtVectoIni');
              qPagar.Params[0].AsDate := DateEdit1.Date;
              qPagar.Params[1].AsDate := DateEdit1.Date;
            end
          else
            begin
              qPagar.SQL.Add('WHERE  dbcPagar.DtGerado <= :DtInicial AND dbcPagarParc.DtVencCPagar BETWEEN :DtVectoIni AND :DtVectoFin');
              qPagar.Params[0].AsDate := DateEdit1.Date;
              qPagar.Params[1].AsDate := DateEdit1.Date;
              qPagar.Params[2].AsDate := DateEdit2.Date;
            end;
        end
      else
        begin
          if DateEdit2.Text = '  /  /    ' then
            begin
              qPagar.SQL.Add('WHERE  dbcPagar.DtGerado <= :DtInicial AND dbcPagarParc.DtVencCPagar <= :DtVectoIni');
              qPagar.Params[0].AsDate := DateEdit1.Date;
              qPagar.Params[1].AsDate := DateEdit1.Date;
            end
          else
            begin
              qPagar.SQL.Add('WHERE  dbcPagar.DtGerado <= :DtInicial AND dbcPagarParc.DtVencCPagar BETWEEN :DtVectoIni AND :DtVectoFin');
              qPagar.Params[0].AsDate := DateEdit1.Date;
              qPagar.Params[1].AsDate := DateEdit1.Date;
              qPagar.Params[2].AsDate := DateEdit2.Date;
            end;
        end;
    end;
  qPagar.SQL.Add('GROUP BY DbcPagarparc.CodForn, Dbfornecedores.NomeForn, Dbfornecedores.FornecedorOutros');
  qPagar.SQL.Add('ORDER BY Dbfornecedores.NomeForn');
  qPagar.Active := True;
end;

procedure TfPrevPagForn.Executa_SQL2;
begin
  Query1.Active := False;
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT Dbfornecedores.CodForn, Dbfornecedores.NomeForn, Dbcpagarparchist.DtUltPgto, Dbcpagarparchist.VlrUltPgto');
  Query1.SQL.Add('FROM "dbFornecedores.DB" Dbfornecedores');
  Query1.SQL.Add('  INNER JOIN "dbCPagar.DB" Dbcpagar');
  Query1.SQL.Add('  ON  (Dbcpagar.CodForn = Dbfornecedores.CodForn)');
  Query1.SQL.Add('  INNER JOIN "dbCPagarParc.DB" Dbcpagarparc');
  Query1.SQL.Add('  ON  (Dbcpagar.NumCPagar = Dbcpagarparc.NumCPagar)');
  Query1.SQL.Add('  INNER JOIN "dbCPagarParcHist.DB" Dbcpagarparchist');
  Query1.SQL.Add('   ON  (Dbcpagarparc.NumCPagar = Dbcpagarparchist.NumCPagar)');
  Query1.SQL.Add('   AND  (Dbcpagarparc.ParcCPagar = Dbcpagarparchist.ParcCPagar)');
  if RadioGroup2.ItemIndex = 1 then
    begin
      Case RadioGroup1.ItemIndex of
        0 : begin
              if DateEdit2.Text = '  /  /    ' then
                begin
                  Query1.SQL.Add('WHERE  Dbcpagarparchist.DtUltPgto <= :DtInicial AND Dbcpagarparc.DtVencCPagar >= :DtInicial2');
                  Query1.Params[0].AsDate := DateEdit1.Date;
                  Query1.Params[1].AsDate := DateEdit1.Date;
                end
              else
                begin
                  Query1.SQL.Add('WHERE  Dbcpagarparchist.DtUltPgto <= :DtInicial AND Dbcpagarparc.DtVencCPagar BETWEEN :DtInicial2 AND :DtFinal');
                  Query1.Params[0].AsDate := DateEdit1.Date;
                  Query1.Params[1].AsDate := DateEdit1.Date;
                  Query1.Params[2].AsDate := DateEdit2.Date;
                end;
            end;
        1: begin
              Query1.SQL.Add('WHERE  Dbcpagarparchist.DtUltPgto <= :DtInicial AND Dbcpagarparc.DtVencCPagar <= :DtInicial2');
              Query1.Params[0].AsDate := DateEdit1.Date;
              Query1.Params[1].AsDate := DateEdit1.Date;
            end;
      end;
    end
  else
    begin
      if RadioGroup1.ItemIndex = 0 then
        begin
          if DateEdit2.Text = '  /  /    ' then
            begin
              Query1.SQL.Add('WHERE Dbcpagarparchist.DtUltPgto <= :DtInicial AND dbcpagar.DtGerado <= :DtInicial2 AND dbcpagarparc.DtVencCPagar >= :DtVectoIni');
              Query1.Params[0].AsDate := DateEdit1.Date;
              Query1.Params[1].AsDate := DateEdit1.Date;
              Query1.Params[2].AsDate := DateEdit1.Date;
            end
          else
            begin
              Query1.SQL.Add('WHERE  Dbcpagarparchist.DtUltPgto <= :DtInicial AND dbcpagar.DtGerado <= :DtInicial2 AND dbcpagarparc.DtVencCPagar BETWEEN :DtVectoIni AND :DtVectoFin');
              Query1.Params[0].AsDate := DateEdit1.Date;
              Query1.Params[1].AsDate := DateEdit1.Date;
              Query1.Params[2].AsDate := DateEdit1.Date;
              Query1.Params[3].AsDate := DateEdit2.Date;
            end;
        end
      else
        begin
          if DateEdit2.Text = '  /  /    ' then
            begin
              Query1.SQL.Add('WHERE Dbcpagarparchist.DtUltPgto <= :DtInicial AND dbcpagar.DtGerado <= :DtInicial2 AND dbcpagarparc.DtVencCPagar <= :DtVectoIni');
              Query1.Params[0].AsDate := DateEdit1.Date;
              Query1.Params[1].AsDate := DateEdit1.Date;
              Query1.Params[2].AsDate := DateEdit1.Date;
            end
          else
            begin
              Query1.SQL.Add('WHERE  Dbcpagarparchist.DtUltPgto <= :DtInicial AND dbcpagar.DtGerado <= :DtInicial2 AND dbcpagarparc.DtVencCPagar BETWEEN :DtVectoIni AND :DtVectoFin');
              Query1.Params[0].AsDate := DateEdit1.Date;
              Query1.Params[1].AsDate := DateEdit1.Date;
              Query1.Params[2].AsDate := DateEdit1.Date;
              Query1.Params[3].AsDate := DateEdit2.Date;
            end;
        end;
    end;
  Query1.Active := True;
end;

procedure TfPrevPagForn.Gera_Memo;
begin
  qPagar.First;
  while not qPagar.Eof do
    begin
      tMemo1.Insert;
      tMemo1CodForn.AsInteger := qPagarCodForn.AsInteger;
      tMemo1Nome.AsString     := qPagarNomeForn.AsString;
      tMemo1Valor.AsFloat     := qPagarVlrParcCPagar.AsFloat - qPagarDesconto.AsFloat - qPagarAbatimentos.AsFloat;
      tMemo1.Post;
      qPagar.Next;
    end;
  tMemo1.First;
  while not tMemo1.Eof do
    begin
      Query1.Filtered := False;
      Query1.Filter   := 'CodForn = '''+tMemo1CodForn.AsString+'''';
      Query1.Filtered := True;
      Query1.First;
      while not Query1.Eof do
        begin
          tMemo1.Edit;
          tMemo1Valor.AsFloat := tMemo1Valor.AsFloat - Query1VlrUltPgto.AsFloat;
          tMemo1.Post;
          Query1.Next;
        end;
      Query1.Filtered := False;
      tMemo1.Next;
    end;
end;

procedure TfPrevPagForn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Query1.Close;
  qPagar.Close;
  if Screen.FormCount < 3 then
    DM1.tFornecedores.Close;
  Action := Cafree;
end;

procedure TfPrevPagForn.RadioGroup1Enter(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : DateEdit2.Enabled := True;
    1 : begin
          DateEdit2.Clear;
          DateEdit2.Enabled := False;
        end;
  end;
end;

procedure TfPrevPagForn.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevPagForn.SpeedButton1Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  RadioGroup1.ItemIndex := 0;
  RadioGroup1.SetFocus;
end;

procedure TfPrevPagForn.Imprimir1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : begin
          if DateEdit1.Date > 1 then
            begin
              Executa_SQL1;
              case RadioGroup3.ItemIndex of
                0 : begin
                      qPagar.Filtered := False;
                      qPagar.Filter   := 'FornecedorOutros = ''F''';
                      qPagar.Filtered := True;
                    end;
                1 : begin
                      qPagar.Filtered := False;
                      qPagar.Filter   := 'FornecedorOutros = ''O''';
                      qPagar.Filtered := True;
                    end;
               end;
              Executa_SQL2;
              Gera_Memo;
              fRelPagForn := TfRelPagForn.Create(Self);
              fRelPagForn.QuickRep1.Print;
              fRelPagForn.QuickRep1.Free;
              Limpa_Memo;
              qPagar.Filtered := False;
            end
        end;
    1 : begin
          if DateEdit1.Date > 1 then
            begin
              Executa_SQL1;
              case RadioGroup3.ItemIndex of
                0 : begin
                      qPagar.Filtered := False;
                      qPagar.Filter   := 'FornecedorOutros = ''F''';
                      qPagar.Filtered := True;
                    end;
                1 : begin
                      qPagar.Filtered := False;
                      qPagar.Filter   := 'FornecedorOutros = ''O''';
                      qPagar.Filtered := True;
                    end;
               end;
              Executa_SQL2;
              Gera_Memo;
              fRelPagForn := TfRelPagForn.Create(Self);
              fRelPagForn.QuickRep1.Print;
              fRelPagForn.QuickRep1.Free;
              Limpa_Memo;
              qPagar.Filtered := False;
            end
          else
            begin
              ShowMessage('Deve haver uma data, p/ executar a consulta!');
              DateEdit1.SetFocus;
            end;
        end;
  end;
end;

procedure TfPrevPagForn.Visualizar1Click(Sender: TObject);
begin
  Case RadioGroup1.ItemIndex of
    0 : begin
          if DateEdit1.Date > 1 then
            begin
              Executa_SQL1;
              case RadioGroup3.ItemIndex of
                0 : begin
                      qPagar.Filtered := False;
                      qPagar.Filter   := 'FornecedorOutros = ''F''';
                      qPagar.Filtered := True;
                    end;
                1 : begin
                      qPagar.Filtered := False;
                      qPagar.Filter   := 'FornecedorOutros = ''O''';
                      qPagar.Filtered := True;
                    end;
               end;
              Executa_SQL2;
              Gera_Memo;
              fRelPagForn := TfRelPagForn.Create(Self);
              fRelPagForn.QuickRep1.Preview;
              fRelPagForn.QuickRep1.Free;
              Limpa_Memo;
              qPagar.Filtered := False;
            end;
        end;
    1 : begin
          if DateEdit1.Date > 1 then
            begin
              Executa_SQL1;
              case RadioGroup3.ItemIndex of
                0 : begin
                      qPagar.Filtered := False;
                      qPagar.Filter   := 'FornecedorOutros = ''F''';
                      qPagar.Filtered := True;
                    end;
                1 : begin
                      qPagar.Filtered := False;
                      qPagar.Filter   := 'FornecedorOutros = ''O''';
                      qPagar.Filtered := True;
                    end;
               end;
              Executa_SQL2;
              Gera_Memo;
              fRelPagForn := TfRelPagForn.Create(Self);
              fRelPagForn.QuickRep1.Preview;
              fRelPagForn.QuickRep1.Free;
              Limpa_Memo;
              qPagar.Filtered := False;
            end
          else
            begin
              ShowMessage('Deve haver uma data, p/ executar a consulta!');
              DateEdit1.SetFocus;
            end;
        end;
  end;
end;

procedure TfPrevPagForn.FormShow(Sender: TObject);
begin
  DM1.tFornecedores.Open;
  Limpa_Memo;
  DateEdit1.Date := Date();
  RadioGroup2.ItemIndex := 0;
end;

end.
