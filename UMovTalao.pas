//*** Código de barras do talão
// 1 Número para o Tipo (0 e 2 = Exportação    1 = Mercado Interno)
// 5 Números para o lote
// 4 Números para o talão
// 2 Números para o setor

unit UMovTalao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Grids, DBGrids, RXDBCtrl, Buttons, Db, DBTables,
  Mask, ToolEdit, CurrEdit, RXCtrls, RxLookup, Variants;

type
  TfMovTalao = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    RxLabel3: TRxLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    qSetor: TQuery;
    qSetorNome: TStringField;
    qSetorCodSetor: TIntegerField;
    qSetorItem: TIntegerField;
    dsqSetor: TDataSource;
    BitBtn7: TBitBtn;
    RxLabel4: TRxLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label14: TLabel;
    RxLabel5: TRxLabel;
    DateEdit1: TDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Insere_DadosS(Lote, Setor, Talao : integer);
    procedure Insere_DadosE(Lote, Setor, Talao : integer);
    //procedure Filtra_Tabela(Lote, Talao : integer);
    procedure Gera_Lote;
    procedure Insere_DadosSMI(Lote, Setor, Talao : integer);
    procedure Insere_DadosEMI(Lote, Setor, Talao : integer);
    //procedure Filtra_TabelaMI(Lote, Talao : integer);
    procedure Gera_LoteMI;
  public
    { Public declarations }
  end;

var
  fMovTalao: TfMovTalao;
  vTipo, vLote, vTalao, vSetor : integer;

implementation

uses UDM1, UEscAtelier, UAgendaTelef, uIntegracao;

{$R *.DFM}

procedure TfMovTalao.Gera_Lote;
begin
  DM1.tTalaoMov.Filtered    := False;
  DM1.tLote.IndexFieldNames := 'Lote';
  DM1.tLote.SetKey;
  DM1.tLoteLote.AsInteger   := vLote;
  if DM1.tLote.GotoKey then
    begin
      DM1.tLoteSetor.First;
      DM1.tSetor.IndexFieldNames := 'Codigo';
      DM1.tSetor.FindKey([DM1.tLoteSetorCodSetor.AsInteger]);
      if DM1.tLoteSetorCodSetor.AsInteger > 0 then
        begin
          DM1.tTalao.First;
          while not DM1.tTalao.Eof do
            begin
              if DM1.tLoteTipoTalao.AsString = 'T' then
                begin
                  DM1.tTalaoGrade.First;
                  while not DM1.tTalaoGrade.Eof do
                    begin
                      DM1.tTalaoMov.IndexFieldNames := 'Lote;Talao;Setor';
                      DM1.tTalaoMov.SetKey;
                      DM1.tTalaoMovLote.AsInteger  := vLote;
                      DM1.tTalaoMovTalao.AsInteger := DM1.tTalaoGradeTalao.AsInteger;
                      DM1.tTalaoMovSetor.AsInteger := DM1.tLoteSetorCodSetor.AsInteger;
                      if DM1.tTalaoMov.GotoKey = False then
                        Insere_DadosE(vLote,DM1.tLoteSetorCodSetor.AsInteger,DM1.tTalaoGradeTalao.AsInteger);
                      DM1.tTalaoGrade.Next;
                    end;
                end
              else
                begin
                  DM1.tTalaoMov.IndexFieldNames := 'Lote;Talao;Setor';
                  DM1.tTalaoMov.SetKey;               
                  DM1.tTalaoMovLote.AsInteger  := vLote;
                  DM1.tTalaoMovTalao.AsInteger := DM1.tTalaoItem.AsInteger;
                  DM1.tTalaoMovSetor.AsInteger := DM1.tLoteSetorCodSetor.AsInteger;
                  if DM1.tTalaoMov.GotoKey = False then                                            
                    Insere_DadosE(vLote,DM1.tLoteSetorCodSetor.AsInteger,DM1.tTalaoItem.AsInteger);
                end;
              DM1.tTalao.Next;
            end;
          ShowMessage('Foi gerada a entrada no corte do LOTE ' + IntToStr(vLote));
        end
      else
        ShowMessage('Setores não lançados no lote');
    end;
