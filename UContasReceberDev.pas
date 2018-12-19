unit UContasReceberDev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, ToolEdit, CurrEdit, RxLookup,
  Db, DBTables, DBFilter, MemTable, Variants;

type
  TfContasReceberDev = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Label15: TLabel;
    DBText5: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label1: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText4: TDBText;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    DBText6: TDBText;
    Label7: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Bevel1: TBevel;
    Label11: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton1: TSpeedButton;
    tHistorico: TTable;
    tHistoricoCodigo: TIntegerField;
    tHistoricoNome: TStringField;
    tHistoricoTipo: TStringField;
    dsHistorico: TDataSource;
    RxDBFilter1: TRxDBFilter;
    tExtComissaoIns: TTable;
    tExtComissaoInsNroLancamento: TIntegerField;
    tExtComissaoInsCodVendedor: TIntegerField;
    tExtComissaoInsDtReferencia: TDateField;
    tExtComissaoInsNroDoc: TIntegerField;
    tExtComissaoInsParcDoc: TIntegerField;
    tExtComissaoInsCodCliente: TIntegerField;
    tExtComissaoInsFuncao: TStringField;
    tExtComissaoInsVlrBase: TFloatField;
    tExtComissaoInsPercDescDupl: TFloatField;
    tExtComissaoInsPercComissao: TFloatField;
    tExtComissaoInsVlrComissao: TFloatField;
    tExtComissaoInsTipo: TStringField;
    tExtComissaoInsSuspensa: TBooleanField;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    tExtComissaoModIns: TTable;
    tExtComissaoModInsNroLancamento: TIntegerField;
    tExtComissaoModInsCodModelista: TIntegerField;
    tExtComissaoModInsDtReferencia: TDateField;
    tExtComissaoModInsNumNota: TIntegerField;
    tExtComissaoModInsCodProduto: TIntegerField;
    tExtComissaoModInsFuncao: TStringField;
    tExtComissaoModInsVlrBase: TFloatField;
    tExtComissaoModInsPercComissao: TFloatField;
    tExtComissaoModInsVlrComissao: TFloatField;
    tExtComissaoModInsTipo: TStringField;
    tExtComissaoModInsCodCliente: TIntegerField;
    qComissao: TQuery;
    qComissaoVlrComissao: TFloatField;
    qComissaoCodModelista: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CurrencyEdit2Enter(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    procedure Grava_Historico;
    procedure Grava_ExtComissao;
    procedure Grava_ExtComissaoMod;
    procedure Pgto_Total;
    procedure Pgto_Parcial;
  public
    { Public declarations }
  end;

var
  fContasReceberDev: TfContasReceberDev;

implementation

uses UDM1, UHistorico, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfContasReceberDev.Grava_Historico;
var
  vItemAux : Integer;
begin
  DM1.tCReceberParcHist.Refresh;
  DM1.tCReceberParcHist.Last;
  vItemAux := DM1.tCReceberParcHistItem.AsInteger;
  DM1.tCReceberParcHist.Insert;
  DM1.tCReceberParcHistNumCReceber.AsInteger   := DM1.tCReceberParcNumCReceber.AsInteger;
  DM1.tCReceberParcHistParcCReceber.AsInteger  := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tCReceberParcHistItem.AsInteger          := vItemAux + 1;
  DM1.tCReceberParcHistDtHistorico.AsDateTime  := Date;
  DM1.tCReceberParcHistCodHistorico.AsCurrency := 0;
  if Edit1.Text <> '' then
    DM1.tCReceberParcHistHistorico.AsString      := Edit1.Text
  else
    DM1.tCReceberParcHistHistorico.AsString      := 'VALOR REF. DEVOLUCAO';
  DM1.tCReceberParcHistDtUltPgto.AsDateTime      := DateEdit1.Date;;
  DM1.tCReceberParcHistVlrUltPgto.AsCurrency     := 0;
  DM1.tCReceberParcHistVlrUltJuros.AsFloat       := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcJurosParcCReceber.AsFloat));
  DM1.tCReceberParcHistVlrUltDescontos.AsFloat   := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat));
  DM1.tCReceberParcHistVlrUltDespesas.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDespesas.AsFloat));
  DM1.tCReceberParcHistVlrUltAbatimentos.AsFloat := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcAbatimentos.AsFloat));
  DM1.tCReceberParcHistVlrDevolucao.AsFloat      := StrToFloat(FormatFloat('0.00',CurrencyEdit1.Value));
  DM1.tCReceberParcHistPgto.AsBoolean            := False;
  DM1.tCReceberParcHistDevolucao.AsBoolean       := True;
