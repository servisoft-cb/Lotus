unit UPrevRelAcumFab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, RxLookup, Mask,
  ToolEdit, CurrEdit, Db, DBTables, MemTable, Variants;

type
  TfPrevRelAcumFab = class(TForm)
    qAcumuladoMes: TQuery;
    qAcumuladoMesReferencia: TStringField;
    qAcumuladoMesQtdPares: TFloatField;
    qsAcumuladoMes: TDataSource;
    mPares: TMemoryTable;
    msPares: TDataSource;
    mParesQtdPares: TFloatField;
    mParesQtdSetor1: TFloatField;
    mParesQtdSetor2: TFloatField;
    mParesQtdSetor3: TFloatField;
    mParesQtdSetor4: TFloatField;
    mParesReferencia: TStringField;
    mParesQtdEmbalagem: TFloatField;
    qAcumuladoMesQtdParesFat: TFloatField;
    qAcumuladoMesLoteExp: TBooleanField;
    qAcumuladoMesPedido: TIntegerField;
    qAcumuladoMesItem: TIntegerField;
    tTalaoMI: TTable;
    dsTalaoMI: TDataSource;
    tTalaoMILote: TIntegerField;
    tTalaoMIItem: TIntegerField;
    tTalaoMICodProduto: TIntegerField;
    tTalaoMICodCabedal1: TIntegerField;
    tTalaoMICodCabedal2: TIntegerField;
    tTalaoMICodCor: TIntegerField;
    tTalaoMICodCorForro: TIntegerField;
    tTalaoMICodCorPalmilha: TIntegerField;
    tTalaoMICodCorSolado: TIntegerField;
    tTalaoMIQtdPar: TIntegerField;
    tTalaoMICodForro: TIntegerField;
    tTalaoMICodEtiqueta: TIntegerField;
    tTalaoMICodSolado: TIntegerField;
    tTalaoMICodTaloneira: TIntegerField;
    tTalaoMICodCorTaloneira: TIntegerField;
    tTalaoMICodPalmilha: TIntegerField;
    tTalaoMICodForma: TIntegerField;
    tTalaoMIItemPedido: TIntegerField;
    tTalaoMINumPedido: TIntegerField;
    tTalaoMovMI: TTable;
    dsTalaoMovMI: TDataSource;
    tTalaoMovMILote: TIntegerField;
    tTalaoMovMITalao: TIntegerField;
    tTalaoMovMISetor: TIntegerField;
    tTalaoMovMIDataEnt: TDateField;
    tTalaoMovMIHoraEnt: TTimeField;
    tTalaoMovMIDataSaida: TDateField;
    tTalaoMovMIHoraSaida: TTimeField;
    tTalaoMovMICodAtelier: TIntegerField;
    mParesFabrica: TIntegerField;
    Panel1: TPanel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    Label3: TLabel;
    DateEdit2: TDateEdit;
    Label5: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label6: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label7: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label8: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qAcumuladoMesCodFabrica: TIntegerField;
    mPareslkFabrica: TStringField;
    qAcumuladoMesMercado: TStringField;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Posiciona_Setores;
  public
    { Public declarations }
  end;

var
  fPrevRelAcumFab: TfPrevRelAcumFab;

implementation

uses UDM1, URelAcumFab;

{$R *.DFM}

procedure TfPrevRelAcumFab.Posiciona_Setores;
begin
  if DM1.tSetor.Locate('Nome','CORTE',[loCaseInsensitive]) then
    RxDBLookupCombo1.KeyValue := DM1.tSetorCodigo.AsInteger
  else
    RxDBLookupCombo1.ClearValue;
  if DM1.tSetor.Locate('Nome','COSTURA',[loCaseInsensitive]) then
    RxDBLookupCombo2.KeyValue := DM1.tSetorCodigo.AsInteger
  else
    RxDBLookupCombo2.ClearValue;
  if DM1.tSetor.Locate('Nome','DISTRIBUICAO',[loCaseInsensitive]) then
    RxDBLookupCombo3.KeyValue := DM1.tSetorCodigo.AsInteger
  else
    RxDBLookupCombo3.ClearValue;
  if DM1.tSetor.Locate('Nome','MONTAGEM',[loCaseInsensitive]) then
    RxDBLookupCombo4.KeyValue := DM1.tSetorCodigo.AsInteger
  else
    RxDBLookupCombo4.ClearValue;
end;