end;

procedure TfMovTalao.Gera_LoteMI;
begin
  DM1.tLoteMI.IndexFieldNames := 'Lote';
  DM1.tLoteMI.SetKey;
  DM1.tLoteMILote.AsInteger   := vLote;
  if DM1.tLoteMI.GotoKey then
    begin
      DM1.tLoteSetorMI.First;
      DM1.tSetor.IndexFieldNames := 'Codigo';
      DM1.tSetor.FindKey([DM1.tLoteSetorMICodSetor.AsInteger]);
      if DM1.tLoteSetorMICodSetor.AsInteger > 0 then
        begin
          DM1.tTalaoMI.First;
          while not DM1.tTalaoMI.Eof do
            begin
              DM1.tTalaoMovMI.IndexFieldNames := 'Lote;Talao;Setor';
              DM1.tTalaoMovMI.SetKey;
              DM1.tTalaoMovMILote.AsInteger  := vLote;
              DM1.tTalaoMovMITalao.AsInteger := DM1.tTalaoMIItem.AsInteger;
              DM1.tTalaoMovMISetor.AsInteger := DM1.tLoteSetorMICodSetor.AsInteger;
              if DM1.tTalaoMovMI.GotoKey = False then
                Insere_DadosEMI(vLote,DM1.tLoteSetorMICodSetor.AsInteger,DM1.tTalaoMIItem.AsInteger);
              DM1.tTalaoMI.Next;
            end;
          ShowMessage('Foi gerada a entrada no corte do LOTE ' + IntToStr(vLote));
        end
      else
        ShowMessage('Setores não lançados no lote');
    end;
  DM1.tTalaoMovMI.Refresh;
end;

procedure TfMovTalao.Insere_DadosE(Lote, Setor, Talao : integer);
begin
  DM1.tTalaoMov.SetKey;
  DM1.tTalaoMovLote.AsInteger  := Lote;
  DM1.tTalaoMovSetor.AsInteger := Setor;
  DM1.tTalaoMovTalao.AsInteger := Talao;
  if DM1.tTalaoMov.GotoKey then
    DM1.tTalaoMov.Edit
  else
    begin
      DM1.tTalaoMov.Insert;
      DM1.tTalaoMovLote.AsInteger     := Lote;
      DM1.tTalaoMovSetor.AsInteger    := Setor;
      DM1.tTalaoMovTalao.AsInteger    := Talao;
    end;
  if DateEdit1.Text <> '  /  /    ' then
    DM1.tTalaoMovDataEnt.AsDateTime := DateEdit1.Date
  else
    DM1.tTalaoMovDataEnt.AsDateTime := Date;
  DM1.tTalaoMovHoraEnt.AsDateTime := Time;
  if DM1.tSetorAtelier.AsBoolean then
    begin
      if DM1.tLoteSetorCodAtelier.AsInteger > 0 then
        DM1.tTalaoMovCodAtelier.AsInteger := DM1.tLoteSetorCodAtelier.AsInteger
      else
        begin
          fEscAtelier := TfEscAtelier.Create(Self);
          fEscAtelier.ShowModal;
          DM1.tTalaoMovCodAtelier.AsInteger := DM1.tAtelierCodigo.AsInteger;
        end;
    end;
  DM1.tTalaoMov.Post;
  Prc_Gravar_TalaoMov_FB(DM1.tTalaoMovLote.AsInteger,DM1.tTalaoMovTalao.AsInteger,DM1.tTalaoMovSetor.AsInteger);
  DM1.tTalaoMov.Refresh;
end;