end;

procedure TfContasReceberDev.Grava_ExtComissao;
var
  vAux : Real;
begin
  tExtComissaoIns.Refresh;
  tExtComissaoIns.Last;
  DM1.tExtComissao.Insert;
  DM1.tExtComissaoNroLancamento.AsInteger := tExtComissaoInsNroLancamento.AsInteger + 1;
  DM1.tExtComissaoCodVendedor.AsInteger   := DM1.tCReceberParcCodVendedor.AsInteger;
  DM1.tExtComissaoDtReferencia.AsDateTime := DateEdit1.Date;
  DM1.tExtComissaoParcDoc.AsInteger       := DM1.tCReceberParcParcCReceber.AsInteger;
  DM1.tExtComissaoCodCliente.AsInteger    := DM1.tCReceberParcCodCli.AsInteger;
  DM1.tExtComissaoFuncao.AsString         := 'D';
  DM1.tExtComissaoNroDoc.AsInteger        := DM1.tCReceberParcNumNota.AsInteger;
  vAux := CurrencyEdit1.Value;
  if DM1.tCReceberParcPagarParteNaNota.AsBoolean then
    vAux := StrToFloat(FormatFloat('0.00',CurrencyEdit1.Value / 2));
  DM1.tExtComissaoVlrBase.AsCurrency      := StrToFloat(FormatFloat('0.00',vAux));
  DM1.tExtComissaoPercDescDupl.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcDesconto.AsFloat));
  DM1.tExtComissaoPercComissao.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcPercComissao.AsFloat));
  DM1.tExtComissaoVlrComissao.AsFloat     := StrToFloat(FormatFloat('0.00',(DM1.tExtComissaoVlrBase.AsFloat * DM1.tExtComissaoPercComissao.AsFloat / 100)));
  DM1.tExtComissaoTipo.AsString           := DM1.tCReceberParclkTipoComissao.AsString;
  DM1.tExtComissaoSuspensa.AsBoolean      := False;
  if DM1.tCReceberParclkTipoComissao.AsString <> '' then
    DM1.tExtComissaoTipo.AsString := 'D';
  DM1.tExtComissao.Post;
  DM1.tCReceberParcHistNroLancExtComissao.AsInteger := DM1.tExtComissaoNroLancamento.AsInteger;
end;

procedure TfContasReceberDev.Grava_ExtComissaoMod;
var
  vAux, vPercentual : Real;
begin
  qComissao.Close;
  qComissao.ParamByName('NumNota').AsInteger := DM1.tCReceberParcNumNota.AsInteger;
  qComissao.Open;

  qComissao.First;
  while not qComissao.Eof do
    begin
      if StrToFloat(FormatFloat('0.00',qComissaoVlrComissao.AsFloat)) > 0 then
        begin
          if DM1.tCReceberParc.RecordCount > 1 then
            vAux := qComissaoVlrComissao.AsFloat / DM1.tCReceberParc.RecordCount
          else
            vAux := qComissaoVlrComissao.AsFloat;
          vPercentual := 100;
          if CurrencyEdit1.Value <> StrToCurr(FormatCurr('0.00',DM1.tCReceberParcVlrParcCReceber.AsFloat)) then
            vPercentual := (CurrencyEdit1.Value / StrToCurr(FormatCurr('0.00',DM1.tCReceberParcVlrParcCReceber.AsFloat))) * 100;
          if vPercentual <> 100 then
            vAux := (vAux * vPercentual) / 100;
          //Grava no tExtComissaoMod
          tExtComissaoModIns.Refresh;
          tExtComissaoModIns.Last;
          DM1.tExtComissaoMod.Insert;
          DM1.tExtComissaoModNroLancamento.AsInteger    := tExtComissaoModInsNroLancamento.AsInteger + 1;
          DM1.tExtComissaoModCodModelista.AsInteger     := qComissaoCodModelista.AsInteger;
          DM1.tExtComissaoModDtReferencia.AsDateTime    := DateEdit1.Date;
          DM1.tExtComissaoModNumNota.AsInteger          := DM1.tCReceberParcNumNota.AsInteger;
          DM1.tExtComissaoModCodProduto.AsInteger       := 0;
          DM1.tExtComissaoModFuncao.AsString            := 'D';
          DM1.tExtComissaoModVlrBase.AsCurrency         := CurrencyEdit1.Value;
          DM1.tExtComissaoModPercComissao.AsCurrency    := 0;
          DM1.tExtComissaoModVlrComissao.AsCurrency     := vAux;
          DM1.tExtComissaoModTipo.AsString              := 'D';
          DM1.tExtComissaoModCodCliente.AsInteger       := DM1.tCReceberParcCodCli.AsInteger;
          DM1.tExtComissaoModParcela.AsInteger          := DM1.tCReceberParcParcCReceber.AsInteger;
          DM1.tExtComissaoModItemHistCReceber.AsInteger := DM1.tCReceberParcHistItem.AsInteger;
          DM1.tExtComissaoMod.Post;
          DM1.tExtComissaoMod.Refresh;
          //Fim da gravação
        end;
      qComissao.Next;
    end;
  qComissao.Close;
