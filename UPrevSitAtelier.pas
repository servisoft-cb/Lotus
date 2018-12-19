unit UPrevSitAtelier;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RxLookup, Db, DBTables, Buttons, RXCtrls, Menus,
  Mask, ToolEdit;

type
  TfPrevSitAtelier = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    qSituacao: TQuery;
    qSituacaoLote: TIntegerField;
    qSituacaoTalao: TIntegerField;
    qSituacaoDataEnt: TDateField;
    qSituacaoHoraEnt: TTimeField;
    qSituacaoReferencia: TStringField;
    qSituacaoCodAtelier: TIntegerField;
    qSituacaoQtdPar: TIntegerField;
    qSituacaoDataSaida: TDateField;
    qSituacaoHoraSaida: TTimeField;
    Panel2: TPanel;
    RxSpeedButton2: TRxSpeedButton;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    qSituacaoTamanho: TStringField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    qReferencia: TQuery;
    qReferenciaReferencia: TStringField;
    qReferenciaCodigo: TIntegerField;
    qReferenciaVlrAtelier: TFloatField;
    CheckBox2: TCheckBox;
    qPagtos: TQuery;
    qPagtosCodAtelier: TIntegerField;
    qPagtosVlrPagto: TFloatField;
    qPagtosPgto: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure Visualizar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Gera_SQL;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrevSitAtelier: TfPrevSitAtelier;

implementation

uses UDM1, URelSitAtelier;

{$R *.DFM}

procedure TfPrevSitAtelier.Gera_SQL;
begin
  qSituacao.Active := False;
  qSituacao.SQL.Clear;
  qSituacao.SQL.Add('SELECT Dbtalaomov.Lote, Dbtalaomov.Talao, Dbtalaomov.DataEnt, Dbtalaomov.HoraEnt, Dbproduto.Referencia, Dbtalaomov.CodAtelier, Dbtalaograde.QtdPar, Dbtalaomov.DataSaida,');
  qSituacao.SQL.Add(' Dbtalaomov.HoraSaida, Dbgradeitem.Tamanho');
  qSituacao.SQL.Add('FROM "dbTalaoMov.db" Dbtalaomov');
  qSituacao.SQL.Add(' INNER JOIN "dbTalaoGrade.DB" Dbtalaograde');
  qSituacao.SQL.Add(' ON  (Dbtalaograde.Lote = Dbtalaomov.Lote)');
  qSituacao.SQL.Add(' AND  (Dbtalaograde.Talao = Dbtalaomov.Talao)');
  qSituacao.SQL.Add(' INNER JOIN "dbTalao.DB" Dbtalao');
  qSituacao.SQL.Add(' ON  (Dbtalao.Lote = Dbtalaograde.Lote)');
  qSituacao.SQL.Add(' AND  (Dbtalao.Item = Dbtalaograde.Item)');
  qSituacao.SQL.Add(' INNER JOIN "dbGradeItem.DB" Dbgradeitem');
  qSituacao.SQL.Add(' ON  (Dbgradeitem.CodGrade = Dbtalaograde.CodGrade)');
  qSituacao.SQL.Add(' AND  (Dbgradeitem.Posicao = Dbtalaograde.Posicao)');
  qSituacao.SQL.Add(' INNER JOIN "dbProduto.DB" Dbproduto');
  qSituacao.SQL.Add(' ON  (Dbproduto.Codigo = Dbtalao.CodProduto)');
  qSituacao.SQL.Add('WHERE (Dbtalaomov.CodAtelier = :CodAtelier)');
  if (DateEdit1.Text <> '  /  /    ') then
    begin
      qSituacao.SQL.Add(' AND  (Dbtalaomov.DataEnt >= :DtEnt1)');
      qSituacao.ParamByName('DtEnt1').AsDateTime := DateEdit1.Date;
    end;
  if (DateEdit2.Text <> '  /  /    ') then
    begin
      qSituacao.SQL.Add(' AND  (Dbtalaomov.DataEnt <= :DtEnt2)');
      qSituacao.ParamByName('DtEnt2').AsDateTime := DateEdit2.Date;
    end;
  if RadioGroup1.ItemIndex <> 0 then
    begin
      if (DateEdit3.Text <> '  /  /    ') then
        begin
          qSituacao.SQL.Add(' AND (Dbtalaomov.DataSaida >= :DtSaida1)');
          qSituacao.ParamByName('DtSaida1').AsDateTime := DateEdit3.Date;
        end;
      if (DateEdit4.Text <> '  /  /    ') then
        begin
          if DateEdit3.Text = '  /  /    ' then
            qSituacao.SQL.Add(' AND (Dbtalaomov.DataSaida <= :DtSaida2 OR Dbtalaomov.DataSaida IS NULL)')
          else
            qSituacao.SQL.Add(' AND (Dbtalaomov.DataSaida <= :DtSaida2)');
          qSituacao.ParamByName('DtSaida2').AsDateTime := DateEdit4.Date;
        end;
    end;
  if RadioGroup1.ItemIndex = 0 then
    qSituacao.SQL.Add(' AND (Dbtalaomov.DataSaida IS NULL)')
  else
  if RadioGroup1.ItemIndex = 1 then
    qSituacao.SQL.Add(' AND (Dbtalaomov.DataSaida IS NOT NULL)');
  qSituacao.ParamByName('CodAtelier').AsInteger := RxDBLookupCombo1.KeyValue;
  qSituacao.SQL.Add('ORDER BY Dbtalaomov.DataEnt, Dbtalaomov.HoraEnt, Dbtalaomov.Lote, Dbtalaomov.Talao');
  qSituacao.Active := True;
  qSituacao.First;

  // SQL da Referência
  if CheckBox1.Checked then
    begin
     qReferencia.Active := False;
     qReferencia.ParamByName('CodAtelier').AsInteger := RxDBLookupCombo1.KeyValue;
     qReferencia.Active := True;
     qReferencia.First;
    end;

  // SQL do valor pago para o Atelier
  qPagtos.Active := True;
