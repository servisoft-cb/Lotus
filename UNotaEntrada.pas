unit UNotaEntrada;
                                                                                             
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, ComCtrls, Mask, Db, DBTables,
  ToolEdit, RXDBCtrl, RXLookup, MemTable, Grids, DBGrids, RXCtrls,
  RxCalc, CurrEdit, DBFilter, Menus, Printers, Variants, RxDBComb, RzDBCmbo;

type
  TfNotaEntrada = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn7: TBitBtn;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel5: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    RxLabel4: TRxLabel;
    DBEdit4: TDBEdit;
    RxCalculator1: TRxCalculator;
    SpeedButton9: TSpeedButton;
    Edit1: TEdit;
    Label6: TLabel;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    Panel4: TPanel;
    DBDateEdit2: TDBDateEdit;
    Label2: TLabel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit4: TCurrencyEdit;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    CurrencyEdit10: TCurrencyEdit;
    RxDBFilter1: TRxDBFilter;
    Bevel1: TBevel;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu2: TPopupMenu;
    Imprimir1: TMenuItem;
    Visualizar1: TMenuItem;
    tCPagarIns: TTable;
    tCPagarInsNumCPagar: TIntegerField;
    tCPagarInsNumNotaEnt: TIntegerField;
    tCPagarInsCodForn: TIntegerField;
    tCPagarInsQuitado: TBooleanField;
    tCPagarInsTipoDoc: TStringField;
    tCPagarInsDtGerado: TDateField;
    tCPagarInsHistorico: TStringField;
    tNEntradaParcIns: TTable;
    tNEntradaParcInsCodForn: TIntegerField;
    tNEntradaParcInsNumNEntr: TIntegerField;
    tNEntradaParcInsParcela: TSmallintField;
    tNEntradaParcInsDtVenc: TDateField;
    tNEntradaParcInsVlrVenc: TFloatField;
    tNEntradaParcInsBanco: TStringField;
    tNEntradaParcInsCheque: TStringField;
    tNEntradaItensIns: TTable;
    tNEntradaItensInsCodForn: TIntegerField;
    tNEntradaItensInsNumNEntr: TIntegerField;
    tNEntradaItensInsItem: TSmallintField;
    tNEntradaItensInsQtd: TFloatField;
    tNEntradaItensInsVlrUnit: TFloatField;
    tNEntradaItensInsVlrTotalItens: TFloatField;
    tNEntradaItensInsIcms: TFloatField;
    tNEntradaItensInsIpi: TFloatField;
    tNEntradaItensInsDesc: TFloatField;
    tNEntradaItensInsVlrDesc: TFloatField;
    tNEntradaItensInsVlrIpi: TFloatField;
    tNEntradaItensInsVlrIcms: TFloatField;
    tNEntradaItensInsBaseIcms: TFloatField;
    tNEntradaItensInsSitTrib: TSmallintField;
    tNEntradaItensInsIcmsIpi: TBooleanField;
    tNEntradaIns: TTable;
    tNEntradaInsNumNEntr: TIntegerField;
    tNEntradaInsCodForn: TIntegerField;
    tNEntradaInsSerie: TStringField;
    tNEntradaInsNumOC: TIntegerField;
    tNEntradaInsCondPgto: TStringField;
    tNEntradaInsDtEmissaoNEntr: TDateField;
    tNEntradaInsDtEntrada: TDateField;
    tNEntradaInsVlrTotalNEntr: TFloatField;
    tNEntradaInsBaseIcms: TFloatField;
    tNEntradaInsVlrIcms: TFloatField;
    tNEntradaInsVlrIpi: TFloatField;
    tNEntradaInsCodNatOper: TSmallintField;
    tNEntradaInsIcmsIpi: TBooleanField;
    tNEntradaInsPlanoContas: TIntegerField;
    tNEntradaItensMObraIns: TTable;
    tNEntradaItensMObraInsCodForn: TIntegerField;
    tNEntradaItensMObraInsNumNEntr: TIntegerField;
    tNEntradaItensMObraInsItem: TSmallintField;
    tNEntradaItensMObraInsCodigo: TSmallintField;
    tNEntradaItensMObraInsDescricao: TStringField;
    tNEntradaItensMObraInsQtd: TFloatField;
    tNEntradaItensMObraInsAliquota: TFloatField;
    tNEntradaItensMObraInsVlrUnit: TFloatField;
    tNEntradaItensMObraInsVlrTotal: TFloatField;
    tNEntradaItensMObraInsVlrIssqn: TFloatField;
    tNEntradaItensMObraInsInss: TFloatField;
    tNEntradaItensMObraInsIrf: TFloatField;
    tNEntradaParcInsNroDuplicata: TIntegerField;
    tCPagarInsNroDuplicata: TIntegerField;
    tNEntradaItensInsCodMaterial: TIntegerField;
    tNEntradaInsNroDuplicata: TIntegerField;
    tAuxNEntradaGrade: TTable;
    dsAuxNEntradaGrade: TDataSource;
    tAuxNEntradaGradeCodGrade: TIntegerField;
    tAuxNEntradaGradePosicao: TIntegerField;
    tAuxNEntradaGradeQtd: TFloatField;
    tAuxNEntradaGradeVlrUnitario: TFloatField;
    tAuxNEntradaGradeVlrTotal: TFloatField;
    tAuxNEntradaGradelkTamanho: TStringField;
    BitBtn16: TBitBtn;
    tNEntradaItensInsCodCor: TIntegerField;
    Label16: TLabel;
    Query1: TQuery;
    dsQuery1: TDataSource;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Query1Codigo: TIntegerField;
    Query1Nome: TStringField;
    BitBtn8: TBitBtn;
    DBEdit5: TDBEdit;
    RxLabel5: TRxLabel;
    DBEdit7: TDBEdit;
    Label21: TLabel;
    Edit2: TEdit;
    BitBtn9: TBitBtn;
    Bevel2: TBevel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Bevel4: TBevel;
    Label9: TLabel;
    Label26: TLabel;
    Label10: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label12: TLabel;
    SpeedButton8: TSpeedButton;
    Label22: TLabel;
    Label24: TLabel;
    Edit12: TEdit;
    CurrencyEdit1: TCurrencyEdit;
    BitBtn2: TBitBtn;
    RxDBLookupCombo3: TRxDBLookupCombo;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    RxDBLookupCombo4: TRxDBLookupCombo;
    DBGrid3: TDBGrid;
    TabSheet2: TTabSheet;
    Bevel5: TBevel;
    SpeedButton11: TSpeedButton;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    Bevel6: TBevel;
    DBMemo1: TDBMemo;
    tCPagarParc: TTable;
    dsCPagarParc: TDataSource;
    tCPagarParcNumCPagar: TIntegerField;
    tCPagarParcParcCPagar: TIntegerField;
    tCPagarParcDtVencCPagar: TDateField;
    tCPagarParcVlrParcCPagar: TFloatField;
    tCPagarParcQuitParcCPagar: TBooleanField;
    tCPagarParcDtPagParcCPagar: TDateField;
    tCPagarParcJurosParcCPagar: TFloatField;
    tCPagarParcCodForn: TIntegerField;
    tCPagarParcNumNotaEnt: TIntegerField;
    tCPagarParcDesconto: TFloatField;
    tCPagarParcPgtoParcial: TFloatField;
    tCPagarParcRestParcela: TFloatField;
    tCPagarParcBanco: TStringField;
    tCPagarParcPlanoContas: TIntegerField;
    tCPagarParcNroDuplicata: TIntegerField;
    tCPagarParcDespesas: TFloatField;
    tCPagarParcAbatimentos: TFloatField;
    tCPagarParcCodConta: TIntegerField;
    tCPagarParcDiasAtraso: TFloatField;
    tCPagarParcJurosPagos: TFloatField;
    tCPagarParcCodTipoCobranca: TIntegerField;
    tCPagarParclkBanco: TStringField;
    Bevel7: TBevel;
    SpeedButton17: TSpeedButton;
    CurrencyEdit11: TCurrencyEdit;
    CurrencyEdit12: TCurrencyEdit;
    Label25: TLabel;
    Label27: TLabel;
    SpeedButton2: TSpeedButton;
    Label28: TLabel;
    CurrencyEdit13: TCurrencyEdit;
    Label29: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    StaticText3: TStaticText;
    tCPagarParcDtRecto: TDateField;
    tCPagarParcCodAtelier: TIntegerField;
    tCPagarParcVlrDevolucao: TFloatField;
    tCPagarParcNumNossaNota: TIntegerField;
    Label31: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label30: TLabel;
    ComboBox1: TComboBox;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    Panel8: TPanel;
    Label1: TLabel;
    Label23: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Label8: TLabel;
    SpeedButton5: TSpeedButton;
    DBEdit1: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit6: TDBEdit;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label3: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label32: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label33: TLabel;
    tNEntradaParcInsNumSeq: TIntegerField;
    tNEntradaItensInsNumSeq: TIntegerField;
    tNEntradaInsNumSeq: TIntegerField;
    tNEntradaItensMObraInsNumSeq: TIntegerField;
    RxDBComboBox1: TRxDBComboBox;
    Label34: TLabel;
    RxDBComboBox3: TRxDBComboBox;
    Label35: TLabel;
    Label36: TLabel;
    DBText1: TDBText;
    Label37: TLabel;
    RxDBLookupCombo13: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure CurrencyEdit3Exit(Sender: TObject);
    procedure CurrencyEdit7Exit(Sender: TObject);
    procedure CurrencyEdit9Exit(Sender: TObject);
    procedure CurrencyEdit10Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Visualizar1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RxDBLookupCombo3Enter(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure tAuxNEntradaGradeBeforeInsert(DataSet: TDataSet);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure CurrencyEdit9Enter(Sender: TObject);
    procedure CurrencyEdit10Enter(Sender: TObject);
    procedure DBEdit7Enter(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2Enter(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure CurrencyEdit11Exit(Sender: TObject);
    procedure CurrencyEdit12Exit(Sender: TObject);
    procedure tAuxNEntradaGradeBeforePost(DataSet: TDataSet);
    procedure CurrencyEdit12Enter(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RxDBLookupCombo5KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBLookupCombo5Exit(Sender: TObject);
    procedure RxDBLookupCombo5Enter(Sender: TObject);
    procedure RxDBLookupCombo5CloseUp(Sender: TObject);
    procedure RxDBLookupCombo7Enter(Sender: TObject);
    procedure RxDBLookupCombo7Exit(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure tAuxNEntradaGradeNewRecord(DataSet: TDataSet);
    procedure RzDBLookupComboBox1CloseUp(Sender: TObject);
    procedure RzDBLookupComboBox1Enter(Sender: TObject);
    procedure RzDBLookupComboBox1Exit(Sender: TObject);
    procedure RzDBLookupComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Panel8Exit(Sender: TObject);
    procedure RxDBLookupCombo6Enter(Sender: TObject);
    procedure RxDBLookupCombo13Enter(Sender: TObject);
  private
    { Private declarations }
    vVlrVencimento : Real;
    procedure Grava_Pgto;
    procedure Habilita;
    procedure Calcula_ICMS;
    procedure Calcula_IPI;
    procedure Cancela_Pgto;
    procedure Compara_Valor_Parcelas;
    procedure Monta_Grade;
    procedure Soma_Estoque;
    procedure Diminui_Estoque;
    procedure Atualiza_Precos;
  public
    procedure Limpa_Edit;
    procedure Verifica_UF;
    procedure Verifica_Parcelas;
    { Public declarations }
  end;

var
  fNotaEntrada : TfNotaEntrada;
  vBaseICMS, vValorICMS, vValorIPI, vAliqICMS: Real;
  vSiglaUF : string[2];
  vProduto : LongInt;
  vValorParcelas, vOutrasDesp : Currency;
  vValorParcelaTot : String;
  vEdit : String[1];
  vNumOC, vItemOC, vItem : Integer;

implementation

uses UDM1, UFornecedores, URelNotaEntrada,
  UNatOperacao, UConsNotaEnt, UPlanoContas, UMaterial, UNotaEntradaGrade,
  USitTributaria, UBuscaOC, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfNotaEntrada.Atualiza_Precos;
begin
  DM1.tNEntradaItens.First;
  while not DM1.tNEntradaItens.Eof do
    begin
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsInteger := DM1.tNEntradaItensCodMaterial.AsInteger;
      if DM1.tMaterial.GotoKey then
        begin
          if DM1.tNEntradaItensCodCor.AsInteger > 0 then
            begin
              if DM1.tMaterialPrecoCor.AsBoolean then
                begin
                  if DM1.tMaterialCor.Locate('CodMaterial;CodCor',VarArrayOf([DM1.tNEntradaItensCodMaterial.AsInteger,DM1.tNEntradaItensCodCor.AsInteger]),[locaseinsensitive]) then
                    begin
                      if DM1.tNEntradaItensVlrUnit.AsFloat > DM1.tMaterialCorPrCusto.AsFloat then
                        begin
                          DM1.tMaterialCor.Edit;
                          DM1.tMaterialCorPrCusto.AsFloat := DM1.tNEntradaItensVlrUnit.AsFloat;
                          DM1.tMaterialCor.Post;
                        end;
                    end;
                end
              else
                begin
                  if DM1.tNEntradaItensVlrUnit.AsFloat > DM1.tMaterialPrCusto.AsFloat then
                    begin
                      DM1.tMaterial.Edit;
                      DM1.tMaterialPrCusto.AsFloat := DM1.tNEntradaItensVlrUnit.AsFloat;
                      DM1.tMaterial.Post;
                    end;
                end;
            end
          else
            begin
              if DM1.tNEntradaItensVlrUnit.AsFloat > DM1.tMaterialPrCusto.AsFloat then
                begin
                  DM1.tMaterial.Edit;
                  DM1.tMaterialPrCusto.AsFloat := DM1.tNEntradaItensVlrUnit.AsFloat;
                  DM1.tMaterial.Post;
                end;
            end;
        end;
      DM1.tNEntradaItens.Next;
    end;
end;

procedure TfNotaEntrada.Monta_Grade;
begin
  if vEdit <> 'S' then
    begin
      tAuxNEntradaGrade.First;
      while not tAuxNEntradaGrade.Eof do
        tAuxNEntradaGrade.delete;
      DM1.tOrdemCompraItemGrade.First;
      while not DM1.tOrdemCompraItemGrade.Eof do
        begin
          tAuxNEntradaGrade.Insert;
          tAuxNEntradaGradeCodGrade.AsInteger  := DM1.tOrdemCompraItemGradeCodGrade.AsInteger;
          tAuxNEntradaGradePosicao.AsInteger   := DM1.tOrdemCompraItemGradePosicao.AsInteger;
          tAuxNEntradaGradeQtd.AsFloat         := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtdRestante.AsFloat));
          tAuxNEntradaGradeVlrUnitario.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat));
          tAuxNEntradaGradeVlrTotal.AsFloat    := StrToFloat(FormatFloat('0.00',DM1.tOrdemCompraItemGradeVlrUnitario.AsFloat * DM1.tOrdemCompraItemQtdRestante.AsFloat));
          tAuxNEntradaGrade.Post;
          DM1.tOrdemCompraItemGrade.Next;
        end;
    end;
end;

procedure TfNotaEntrada.Limpa_Edit;
begin
  Edit1.Enabled            := True;
  RzDBLookupComboBox1.Visible := True;
  CurrencyEdit3.Clear;
  CurrencyEdit4.Clear;
  CurrencyEdit5.Clear;
  CurrencyEdit7.Clear;
  CurrencyEdit8.Clear;
  CurrencyEdit9.Clear;
  CurrencyEdit10.Clear;
  CurrencyEdit12.Clear;
  CurrencyEdit13.Clear;
  Edit1.Clear;
  Edit2.Clear;
  RzDBLookupComboBox1.ClearKeyValue;
  RxDBLookupCombo2.ClearValue;
  tAuxNEntradaGrade.First;
  while not tAuxNEntradaGrade.Eof do
    tAuxNEntradaGrade.Delete;
end;

procedure TfNotaEntrada.Calcula_ICMS;
var
  vValorDesc : Real;
  v51 : Boolean;
  vPerc_Dif : Real;
begin
  vBaseICMS  := 0;
  vValorICMS := 0;
  //vValorIPI  := 0;
  v51        := False;
  vPerc_Dif  := 0;
  if trim(RxDBLookupCombo13.Text) <> '' then
  begin
    vBaseICMS := StrToCurr(FormatCurr('0.00',(CurrencyEdit3.Value * CurrencyEdit7.Value) - CurrencyEdit10.Value));
    if DM1.tNEntradaItensIcmsIpi.AsBoolean then
      vBaseICMS := vBaseICMS + DM1.tNEntradaItensVlrIpi.AsFloat;
    if DM1.tSitTributaria.Locate('Codigo',RxDBLookupCombo13.Value,[loCaseInsensitive]) then
    begin
      if DM1.tSitTributariaCodSit.AsString = '51' then
      begin
        v51       := True;
        vPerc_Dif := StrToCurr(FormatCurr('0.0000',DM1.tSitTributariaPerc_Diferimento.AsFloat));
      end
      else
      if StrToCurr(FormatCurr('0.00',DM1.tSitTributariaSitTributaria.AsFloat)) = 0 then
        vBaseICMS := StrToCurr(FormatCurr('0.00',0))
      else
        vBaseICMS := StrToCurr(FormatCurr('0.00',(vBaseICMS * DM1.tSitTributariaSitTributaria.AsFloat) / 100));
    end;
    vValorICMS := StrToCurr(FormatCurr('0.00',(vBaseICMS * DM1.tNEntradaItensIcms.AsFloat) / 100));
    if (v51) and (StrToCurr(FormatCurr('0.00',vPerc_Dif)) > 0) then
      vValorICMS := StrToCurr(FormatCurr('0.00',(vValorICMS * (100 - vPerc_Dif)) / 100));
  end;
  ShowMessage('aqui');


  {if RxDBLookupCombo13.Text = '' then
    begin
      if CurrencyEdit5.Text <> '' then
        begin
          if DM1.tNEntradaItensIcmsIpi.AsBoolean then
            begin
              if CurrencyEdit9.Value > 0 then
                begin
                  vBaseICMS  := CurrencyEdit3.Value * CurrencyEdit7.Value;
                  vValorDesc := vBaseICMS * CurrencyEdit9.Value / 100;
                  vValorIPI  := (CurrencyEdit3.Value * CurrencyEdit7.Value) * CurrencyEdit5.Value / 100;
                  vBaseICMS  := vBaseICMS - vValorDesc + vValorIPI;
                end
              else
              if (CurrencyEdit9.Value <= 0) and (CurrencyEdit10.Value > 0) then
                begin
                  vBaseICMS := (CurrencyEdit3.Value * CurrencyEdit7.Value);
                  vValorIPI := (CurrencyEdit3.Value * CurrencyEdit7.Value) * CurrencyEdit5.Value / 100;
                  vBaseICMS := vBaseICMS - CurrencyEdit10.Value + vValorIPI;
                end
              else
                begin
                  vValorIPI := (CurrencyEdit3.Value * CurrencyEdit7.Value) * CurrencyEdit5.Value / 100;
                  vBaseICMS := (CurrencyEdit3.Value * CurrencyEdit7.Value) + vValorIPI;
                end;
            end
          else
          if not DM1.tNEntradaItensIcmsIpi.AsBoolean then
            begin
              if CurrencyEdit9.Value > 0 then
                begin
                  vBaseICMS  := CurrencyEdit3.Value * CurrencyEdit7.Value;
                  vValorDesc := vBaseICMS * CurrencyEdit9.Value / 100;
                  vBaseICMS  := vBaseICMS - vValorDesc;
                end
              else
              if (CurrencyEdit9.Value <= 0) and (CurrencyEdit10.Value > 0) then
                begin
                  vBaseICMS := CurrencyEdit3.Value * CurrencyEdit7.Value;
                  vBaseICMS := vBaseICMS - CurrencyEdit10.Value;
                end
              else
                vBaseICMS := CurrencyEdit3.Value * CurrencyEdit7.Value;
            end;
        end
      else
        begin
          if CurrencyEdit9.Value > 0 then
            begin
              vBaseICMS  := CurrencyEdit3.Value * CurrencyEdit7.Value;
              vValorDesc := vBaseICMS * CurrencyEdit9.Value / 100;
              vBaseICMS  := vBaseICMS - vValorDesc;
            end
          else
          if (CurrencyEdit9.Value <= 0) and (CurrencyEdit10.Value > 0) then
            begin
              vBaseICMS := CurrencyEdit3.Value * CurrencyEdit7.Value;
              vBaseICMS := vBaseICMS - CurrencyEdit10.Value;
            end
          else
            vBaseICMS := CurrencyEdit3.Value * CurrencyEdit7.Value;
        end;
      if CurrencyEdit4.Value <= 0 then
        vValorICMS := vBaseICMS * vAliqICMS / 100
      else
        vValorICMS := vBaseICMS * CurrencyEdit4.Value / 100;
    end
  else
    begin
      if DM1.tSitTributaria.Locate('Codigo',RxDBLookupCombo13.Value,[loCaseInsensitive]) then
        begin
          if CurrencyEdit5.Text <> '' then
            begin
              if DM1.tNEntradaItensIcmsIpi.AsBoolean then
                begin
                  if CurrencyEdit9.Value > 0 then
                    begin
                      vBaseICMS  := CurrencyEdit3.Value * CurrencyEdit7.Value;
                      vValorDesc := vBaseICMS * CurrencyEdit9.Value / 100;
                      vValorIPI  := (CurrencyEdit3.Value * CurrencyEdit7.Value) * CurrencyEdit5.Value / 100;
                      vBaseICMS  := (vBaseICMS - vValorDesc) * DM1.tSitTributariaSitTributaria.AsFloat / 100;
                      vBaseICMS  := vBaseICMS + vValorIPI;
                    end
                  else
                  if (CurrencyEdit9.Value <= 0) and (CurrencyEdit10.Value > 0) then
                    begin
                      vBaseICMS := CurrencyEdit3.Value * CurrencyEdit7.Value;
                      vValorIPI := (CurrencyEdit3.Value * CurrencyEdit7.Value) * CurrencyEdit5.Value / 100;
                      vBaseICMS := (vBaseICMS - CurrencyEdit10.Value) * DM1.tSitTributariaSitTributaria.AsFloat / 100;
                      vBaseICMS := vBaseICMS + vValorIPI;
                    end
                  else
                    begin
                      vValorIPI := (CurrencyEdit3.Value * CurrencyEdit7.Value) * CurrencyEdit5.Value / 100;
                      vBaseICMS := (CurrencyEdit3.Value * CurrencyEdit7.Value) * DM1.tSitTributariaSitTributaria.AsFloat / 100;
                      vBaseICMS := vBaseICMS + vValorIPI;
                    end
                end
              else
              if not DM1.tNEntradaItensIcmsIpi.AsBoolean then
                begin
                  if CurrencyEdit9.Value > 0 then
                    begin
                      vBaseICMS  := CurrencyEdit3.Value * CurrencyEdit7.Value;
                      vValorDesc := vBaseICMS * CurrencyEdit9.Value / 100;
                      vBaseICMS  := (vBaseICMS - vValorDesc) * DM1.tSitTributariaSitTributaria.AsFloat / 100;
                    end
                  else
                  if (CurrencyEdit9.Value <= 0) and (CurrencyEdit10.Value > 0) then
                    begin
                      vBaseICMS := CurrencyEdit3.Value * CurrencyEdit7.Value;
                      vBaseICMS := (vBaseICMS - CurrencyEdit10.Value) * DM1.tSitTributariaSitTributaria.AsFloat / 100;
                    end
                  else
                    vBaseICMS := ((CurrencyEdit3.Value * CurrencyEdit7.Value) + vValorIPI) * DM1.tSitTributariaSitTributaria.AsFloat / 100;
                end;
            end
          else
            begin
              if CurrencyEdit9.Value > 0 then
                begin
                  vBaseICMS  := CurrencyEdit3.Value * CurrencyEdit7.Value;
                  vValorDesc := vBaseICMS * CurrencyEdit9.Value / 100;
                  vBaseICMS  := vBaseICMS - vValorDesc * DM1.tSitTributariaSitTributaria.AsFloat / 100;
                end
              else
              if (CurrencyEdit9.Value <= 0) and (CurrencyEdit10.Value > 0) then
                begin
                  vBaseICMS := CurrencyEdit3.Value * CurrencyEdit7.Value;
                  vBaseICMS := vBaseICMS - CurrencyEdit10.Value * DM1.tSitTributariaSitTributaria.AsFloat / 100;
                end
              else
                vBaseICMS := (CurrencyEdit3.Value * CurrencyEdit7.Value) * DM1.tSitTributariaSitTributaria.AsFloat / 100;
            end;
          if CurrencyEdit4.Value <= 0 then
            vValorICMS := vBaseICMS * vAliqICMS / 100
          else
            vValorICMS := vBaseICMS * CurrencyEdit4.Value / 100;
        end
      else
        ShowMessage('Sit. Tributária não encontrada! ICMS não será calculado!');
    end;}
end;

procedure TfNotaEntrada.Calcula_IPI;
begin
  vValorIPI := 0;
  if CurrencyEdit5.Value > 0 then
    vValorIPI := (CurrencyEdit3.Value * CurrencyEdit7.Value) * CurrencyEdit5.Value / 100;
end;

procedure TfNotaEntrada.Verifica_UF;
begin
  DM1.tUF.SetKey;
  DM1.tUFSigla.AsString := DM1.tNEntradalkUF.AsString;
  if DM1.tUF.GotoKey then
    vAliqICMS := DM1.tUFPercentual.AsFloat;
  vSiglaUF := DM1.tNEntradalkUF.AsString;
end;

procedure TfNotaEntrada.Habilita;
begin
  Panel3.Enabled         := not(Panel3.Enabled);
  BitBtn1.Enabled        := not(BitBtn1.Enabled);
  BitBtn3.Enabled        := not(BitBtn3.Enabled);
  BitBtn4.Enabled        := not(BitBtn4.Enabled);
  BitBtn5.Enabled        := not(BitBtn5.Enabled);
  BitBtn6.Enabled        := not(BitBtn6.Enabled);
  BitBtn8.Enabled        := not(BitBtn8.Enabled);
  TabSheet1.Enabled      := not(TabSheet1.Enabled);
  TabSheet2.Enabled      := not(TabSheet2.Enabled);
  TabSheet3.Enabled      := not(TabSheet3.Enabled);
  DBNavigator1.Enabled   := not(DBNavigator1.Enabled);
  RxSpeedButton1.Enabled := not RxSpeedButton1.Enabled;
end;

procedure TfNotaEntrada.Grava_Pgto;
begin
  DM1.tCPagar.Refresh;
  tCPagarIns.Refresh;
  tCPagarIns.Last;
  if DM1.tNEntradaParc.RecordCount > 0 then
    begin
      DM1.tCPagar.Insert;
      DM1.tCPagarNumCPagar.AsInteger      := tCPagarInsNumCPagar.AsInteger + 1;
      DM1.tCPagarCodForn.AsInteger        := DM1.tNEntradaCodForn.AsInteger;
      DM1.tCPagarNumNotaEnt.AsInteger     := DM1.tNEntradaNumNEntr.AsInteger;
      DM1.tCPagarNroDuplicata.AsInteger   := DM1.tNEntradaNroDuplicata.AsInteger;
      DM1.tCPagarTipoDoc.AsString         := 'NE';
      DM1.tCPagarDtGerado.AsDateTime      := DM1.tNEntradaDtEntrada.AsDateTime;
      DM1.tCPagarDtEmissaoNota.AsDateTime := DM1.tNEntradaDtEmissaoNEntr.AsDateTime;
      DM1.tCPagarCodAtelier.AsInteger     := DM1.tNEntradaCodAtelier.AsInteger;
      DM1.tCPagarCodNatOper.AsInteger     := DM1.tNEntradaCodNatOper.AsInteger;
      DM1.tCPagarSerie.AsString           := DM1.tNEntradaSerie.AsString;
      DM1.tCPagarNumSeqNEntrada.AsInteger := DM1.tNEntradaNumSeq.AsInteger;

      DM1.tNEntradaParc.First;
      while not DM1.tNEntradaParc.Eof do
        begin
          DM1.tCPagarParc.Insert;
          DM1.tCPagarParcNumCPagar.AsInteger      := DM1.tCPagarNumCPagar.AsInteger;
          DM1.tCPagarParcParcCPagar.AsInteger     := DM1.tNEntradaParcParcela.AsInteger;
          DM1.tCPagarParcNroDuplicata.AsInteger   := DM1.tNEntradaParcNroDuplicata.AsInteger;
          DM1.tCPagarParcVlrParcCPagar.AsFloat    := DM1.tNEntradaParcVlrVenc.AsFloat;
          DM1.tCPagarParcRestParcela.AsFloat      := DM1.tNEntradaParcVlrVenc.AsFloat;
          DM1.tCPagarParcDtVencCPagar.AsDateTime  := DM1.tNEntradaParcDtVenc.AsDateTime;
          DM1.tCPagarParcCodForn.AsInteger        := DM1.tNEntradaCodForn.AsInteger;
          DM1.tCPagarParcNumNotaEnt.AsInteger     := DM1.tNEntradaNumNEntr.AsInteger;
          DM1.tCPagarParcPlanoContas.AsInteger    := DM1.tNEntradaPlanoContas.AsInteger;
          DM1.tCPagarParcCodConta.AsInteger       := DM1.tNEntradaParcCodBco.AsInteger;
          DM1.tCPagarParcCodAtelier.AsInteger     := DM1.tNEntradaCodAtelier.AsInteger;
          DM1.tCPagarParcSerie.AsString           := DM1.tNEntradaSerie.AsString;
          DM1.tCPagarParcNumSeqNEntrada.AsInteger := DM1.tNEntradaNumSeq.AsInteger;
          DM1.tCPagarParcDtGerado.AsDateTime      := DM1.tCPagarDtGerado.AsDateTime;
          DM1.tCPagarParcDtEmissaoNota.AsDateTime := DM1.tCPagarDtEmissaoNota.AsDateTime;

          DM1.tCPagarParc.Post;
          DM1.tCPagarVlrTotal.AsFloat            := DM1.tCPagarVlrTotal.AsFloat + StrToFloat(FormatFloat('0.00',DM1.tCPagarParcVlrParcCPagar.AsFloat));
          DM1.tNEntradaParc.Next;
        end;
      DM1.tCPagar.Post;
    end
  else
  if DM1.tNEntradaCondPgto.AsString = 'V' then
    begin
      DM1.tCPagar.Insert;
      DM1.tCPagarNumCPagar.AsInteger      := tCPagarInsNumCPagar.AsInteger + 1;
      DM1.tCPagarCodForn.AsInteger        := DM1.tNEntradaCodForn.AsInteger;
      DM1.tCPagarNumNotaEnt.AsInteger     := DM1.tNEntradaNumNEntr.AsInteger;
      DM1.tCPagarNroDuplicata.AsInteger   := DM1.tNEntradaNroDuplicata.AsInteger;
      DM1.tCPagarTipoDoc.AsString         := 'NE';
      DM1.tCPagarDtGerado.AsDateTime      := DM1.tNEntradaDtEntrada.AsDateTime;
      DM1.tCPagarDtEmissaoNota.AsDateTime := DM1.tNEntradaDtEmissaoNEntr.AsDateTime;
      DM1.tCPagarCodAtelier.AsInteger     := DM1.tNEntradaCodAtelier.AsInteger;
      DM1.tCPagarCodNatOper.AsInteger     := DM1.tNEntradaCodNatOper.AsInteger;
      DM1.tCPagarVlrTotal.AsFloat         := vVlrVencimento;
      DM1.tCPagarSerie.AsString           := DM1.tNEntradaSerie.AsString;
      DM1.tCPagarNumSeqNEntrada.AsInteger := DM1.tNEntradaNumSeq.AsInteger;
      DM1.tCPagar.Post;

      DM1.tCPagarParc.Insert;
      DM1.tCPagarParcNumCPagar.AsInteger      := DM1.tCPagarNumCPagar.AsInteger;
      DM1.tCPagarParcParcCPagar.AsInteger     := 1;
      DM1.tCPagarParcNroDuplicata.AsInteger   := DM1.tNEntradaNroDuplicata.AsInteger;
      DM1.tCPagarParcVlrParcCPagar.AsFloat    := vVlrVencimento;
      DM1.tCPagarParcRestParcela.AsFloat      := vVlrVencimento;
      DM1.tCPagarParcDtVencCPagar.AsDateTime  := DM1.tNEntradaDtEntrada.AsDateTime;
      DM1.tCPagarParcCodForn.AsInteger        := DM1.tNEntradaCodForn.AsInteger;
      DM1.tCPagarParcNumNotaEnt.AsInteger     := DM1.tNEntradaNumNEntr.AsInteger;
      DM1.tCPagarParcPlanoContas.AsInteger    := DM1.tNEntradaPlanoContas.AsInteger;
      DM1.tCPagarParcCodConta.AsInteger       := 0;
      DM1.tCPagarParcCodAtelier.AsInteger     := DM1.tNEntradaCodAtelier.AsInteger;
      DM1.tCPagarParcSerie.AsString           := DM1.tNEntradaSerie.AsString;
      DM1.tCPagarParcNumSeqNEntrada.AsInteger := DM1.tNEntradaNumSeq.AsInteger;
      DM1.tCPagarParcDtGerado.AsDateTime      := DM1.tCPagarDtGerado.AsDateTime;
      DM1.tCPagarParcDtEmissaoNota.AsDateTime := DM1.tCPagarDtEmissaoNota.AsDateTime;

      DM1.tCPagarParc.Post;
    end;
end;

procedure TfNotaEntrada.Verifica_Parcelas;
var
  vValorTotalStr : String;
begin
  if (DM1.tNEntradaParcDtVenc.AsString = '') or (DM1.tNEntradaParcVlrVenc.AsString = '') then
   begin
      DM1.tNEntradaParc.Cancel;
      vValorTotalStr := FormatFloat('0.00',DM1.tNEntradaParcParcela.AsFloat);
      Compara_Valor_Parcelas;
      if vValorParcelaTot <> vValorTotalStr then
        ShowMessage('Valor das Parcelas não confere com Total da Nota!');
      Abort;
   end
  else
    begin
      if DM1.tNEntradaParc.State = dsInsert then
        begin
          tNEntradaParcIns.Refresh;
          tNEntradaParcIns.Last;
          DM1.tNEntradaParcParcela.AsInteger := tNEntradaParcInsParcela.AsInteger + 1;
       end;
    end;
end;

procedure TfNotaEntrada.Compara_Valor_Parcelas;
begin
  vValorParcelas := 0;
  if DM1.tNEntradaParc.State in [dsEdit,dsInsert] then
    DM1.tNEntradaParc.Post;
  DM1.tNEntradaParc.First;
  while not DM1.tNEntradaParc.Eof do
    begin
      vValorParcelas := vValorParcelas + DM1.tNEntradaParcVlrVenc.AsFloat;
      DM1.tNEntradaParc.Edit;
      DM1.tNEntradaParcNumNEntr.AsInteger := DM1.tNEntradaNumNEntr.AsInteger;
      if DM1.tNEntradaParcNroDuplicata.AsInteger < 1 then
        DM1.tNEntradaParcNroDuplicata.AsInteger := DM1.tNEntradaNumNEntr.AsInteger;
      DM1.tNEntradaParc.Post;
      DM1.tNEntradaParc.Next;
    end;
  vValorParcelaTot := FormatFloat('0.00',vValorParcelas);
end;

procedure TfNotaEntrada.Cancela_Pgto;
begin
  if DM1.tNEntradaCondPgto.AsString = 'P' then
    begin
//  apaga o contas a pagar e as parcelas dele
      DM1.tCPagar.Filtered := False;
      //DM1.tCPagar.Filter   := 'NumNotaEnt = '''+DM1.tNEntradaNumNEntr.AsString+''' and codForn = '''+DM1.tNEntradaCodForn.AsString+'''';
      DM1.tCPagar.Filter   := 'NumSeqNEntrada = '''+DM1.tNEntradaNumSeq.AsString+''' and codForn = '''+DM1.tNEntradaCodForn.AsString+'''';
      DM1.tCPagar.Filtered := True;
      if not DM1.tCPagar.IsEmpty then
        begin
          DM1.tCPagarParc.First;
          while not DM1.tCPagarParc.Eof do
            DM1.tCPagarParc.Delete;
          DM1.tCPagar.Delete;
        end;
      DM1.tCPagar.Filtered := False;
    end
  else
  if DM1.tNEntradaCondPgto.AsString = 'V' then
    begin
      if DM1.tNEntradaParc.RecordCount < 0 then
        begin
          DM1.tCPagar.Filtered := False;
          //DM1.tCPagar.Filter   := 'NumNotaEnt = '''+DM1.tNEntradaNumNEntr.AsString+''' and codForn = '''+DM1.tNEntradaCodForn.AsString+'''';
          DM1.tCPagar.Filter   := 'NumSeqNEntrada = '''+DM1.tNEntradaNumSeq.AsString+''' and codForn = '''+DM1.tNEntradaCodForn.AsString+'''';
          DM1.tCPagar.Filtered := True;
          if not DM1.tCPagar.IsEmpty then
            begin
              DM1.tCPagarParc.First;
              while not DM1.tCPagarParc.Eof do
                DM1.tCPagarParc.Delete;
              DM1.tCPagar.Delete;
            end;
          DM1.tCPagar.Filtered := False;
        end;
    end;
end;

procedure TfNotaEntrada.Soma_Estoque;
var
  vNumMovEst : Integer;
begin
  DM1.tNEntradaItens.First;
  while not DM1.tNEntradaItens.Eof do
    begin
      //*** Grava movimento do estoque
      if DM1.tNEntradaItensNumMovEst.AsInteger > 0 then
        begin
          DM1.tEstoqueMatMov.SetKey;
          DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tNEntradaItensNumMovEst.AsInteger;
          if DM1.tEstoqueMatMov.GotoKey then
            begin
              DM1.tEstoqueMatMov.Refresh;
              DM2.tEstoqueMatMov2.Refresh;
              DM2.tEstoqueMatMov2.Last;
              vNumMovEst := DM2.tEstoqueMatMov2NumMov.AsInteger + 1;
            end
          else
            vNumMovEst := DM1.tNEntradaItensNumMovEst.AsInteger;
        end
      else
        begin
          DM1.tEstoqueMatMov.Refresh;
          DM2.tEstoqueMatMov2.Refresh;
          DM2.tEstoqueMatMov2.Last;
          vNumMovEst := DM2.tEstoqueMatMov2NumMov.AsInteger + 1;
        end;
      DM1.tEstoqueMatMov.Insert;
      DM1.tEstoqueMatMovNumMov.AsInteger      := vNumMovEst;
      DM1.tEstoqueMatMovCodMaterial.AsInteger := DM1.tNEntradaItensCodMaterial.AsInteger;
      DM1.tEstoqueMatMovCodCor.AsInteger      := DM1.tNEntradaItensCodCor.AsInteger;
      DM1.tEstoqueMatMovLargura.AsString      := DM1.tNEntradaItenslkLargura.AsString;
      DM1.tEstoqueMatMovDtMov.AsDateTime      := DM1.tNEntradaDtEntrada.AsDateTime;
      DM1.tEstoqueMatMovES.AsString           := 'E';
      DM1.tEstoqueMatMovTipoMov.AsString      := 'NTE';
      DM1.tEstoqueMatMovNumNota.AsInteger     := DM1.tNEntradaNumNEntr.AsInteger;
      DM1.tEstoqueMatMovCodCliForn.AsInteger  := DM1.tNEntradaCodForn.AsInteger;
      DM1.tEstoqueMatMovVlrUnitario.AsFloat   := DM1.tNEntradaItensVlrUnit.AsFloat;
      DM1.tEstoqueMatMovQtd.AsFloat           := DM1.tNEntradaItensQtd.AsFloat;
      DM1.tEstoqueMatMovQtd2.AsFloat          := DM1.tNEntradaItensQtd.AsFloat;
      DM1.tEstoqueMatMovUnidade.AsString      := DM1.tNEntradaItensUnidade.AsString;
      DM1.tEstoqueMatMovPercIcms.AsFloat      := DM1.tNEntradaItensIcms.AsFloat;
      DM1.tEstoqueMatMovPercIpi.AsFloat       := DM1.tNEntradaItensIpi.AsFloat;
      DM1.tEstoqueMatMovVlrDesconto.AsFloat   := (DM1.tNEntradaItensVlrDesc.AsFloat / DM1.tNEntradaItensQtd.AsFloat);
      DM1.tEstoqueMatMovMercado.AsString      := DM1.tNEntradaItensMercado.AsString;
      if DM1.tNEntradaItensNumOC.AsInteger > 0 then
        begin
          DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
          DM1.tOrdemCompra.SetKey;
          DM1.tOrdemCompraFilial.AsInteger := 1;
          DM1.tOrdemCompraCodigo.AsInteger := DM1.tNEntradaItensNumOC.AsInteger;
          if DM1.tOrdemCompra.GotoKey then
            begin
              if DM1.tOrdemCompraCodProd.AsInteger > 0 then
                DM1.tEstoqueMatMovCodProd.AsInteger := DM1.tOrdemCompraCodProd.AsInteger;
            end;
        end;
      DM1.tEstoqueMatMov.Post;
      DM1.tNEntradaItens.Edit;
      DM1.tNEntradaItensNumMovEst.AsInteger := DM1.tEstoqueMatMovNumMov.AsInteger;
      DM1.tNEntradaItens.Post;
      if DM1.tNEntradaItensCodGrade.AsInteger > 0 then
        begin
          DM1.tNEntradaItensGrade.First;
          while not DM1.tNEntradaItensGrade.Eof do
            begin
              //*** Grava movimento do estoque (grade)
              if DM1.tEstoqueMatMovGrade.FindKey([DM1.tEstoqueMatMovNumMov.AsInteger,DM1.tNEntradaItensGradelkTamanho.AsString]) then
                DM1.tEstoqueMatMovGrade.Edit
              else
              begin
                DM1.tEstoqueMatMovGrade.Insert;
                DM1.tEstoqueMatMovGradeNumMov.AsInteger   := DM1.tEstoqueMatMovNumMov.AsInteger;
                DM1.tEstoqueMatMovGradeTamanho.AsString   := DM1.tNEntradaItensGradelkTamanho.AsString;
                DM1.tEstoqueMatMovGradeQtd.AsInteger      := DM1.tEstoqueMatMovGradeQtd.AsInteger + DM1.tNEntradaItensGradeQtd.AsInteger;
                DM1.tEstoqueMatMovGradeQtd2.AsInteger     := DM1.tEstoqueMatMovGradeQtd2.AsInteger + DM1.tNEntradaItensGradeQtd.AsInteger;
              end;
              DM1.tEstoqueMatMovGrade.Post;
              DM1.tNEntradaItensGrade.Next;
            end;
        end;
      DM1.tNEntradaItens.Next;
    end;
end;

procedure TfNotaEntrada.Diminui_Estoque;
begin
  DM1.tNEntradaItens.First;
  while not DM1.tNEntradaItens.Eof do
    begin
      //*** Exclui o movimento do estoque
      DM1.tEstoqueMatMov.SetKey;
      DM1.tEstoqueMatMovNumMov.AsInteger := DM1.tNEntradaItensNumMovEst.AsInteger;
      if DM1.tEstoqueMatMov.GotoKey then
        begin
          DM1.tEstoqueMatMovGrade.First;
          while not DM1.tEstoqueMatMovGrade.Eof do
            DM1.tEstoqueMatMovGrade.Delete;
          DM1.tEstoqueMatMov.Delete;
        end;
      DM1.tNEntradaItens.Next;
    end;
end;

procedure TfNotaEntrada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Query1.Close;
  DM1.tFornecedores.IndexFieldNames := 'CodForn';
  if Screen.FormCount < 3 then
    begin
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      DM1.tContas.Close;
      DM1.tTipoCobranca.Close;
      DM1.tNatOperacao.Close;
      DM1.tOrdemCompra.Close;
      DM1.tOrdemCompraItem.Close;
      DM1.tOrdemCompraItemGrade.Close;
      DM1.tOrdemCompraNota.Close;
      DM1.tOrdemCompraNotaGrade.Close;
      DM1.tMaoDeObra.Close;
      DM1.tUF.Close;
      DM1.tCidade.Close;
      DM1.tMaterial.Close;
      DM1.tMaterialCor.Close;
      Dm1.tMovimentos.Close;
      DM1.tCor.Close;
      DM1.tNEntrada.Close;
      DM1.tNEntradaItens.Close;
      DM1.tNEntradaItensGrade.Close;
      DM1.tNEntradaParc.Close;
      DM1.tNEntradaItensMobra.Close;
      DM1.tFornecedores.Close;
      DM1.tSitTributaria.Close;
      DM1.tClasFiscal.Close;
      DM1.tAtelier.Close;
      DM1.tEstoqueMatMov.Close;
      DM1.tEstoqueMatMovGrade.Close;
      DM1.tPlanoContas.Close;
      DM1.tCondPgtoItem.Close;
      DM1.tCondPgto.Close;
      DM1.tCPagar.Close;
      DM1.tCPagarParc.Close;
      DM1.tCPagarParcHist.Close;
    end;
  Action := Cafree;
end;

procedure TfNotaEntrada.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioFornecedores.AsBoolean then
    begin
      fFornecedores := TfFornecedores.Create(Self);
      fFornecedores.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de fornecedores!');
end;

procedure TfNotaEntrada.SpeedButton4Click(Sender: TObject);
begin
  if DM1.tUsuarioMaterial.AsBoolean then
    begin
      fMaterial := TfMaterial.Create(Self);
      fMaterial.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de materiais!');
end;

procedure TfNotaEntrada.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfNotaEntrada.BitBtn1Click(Sender: TObject);
var
  vNum : Integer;
begin
  BitBtn8.Tag := 0;
  Habilita;
  DM1.tNEntrada.IndexFieldNames          := 'NumSeq';
  DM1.tNEntrada.Refresh;
  DM1.tNEntrada.Last;
  vNum := DM1.tNEntradaNumSeq.AsInteger;

  DM1.tNEntrada.Insert;
  DM1.tNEntradaNumSeq.AsInteger          := vNum + 1;
  DM1.tNEntradaTotalParcelas.AsInteger   := 3;
  DM1.tNEntradaDtEmissaoNEntr.AsDateTime := Date;
  DM1.tNEntradaDtEntrada.AsDateTime      := Date;
  DM1.tNEntradaIcmsIpi.AsBoolean         := DM1.tParametrosIcmsIpi.AsBoolean;
  RxDBComboBox1.ReadOnly                 := False;
  DM1.tNEntradaSerie.AsString            := 'UN';
  DM1.tNEntradaFilial.AsInteger          := 1;
  DM1.tNEntrada.Post;
  DM1.tNEntrada.Edit;

  DBEdit1.SetFocus;
  PageControl1.ActivePage                := TabSheet1;
  vEdit := 'N';
  vItem := 0;
end;

procedure TfNotaEntrada.BitBtn5Click(Sender: TObject);
begin
  vEdit := 'N';
  vItem := 0;
  CurrencyEdit11.Clear;
  CurrencyEdit12.Clear;
  Limpa_Edit;
  if BitBtn8.Tag = 0 then
    begin
      DM1.tNEntradaItens.First;
      while not DM1.tNEntradaItens.IsEmpty do
        begin
          if DM1.tNEntradaItensNumOC.AsInteger > 0 then
            begin
              Dm1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
              DM1.tOrdemCompra.SetKey;
              DM1.tOrdemCompraFilial.AsInteger := 1;
              DM1.tOrdemCompraCodigo.AsInteger := Dm1.tNEntradaItensNumOC.AsInteger;
              if DM1.tOrdemCompra.GotoKey then
                begin
                  DM1.tOrdemCompra.Edit;
                  DM1.tOrdemCompraEntregue.AsBoolean := False;
                  DM1.tOrdemCompra.Post;

                  Dm1.tOrdemCompraItem.IndexFieldNames := 'Filial;Codigo;Item';
                  Dm1.tOrdemCompraItem.SetKey;
                  DM1.tOrdemCompraItemFilial.AsInteger := DM1.tOrdemCompraFilial.AsInteger;
                  Dm1.tOrdemCompraItemCodigo.AsInteger := Dm1.tNEntradaItensNumOC.AsInteger;
                  Dm1.tOrdemCompraItemItem.AsInteger   := Dm1.tNEntradaItensItemOC.AsInteger;
                  if DM1.tOrdemCompraItem.GotoKey then
                    begin
                      Dm1.tOrdemCompraItem.Edit;
                      Dm1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdRestante.AsFloat + Dm1.tNEntradaItensQtd.AsFloat));
                      Dm1.tOrdemCompraItemQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdEntregue.AsFloat - Dm1.tNEntradaItensQtd.AsFloat));
                      if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) > StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat)) then
                        //StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat));
                        DM1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat));
                      Dm1.tOrdemCompraItem.Post;
                    end;
                end;
            end;
          while not Dm1.tNEntradaItensGrade.IsEmpty do
            begin
              Dm1.tOrdemCompraItemGrade.IndexFieldNames   := 'Filial;Codigo;Item;CodGrade;Posicao';
              Dm1.tOrdemCompraItemGrade.SetKey;
              Dm1.tOrdemCompraItemGradeFilial.AsInteger   := 1;
              Dm1.tOrdemCompraItemGradeCodigo.AsInteger   := Dm1.tNEntradaItensNumOC.AsInteger;
              Dm1.tOrdemCompraItemGradeItem.AsInteger     := Dm1.tNEntradaItensItemOC.AsInteger;
              Dm1.tOrdemCompraItemGradeCodGrade.AsInteger := Dm1.tNEntradaItensGradeCodGrade.AsInteger;
              Dm1.tOrdemCompraItemGradePosicao.AsInteger  := Dm1.tNEntradaItensGradePosicao.AsInteger;
              if Dm1.tOrdemCompraItemGrade.GotoKey then
                begin
                  Dm1.tOrdemCompraItemGrade.Edit;
                  Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat - Dm1.tNEntradaItensGradeQtd.AsFloat));
                  Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat + Dm1.tNEntradaItensGradeQtd.AsFloat));
                  if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtdRestante.AsFloat)) > StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtd.AsFloat)) then
                    DM1.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtd.AsFloat));
                  Dm1.tOrdemCompraItemGrade.Post;
                end;
              Dm1.tNEntradaItensGrade.Delete;
            end;
          DM1.tNEntradaItens.Delete;
        end;
      DM1.tNEntradaParc.First;
      if not DM1.tNEntradaParc.IsEmpty then
        while not DM1.tNEntradaParc.Eof do
          DM1.tNEntradaParc.Delete;
      if not DM1.tNEntradaItensMobra.IsEmpty then
        while not DM1.tNEntradaItensMobra.EOF do
          DM1.tNEntradaItensMobra.Delete;
      DM1.tNEntrada.Delete;
    end
  else
  if BitBtn8.Tag = 1 then
    begin
      Soma_Estoque;
      DM1.tNEntrada.Cancel;
    end;
  Habilita;
  RxDBComboBox1.ReadOnly := False;
  BitBtn8.Tag := 0;
end;

procedure TfNotaEntrada.BitBtn6Click(Sender: TObject);
var
  vValorTotalStr : string;
  vValorTotal    : Currency;
begin
  if DM1.tNEntradaParc.State in [dsEdit,dsInsert] then
    begin
      if DM1.tNEntradaParcVlrVenc.AsFloat > 0 then
        DM1.tNEntradaParc.Post
      else
        DM1.tNEntradaParc.Cancel;
    end;
  if (DM1.tNEntradaCodForn.AsString = '') or (RxDBLookupCombo1.Text = '') or (DM1.tNEntradaNumNEntr.AsInteger < 1) then
    begin
      ShowMessage('Você deve preencher os campos <Fornecedor> e <Nº Nota>!');
      exit;
    end;
  if RxDBLookupCombo6.Text = '' then
    begin
      ShowMessage('Deve haver uma Natureza de Operação digitada!');
      exit;
    end;
  if (DM1.tNEntradaCondPgto.AsString = 'N') and not(DM1.tNEntradaParc.IsEmpty) then
    begin
      ShowMessage('A cond.de pagamento escolhida não pode ter vencimentos!');
      exit;
    end;
  if (DM1.tNEntradaCondPgto.AsString = 'P') and (DM1.tNEntradaParc.IsEmpty) then
    begin
      ShowMessage('Você escolheu Cond.Pgto a Prazo, deve digitar as parcelas!');
      exit;
    end;

  if DM1.tNEntradaCondPgto.AsString <> 'N' then
    begin
      vValorTotal    := 0;
      vVlrVencimento := 0;
      case RxDBComboBox3.ItemIndex of
        0 : begin
              tNEntradaItensIns.First;
              while not tNEntradaItensIns.EOF do
                begin
                  vValorTotal := vValorTotal + tNEntradaItensInsVlrTotalItens.AsFloat;
                  tNEntradaItensIns.Next;
                end;
              vValorTotalStr := FormatFloat('0.00',vValorTotal);
            end;
        1 : begin
              DM1.tNEntradaItensMobra.First;
              while not DM1.tNEntradaItensMobra.EOF do
                begin
                  vValorTotal := vValorTotal + DM1.tNEntradaItensMobraVlrTotal.AsFloat;
                  DM1.tNEntradaItensMobra.Next;
                end;
              vValorTotalStr := FormatFloat('0.00',vValorTotal);
            end;
        2 : vValorTotalStr := FormatFloat('0.00',DM1.tNEntradaVlrTotalNEntr.AsFloat);
      end;
      vVlrVencimento := StrToFloat(vValorTotalStr);
    end;

  if DM1.tNEntradaParc.RecordCount > 0 then
    begin
      Compara_Valor_Parcelas;
      if vValorParcelaTot <> vValorTotalStr then
        begin
          ShowMessage('Valor das Parcelas não confere com Total da Nota de Entrada!');
          exit;
        end;
    end;
  if DM1.tNEntradaParc.State in [dsEdit,dsInsert] then
    DM1.tNEntradaParc.Post;
  DM1.tNEntradaParc.First;
  DM1.tNEntradaNroDuplicata.AsInteger := DM1.tNEntradaParcNroDuplicata.AsInteger;
  DM1.tNEntrada.Post;
  if DM1.tNEntradaItens.State in [dsEdit,dsInsert] then
    DM1.tNEntradaItens.Post;
  Soma_Estoque;
  if BitBtn8.Tag = 0 then
    Atualiza_Precos;
  BitBtn8.Tag := 0;
  if (DM1.tNEntradaCondPgto.AsString = 'P') or (DM1.tNEntradaCondPgto.AsString = 'V') then
    Grava_Pgto;
  Habilita;
  DM1.tNEntrada.Refresh;
  DM1.tNEntradaItens.Refresh;
  DM1.tNEntradaParc.Refresh;
  CurrencyEdit11.Clear;
  //if not DM1.tCPagar.Locate('CodForn;NumNotaEnt',VarArrayOf([DM1.tNEntradaCodForn.AsInteger,DM1.tNEntradaNumNEntr.AsInteger]),[locaseinsensitive]) then
  if not DM1.tCPagar.Locate('CodForn;NumSeqNEntrada',VarArrayOf([DM1.tNEntradaCodForn.AsInteger,DM1.tNEntradaNumSeq.AsInteger]),[locaseinsensitive]) then
    ShowMessage('Não foi gravada a nota no contas a pagar!');
end;

procedure TfNotaEntrada.BitBtn7Click(Sender: TObject);
var
  vEntregue : Boolean;
begin
  if RzDBLookupComboBox1.Text <> '' then
    vProduto := RzDBLookupComboBox1.KeyValue;
  if (CurrencyEdit3.Value <= 0) or (CurrencyEdit7.Value <= 0) or (DBEdit1.Text = '') or
     (vProduto = 0) or (Edit1.Text = '') or (RxDBLookupCombo1.Text = '') or (CurrencyEdit8.Value <= 0) then
    begin
      ShowMessage(' Há campos requeridos em branco, você deve acertar p/gravar' + #13 +
                  '"Quant.", "Valor Unitário", "Material", "Fornecedor" ou "Nº nota"');
      BitBtn6.SetFocus;
    end
  else
    begin
      if (Query1.Active) and (RxDBLookupCombo2.Text = '') and not(Query1.IsEmpty) then
        begin
          ShowMessage('Não pode ser confirmado este item s/ "Cor"!');
          RxDBLookupCombo2.SetFocus;
        end
      else
        begin
          Dm1.tMaterial.IndexFieldNames := 'Codigo';
          Dm1.tMaterial.SetKey;
          Dm1.tMaterialCodigo.AsInteger := RzDBLookupComboBox1.KeyValue;
          if Dm1.tMaterial.GotoKey then
            begin
              CurrencyEdit3Exit(Sender);
              CurrencyEdit7Exit(Sender);
              tNEntradaItensIns.Refresh;
              tNEntradaItensIns.Last;
              DM1.tNEntradaItens.Insert;
              DM1.tNEntradaItensNumSeq.AsInteger := DM1.tNEntradaNumSeq.AsInteger;
              if vEdit = 'S' then
                DM1.tNEntradaItensItem.AsInteger      := vItem
              else
                DM1.tNEntradaItensItem.AsInteger      := tNEntradaItensInsItem.AsInteger + 1;
              DM1.tNEntradaItensCodMaterial.AsInteger := vProduto;
              if RxDBLookupCombo2.Text <> '' then
                DM1.tNEntradaItensCodCor.AsInteger    := RxDBLookupCombo2.KeyValue;
              DM1.tNEntradaItensCodForn.AsInteger     := DM1.tNEntradaCodForn.AsInteger;
              DM1.tNEntradaItensNumNEntr.AsInteger    := DM1.tNEntradaNumNEntr.AsInteger;
              DM1.tNEntradaItensQtd.AsFloat           := CurrencyEdit3.Value;
              DM1.tNEntradaItensQtdPacote.AsFloat     := CurrencyEdit13.Value;
              DM1.tNEntradaItensUnidade.AsString      := Edit2.Text;
              DM1.tNEntradaItensICMS.AsFloat          := CurrencyEdit4.Value;
              DM1.tNEntradaItensIPI.AsFloat           := CurrencyEdit5.Value;
              DM1.tNEntradaItensVlrUnit.AsFloat       := CurrencyEdit7.Value;
              DM1.tNEntradaItensVlrTotalItens.AsFloat := CurrencyEdit8.Value;
              DM1.tNEntradaItensDesc.AsFloat          := CurrencyEdit9.Value;
              DM1.tNEntradaItensVlrDesc.AsFloat       := CurrencyEdit10.Value;
              DM1.tNEntradaItensSitTrib.AsString      := RxDBLookupCombo13.Value;
              DM1.tNEntradaItensIcmsIpi.AsBoolean     := DM1.tNEntradaIcmsIpi.AsBoolean;
              Dm1.tNEntradaItensNumOC.AsInteger       := CurrencyEdit11.AsInteger;
              Dm1.tNEntradaItensItemOC.AsInteger      := CurrencyEdit12.AsInteger;
              case ComboBox1.ItemIndex of
                0 : DM1.tNEntradaItensMercado.AsString := 'E';
                1 : DM1.tNEntradaItensMercado.AsString := 'I';
              end;
              vBaseIcms  := 0;
              vValorIcms := 0;
              Calcula_IPI;
              if CurrencyEdit4.Value > 0 then
                Calcula_ICMS;
              DM1.tNEntradaItensBaseICMS.AsFloat      := vBaseICMS;
              DM1.tNEntradaItensVlrICMS.AsFloat       := vValorICMS;
              DM1.tNEntradaItensVlrIPI.AsFloat        := vValorIPI;
              DM1.tNEntradaBaseICMS.AsFloat           := DM1.tNEntradaBaseICMS.AsFloat + vBaseICMS;
              DM1.tNEntradaVlrICMS.AsFloat            := DM1.tNEntradaVlrICMS.AsFloat + vValorICMS;
              DM1.tNEntradaVlrIPI.AsFloat             := DM1.tNEntradaVlrIPI.AsFloat + vValorIPI;
              DM1.tNEntradaVlrTotalNEntr.AsFloat      := DM1.tNEntradaVlrTotalNEntr.AsFloat + CurrencyEdit8.Value;
              tAuxNEntradaGrade.First;
              if not (tAuxNEntradaGrade.IsEmpty) and (Dm1.tMaterialLancaGrade.AsBoolean) then
                DM1.tNEntradaItensCodGrade.AsInteger  := tAuxNEntradaGradeCodGrade.AsInteger
              else
                DM1.tNEntradaItensCodGrade.AsInteger  := 0;
              DM1.tNEntradaItens.Post;
              //*** Baixa a Ordem de Compra
              if DM1.tNEntradaItensNumOC.AsInteger > 0 then
                begin
                  Dm1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
                  DM1.tOrdemCompra.SetKey;
                  DM1.tOrdemCompraFilial.AsInteger := 1;
                  DM1.tOrdemCompraCodigo.AsInteger := DM1.tNEntradaItensNumOC.AsInteger;
                  if DM1.tOrdemCompra.GotoKey then
                    begin
                      Dm1.tOrdemCompraItem.IndexFieldNames := 'Filial;Codigo;Item';
                      Dm1.tOrdemCompraItem.SetKey;
                      DM1.tOrdemCompraItemFilial.AsInteger := DM1.tOrdemCompraFilial.AsInteger;
                      DM1.tOrdemCompraItemCodigo.AsInteger := Dm1.tNEntradaItensNumOC.AsInteger;
                      DM1.tOrdemCompraItemItem.AsInteger   := Dm1.tNEntradaItensItemOC.AsInteger;
                      if DM1.tOrdemCompraItem.GotoKey then
                        begin
                          Dm1.tOrdemCompraItem.Edit;
                          Dm1.tOrdemCompraItemQtdEntregue.AsFloat      := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdEntregue.AsFloat + Dm1.tNEntradaItensQtd.AsFloat));
                          Dm1.tOrdemCompraItemQtdRestante.AsFloat      := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdRestante.AsFloat - Dm1.tNEntradaItensQtd.AsFloat));
                          if StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdRestante.AsFloat)) < 0 then
                            Dm1.tOrdemCompraItemQtdRestante.AsFloat := 0;
                          Dm1.tOrdemCompraItem.Post;
                        end;
                    end;
                end;
              //*** grava a grade nos itens
              if DM1.tMaterialLancaGrade.AsBoolean then
                begin
                  tAuxNEntradaGrade.First;
                  while not tAuxNEntradaGrade.IsEmpty do
                    begin
                      DM1.tNEntradaItensGrade.Insert;
                      DM1.tNEntradaItensGradeCodForn.AsInteger   := DM1.tNEntradaCodForn.AsInteger;
                      DM1.tNEntradaItensGradeNumNEntr.AsInteger  := DM1.tNEntradaNumNEntr.AsInteger;
                      DM1.tNEntradaItensGradeItem.AsInteger      := DM1.tNEntradaItensItem.AsInteger;
                      DM1.tNEntradaItensGradeCodGrade.AsInteger  := tAuxNEntradaGradeCodGrade.AsInteger;
                      DM1.tNEntradaItensGradePosicao.AsInteger   := tAuxNEntradaGradePosicao.AsInteger;
                      DM1.tNEntradaItensGradeQtd.AsInteger       := tAuxNEntradaGradeQtd.AsInteger;
                      DM1.tNEntradaItensGradeVlrUnitario.AsFloat := tAuxNEntradaGradeVlrUnitario.AsFloat;
                      DM1.tNEntradaItensGradeVlrTotal.AsFloat    := tAuxNEntradaGradeQtd.AsInteger * tAuxNEntradaGradeVlrUnitario.AsFloat;
                      DM1.tNEntradaItensGrade.Post;
                      if DM1.tNEntradaItensNumOc.AsInteger > 0 then
                        begin
                          Dm1.tOrdemCompraItemGrade.IndexFieldNames := 'Filial;Codigo;Item;CodGrade;Posicao';
                          Dm1.tOrdemCompraItemGrade.SetKey;
                          Dm1.tOrdemCompraItemGradeFilial.AsInteger   := 1;
                          Dm1.tOrdemCompraItemGradeCodigo.AsInteger   := CurrencyEdit11.AsInteger;
                          Dm1.tOrdemCompraItemGradeItem.AsInteger     := CurrencyEdit12.AsInteger;
                          Dm1.tOrdemCompraItemGradeCodGrade.AsInteger := tAuxNEntradaGradeCodGrade.AsInteger;
                          Dm1.tOrdemCompraItemGradePosicao.AsInteger  := tAuxNEntradaGradePosicao.AsInteger;
                          if Dm1.tOrdemCompraItemGrade.GotoKey then
                            begin
                              Dm1.tOrdemCompraItemGrade.Edit;
                              Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat - Dm1.tNEntradaItensGradeQtd.AsFloat));
                              Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat + Dm1.tNEntradaItensGradeQtd.AsFloat));
                              if Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat < 0 then
                                Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat := 0;
                              Dm1.tOrdemCompraItemGrade.Post;
                            end;
                        end;
                      tAuxNEntradaGrade.Delete;
                    end;
                end;
              if DM1.tNEntradaItensNumOC.AsInteger > 0 then
                begin
                  vEntregue := True;
                  DM1.tOrdemCompraItem.First;
                  while not DM1.tOrdemCompraItem.Eof do
                    begin
                      if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) > 0 then
                        vEntregue := False;
                      DM1.tOrdemCompraItem.Next;
                    end;
                  DM1.tOrdemCompra.Edit;
                  DM1.tOrdemCompraEntregue.AsBoolean := vEntregue;
                  DM1.tOrdemCompra.Post;
                  if vEntregue then
                    CurrencyEdit11.Clear;
                end;
              Limpa_Edit;
              if CurrencyEdit11.AsInteger > 0 then
                CurrencyEdit12.SetFocus
              else
                Edit1.SetFocus;
              vEdit := 'N';
              vItem := 0;
              Query1.Active := False;
            end;
        end;
    end;
  if not DM1.tNEntradaItens.IsEmpty then
    RxDBComboBox1.ReadOnly := True;
end;

procedure TfNotaEntrada.SpeedButton3Click(Sender: TObject);
begin
  Limpa_Edit;
  Query1.Active := False;
  Edit1.SetFocus;
  vItem := 0;
end;

procedure TfNotaEntrada.SpeedButton9Click(Sender: TObject);
begin
  if not DM1.tNEntradaItens.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir este material da nota?',mtConfirmation,
         [mbOK,mbNo],0) = mrOK then
        begin
          DM1.tNEntradaBaseICMS.AsFloat      := DM1.tNEntradaBaseICMS.AsFloat -
                                                DM1.tNEntradaItensBaseICMS.AsFloat;
          DM1.tNEntradaVlrICMS.AsFloat       := DM1.tNEntradaVlrICMS.AsFloat -
                                                DM1.tNEntradaItensVlrICMS.AsFloat;
          DM1.tNEntradaVlrTotalNEntr.AsFloat := DM1.tNEntradaVlrTotalNEntr.AsFloat -
                                                DM1.tNEntradaItensVlrTotalItens.AsFloat;
          DM1.tNEntradaVlrIPI.AsFloat        := DM1.tNEntradaVlrIPI.AsFloat -
                                                DM1.tNEntradaItensVlrIPI.AsFloat;

          if DM1.tNEntradaItensNumOC.AsInteger > 0 then
            begin
              Dm1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
              DM1.tOrdemCompra.SetKey;
              DM1.tOrdemCompraFilial.AsInteger := 1;
              DM1.tOrdemCompraCodigo.AsInteger := Dm1.tNEntradaItensNumOC.AsInteger;
              if DM1.tOrdemCompra.GotoKey then
                begin
                  DM1.tOrdemCompra.Edit;
                  DM1.tOrdemCompraEntregue.AsBoolean := False;
                  DM1.tOrdemCompra.Post;

                  Dm1.tOrdemCompraItem.IndexFieldNames := 'Filial;Codigo;Item';
                  Dm1.tOrdemCompraItem.SetKey;
                  DM1.tOrdemCompraItemFilial.AsInteger := DM1.tOrdemCompraFilial.AsInteger;
                  Dm1.tOrdemCompraItemCodigo.AsInteger := Dm1.tNEntradaItensNumOC.AsInteger;
                  Dm1.tOrdemCompraItemItem.AsInteger   := Dm1.tNEntradaItensItemOC.AsInteger;
                  if DM1.tOrdemCompraItem.GotoKey then
                    begin
                      Dm1.tOrdemCompraItem.Edit;
                      Dm1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdRestante.AsFloat + Dm1.tNEntradaItensQtd.AsFloat));
                      Dm1.tOrdemCompraItemQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdEntregue.AsFloat - Dm1.tNEntradaItensQtd.AsFloat));
                      if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) > StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat)) then
                        DM1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat));
                      Dm1.tOrdemCompraItem.Post;
                    end;
                end;
            end;
          while not Dm1.tNEntradaItensGrade.IsEmpty do
            begin
              Dm1.tOrdemCompraItemGrade.IndexFieldNames   := 'Filial;Codigo;Item;CodGrade;Posicao';
              Dm1.tOrdemCompraItemGrade.SetKey;
              Dm1.tOrdemCompraItemGradeFilial.AsInteger   := 1;
              Dm1.tOrdemCompraItemGradeCodigo.AsInteger   := Dm1.tNEntradaItensNumOC.AsInteger;
              Dm1.tOrdemCompraItemGradeItem.AsInteger     := Dm1.tNEntradaItensItemOC.AsInteger;
              Dm1.tOrdemCompraItemGradeCodGrade.AsInteger := Dm1.tNEntradaItensGradeCodGrade.AsInteger;
              Dm1.tOrdemCompraItemGradePosicao.AsInteger  := Dm1.tNEntradaItensGradePosicao.AsInteger;
              if Dm1.tOrdemCompraItemGrade.GotoKey then
                begin 
                  Dm1.tOrdemCompraItemGrade.Edit;
                  Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat - Dm1.tNEntradaItensGradeQtd.AsFloat));
                  Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat + Dm1.tNEntradaItensGradeQtd.AsFloat));
                  if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtdRestante.AsFloat)) > StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtd.AsFloat)) then
                    DM1.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtd.AsFloat));
                  Dm1.tOrdemCompraItemGrade.Post;
                end;
              Dm1.tNEntradaItensGrade.Delete;
            end;
          DM1.tNEntradaItens.Delete;
        end;
    end
  else
    ShowMessage('Não há o que apagar da nota!');
  if DM1.tNEntradaItens.IsEmpty then
    RxDBComboBox1.ReadOnly := False;
end;

procedure TfNotaEntrada.SpeedButton11Click(Sender: TObject);
begin
  RxCalculator1.Execute;
end;

procedure TfNotaEntrada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tNEntrada.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('Você deve cancelar ou confirmar nota de entrada antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfNotaEntrada.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esta Nota?',mtConfirmation,[mbOK,mbNO],0) = mrOK then
    begin
      // apaga os itens da nota de entrada
      Diminui_Estoque;
      DM1.tNEntradaItens.First;
      while not DM1.tNEntradaItens.IsEmpty do
        begin
          if DM1.tNEntradaItensNumOC.AsInteger > 0 then
            begin
              Dm1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
              DM1.tOrdemCompra.SetKey;
              DM1.tOrdemCompraFilial.AsInteger := 1;
              DM1.tOrdemCompraCodigo.AsInteger := Dm1.tNEntradaItensNumOC.AsInteger;
              if DM1.tOrdemCompra.GotoKey then
                begin
                  DM1.tOrdemCompra.Edit;
                  DM1.tOrdemCompraEntregue.AsBoolean := False;
                  DM1.tOrdemCompra.Post;
                  Dm1.tOrdemCompraItem.IndexFieldNames := 'Filial;Codigo;Item';
                  Dm1.tOrdemCompraItem.SetKey;
                  DM1.tOrdemCompraItemFilial.AsInteger := DM1.tOrdemCompraFilial.AsInteger;
                  Dm1.tOrdemCompraItemCodigo.AsInteger := Dm1.tNEntradaItensNumOC.AsInteger;
                  Dm1.tOrdemCompraItemItem.AsInteger   := Dm1.tNEntradaItensItemOC.AsInteger;
                  if DM1.tOrdemCompraItem.GotoKey then
                    begin
                      Dm1.tOrdemCompraItem.Edit;
                      Dm1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdRestante.AsFloat + Dm1.tNEntradaItensQtd.AsFloat));
                      Dm1.tOrdemCompraItemQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdEntregue.AsFloat - Dm1.tNEntradaItensQtd.AsFloat));
                      if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) > StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat)) then
                        DM1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat));
                      Dm1.tOrdemCompraItem.Post;
                    end;
                end;
            end;
          while not Dm1.tNEntradaItensGrade.IsEmpty do
            begin
              Dm1.tOrdemCompraItemGrade.IndexFieldNames   := 'Filial;Codigo;Item;CodGrade;Posicao';
              Dm1.tOrdemCompraItemGrade.SetKey;
              Dm1.tOrdemCompraItemGradeFilial.AsInteger   := 1;
              Dm1.tOrdemCompraItemGradeCodigo.AsInteger   := Dm1.tNEntradaItensNumOC.AsInteger;
              Dm1.tOrdemCompraItemGradeItem.AsInteger     := Dm1.tNEntradaItensItemOC.AsInteger;
              Dm1.tOrdemCompraItemGradeCodGrade.AsInteger := Dm1.tNEntradaItensGradeCodGrade.AsInteger;
              Dm1.tOrdemCompraItemGradePosicao.AsInteger  := Dm1.tNEntradaItensGradePosicao.AsInteger;
              if Dm1.tOrdemCompraItemGrade.GotoKey then
                begin
                  Dm1.tOrdemCompraItemGrade.Edit;
                  Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat - Dm1.tNEntradaItensGradeQtd.AsFloat));
                  Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat + Dm1.tNEntradaItensGradeQtd.AsFloat));
                  if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtdRestante.AsFloat)) > StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtd.AsFloat)) then
                    DM1.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtd.AsFloat));
                  Dm1.tOrdemCompraItemGrade.Post;
                end;
              Dm1.tNEntradaItensGrade.Delete;
            end;
          DM1.tNEntradaItens.Delete;
        end;
      // apaga as parcelas da nota de entrada
      while not DM1.tNEntradaParc.IsEmpty do
        DM1.tNEntradaParc.Delete;
      // apaga o contas a pagar ou o caixa
      Cancela_Pgto;
      // apaga os itens da mão-de-obra
      if not DM1.tNEntradaItensMObra.IsEmpty then
        while not DM1.tNEntradaItensMObra.Eof do
          DM1.tNEntradaItensMObra.Delete;
      // apaga a nota de entrada
      DM1.tNEntrada.Delete;
    end;
end;

procedure TfNotaEntrada.FormShow(Sender: TObject);
begin
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tContas.Open;
  DM1.tTipoCobranca.Open;
  DM1.tNatOperacao.Open;
  DM1.tOrdemCompra.Open;
  DM1.tOrdemCompraItem.Open;
  DM1.tOrdemCompraItemGrade.Open;
  DM1.tOrdemCompraNota.Open;
  DM1.tOrdemCompraNotaGrade.Open;
  DM1.tMaoDeObra.Open;
  DM1.tUF.Open;
  DM1.tCidade.Open;
  DM1.tMaterial.Open;
  DM1.tMaterialCor.Open;
  Dm1.tMovimentos.Open;
  DM1.tCor.Open;
  DM1.tNEntrada.Open;
  DM1.tNEntradaItens.Open;
  DM1.tNEntradaItensGrade.Open;
  DM1.tNEntradaParc.Open;
  DM1.tNEntradaItensMobra.Open;
  DM1.tFornecedores.Open;
  DM1.tSitTributaria.Open;
  DM1.tClasFiscal.Open;
  DM1.tAtelier.Open;
  DM1.tEstoqueMatMov.Open;
  DM1.tEstoqueMatMovGrade.Open;
  DM1.tPlanoContas.Open;
  DM1.tCondPgtoItem.open;
  DM1.tCondPgto.open;
  DM1.tCPagar.Open;
  DM1.tCPagarParc.Open;
  DM1.tCPagarParcHist.Open;
  DM1.tNatOperacao2.Open;

  DM1.tNEntrada.Refresh;
  DM1.tNEntradaItens.Refresh;
  DM1.tNEntradaParc.Refresh;
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfNotaEntrada.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text <> '' then
    begin
      DM1.tMaterial.IndexFieldNames := 'Codigo';
      DM1.tMaterial.SetKey;
      DM1.tMaterialCodigo.AsString  := Edit1.Text;
      if DM1.tMaterial.GotoKey then
        begin
          RzDBLookUpComboBox1.KeyValue  := DM1.tMaterialCodigo.AsInteger;
          vProduto                   := DM1.tMaterialCodigo.AsInteger;
          Edit2.Text                 := DM1.tMaterialUnidade.AsString;
          CurrencyEdit4.Value        := DM1.tMaterialICMS.AsCurrency;
          CurrencyEdit5.Value        := DM1.tMaterialIPI.AsCurrency;
          if (CurrencyEdit12.Value < 1) and (vEdit <> 'S') then
            Begin
              CurrencyEdit7.Value        := DM1.tMaterialPrCusto.AsCurrency;
              CurrencyEdit3.Value        := 1;
              CurrencyEdit8.Value        := DM1.tMaterialPrCusto.AsCurrency;
            end;
        end
      else
        begin
          ShowMessage('Material não encontrado, ou inativo!');
          Edit1.SetFocus;
        end;
    end;
end;

procedure TfNotaEntrada.RxDBLookupCombo1Exit(Sender: TObject);
begin
  Verifica_UF;
end;

procedure TfNotaEntrada.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tFornecedores.IndexFieldNames := 'NomeForn';
end;

procedure TfNotaEntrada.CurrencyEdit3Exit(Sender: TObject);
begin
  if (Edit1.Text <> '') and (RzDBLookupComboBox1.Text <> '') then
    begin
      if CurrencyEdit3.Value <= 0 then
        begin
          if MessageDlg('Quantidade não pode ser "0" ou inferior' +#13+
                        'Deseja cancelar a inserção deste item ?', mtConfirmation,
                        [mbOK,mbNO],0) = mrOK then
            begin
              Limpa_Edit;
              Edit1.SetFocus;
            end
          else
            CurrencyEdit3.SetFocus;
        end;
    end;
end;

procedure TfNotaEntrada.CurrencyEdit7Exit(Sender: TObject);
begin
  if (Edit1.Text <> '') and (RzDBLookupComboBox1.Text <> '') then
    begin
      if CurrencyEdit7.Value <= 0 then
        begin
          if MessageDlg('Valor Unitário não pode ser "0" ou menor' +#13+
                     'Deseja cancelar a inserção deste item ?', mtConfirmation,
                     [mbOK,mbNO],0) = mrOK then
            begin
              Limpa_Edit;
              Edit1.SetFocus;
            end
          else
            CurrencyEdit7.SetFocus;
        end
      else
        begin
          if CurrencyEdit5.Value > 0 then
            begin
              CurrencyEdit8.Value := CurrencyEdit3.Value * CurrencyEdit7.Value;
              CurrencyEdit8.Value := CurrencyEdit8.Value + CurrencyEdit8.Value * CurrencyEdit5.Value / 100;
            end
          else
            CurrencyEdit8.Value := CurrencyEdit3.Value * CurrencyEdit7.Value;
          CurrencyEdit9Exit(Sender);
          CurrencyEdit10Exit(Sender);
        end;
    end;
end;

procedure TfNotaEntrada.CurrencyEdit9Exit(Sender: TObject);
begin
  if CurrencyEdit9.Value > 0 then
    begin
      CurrencyEdit8.Value  := CurrencyEdit8.Value + CurrencyEdit8.Value * CurrencyEdit5.Value / 100;
      CurrencyEdit10.Value := CurrencyEdit8.Value * CurrencyEdit9.Value / 100;
      CurrencyEdit8.Value  := CurrencyEdit8.Value - CurrencyEdit10.Value;
    end;
end;

procedure TfNotaEntrada.CurrencyEdit10Exit(Sender: TObject);
begin
  if (CurrencyEdit9.Value = 0) and (CurrencyEdit10.Value > 0) then
    begin
      CurrencyEdit8.Value := CurrencyEdit8.Value + CurrencyEdit8.Value * CurrencyEdit5.Value / 100;
      CurrencyEdit8.Value := CurrencyEdit8.Value - CurrencyEdit10.Value;
    end;
end;

procedure TfNotaEntrada.SpeedButton5Click(Sender: TObject);
begin
  if DM1.tUsuarioNatOper.AsBoolean then
    begin
      fNatOperacao := TfNatOperacao.Create(Self);
      fNatOperacao.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir formulário de natureza de operação!');
end;

procedure TfNotaEntrada.BitBtn2Click(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
    begin
      if (CurrencyEdit6.Value > 0) and (Edit12.Text <> '') and (CurrencyEdit1.Value > 0) and (CurrencyEdit2.Value > 0) and (RxDBLookupCombo4.Text <> '') then
        begin
          tNEntradaItensMObraIns.Refresh;
          tNEntradaItensMObraIns.Last;
          DM1.tNEntradaItensMObra.Insert;
          DM1.tNEntradaItensMobraNumSeq.AsInteger     := DM1.tNEntradaNumSeq.AsInteger;
          DM1.tNEntradaItensMobraCodNatOper.AsInteger := RxDBLookupCombo4.KeyValue;
          DM1.tNEntradaItensMObraCodForn.AsInteger    := DM1.tNEntradaCodForn.AsInteger;
          DM1.tNEntradaItensMObraNumNEntr.AsInteger   := DM1.tNEntradaNumNEntr.AsInteger;
          DM1.tNEntradaItensMObraItem.AsInteger       := tNEntradaItensMObraInsItem.AsInteger + 1;
          DM1.tNEntradaItensMObraQtd.AsString         := CurrencyEdit6.Text;
          DM1.tNEntradaItensMObraDescricao.AsString   := Edit12.Text;
          DM1.tNEntradaItensMobraVlrUnit.AsFloat      := CurrencyEdit1.Value;
          DM1.tNEntradaItensMObraVlrTotal.AsFloat     := CurrencyEdit2.Value;
          DM1.tNEntradaVlrTotalNEntr.AsCurrency       := DM1.tNEntradaVlrTotalNEntr.AsCurrency +
                                                         DM1.tNEntradaItensMObraVlrTotal.AsCurrency;
          DM1.tNEntradaItensMObra.Post;
          SpeedButton6.Click;
          Edit12.SetFocus;
        end
      else
        begin
          ShowMessage('Deve haver: Mão-de-obra, quantidade mínima de 1 Valor Unítário, valor Total e Natureza de Operação!');
          Edit12.SetFocus;
        end;
    end
  else
    begin
      ShowMessage('Deve haver nº nota!');
      DBEdit1.SetFocus;
    end;
end;

procedure TfNotaEntrada.SpeedButton6Click(Sender: TObject);
begin
  Edit12.Clear;
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit6.Clear;
end;

procedure TfNotaEntrada.SpeedButton7Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir este serviço da nota?',mtConfirmation,
     [mbOK,mbNo],0) = mrOK then
    begin
      DM1.tNEntradaVlrTotalNEntr.AsCurrency := DM1.tNEntradaVlrTotalNEntr.AsCurrency -
                                               DM1.tNEntradaItensMObraVlrTotal.AsCurrency;
      DM1.tNEntradaItensMObra.Delete;
    end;
end;

procedure TfNotaEntrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if (Key = Vk_F2) and (DM1.tNEntrada.State in [dsBrowse]) then
    begin
      fConsNotaEnt := TfConsNotaEnt.Create(Self);
      fConsNotaEnt.ShowModal;
    end;
end;

procedure TfNotaEntrada.Visualizar1Click(Sender: TObject);
var
  vNumNE : integer;
begin
  //vNumNE                 := DM1.tNEntradaNumNEntr.AsInteger;
  vNumNE                 := DM1.tNEntradaNumSeq.AsInteger;
  DM1.tNEntrada.Filtered := False;
  DM1.tNEntrada.Filter   := 'NumSeq = '''+IntToStr(vNumNE)+'''';
  DM1.tNEntrada.Filtered := True;
  fRelNotaEntrada        := TfRelNotaEntrada.Create(Self);
  fRelNotaEntrada.QuickRep1.Preview;
  fRelNotaEntrada.QuickRep1.Free;
  DM1.tNEntrada.Filtered := False;
  DM1.tNEntrada.IndexFieldNames := 'NumSeq';
  DM1.tNEntrada.FindKey([vNumNE]);
end;

procedure TfNotaEntrada.SpeedButton8Click(Sender: TObject);
begin
  if DM1.tUsuarioPlanoCtas.AsBoolean then
    begin
      fPlanoContas := TfPlanoContas.Create(Self);
      fPlanoContas.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfNotaEntrada.RxDBLookupCombo3Enter(Sender: TObject);
begin
  DM1.tPlanoContas.IndexFieldNames := 'Descricao';
end;

procedure TfNotaEntrada.BitBtn16Click(Sender: TObject);
var
 vAux : Real;
begin
  if not DM1.tNEntradaItens.IsEmpty then
    begin
      if RzDBLookupComboBox1.Text = '' then
        begin
          vAux := 0;
          vEdit                              := 'S';
          vItem                              := DM1.tNEntradaItensItem.AsInteger;
          Edit1.Text                         := DM1.tNEntradaItensCodMaterial.AsString;
          RzDBLookupComboBox1.KeyValue          := DM1.tNEntradaItensCodMaterial.AsInteger;
          RxDBLookupCombo2Enter(Sender);
          if DM1.tNEntradaItensCodCor.AsInteger > 0 then
            RxDBLookupCombo2.KeyValue        := DM1.tNEntradaItensCodCor.AsInteger;
          Edit2.Text                         := DM1.tNEntradaItensUnidade.AsString;
          CurrencyEdit3.Value                := DM1.tNEntradaItensQtd.AsFloat;
          CurrencyEdit13.Value               := DM1.tNEntradaItensQtdPacote.AsFloat;
          CurrencyEdit4.Value                := DM1.tNEntradaItensIcms.AsFloat;
          CurrencyEdit5.Value                := DM1.tNEntradaItensIpi.AsFloat;
          if trim(DM1.tNEntradaItensSitTrib.AsString) <> '' then
            RxDBLookupCombo13.Value := DM1.tNEntradaItensSitTrib.AsString
          else
            RxDBLookupCombo13.ClearValue;
          CurrencyEdit7.Value                := DM1.tNEntradaItensVlrUnit.AsFloat;
          CurrencyEdit8.Value                := DM1.tNEntradaItensVlrTotalItens.AsFloat;
          CurrencyEdit9.Value                := DM1.tNEntradaItensDesc.AsFloat;
          CurrencyEdit10.Value               := DM1.tNEntradaItensVlrDesc.AsFloat;
          CurrencyEdit11.Value               := DM1.tNEntradaItensNumOC.AsInteger;
          CurrencyEdit12.Value               := DM1.tNEntradaItensItemOC.AsInteger;
          if DM1.tNEntradaItensMercado.AsString = 'I' then
            ComboBox1.ItemIndex := 1
          else
            ComboBox1.ItemIndex := 0;
          DM1.tNEntradaBaseICMS.AsFloat      := DM1.tNEntradaBaseICMS.AsFloat -
                                                DM1.tNEntradaItensBaseICMS.AsFloat;
          DM1.tNEntradaVlrICMS.AsFloat       := DM1.tNEntradaVlrICMS.AsFloat -
                                                DM1.tNEntradaItensVlrICMS.AsFloat;
          DM1.tNEntradaVlrIPI.AsFloat        := DM1.tNEntradaVlrIPI.AsFloat -
                                                DM1.tNEntradaItensVlrIPI.AsFloat;
          DM1.tNEntradaVlrTotalNEntr.AsFloat := DM1.tNEntradaVlrTotalNEntr.AsFloat - DM1.tNEntradaItensVlrTotalItens.AsFloat;

          tAuxNEntradaGrade.First;
          while not tAuxNEntradaGrade.EOF do
            tAuxNEntradaGrade.Delete;
          if DM1.tNEntradaItensCodGrade.AsInteger > 0 then
            begin
              DM1.tGrade.IndexFieldNames := 'Codigo';
              DM1.tGrade.FindKey([DM1.tNEntradaItensCodGrade.AsInteger]);
            end;
          DM1.tNEntradaItensGrade.First;
          //*** Volta a Ordem de Compra
          if DM1.tNEntradaItensNumOC.AsInteger > 0 then
            begin
              Dm1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
              DM1.tOrdemCompra.SetKey;
              DM1.tOrdemCompraFilial.AsInteger := 1;
              DM1.tOrdemCompraCodigo.AsInteger := Dm1.tNEntradaItensNumOC.AsInteger;
              if DM1.tOrdemCompra.GotoKey then
                begin
                  DM1.tOrdemCompra.Edit;
                  DM1.tOrdemCompraEntregue.AsBoolean := False;
                  DM1.tOrdemCompra.Post;

                  Dm1.tOrdemCompraItem.IndexFieldNames := 'Filial;Codigo;Item';
                  Dm1.tOrdemCompraItem.SetKey;
                  DM1.tOrdemCompraItemFilial.AsInteger := DM1.tOrdemCompraFilial.AsInteger;
                  Dm1.tOrdemCompraItemCodigo.AsInteger := Dm1.tNEntradaItensNumOC.AsInteger;
                  Dm1.tOrdemCompraItemItem.AsInteger   := Dm1.tNEntradaItensItemOC.AsInteger;
                  if DM1.tOrdemCompraItem.GotoKey then
                    begin
                      Dm1.tOrdemCompraItem.Edit;
                      Dm1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdRestante.AsFloat + Dm1.tNEntradaItensQtd.AsFloat));
                      Dm1.tOrdemCompraItemQtdEntregue.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemQtdEntregue.AsFloat - Dm1.tNEntradaItensQtd.AsFloat));
                      if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) > StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat)) then
                        DM1.tOrdemCompraItemQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtd.AsFloat));
                      Dm1.tOrdemCompraItem.Post;
                    end;
                end;
            end;
          while not DM1.tNEntradaItensGrade.EOF do
            begin
              tAuxNEntradaGrade.Insert;
              tAuxNEntradaGradeCodGrade.AsInteger  := DM1.tNEntradaItensGradeCodGrade.AsInteger;
              tAuxNEntradaGradePosicao.AsInteger   := DM1.tNEntradaItensGradePosicao.AsInteger;
              tAuxNEntradaGradeQtd.asFloat         := StrToFloat(FormatFloat('0.00000',DM1.tNEntradaItensGradeQtd.AsFloat));
              tAuxNEntradaGradeVlrUnitario.AsFloat := DM1.tNEntradaItensGradeVlrUnitario.AsFloat;
              tAuxNEntradaGradeVlrTotal.AsFloat    := DM1.tNEntradaItensGradeVlrUnitario.AsFloat * DM1.tNEntradaItensGradeQtd.AsFloat;
              vAux := vAux + DM1.tNEntradaItensGradeQtd.AsFloat;
              tAuxNEntradaGrade.Post;
              Dm1.tOrdemCompraItemGrade.IndexFieldNames   := 'Filial;Codigo;Item;CodGrade;Posicao';
              Dm1.tOrdemCompraItemGrade.SetKey;
              Dm1.tOrdemCompraItemGradeFilial.AsInteger   := 1;
              Dm1.tOrdemCompraItemGradeCodigo.AsInteger   := Dm1.tNEntradaItensNumOC.AsInteger;
              Dm1.tOrdemCompraItemGradeItem.AsInteger     := Dm1.tNEntradaItensItemOC.AsInteger;
              Dm1.tOrdemCompraItemGradeCodGrade.AsInteger := Dm1.tNEntradaItensGradeCodGrade.AsInteger;
              Dm1.tOrdemCompraItemGradePosicao.AsInteger  := Dm1.tNEntradaItensGradePosicao.AsInteger;
              if Dm1.tOrdemCompraItemGrade.GotoKey then
                begin
                  Dm1.tOrdemCompraItemGrade.Edit;
                  Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat := Dm1.tOrdemCompraItemGradeQtdEntregue.AsFloat -
                                                                  Dm1.tNEntradaItensGradeQtd.AsFloat;
                  Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',Dm1.tOrdemCompraItemGradeQtdRestante.AsFloat + Dm1.tNEntradaItensGradeQtd.AsFloat));
                  if DM1.tOrdemCompraItemGradeQtdRestante.AsFloat > DM1.tOrdemCompraItemGradeQtd.AsFloat then
                    DM1.tOrdemCompraItemGradeQtdRestante.AsFloat := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemGradeQtd.AsFloat));
                  Dm1.tOrdemCompraItemGrade.Post;
                end;
              DM1.tNEntradaItensGrade.Delete;
            end;
          if vAux > 0 then
            CurrencyEdit3.Value := vAux;
          DM1.tNEntradaItens.Delete;
          RzDbLookUpComboBox1.SetFocus;
        end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfNotaEntrada.tAuxNEntradaGradeBeforeInsert(DataSet: TDataSet);
var
 icount : integer;
begin
  i2 := 0;
  icount := tAuxNEntradaGrade.RecordCount;
  if icount >= DM1.tGradeItem.RecordCount then
    begin
      fNotaEntradaGrade.BitBtn5.SetFocus;
      Abort;
    end;
end;

procedure TfNotaEntrada.RxDBLookupCombo2Enter(Sender: TObject);
begin
  if RzDBLookupComboBox1.Text <> '' then
    begin
      Query1.Active := False;
      Query1.Params[0].AsInteger := RzDBLookupComboBox1.KeyValue;
      Query1.Active := True;
    end;
end;

procedure TfNotaEntrada.BitBtn8Click(Sender: TObject);
var
  Altera : Boolean;
begin
  BitBtn8.Tag := 1;
  vItem       := 0;
  Altera      := True;
  DM1.tNEntradaParc.First;
  while not DM1.tNEntradaParc.EOF do
    begin
      if tCPagarParc.Locate('ParcCPagar;CodForn;NumNotaEnt',VarArrayOf([DM1.tNEntradaParcParcela.AsInteger,
                                                                                   DM1.tNEntradaParcCodForn.AsInteger,DM1.tNEntradaParcNumNEntr.AsInteger]),[locaseinsensitive]) then
        begin
          if (tCPagarParcNumNotaEnt.AsInteger <> DM1.tNEntradaParcNumNEntr.AsInteger) or (tCPagarParcParcCPagar.AsInteger <> DM1.tNEntradaParcParcela.AsInteger) or
            (tCPagarParcDtVencCPagar.AsDateTime <> DM1.tNEntradaParcDtVenc.AsDateTime) or (tCPagarParcVlrParcCPagar.AsFloat <> DM1.tNEntradaParcVlrVenc.AsFloat) or
            (tCPagarParcCodConta.AsInteger <> DM1.tNEntradaParcCodBco.AsInteger) or (tCPagarParcPgtoParcial.AsFloat > 0) or
            (tCPagarParcVlrDevolucao.AsFloat > 0) then
              Altera := False;
        end
      else
        Altera := True;
      DM1.tNEntradaParc.Next;
    end;
  if not Altera then
    ShowMessage('Esta Nota já foi alterada no Ctas. a Pagar!');
  if (Altera) and (DM1.tNEntradaDevolvida.AsBoolean) then
    begin
      ShowMessage('Nota foi devolvida não pode ser alterada');
      Altera := False;
    end;
  if Altera = True then
    begin
      Habilita;
      Cancela_Pgto;
      DM1.tNEntrada.Edit;
      Diminui_Estoque;
    end;
end;

procedure TfNotaEntrada.CurrencyEdit9Enter(Sender: TObject);
begin
  CurrencyEdit8.Value := CurrencyEdit8.Value + CurrencyEdit10.Value;
end;

procedure TfNotaEntrada.CurrencyEdit10Enter(Sender: TObject);
begin
  if (CurrencyEdit9.Value = 0) and (CurrencyEdit10.Value > 0) then
    CurrencyEdit8.Value := CurrencyEdit8.Value + CurrencyEdit10.Value;
end;

procedure TfNotaEntrada.DBEdit7Enter(Sender: TObject);
begin
  vOutrasDesp := DM1.tNEntradaOutrasDesp.AsFloat;
end;

procedure TfNotaEntrada.DBEdit7Exit(Sender: TObject);
begin
  DM1.tNEntradaVlrTotalNEntr.AsFloat := DM1.tNEntradaVlrTotalNEntr.AsFloat - vOutrasDesp + DM1.tNEntradaOutrasDesp.AsFloat;
end;

procedure TfNotaEntrada.CurrencyEdit1Exit(Sender: TObject);
begin
  CurrencyEdit2.Value := CurrencyEdit1.Value * CurrencyEdit6.Value;
end;

procedure TfNotaEntrada.BitBtn9Click(Sender: TObject);
begin
  if DM1.tUsuarioSitTrib.AsBoolean then
    begin
      fSitTributaria := TfSitTributaria.Create(Self);
      fSitTributaria.ShowModal;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfNotaEntrada.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_F2 then
    begin
      if RxDBLookupCombo1.LookupDisplay = 'NomeForn' then
        begin
           RxDBLookupCombo1.CloseUp(True);
           RxDBLookupCombo1.LookupDisplay    := 'Fantasia';
           DM1.tFornecedores.IndexFieldNames := 'Fantasia';
           DM1.tFornecedores.Refresh;
           Label23.Caption := 'Fantasia';
        end
      else
      if RxDBLookupCombo1.LookupDisplay = 'Fantasia' then
        begin
          RxDBLookupCombo1.CloseUp(True);
          RxDBLookupCombo1.LookupDisplay    := 'NomeForn';
          DM1.tFornecedores.IndexFieldNames := 'NomeForn';
          DM1.tFornecedores.Refresh;
          Label23.Caption := 'Nome';
        end;
    end;
end;

procedure TfNotaEntrada.DBGrid2Enter(Sender: TObject);
begin
  if DM1.tNEntradaNumNEntr.AsString = '' then
    begin
      ShowMessage('É obrigatório informar nº da nota!');
      DBEdit1.SetFocus;
    end;
end;

procedure TfNotaEntrada.SpeedButton17Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
  begin
    fBuscaOC := TfBuscaOC.Create(Self);
    //DM1.tOrdemCompra.IndexFieldNames  := 'CodFornecedor';
    //fBuscaOC.RxDBLookupCombo1.KeyValue := RxDBLookupCombo1.KeyValue;
    fBuscaOC.ShowModal;
    if CurrencyEdit11.AsInteger > 0 then
      CurrencyEdit12.SetFocus;
  end
  else
    ShowMessage('Falta informar o fornecedor!');
end;

procedure TfNotaEntrada.CurrencyEdit11Exit(Sender: TObject);
begin
  if CurrencyEdit11.AsInteger > 0 then
    begin
      DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
      DM1.tOrdemCompra.SetKey;
      DM1.tOrdemCompraFilial.AsInteger := 1;
      DM1.tOrdemCompraCodigo.AsInteger := CurrencyEdit11.AsInteger;
      if DM1.tOrdemCompra.GotoKey then
        begin
          if (DM1.tOrdemCompraEntregue.AsBoolean) then
            begin
              ShowMessage('Esta ordem de compra já foi entregue!');
              CurrencyEdit11.AsInteger := 0;
              CurrencyEdit11.SetFocus;
            end
          else
          if (DM1.tOrdemCompraCodFornecedor.AsInteger <> DM1.tNEntradaCodForn.AsInteger) then
            begin
              ShowMessage('Fornecedor diferente da nota');
              CurrencyEdit11.AsInteger := 0;
              CurrencyEdit11.SetFocus;
            end;
         end
       else
         begin
           ShowMessage('Ordem de compra não cadastrada');
           CurrencyEdit11.AsInteger := 0;
           CurrencyEdit11.SetFocus;
        end;
    end;
end;

procedure TfNotaEntrada.CurrencyEdit12Exit(Sender: TObject);
begin
  Edit1.Enabled            := True;
  RzDBLookupComboBox1.Enabled := True;
  if vEdit <> 'S' then
    begin
      if (CurrencyEdit11.AsInteger < 1) and (CurrencyEdit12.AsInteger > 0) then
        begin
          ShowMessage('Não pode informar o item sem o número da ordem de compra!');
          CurrencyEdit12.AsInteger := 0;
          CurrencyEdit12.SetFocus;
        end
      else
      if (CurrencyEdit11.AsInteger > 0) and (CurrencyEdit12.AsInteger > 0) then
        begin
          DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
          DM1.tOrdemCompra.SetKey;
          DM1.tOrdemCompraFilial.AsInteger := 1;
          DM1.tOrdemCompraCodigo.AsInteger := CurrencyEdit11.AsInteger;
          if (DM1.tOrdemCompra.GotoKey) and (DM1.tOrdemCompraEntregue.AsBoolean <> True) and
             (DM1.tOrdemCompraCodFornecedor.AsInteger = DM1.tNEntradaCodForn.AsInteger) then
            begin
              DM1.tOrdemCompraItem.IndexFieldNames := 'Filial;Codigo;Item';
              DM1.tOrdemCompraItem.SetKey;
              DM1.tOrdemCompraItemFilial.AsInteger := DM1.tOrdemCompraFilial.AsInteger;
              DM1.tOrdemCompraItemCodigo.AsInteger := CurrencyEdit11.AsInteger;
              DM1.tOrdemCompraItemItem.AsInteger   := CurrencyEdit12.AsInteger;
              if DM1.tOrdemCompraItem.GotoKey then
                begin
                  if StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat)) > 0 then
                    begin
                      Edit1.Text   := DM1.tOrdemCompraItemCodMaterial.AsString;
                      Edit1Exit(Sender);
                      RxDBLookupCombo5Exit(Sender);
                      RxDBLookupCombo2Enter(Sender);
                      if DM1.tOrdemCompraItemCodCor.AsInteger > 0 then
                        RxDBLookupCombo2.KeyValue := DM1.tOrdemCompraItemCodCor.AsInteger;
                      Edit2.Text          := DM1.tOrdemCompraItemUnidade.AsString;
                      CurrencyEdit3.Value := StrToFloat(FormatFloat('0.00000',DM1.tOrdemCompraItemQtdRestante.AsFloat));
                      CurrencyEdit7.Value := DM1.tOrdemCompraItemVlrUnitario.AsFloat;
                      if CurrencyEdit7.Value > 0 then
                        CurrencyEdit7Exit(Sender);
                      Edit1.Enabled            := False;
                      RzDBLookupComboBox1.Enabled := False;
                      if DM1.tOrdemCompraItemCodGrade.AsInteger > 0 then
                        begin
                          DM1.tGrade.IndexFieldNames := 'Codigo';
                          DM1.tGrade.FindKey([DM1.tOrdemCompraItemCodGrade.AsInteger]);
                          Monta_Grade;
                          fNotaEntradaGrade := tfNotaEntradaGrade.Create(Self);
                          fNotaEntradaGrade.ShowModal;
                        end;
                    end
                  else
                    begin
                      ShowMessage('Este item da ordem de compra já foi entregue!');
                      CurrencyEdit12.AsInteger := 0;
                      CurrencyEdit12.SetFocus;
                    end
                 end
              else
                begin
                  ShowMessage('Item não cadastrado');
                  CurrencyEdit12.AsInteger := 0;
                  CurrencyEdit12.SetFocus;
                end;
            end;
        end;
    end;
end;

procedure TfNotaEntrada.tAuxNEntradaGradeBeforePost(DataSet: TDataSet);
begin
  if CurrencyEdit11.AsInteger > 0 then
    begin
      DM1.tOrdemCompra.IndexFieldNames := 'Filial;Codigo';
      DM1.tOrdemCompra.SetKey;
      DM1.tOrdemCompraFilial.AsInteger := 1;
      DM1.tOrdemCompraCodigo.AsInteger := CurrencyEdit11.AsInteger;
      if (DM1.tOrdemCompra.GotoKey) and (DM1.tOrdemCompraEntregue.AsBoolean <> True) and
         (DM1.tOrdemCompraCodFornecedor.AsInteger = DM1.tNEntradaCodForn.AsInteger) then
        begin
          DM1.tOrdemCompraItem.IndexFieldNames := 'Filial;Codigo;Item';
          DM1.tOrdemCompraItem.SetKey;
          DM1.tOrdemCompraItemFilial.AsInteger := DM1.tOrdemCompraFilial.AsInteger;
          DM1.tOrdemCompraItemCodigo.AsInteger := CurrencyEdit11.AsInteger;
          DM1.tOrdemCompraItemItem.AsInteger   := CurrencyEdit12.AsInteger;
          if DM1.tOrdemCompraItem.GotoKey then
            DM1.tOrdemCompraItemGradeCodigo.AsInteger
        end;
    end;
end;

procedure TfNotaEntrada.CurrencyEdit12Enter(Sender: TObject);
begin
  if CurrencyEdit11.Value < 1 then
    Edit1.SetFocus;
end;

procedure TfNotaEntrada.SpeedButton2Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esta parcela da nota?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
    DM1.tNEntradaParc.Delete;
end;

procedure TfNotaEntrada.RxDBLookupCombo5KeyPress(Sender: TObject;
  var Key: Char);
begin
  if RzDbLookUpComboBox1.Text <> '' then
    Edit1.Text := DM1.tMaterialCodigo.AsString;
end;

procedure TfNotaEntrada.RxDBLookupCombo5Exit(Sender: TObject);
begin
  if RzDbLookUpComboBox1.Text <> '' then
    begin
      Edit1.Text   := DM1.tMaterialCodigo.AsString;
      CurrencyEdit3.Enabled  := not (DM1.tMaterialLancaGrade.AsBoolean);
      CurrencyEdit13.Enabled := not (DM1.tMaterialLancaGrade.AsBoolean);
      CurrencyEdit7.Enabled := not (DM1.tMaterialPrecoGrade.AsBoolean);
      if (CurrencyEdit12.Value < 1) or (vEdit = 'S') then
        begin
          if DM1.tMaterialLancaGrade.AsBoolean then
            begin
              fNotaEntradaGrade := tfNotaEntradaGrade.Create(Self);
              fNotaEntradaGrade.ShowModal;
            end;
        end;
      if DM1.tMaterialLancaCor.AsBoolean then
        RxDBLookupCombo2.SetFocus
      else
      if not DM1.tMaterialLancaGrade.AsBoolean then
        Edit2.SetFocus
      else
        CurrencyEdit4.SetFocus;
      if (CurrencyEdit12.AsInteger < 1) and (vEdit <> 'S') then
        CurrencyEdit7.Value := DM1.tMaterialPrCusto.AsFloat;
    end;
end;

procedure TfNotaEntrada.RxDBLookupCombo5Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfNotaEntrada.RxDBLookupCombo5CloseUp(Sender: TObject);
begin
  if RzDbLookUpComboBox1.Text <> '' then
    begin
      vProduto   := DM1.tMaterialCodigo.AsInteger;
      Edit1.Text := DM1.tMaterialCodigo.AsString;
      if (CurrencyEdit12.AsInteger < 1) and (vEdit <> 'S') then
        begin
          CurrencyEdit3.Value := 1;
          CurrencyEdit4.Value := DM1.tMaterialICMS.AsCurrency;
          CurrencyEdit5.Value := DM1.tMaterialIPI.AsCurrency;
          Edit2.Text          := DM1.tMaterialUnidade.AsString;
          CurrencyEdit7.Value := DM1.tMaterialPrCusto.AsCurrency;
          CurrencyEdit8.Value := DM1.tMaterialPrCusto.AsCurrency;
        end;
    end;
end;

procedure TfNotaEntrada.RxDBLookupCombo7Enter(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Atelier';
end;

procedure TfNotaEntrada.RxDBLookupCombo7Exit(Sender: TObject);
begin
  DM1.tAtelier.IndexFieldNames := 'Codigo';
end;

procedure TfNotaEntrada.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  DM1.tNEntrada.Refresh;
end;

procedure TfNotaEntrada.tAuxNEntradaGradeNewRecord(DataSet: TDataSet);
begin
  tAuxNEntradaGradeQtd.AsFloat := 0;
end;

procedure TfNotaEntrada.RzDBLookupComboBox1CloseUp(Sender: TObject);
begin
  if RzDbLookUpComboBox1.Text <> '' then
    begin
      vProduto   := DM1.tMaterialCodigo.AsInteger;
      Edit1.Text := DM1.tMaterialCodigo.AsString;
      if (CurrencyEdit12.AsInteger < 1) and (vEdit <> 'S') then
        begin
          CurrencyEdit3.Value := 1;
          CurrencyEdit4.Value := DM1.tMaterialICMS.AsCurrency;
          CurrencyEdit5.Value := DM1.tMaterialIPI.AsCurrency;
          Edit2.Text          := DM1.tMaterialUnidade.AsString;
          CurrencyEdit7.Value := DM1.tMaterialPrCusto.AsCurrency;
          CurrencyEdit8.Value := DM1.tMaterialPrCusto.AsCurrency;
        end;
    end;
end;

procedure TfNotaEntrada.RzDBLookupComboBox1Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfNotaEntrada.RzDBLookupComboBox1Exit(Sender: TObject);
begin
   if RzDbLookUpComboBox1.Text <> '' then
    begin
      Edit1.Text   := DM1.tMaterialCodigo.AsString;
      CurrencyEdit3.Enabled  := not (DM1.tMaterialLancaGrade.AsBoolean);
      CurrencyEdit13.Enabled := not (DM1.tMaterialLancaGrade.AsBoolean);
      CurrencyEdit7.Enabled := not (DM1.tMaterialPrecoGrade.AsBoolean);
      if (CurrencyEdit12.Value < 1) or (vEdit = 'S') then
        begin
          if DM1.tMaterialLancaGrade.AsBoolean then
            begin
              fNotaEntradaGrade := tfNotaEntradaGrade.Create(Self);
              fNotaEntradaGrade.ShowModal;
            end;
        end;
      if DM1.tMaterialLancaCor.AsBoolean then
        RxDBLookupCombo2.SetFocus
      else
      if not DM1.tMaterialLancaGrade.AsBoolean then
        Edit2.SetFocus
      else
        CurrencyEdit4.SetFocus;
      if (CurrencyEdit12.AsInteger < 1) and (vEdit <> 'S') then
        CurrencyEdit7.Value := DM1.tMaterialPrCusto.AsFloat;
    end;
end;

procedure TfNotaEntrada.RzDBLookupComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
   if RzDbLookUpComboBox1.Text <> '' then
    Edit1.Text := DM1.tMaterialCodigo.AsString;
end;

procedure TfNotaEntrada.Panel8Exit(Sender: TObject);
begin
  if (BitBtn8.Tag <> 1) and (DBEdit1.Text <> '') then
    begin
      if tNEntradaIns.Locate('NumNEntr;Serie;CodForn',VarArrayOf([DM1.tNEntradaNumNEntr.AsInteger,DM1.tNEntradaSerie.AsString,DM1.tNEntradaCodForn.AsInteger]),[locaseinsensitive]) then
        begin
          ShowMessage('Nota já lançada!');
          DBEdit1.SetFocus;
        end;
    end;
end;

procedure TfNotaEntrada.RxDBLookupCombo6Enter(Sender: TObject);
begin
  DM1.tNatOperacao.IndexFieldNames := 'CodNatOper';
end;

procedure TfNotaEntrada.RxDBLookupCombo13Enter(Sender: TObject);
begin
  DM1.tSitTributaria.IndexFieldNames := 'CodSit;SitTributaria';
end;

end.