end;

procedure TfContasReceberDev.Pgto_Total;
procedure QuitaContaReceber;
var Achou : Boolean;
begin
  Achou := False;
  DM1.tCReceberParc.First;
  while not DM1.tCReceberParc.EOF do
    begin
      if not DM1.tCReceberParcQuitParcCReceber.AsBoolean then
        Achou := True;
      DM1.tCReceberParc.Next;
    end;
  if not Achou then
    begin
      DM1.tCReceber.Edit;
      DM1.tCReceberQuitado.AsBoolean := True;
      DM1.tCReceber.Post;
    end;
end;
begin
  DM1.tCReceberParcVlrDevolucao.AsFloat         := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrDevolucao.AsFloat + CurrencyEdit1.Value));
  DM1.tCReceberParcRestParcela.AsFloat          := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat - CurrencyEdit1.Value));
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <=0 then
    DM1.tCReceberParcRestParcela.AsFloat := 0;
  if DM1.tCReceberParcDtVencCReceber.AsString = '' then
    DM1.tCReceberParcDtVencCReceber.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  Grava_Historico;
  if CheckBox1.Checked then
    begin
      if (DM1.tCReceberParcCodVendedor.AsInteger > 0) and (StrToFloat(FormatFloat('0.00',DM1.tCReceberParcPercComissao.AsFloat)) > 0) and
         ((DM1.tCReceberParclkTipoComissao.AsString = 'N') or (DM1.tCReceberParcPagarParteNaNota.AsBoolean)) then
        Grava_ExtComissao;
    end;
  DM1.tCReceberParcHist.Post;
  DM1.tCReceberParcQuitParcCReceber.AsBoolean   := True;
  DM1.tCReceberParc.Post;
  if CheckBox2.Checked then
    Grava_ExtComissaoMod;
  QuitaContaReceber;
  Close;
end;

procedure TfContasReceberDev.Pgto_Parcial;
procedure QuitaContaReceber;
var Achou : Boolean;
begin
  Achou := False;
  DM1.tCReceberParc.First;
  while not DM1.tCReceberParc.EOF do
    begin
      if not DM1.tCReceberParcQuitParcCReceber.AsBoolean then
        Achou := True;
      DM1.tCReceberParc.Next;
    end;
  if not Achou then
    begin
      DM1.tCReceber.Edit;
      DM1.tCReceberQuitado.AsBoolean := True;
      DM1.tCReceber.Post;
    end;
end;
begin
  DM1.tCReceberParcVlrDevolucao.AsFloat         := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcVlrDevolucao.AsFloat + CurrencyEdit1.Value));
  DM1.tCReceberParcRestParcela.AsCurrency       := StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsCurrency - CurrencyEdit1.Value));
  if DM1.tCReceberParcDtVencCReceber.AsString = '' then
    DM1.tCReceberParcDtVencCReceber.AsDateTime := DM1.tCReceberParcDtPagParcCReceber.AsDateTime;
  Grava_Historico;
  if CheckBox1.Checked then
    begin
      if (DM1.tCReceberParcCodVendedor.AsInteger > 0) and (StrToFloat(FormatFloat('0.00',DM1.tCReceberParcPercComissao.AsFloat)) > 0) and
         ((DM1.tCReceberParclkTipoComissao.AsString = 'N') or (DM1.tCReceberParcPagarParteNaNota.AsBoolean)) then
        Grava_ExtComissao;
    end;
  DM1.tCReceberParcHist.Post;
  if StrToFloat(FormatFloat('0.00',DM1.tCReceberParcRestParcela.AsFloat)) <= 0 then
    DM1.tCReceberParcQuitParcCReceber.AsBoolean := True;
  DM1.tCReceberParc.Post;
  if CheckBox2.Checked then
    Grava_ExtComissaoMod;
  QuitaContaReceber;
  Close;