end;

procedure TfPrevSitAtelier.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Dm1.tAtelier.Close;
  DM1.tAtelierPreco.Close;
  Action := Cafree;
end;

procedure TfPrevSitAtelier.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Atelier';
end;

procedure TfPrevSitAtelier.Visualizar1Click(Sender: TObject);
begin
  if (CheckBox2.Checked) and (RadioGroup1.ItemIndex = 2) then
    ShowMessage('Quando o relatório for resumido só pode ser escolhida as situações PENDENTE ou ENTREGUE')
  else
  if RxDBLookupCombo1.Text = '' then
    ShowMessage('Falta informar o nome do atelier')
  else
    begin
      Gera_SQL;
      if qSituacao.RecordCount < 1 then
        ShowMessage('Não existe registro para imprimir')
      else
        begin
          if CheckBox1.Checked then
            begin
              if CheckBox2.Checked then
                begin
                  fRelSitAtelier := TfRelSitAtelier.Create(Self);
                  fRelSitAtelier.QuickRep3.Preview;
                  fRelSitAtelier.QuickRep3.Free;
                end
              else
                begin
                  fRelSitAtelier := TfRelSitAtelier.Create(Self);
                  fRelSitAtelier.QuickRep2.Preview;
                  fRelSitAtelier.QuickRep2.Free;
                end;
              qSituacao.Filtered := False;
            end
          else
            begin
              fRelSitAtelier := TfRelSitAtelier.Create(Self);
              fRelSitAtelier.QuickRep1.Preview;
              fRelSitAtelier.QuickRep1.Free;
            end;
        end;
      qPagtos.Active := False;
    end;
end;

procedure TfPrevSitAtelier.Imprimir1Click(Sender: TObject);
begin
  if (CheckBox2.Checked) and (RadioGroup1.ItemIndex = 2) then
    ShowMessage('Quando o relatório for resumido só pode ser escolhida as situações PENDENTE ou ENTREGUE')
  else
  if RxDBLookupCombo1.Text = '' then
    ShowMessage('Falta informar o nome do atelier')
  else
    begin
      Gera_SQL;
      if qSituacao.RecordCount < 1 then
        ShowMessage('Não existe registro para imprimir')
      else
        begin
          if CheckBox1.Checked then
            begin
              if CheckBox2.Checked then
                begin
                  fRelSitAtelier := TfRelSitAtelier.Create(Self);
                  fRelSitAtelier.QuickRep3.Print;
                  fRelSitAtelier.QuickRep3.Free;
                end
              else
                begin
                  fRelSitAtelier := TfRelSitAtelier.Create(Self);
                  fRelSitAtelier.QuickRep2.Print;
                  fRelSitAtelier.QuickRep2.Free;
                end;
              qSituacao.Filtered := False;
            end
          else
            begin
              fRelSitAtelier := TfRelSitAtelier.Create(Self);
              fRelSitAtelier.QuickRep1.Print;
              fRelSitAtelier.QuickRep1.Free;
            end;
        end;
      qPagtos.Active := False;
    end;
end;

procedure TfPrevSitAtelier.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevSitAtelier.BitBtn2Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  DateEdit3.Clear;
  DateEdit4.Clear;
  RxDBLookupCombo1.ClearValue;
end;

procedure TfPrevSitAtelier.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
    GroupBox2.Enabled := False
  else
    GroupBox2.Enabled := True;
end;

procedure TfPrevSitAtelier.CheckBox2Exit(Sender: TObject);
begin
  if not CheckBox1.Checked then
    begin
      if CheckBox2.Checked then
        CheckBox2.Checked := False;
    end;
end;

procedure TfPrevSitAtelier.FormShow(Sender: TObject);
begin
  Dm1.tAtelier.Open;
  DM1.tAtelierPreco.Open;
end;

end.