procedure TfPrevRelAcumFab.BitBtn6Click(Sender: TObject);
begin
  if (DateEdit1.Text = '  /  /    ') or (DateEdit2.Text = '  /  /    ') or
     (RxDBLookupCombo1.Text = '') or (RxDBLookupCombo2.Text = '') or
     (RxDBLookupCombo3.Text = '') or (RxDBLookupCombo4.Text = '') then
    begin
      ShowMessage('Falta informação');
      RxDBLookupCombo1.SetFocus;
    end
  else
    begin
      Screen.Cursor  := crHourGlass;
      mPares.EmptyTable;
      qAcumuladoMes.Active := False;
      qAcumuladoMes.Params[0].AsDate    := DateEdit1.Date;
      qAcumuladoMes.Params[1].AsDate    := DateEdit2.Date;
      qAcumuladoMes.Active := True;
      if qAcumuladoMes.RecordCount < 1 then
        ShowMessage('Não há registros para imprimir')
      else
        begin
          qAcumuladoMes.First;
          while not qAcumuladoMes.Eof do
            begin
              if qAcumuladoMesMercado.AsString = 'E' then
                begin
                  if mPares.Locate('Referencia;Fabrica',VarArrayOf([qAcumuladoMesReferencia.AsString,qAcumuladoMesCodFabrica.AsInteger]),[locaseinsensitive]) then
                    mPares.Edit
                  else
                    begin
                      mPares.Insert;
                      mParesReferencia.AsString  := qAcumuladoMesReferencia.AsString;
                      mParesFabrica.AsInteger    := qAcumuladoMesCodFabrica.AsInteger;
                      mParesQtdPares.AsFloat     := 0;
                      mParesQtdSetor1.AsFloat    := 0;
                      mParesQtdSetor2.AsFloat    := 0;
                      mParesQtdSetor3.AsFloat    := 0;
                      mParesQtdSetor4.AsFloat    := 0;
                      mParesQtdEmbalagem.AsFloat := 0;
                    end;
                end
              else
              if qAcumuladoMesMercado.AsString = 'I' then
                begin
                  if mPares.Locate('Referencia;Fabrica',VarArrayOf(['0',qAcumuladoMesCodFabrica.AsInteger]),[locaseinsensitive]) then
                    mPares.Edit
                  else
                    begin
                      mPares.Insert;
                      mParesReferencia.AsString  := '0';
                      mParesFabrica.AsInteger    := qAcumuladoMesCodFabrica.AsInteger;
                      mParesQtdPares.AsFloat     := 0;
                      mParesQtdSetor1.AsFloat    := 0;
                      mParesQtdSetor2.AsFloat    := 0;
                      mParesQtdSetor3.AsFloat    := 0;
                      mParesQtdSetor4.AsFloat    := 0;
                      mParesQtdEmbalagem.AsFloat := 0;
                    end;
                end;
              mParesQtdPares.AsFloat     := mParesQtdPares.AsFloat + qAcumuladoMesQtdPares.AsFloat;
              mParesQtdEmbalagem.AsFloat := mParesQtdEmbalagem.AsFloat + qAcumuladoMesQtdParesFat.AsFloat;
              //*** Mercado Interno
              if qAcumuladoMesMercado.AsString = 'I' then
                begin
                  tTalaoMI.Filtered := False;
                  tTalaoMI.Filter   := 'NumPedido = '''+qAcumuladoMesPedido.AsString+''' and ItemPedido = '''+qAcumuladoMesItem.AsString+'''';
                  tTalaoMI.Filtered := True;
                  tTalaoMI.First;
                  while not tTalaoMI.Eof do
                    begin
                      tTalaoMovMI.First;
                      while not tTalaoMovMI.Eof do
                        begin
                          if (tTalaoMovMISetor.AsInteger = RxDBLookupCombo1.KeyValue) and (tTalaoMovMIDataSaida.AsDateTime > 0) then
                            mParesQtdSetor1.AsFloat := mParesQtdSetor1.AsFloat + qAcumuladoMesQtdPares.AsFloat
                          else
                          if (tTalaoMovMISetor.AsInteger = RxDBLookupCombo2.KeyValue) and (tTalaoMovMIDataSaida.AsDateTime > 0) then
                            mParesQtdSetor2.AsFloat := mParesQtdSetor2.AsFloat + qAcumuladoMesQtdPares.AsFloat
                          else
                          if (tTalaoMovMISetor.AsInteger = RxDBLookupCombo3.KeyValue) and (tTalaoMovMIDataSaida.AsDateTime > 0) then
                            mParesQtdSetor3.AsFloat := mParesQtdSetor3.AsFloat + qAcumuladoMesQtdPares.AsFloat
                          else
                          if (tTalaoMovMISetor.AsInteger = RxDBLookupCombo4.KeyValue) and (tTalaoMovMIDataSaida.AsDateTime > 0) then
                            mParesQtdSetor4.AsFloat := mParesQtdSetor4.AsFloat + qAcumuladoMesQtdPares.AsFloat;
                          tTalaoMovMI.Next;
                        end;
                      tTalaoMI.Next;
                    end;
                  tTalaoMI.Filtered := False;
                end
              else
              //*** Exportação
                begin
                  DM1.tLote.Filtered := False;
                  DM1.tLote.Filter   := 'NroPedido = '''+qAcumuladoMesPedido.AsString+''' and ItemPed = '''+qAcumuladoMesItem.AsString+'''';
                  DM1.tLote.Filtered := True;
                  DM1.tLote.First;
                  while not DM1.tLote.Eof do
                    begin
                      DM1.tTalao.First;
                      while not DM1.tTalao.Eof do
                        begin
                          DM1.tTalaoGrade.First;
                          while not DM1.tTalaoGrade.Eof do
                            begin
                              DM1.tTalaoMov.Filtered := False;
                              DM1.tTalaoMov.Filter   := 'Lote = '''+DM1.tTalaoGradeLote.AsString+''' and Talao = '''+DM1.tTalaoGradeTalao.AsString+'''';
                              DM1.tTalaoMov.Filtered := True;
                              DM1.tTalaoMov.First;
                              while not DM1.tTalaoMov.Eof do
                                begin
                                  if (DM1.tTalaoMovSetor.AsInteger = RxDBLookupCombo1.KeyValue) and (DM1.tTalaoMovDataSaida.AsDateTime > 0) then
                                    mParesQtdSetor1.AsFloat := mParesQtdSetor1.AsFloat + DM1.tTalaoGradeQtdPar.AsFloat
                                  else
                                  if (DM1.tTalaoMovSetor.AsInteger = RxDBLookupCombo2.KeyValue) and (DM1.tTalaoMovDataSaida.AsDateTime > 0) then
                                    mParesQtdSetor2.AsFloat := mParesQtdSetor2.AsFloat + DM1.tTalaoGradeQtdPar.AsFloat
                                  else
                                  if (DM1.tTalaoMovSetor.AsInteger = RxDBLookupCombo3.KeyValue) and (DM1.tTalaoMovDataSaida.AsDateTime > 0) then
                                    mParesQtdSetor3.AsFloat := mParesQtdSetor3.AsFloat + DM1.tTalaoGradeQtdPar.AsFloat
                                  else
                                  if (DM1.tTalaoMovSetor.AsInteger = RxDBLookupCombo4.KeyValue) and (DM1.tTalaoMovDataSaida.AsDateTime > 0) then
                                    mParesQtdSetor4.AsFloat := mParesQtdSetor4.AsFloat + DM1.tTalaoGradeQtdPar.AsFloat;
                                  DM1.tTalaoMov.Next;
                                end;
                              DM1.tTalaoMov.Filtered := False;
                              DM1.tTalaoGrade.Next;
                            end;
                          DM1.tTalao.Next;
                        end;
                      DM1.tLote.Next;
                    end;
                  DM1.tLote.Filtered := False;
                end;
              mPares.Post;
              qAcumuladoMes.Next;
            end;
        end;
      mPares.First;
      Screen.Cursor := crDefault;
      if mPares.RecordCount > 0 then
        begin
          {fRelAcumFab := TfRelAcumFab.Create(Self);
          fRelAcumFab.QuickRep1.Preview;
          fRelAcumFab.QuickRep1.Free;}
          fRelAcumFab := TfRelAcumFab.Create(Self);
          fRelAcumFab.RLReport1.Preview;
          fRelAcumFab.RLReport1.Free;
        end;
    end;
end;

procedure TfPrevRelAcumFab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qAcumuladoMes.Active := False;
  DM1.tSetor.IndexFieldNames := 'Codigo';
  Dm1.tSetor.Close;
  Dm1.tLote.Close;
  Dm1.tTalao.Close;
  Dm1.tTalaoGrade.Close;
  Dm1.tTalaoMov.Close;
  DM1.tFabrica.Close;
  Action := Cafree;
end;

procedure TfPrevRelAcumFab.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPrevRelAcumFab.FormShow(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Nome';
end;

procedure TfPrevRelAcumFab.BitBtn2Click(Sender: TObject);
begin
  DateEdit1.Clear;
  DateEdit2.Clear;
  Posiciona_Setores;
  DateEdit1.SetFocus;
end;

procedure TfPrevRelAcumFab.FormCreate(Sender: TObject);
begin
  Dm1.tSetor.Open;
  Dm1.tLote.Open;
  Dm1.tTalao.Open;
  Dm1.tTalaoGrade.Open;
  Dm1.tTalaoMov.Open;
  DM1.tFabrica.Open;
  Posiciona_Setores;
end;

end.