end;

procedure TfContasReceberDev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM1.tCReceberParc.State in [dsInsert,dsEdit] then
    DM1.tCReceberParc.Cancel;
  Action := Cafree;
end;

procedure TfContasReceberDev.FormShow(Sender: TObject);
begin
  DM1.tCReceberParc.Edit;
  CurrencyEdit1.Value := DM1.tCReceberParcRestParcela.AsCurrency;
  DateEdit1.Date      := Date;
  CurrencyEdit2.Value := 0;
  Edit1.Text := '';
end;

procedure TfContasReceberDev.BitBtn1Click(Sender: TObject);
begin
  if CurrencyEdit1.Value > StrToFloat(FormatFloat('0.00',(DM1.tCReceberParcRestParcela.AsFloat))) then
    ShowMessage('Valor da devolução não pode ser maior que restante a receber!')
  else
  if CurrencyEdit1.value <= 0 then
    ShowMessage('Valor de devolução não pode ser zero!')
  else
    begin
      vEncComissao := False;
      if CheckBox1.Checked then
        if (DM1.tCReceberParcCodVendedor.AsInteger > 0) and (StrToFloat(FormatFloat('0.00',DM1.tCReceberParcPercComissao.AsFloat)) > 0) and
           ((DM1.tCReceberParclkTipoComissao.AsString = 'N') or (DM1.tCReceberParcPagarParteNaNota.AsBoolean)) then
          DM1.Verifica_ComissaoEnc(DM1.tCReceberParcCodVendedor.AsInteger,DateEdit1.Date);
      if not vEncComissao then
        begin
          if (CurrencyEdit1.value = StrToFloat(FormatFloat('0.00',(DM1.tCReceberParcVlrParcCReceber.AsFloat)))) and
             (CurrencyEdit1.value = StrToFloat(FormatFloat('0.00',(DM1.tCReceberParcRestParcela.AsFloat)))) then
            begin
              Pgto_Total;
              DM1.tCReceberParc.Locate('NumCReceber;ParcCReceber',VarArrayOf([DM1.tCReceberParcNumCReceber.AsInteger,DM1.tCReceberParcParcCReceber.AsInteger]),[loCaseInsensitive]);
            end
          else
            begin
              Pgto_Parcial;
              DM1.tCReceberParc.Locate('NumCReceber;ParcCReceber',VarArrayOf([DM1.tCReceberParcNumCReceber.AsInteger,DM1.tCReceberParcParcCReceber.AsInteger]),[loCaseInsensitive]);
            end;
        end;
    end;
end;

procedure TfContasReceberDev.CurrencyEdit2Enter(Sender: TObject);
begin
  DM1.tHistorico.IndexFieldNames := 'Codigo';
end;

procedure TfContasReceberDev.CurrencyEdit2Exit(Sender: TObject);
begin
  if CurrencyEdit2.Value > 0 then
    begin
      DM1.tHistorico.SetKey;
      DM1.tHistoricoCodigo.AsCurrency := CurrencyEdit2.Value;
      if DM1.tHistorico.GotoKey then
        Edit1.Text := DM1.tHistoricoNome.AsString
      else
        begin
          Edit1.Text := '';
          ShowMessage('Histórico não cadastrado!');
          CurrencyEdit2.SetFocus;
        end;
    end
  else
    Edit1.Text := '';
end;

procedure TfContasReceberDev.Edit1Change(Sender: TObject);
begin
  try
    tHistorico.IndexFieldNames := 'Nome';
    tHistorico.FindNearest([Edit1.Text]);
    CurrencyEdit2.Text := tHistoricoCodigo.AsString;
  except
  end;
end;

procedure TfContasReceberDev.RxDBLookupCombo1Change(Sender: TObject);
begin
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasReceberDev.RxDBLookupCombo1Enter(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Nome';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasReceberDev.RxDBLookupCombo1Exit(Sender: TObject);
begin
  tHistorico.IndexFieldNames := 'Codigo';
  Edit1.Text := RxDBLookupCombo1.Text;
  CurrencyEdit2.Text := tHistoricoCodigo.AsString;
end;

procedure TfContasReceberDev.SpeedButton1Click(Sender: TObject);
begin
  fHistorico := TfHistorico.Create(Self);
  fHistorico.ShowModal;
end;

procedure TfContasReceberDev.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if key = vk_F10 then
    BitBtn1Click(Sender);
end;

procedure TfContasReceberDev.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

end.