procedure TfMovTalao.Insere_DadosEMI(Lote, Setor, Talao : integer);
begin
  DM1.tTalaoMovMI.SetKey;
  DM1.tTalaoMovMILote.AsInteger  := Lote;
  DM1.tTalaoMovMISetor.AsInteger := Setor;
  DM1.tTalaoMovMITalao.AsInteger := Talao;
  if DM1.tTalaoMovMI.GotoKey then
    DM1.tTalaoMovMI.Edit
  else
    begin
      DM1.tTalaoMovMI.Insert;
      DM1.tTalaoMovMILote.AsInteger     := Lote;
      DM1.tTalaoMovMISetor.AsInteger    := Setor;
      DM1.tTalaoMovMITalao.AsInteger    := Talao;
    end;
  if DateEdit1.Text <> '  /  /    ' then
    DM1.tTalaoMovMIDataEnt.AsDateTime := DateEdit1.Date
  else
    DM1.tTalaoMovMIDataEnt.AsDateTime := Date;
  DM1.tTalaoMovMIHoraEnt.AsDateTime := Time;
  if DM1.tSetorAtelier.AsBoolean then
    begin
      if DM1.tLoteSetorMICodAtelier.AsInteger > 0 then
        DM1.tTalaoMovMICodAtelier.AsInteger := DM1.tLoteSetorMICodAtelier.AsInteger
      else
        begin
          fEscAtelier := TfEscAtelier.Create(Self);
          fEscAtelier.ShowModal;
          DM1.tTalaoMovMICodAtelier.AsInteger := DM1.tAtelierCodigo.AsInteger;
        end;
    end;
  DM1.tTalaoMovMI.Post;
  DM1.tTalaoMovMI.Refresh;
end;

procedure TfMovTalao.Insere_DadosS(Lote, Setor, Talao : integer);
begin
  DM1.tTalaoMov.Edit;
  if DateEdit1.Text <> '  /  /    ' then
    DM1.tTalaoMovDataSaida.AsDateTime := DateEdit1.Date
  else
    DM1.tTalaoMovDataSaida.AsDateTime := Date;
  DM1.tTalaoMovHoraSaida.AsDateTime := Time;
  DM1.tTalaoMov.Post;
  Prc_Gravar_TalaoMov_FB(DM1.tTalaoMovLote.AsInteger,DM1.tTalaoMovTalao.AsInteger,DM1.tTalaoMovSetor.AsInteger);
  DM1.tTalaoMov.Refresh;
end;

procedure TfMovTalao.Insere_DadosSMI(Lote, Setor, Talao : integer);
begin
  DM1.tTalaoMovMI.Edit;
  if DateEdit1.Text <> '  /  /    ' then
    DM1.tTalaoMovMIDataSaida.AsDateTime := DateEdit1.Date
  else
    DM1.tTalaoMovMIDataSaida.AsDateTime := Date;
  DM1.tTalaoMovMIHoraSaida.AsDateTime := Time;
  DM1.tTalaoMovMI.Post;
  DM1.tTalaoMovMI.Refresh;
end;

{procedure TfMovTalao.Filtra_Tabela(Lote, Talao : integer);
begin
  //RxDBGrid1.DataSource   := DM1.dsTalaoMov;
  DM1.tTalaoMov.Filtered := False;
  DM1.tTalaoMov.Filter   := 'Lote = '''+IntToStr(Lote)+''' and Talao = '''+IntToStr(Talao)+'''';
  DM1.tTalaoMov.Filtered := True;
  Edit1.SelectAll;
end;}

{procedure TfMovTalao.Filtra_TabelaMI(Lote, Talao : integer);
begin
  //RxDBGrid1.DataSource     := DM1.dsTalaoMovMI;
  DM1.tTalaoMovMI.Filtered := False;
  DM1.tTalaoMovMI.Filter   := 'Lote = '''+IntToStr(Lote)+''' and Talao = '''+IntToStr(Talao)+'''';
  DM1.tTalaoMovMI.Filtered := True;
  Edit1.SelectAll;
end;}

procedure TfMovTalao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM1.tTalaoMov.Filtered := False;
  DM1.tTalaoMov.Close;
  DM1.tLote.Close;
  DM1.tLoteSetor.Close;
  DM1.tSetor.Close;
  DM1.tTalao.Close;
  DM1.tTalaoGrade.Close;
  DM1.tLoteMI.Close;
  DM1.tLoteSetorMI.Close;
  DM1.tTalaoMI.Close;
  DM1.tTalaoMovMI.Close;
  Action := Cafree;
end;

procedure TfMovTalao.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfMovTalao.FormShow(Sender: TObject);
begin
  DM1.tTalaoMov.Open;
  DM1.tLote.Open;
  DM1.tLoteSetor.Open;
  DM1.tSetor.Open;
  DM1.tTalao.Open;
  DM1.tTalaoGrade.Open;
  DM1.tLoteMI.Open;
  DM1.tLoteSetorMI.Open;
  DM1.tTalaoMI.Open;
  DM1.tTalaoMovMI.Open;
  DM1.tSetor.IndexFieldNames := 'Codigo';
  DateEdit1.Date             := Date;
  Label14.Caption            := '';
end;

procedure TfMovTalao.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
 var
  vOrdem : Integer;
begin
  Label14.Caption := '';
  if Key = Vk_Return then
    begin
      if Length(Edit1.Text) < 12 then
        begin
          ShowMessage('Falta nº(s) p/ dar entrada neste registro!');
          Edit1.SetFocus;
          Edit1.SelectAll;
        end
      else
        begin
          vTipo  := StrToInt(copy(Edit1.Text,1,1));
          vLote  := StrToInt(copy(Edit1.Text,2,5));
          vTalao := StrToInt(copy(Edit1.Text,7,4));
          vSetor := StrToInt(copy(Edit1.Text,11,2));
          if vTalao < 1 then
            begin
              if (vTipo = 0) or (vTipo = 2) then
                Gera_Lote
              else
                Gera_LoteMI;
              Edit1.Clear;
              Edit1.SetFocus;
            end
          else
          //*** Leitura do talão de Exportação
          if (vSetor > 0) and ((vTipo = 0) or (vTipo = 2)) then
            begin
              DM1.tLote.IndexFieldNames := 'Lote';
              DM1.tLote.SetKey;
              DM1.tLoteLote.AsInteger := vLote;
              if DM1.tLote.GotoKey = False then
                begin
                  //Filtra_Tabela(vLote,vTalao);
                  ShowMessage('Lote não foi gerado');
                end
              else
                begin
                  DM1.tSetor.SetKey;
                  DM1.tSetorCodigo.AsInteger := vSetor;
                  if (DM1.tSetor.GotoKey) and (DM1.tSetorImpTalao.AsBoolean) then
                    begin
                      //DM1.tTalaoMov.Filtered := False;
                      DM1.tTalaoMov.SetKey;
                      DM1.tTalaoMovLote.AsInteger  := vLote;
                      DM1.tTalaoMovTalao.AsInteger := vTalao;
                      DM1.tTalaoMovSetor.AsInteger := vSetor;
                      if not DM1.tTalaoMov.GotoKey then
                      //if not DM1.tTalaoMov.Locate('Lote;Talao;Setor',VarArrayOf([vLote,vTalao,vSetor]),[locaseinsensitive]) then
                        begin
                          //Filtra_Tabela(vLote,vTalao);
                          ShowMessage('Não foi dado entrada neste talão');
                        end
                      else
                        begin
                          vOrdem := 0;
                          if DM1.tTalaoMovDataSaida.AsDateTime > 1 then
                            begin
                              //Filtra_Tabela(vLote,vTalao);
                              ShowMessage('Já foi dado saida neste talão dia ' + DM1.tTalaoMovDataSaida.AsString);
                            end
                          else
                            begin
                              Insere_DadosS(vLote,vSetor,vTalao);
                              if DM1.tLoteSetor.Locate('Lote;CodSetor',VarArrayOf([vLote,vSetor]),[locaseinsensitive]) then
                                vOrdem := DM1.tLoteSetorItem.AsInteger;
                              if vOrdem <> DM1.tLoteSetor.RecordCount then
                                begin
                                  vOrdem := vOrdem + 1;
                                  DM1.tLoteSetor.SetKey;
                                  DM1.tLoteSetorLote.AsInteger := vLote;
                                  DM1.tLoteSetorItem.AsInteger := vOrdem;
                                  if DM1.tLoteSetor.GotoKey then
                                    begin
                                      DM1.tSetor.SetKey;
                                      DM1.tSetorCodigo.AsInteger := DM1.tLoteSetorCodSetor.AsInteger;
                                      if DM1.tSetor.GotoKey then
                                        Insere_DadosE(vLote,DM1.tLoteSetorCodSetor.AsInteger,vTalao);
                                    end;
                                end;
                                Label14.Caption := '...Movimento gerado...';                                
                              //Filtra_Tabela(vLote,vTalao);
                            end;
                        end;
                    end
                  else
                    begin       
                      ShowMessage('Setor não cadastrado ou não autorizado');
                      //Filtra_Tabela(vLote,vTalao);
                    end;
                end;
            end
          else

          //*** Leitura do talão do Mercado Interno
          if (vSetor > 0) and (vTipo = 1) then
            begin
              DM1.tLoteMI.IndexFieldNames := 'Lote';
              DM1.tLoteMI.SetKey;
              DM1.tLoteMILote.AsInteger := vLote;
              if DM1.tLoteMI.GotoKey = False then
                begin
                  //Filtra_TabelaMI(vLote,vTalao);
                  ShowMessage('Lote não foi gerado');
                end
              else
                begin
                  DM1.tSetor.SetKey;
                  DM1.tSetorCodigo.AsInteger := vSetor;
                  if (DM1.tSetor.GotoKey) and (DM1.tSetorImpTalao.AsBoolean) then
                    begin
                      DM1.tTalaoMovMI.Filtered := False;
                      if not DM1.tTalaoMovMI.Locate('Lote;Talao;Setor',VarArrayOf([vLote,vTalao,vSetor]),[locaseinsensitive]) then
                        begin
                          //Filtra_TabelaMI(vLote,vTalao);
                          ShowMessage('Não foi dado entrada neste talão');
                        end
                      else
                        begin
                          vOrdem := 0;
                          if DM1.tTalaoMovMIDataSaida.AsDateTime > 1 then
                            begin
                              //Filtra_TabelaMI(vLote,vTalao);
                              ShowMessage('Já foi dado saida neste talão');
                            end
                          else
                            begin
                              Insere_DadosSMI(vLote,vSetor,vTalao);
                              if DM1.tLoteSetorMI.Locate('Lote;CodSetor',VarArrayOf([vLote,vSetor]),[locaseinsensitive]) then
                                vOrdem := DM1.tLoteSetorMIItem.AsInteger;
                              if vOrdem <> DM1.tLoteSetorMI.RecordCount then
                                begin
                                  vOrdem := vOrdem + 1;
                                  DM1.tLoteSetorMI.SetKey;
                                  DM1.tLoteSetorMILote.AsInteger := vLote;
                                  DM1.tLoteSetorMIItem.AsInteger := vOrdem;
                                  if DM1.tLoteSetorMI.GotoKey then
                                    begin
                                      DM1.tSetor.SetKey;
                                      DM1.tSetorCodigo.AsInteger := DM1.tLoteSetorMICodSetor.AsInteger;
                                      if DM1.tSetor.GotoKey then
                                        Insere_DadosEMI(vLote,DM1.tLoteSetorMICodSetor.AsInteger,vTalao);
                                    end;
                                end;
                              Label14.Caption := '...Movimento Gerado...';
                              //Filtra_TabelaMI(vLote,vTalao);
                            end;
                        end;
                    end
                  else          
                    begin
                      ShowMessage('Setor não cadastrado ou não autorizado');
                      //Filtra_TabelaMI(vLote,vTalao);
                    end;
                end;
            end
          else
            begin
              ShowMessage('Setor ou tipo não permitido ');
              {if (vTipo = 0) or (vTipo = 2) then
                Filtra_Tabela(vLote,vTalao)
              else
              if vTipo = 1 then
                Filtra_TabelaMI(vLote,vTalao);}
            end;
          Edit1.SetFocus;
          Edit1.SelectAll;
        end;
    end;
end;

procedure TfMovTalao.CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) and (RadioGroup1.ItemIndex < 0) then
    ShowMessage('Falta informar se o lote é Exportação ou Mercado Interno')
  else
  if (Key = Vk_Return) and (CurrencyEdit1.AsInteger > 0) then
    begin
      Screen.Cursor := crHourglass;
      vLote := CurrencyEdit1.AsInteger;
      if RadioGroup1.ItemIndex = 0 then
        Gera_Lote
      else
        Gera_LoteMI;
      CurrencyEdit1.Clear;
      Screen.Cursor := crDefault;
    end;
end;

procedure TfMovTalao.CurrencyEdit2Exit(Sender: TObject);
begin
  Label14.Caption := '';
  if CurrencyEdit2.AsInteger > 0 then
    begin
      if RadioGroup1.ItemIndex = 0 then
        begin
          qSetor.Active := False;
          qSetor.SQL.Clear;
          qSetor.SQL.Add('SELECT Dbsetor.Nome, Dblotesetor.CodSetor, Dblotesetor.Item');
          qSetor.SQL.Add('FROM "dbLoteSetor.DB" Dblotesetor');
          qSetor.SQL.Add('   INNER JOIN "dbSetor.DB" Dbsetor');
          qSetor.SQL.Add('   ON  (Dblotesetor.CodSetor = Dbsetor.Codigo)');
          qSetor.SQL.Add('WHERE  Dblotesetor.Lote = :NumLote');
          qSetor.SQL.Add('ORDER BY Dblotesetor.Item');
          DM1.tLote.IndexFieldNames := 'Lote';
          DM1.tLote.SetKey;
          DM1.tLoteLote.AsInteger   := CurrencyEdit2.AsInteger;
          if DM1.tLote.GotoKey then
            begin
              qSetor.Params[0].AsInteger := CurrencyEdit2.AsInteger;
              qSetor.Active              := True;
            end;
        end
      else
      if RadioGroup1.ItemIndex = 1 then
        begin
          qSetor.Active := False;
          qSetor.SQL.Clear;
          qSetor.SQL.Add('SELECT Dbsetor.Nome, Dblotesetormi.CodSetor, Dblotesetormi.Item');
          qSetor.SQL.Add('FROM "dbLoteSetorMI.DB" Dblotesetormi');
          qSetor.SQL.Add('   INNER JOIN "dbSetor.DB" Dbsetor');
          qSetor.SQL.Add('   ON  (Dblotesetormi.CodSetor = Dbsetor.Codigo)');
          qSetor.SQL.Add('WHERE  Dblotesetormi.Lote = :NumLote');
          qSetor.SQL.Add('ORDER BY Dblotesetormi.Item');
          DM1.tLoteMI.IndexFieldNames := 'Lote';
          DM1.tLoteMI.SetKey;
          DM1.tLoteMILote.AsInteger   := CurrencyEdit2.AsInteger;
          if DM1.tLoteMI.GotoKey then
            begin
              qSetor.Params[0].AsInteger := CurrencyEdit2.AsInteger;
              qSetor.Active              := True;
            end;
        end;
    end;
end;

procedure TfMovTalao.BitBtn7Click(Sender: TObject);
 var
  vOrdem : Integer;
begin
  Case RadioGroup1.ItemIndex of
    0 : vTipo := 2;
    1 : vTipo := 1;
  end;           
  if (CurrencyEdit2.AsInteger > 0) and (CurrencyEdit3.AsInteger > 0) and
     (RxDBLookupCombo1.Text <> '') then
    begin
      vLote  := CurrencyEdit2.AsInteger;
      vTalao := CurrencyEdit3.AsInteger;
      vSetor := RxDBLookupCombo1.KeyValue;
      //*** Leitura do talão de Exportação
      if (vSetor > 0) and ((vTipo = 0) or (vTipo = 2)) then
        begin
          DM1.tLote.IndexFieldNames := 'Lote';
          DM1.tLote.SetKey;
          DM1.tLoteLote.AsInteger := vLote;
          if DM1.tLote.GotoKey = False then
            begin
              //Filtra_Tabela(vLote,vTalao);
              ShowMessage('Lote não foi gerado');
            end
          else
            begin
              DM1.tSetor.SetKey;
              DM1.tSetorCodigo.AsInteger := vSetor;
              if (DM1.tSetor.GotoKey) and (DM1.tSetorImpTalao.AsBoolean) then
                begin
                  //DM1.tTalaoMov.Filtered := False;
                  DM1.tTalaoMov.SetKey;
                  DM1.tTalaoMovLote.AsInteger  := vLote;
                  DM1.tTalaoMovTalao.AsInteger := vTalao;
                  DM1.tTalaoMovSetor.AsInteger := vSetor;
                  if not DM1.tTalaoMov.GotoKey then
                  //if not DM1.tTalaoMov.Locate('Lote;Talao;Setor',VarArrayOf([vLote,vTalao,vSetor]),[locaseinsensitive]) then
                    begin
                      //Filtra_Tabela(vLote,vTalao);
                      ShowMessage('Não foi dado entrada neste talão');
                    end
                  else
                    begin
                      vOrdem := 0;
                      if DM1.tTalaoMovDataSaida.AsDateTime > 1 then
                        begin
                          //Filtra_Tabela(vLote,vTalao);
                          ShowMessage('Já foi dado saida neste talão dia ' + DM1.tTalaoMovDataSaida.AsString);
                        end
                      else
                        begin
                          Insere_DadosS(vLote,vSetor,vTalao);
                          if DM1.tLoteSetor.Locate('Lote;CodSetor',VarArrayOf([vLote,vSetor]),[locaseinsensitive]) then
                            vOrdem := DM1.tLoteSetorItem.AsInteger;
                          if vOrdem <> DM1.tLoteSetor.RecordCount then
                            begin
                              vOrdem := vOrdem + 1;
                              DM1.tLoteSetor.SetKey;
                              DM1.tLoteSetorLote.AsInteger := vLote;
                              DM1.tLoteSetorItem.AsInteger := vOrdem;
                              if DM1.tLoteSetor.GotoKey then
                                begin
                                  DM1.tSetor.SetKey;
                                  DM1.tSetorCodigo.AsInteger := DM1.tLoteSetorCodSetor.AsInteger;
                                  if DM1.tSetor.GotoKey then
                                    Insere_DadosE(vLote,DM1.tLoteSetorCodSetor.AsInteger,vTalao);
                                end;
                            end;
                          //Filtra_Tabela(vLote,vTalao);
                          Label14.Caption := '...Movimento gerado...';
                        end;
                    end;
                end
              else
                begin
                  ShowMessage('Setor não cadastrado ou não autorizado');
                  //Filtra_Tabela(vLote,vTalao);
                end;
            end;
        end
      else

      //*** Leitura do talão do Mercado Interno
      if vTipo = 1 then
        begin
          DM1.tLoteMI.IndexFieldNames := 'Lote';
          DM1.tLoteMI.SetKey;
          DM1.tLoteMILote.AsInteger := vLote;
          if DM1.tLoteMI.GotoKey = False then
            ShowMessage('Lote não foi gerado')
          else
            begin
              DM1.tSetor.SetKey;
              DM1.tSetorCodigo.AsInteger := vSetor;
              if (DM1.tSetor.GotoKey) and (DM1.tSetorImpTalao.AsBoolean) then
                begin
                  DM1.tTalaoMovMI.Filtered := False;
                  if not DM1.tTalaoMovMI.Locate('Lote;Talao;Setor',VarArrayOf([vLote,vTalao,vSetor]),[locaseinsensitive]) then
                    ShowMessage('Não foi dado entrada neste talão')
                  else
                    begin
                      vOrdem := 0;
                      if DM1.tTalaoMovMIDataSaida.AsDateTime > 1 then
                        ShowMessage('Já foi dado saida neste talão')
                      else      
                        begin
                          Insere_DadosSMI(vLote,vSetor,vTalao);
                          if DM1.tLoteSetorMI.Locate('Lote;CodSetor',VarArrayOf([vLote,vSetor]),[locaseinsensitive]) then
                            vOrdem := DM1.tLoteSetorMIItem.AsInteger;
                          if vOrdem <> DM1.tLoteSetorMI.RecordCount then
                            begin
                              vOrdem := vOrdem + 1;
                              DM1.tLoteSetorMI.SetKey;
                              DM1.tLoteSetorMILote.AsInteger := vLote;
                              DM1.tLoteSetorMIItem.AsInteger := vOrdem;
                              if DM1.tLoteSetorMI.GotoKey then
                                begin
                                  DM1.tSetor.SetKey;
                                  DM1.tSetorCodigo.AsInteger := DM1.tLoteSetorMICodSetor.AsInteger;
                                  if DM1.tSetor.GotoKey then
                                    Insere_DadosEMI(vLote,DM1.tLoteSetorMICodSetor.AsInteger,vTalao);
                                end;
                            end;
                          Label14.Caption := '...Movimento gerado...';
                        end;
                    end;
                end
              else
                ShowMessage('Setor não cadastrado ou não autorizado');
            end;
          DM1.tTalaoMovMI.Refresh;
        end;
    end;
  CurrencyEdit2.SetFocus;
end;

procedure TfMovTalao.CurrencyEdit3Exit(Sender: TObject);
begin
  if (CurrencyEdit2.AsInteger > 0) and (CurrencyEdit3.AsInteger > 0) then
    begin
      if RadioGroup1.ItemIndex = 1 then
        begin
          DM1.tTalaoMI.SetKey;
          DM1.tTalaoMILote.AsInteger := CurrencyEdit2.AsInteger;
          DM1.tTalaoMIItem.AsInteger := CurrencyEdit3.AsInteger;
          if not DM1.tTalaoMI.GotoKey then
            begin
              ShowMessage('Talão inexistente');
              CurrencyEdit3.SetFocus;
            end;
        end
      else
        begin
          if DM1.tLoteTipoTalao.AsString = 'R' then
            begin
              DM1.tTalao.SetKey;
              DM1.tTalaoLote.AsInteger := CurrencyEdit2.AsInteger;
              DM1.tTalaoItem.AsInteger := CurrencyEdit3.AsInteger;
              if not DM1.tTalao.GotoKey then
                begin
                  ShowMessage('Talão inexistente');
                  CurrencyEdit3.SetFocus;
                end;
            end
          else
            begin
              DM1.tTalao.SetKey;
              DM1.tTalaoLote.AsInteger := CurrencyEdit2.AsInteger;
              DM1.tTalaoItem.AsInteger := 1;
              if not DM1.tTalao.GotoKey then
                begin
                  ShowMessage('item inexistente');
                  CurrencyEdit3.SetFocus;
                end
              else
                begin
                  if not DM1.tTalaoGrade.Locate('Lote;Item;Talao',VarArrayOf([CurrencyEdit2.AsInteger,DM1.tTalaoItem.AsInteger,CurrencyEdit3.AsInteger]),[locaseinsensitive]) then
                    begin
                      ShowMessage('Talão inexistente');
                      CurrencyEdit3.SetFocus;
                    end;
                end;
            end
        end



    end;
end;

procedure TfMovTalao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
