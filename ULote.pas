unit ULote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB, DBTables,
  DBIProcs, DBFilter, RXLookup, MemTable, Mask, ToolEdit, RXCtrls;

type
  TfLote = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    DBText1: TDBText;
    BitBtn5: TBitBtn;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    tLoteMIIns: TTable;
    RxDBFilter1: TRxDBFilter;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    tMemGradeTalao: TMemoryTable;
    tMemGradeTalaoPos1: TIntegerField;
    tMemGradeTalaoPos2: TIntegerField;
    tMemGradeTalaoPos3: TIntegerField;
    tMemGradeTalaoPos4: TIntegerField;
    tMemGradeTalaoPos5: TIntegerField;
    tMemGradeTalaoPos6: TIntegerField;
    tMemGradeTalaoPos7: TIntegerField;
    tMemGradeTalaoPos8: TIntegerField;
    tMemGradeTalaoPos9: TIntegerField;
    tMemGradeTalaoPos10: TIntegerField;
    tMemGradeTalaoPos11: TIntegerField;
    tMemGradeTalaoPos12: TIntegerField;
    tMemGradeTalaoPos13: TIntegerField;
    tMemGradeTalaoPos14: TIntegerField;
    tMemGradeTalaoPos15: TIntegerField;
    tMemGradeTalaoPos16: TIntegerField;
    tMemGradeTalaoPos17: TIntegerField;
    tMemGradeTalaoPos18: TIntegerField;
    tMemGradeTalaoPos19: TIntegerField;
    tMemGradeTalaoPos20: TIntegerField;
    tMemGradeTalaoGrade: TIntegerField;
    tTalaoGradeMI: TTable;
    Panel6: TPanel;
    BitBtn3: TBitBtn;
    tLoteMIInsLote: TIntegerField;
    tLoteMIInsQtdTaloes: TIntegerField;
    tLoteMIInsQtdPares: TFloatField;
    tLoteMIInsObs: TMemoField;
    tLoteMIInsImpCalcMaterial: TBooleanField;
    tLoteMIInsImpresso: TBooleanField;
    tLoteMIInsOCGerado: TBooleanField;
    tTalaoGradeMILote: TIntegerField;
    tTalaoGradeMIItem: TIntegerField;
    tTalaoGradeMITalao: TIntegerField;
    tTalaoGradeMICodGrade: TIntegerField;
    tTalaoGradeMIPosicao: TIntegerField;
    tTalaoGradeMIQtdPar: TIntegerField;
    mSetorAux: TMemoryTable;
    dsSetorAux: TDataSource;
    mSetorAuxCodSetor: TIntegerField;
    mSetorAuxOrdem: TIntegerField;
    mSetorAuxCodAtelier: TIntegerField;
    mSetorAuxAtelier: TBooleanField;
    tMemPedido: TMemoryTable;
    dsMemPedido: TDataSource;
    tMemPedidoPedido: TIntegerField;
    mSetorAuxlkNomeSetor: TStringField;
    mSetorAuxlkNomeAtelier: TStringField;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    RxLabel1: TRxLabel;
    Label6: TLabel;
    DBDateEdit1: TDBDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn6Click(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure tTalaoGradeMIAfterPost(DataSet: TDataSet);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tMemPedidoAfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure Habilita;
    procedure Monta_Setores;
    procedure Grava_LotePedido;
    procedure Grava_Talao;
    procedure Grava_TalaoGrade;
    procedure Grava_LoteSetor;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLote: TfLote;
  vTalao, vQtdPar2, vQtdParesPed : Integer;

implementation

uses UDM1, ULoteSetorMI, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfLote.Habilita;
begin
  Panel2.Enabled  := not(Panel2.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn6.Enabled := not(BitBtn6.Enabled);
end;

procedure TfLote.Monta_Setores;
var
 vOrdem : Integer;
begin
  mSetorAux.First;
  while not mSetorAux.Eof do
    mSetorAux.Delete;
  vOrdem := 0;
  DM1.tOrdImpTalao.First;
  while not DM1.tOrdImpTalao.Eof do
    begin
      inc(vOrdem);
      mSetorAux.Insert;
      mSetorAuxCodSetor.AsInteger   := DM1.tOrdImpTalaoCodSetor.AsInteger;
      mSetorAuxOrdem.AsInteger      := vOrdem;
      mSetorAuxAtelier.AsBoolean    := DM1.tOrdImpTalaolkAtelier.AsBoolean;
      mSetorAuxCodAtelier.AsInteger := 0;
      mSetorAux.Post;
      DM1.tOrdImpTalao.Next;
    end;
end;

procedure TfLote.Grava_LotePedido;
begin
  DM1.tLotePedidoMI.Insert;
  DM1.tLotePedidoMILote.AsInteger   := DM1.tLoteMILote.AsInteger;
  DM1.tLotePedidoMIPedido.AsInteger := DM1.tPedidoPedido.AsInteger;
  DM1.tLotePedidoMI.Post;
end;

procedure TfLote.Grava_LoteSetor;
begin
  mSetorAux.First;
  while not mSetorAux.Eof do
    begin
      DM1.tLoteSetorMI.Insert;
      DM1.tLoteSetorMILote.AsInteger     := DM1.tLoteMILote.AsInteger;
      DM1.tLoteSetorMIItem.AsInteger     := mSetorAuxOrdem.AsInteger;
      DM1.tLoteSetorMICodSetor.AsInteger := mSetorAuxCodSetor.AsInteger;
      DM1.tSetor.IndexFieldNames       := 'Codigo';
      DM1.tSetor.FindKey([mSetorAuxCodSetor.AsInteger]);
      if (DM1.tSetorAtelier.AsBoolean) and (DM1.tSetorCodigo.AsInteger = mSetorAuxCodSetor.AsInteger) then
        DM1.tLoteSetorMICodAtelier.AsInteger := mSetorAuxCodAtelier.AsInteger;
      DM1.tLoteSetorMI.Post;
      mSetorAux.Next;
    end;
end;

procedure TfLote.Grava_Talao;
begin
  DM1.tTalaoMI.Refresh;
  DM1.tTalaoMI.Insert;
  DM1.tTalaoMILote.AsInteger            := DM1.tLoteMILote.AsInteger;
  DM1.tTalaoMIItem.AsInteger            := vTalao;
  DM1.tTalaoMICodProduto.AsInteger      := DM1.tPedidoItemCodProduto.AsInteger;
  DM1.tTalaoMICodCabedal1.AsInteger     := DM1.tPedidoItemCodCabedal1.AsInteger;
  DM1.tTalaoMICodCabedal2.AsInteger     := DM1.tPedidoItemCodCabedal2.AsInteger;
  DM1.tTalaoMICodCor.AsInteger          := DM1.tPedidoItemCodCor.AsInteger;
  DM1.tTalaoMICodCorForro.AsInteger     := DM1.tPedidoItemCodCorForro.AsInteger;
  DM1.tTalaoMICodPalmilha.AsInteger     := DM1.tPedidoItemCodPalmilha.AsInteger;
  DM1.tTalaoMICodCorPalmilha.AsInteger  := DM1.tPedidoItemCodCorPalmilha.AsInteger;
  DM1.tTalaoMICodForro.AsInteger        := DM1.tPedidoItemCodForro.AsInteger;
  DM1.tTalaoMICodCorSolado.AsInteger    := DM1.tPedidoItemCodCorSolado.AsInteger;
  DM1.tTalaoMICodSolado.AsInteger       := DM1.tPedidoItemCodSolado.AsInteger;
  DM1.tTalaoMICodEtiqueta.AsInteger     := DM1.tPedidoItemCodEtiqueta.AsInteger;
  DM1.tTalaoMICodTaloneira.AsInteger    := DM1.tPedidoItemCodTaloneira.AsInteger;
  DM1.tTalaoMICodCorTaloneira.AsInteger := DM1.tPedidoItemCodCorTaloneira.AsInteger;
  DM1.tTalaoMICodForma.AsInteger        := DM1.tPedidoItemCodForma.AsInteger;
  DM1.tTalaoMIQtdPar.AsInteger          := DM1.tPedidoItemQtdPares.AsInteger;
  DM1.tLoteMIQtdPares.AsInteger         := DM1.tLoteMIQtdPares.AsInteger + DM1.tTalaoMIQtdPar.AsInteger;
  DM1.tTalaoMIItemPedido.AsInteger      := DM1.tPedidoItemItem.AsInteger;
  DM1.tTalaoMINumPedido.AsInteger       := DM1.tPedidoItemPedido.AsInteger;
  DM1.tTalaoMI.Post;
  DM1.tTalaoMI.Refresh;
end;

procedure TfLote.Grava_TalaoGrade;
begin
  DM1.tTalaoGradeMI.Insert;
  DM1.tTalaoGradeMILote.AsInteger     := DM1.tLoteMILote.AsInteger;
  DM1.tTalaoGradeMIItem.AsInteger     := vTalao;
  DM1.tTalaoGradeMITalao.AsInteger    := 0;
  DM1.tTalaoGradeMICodGrade.AsInteger := DM1.tPedidoGradeCodGrade.AsInteger;
  DM1.tTalaoGradeMIPosicao.AsInteger  := DM1.tPedidoGradePosicao.AsInteger;
  DM1.tTalaoGradeMIQtdPar.AsInteger   := DM1.tPedidoGradeQtd.AsInteger;
  DM1.tTalaoGradeMI.Post;
end;

procedure TfLote.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Dm1.tOrdImpTalao.Close;
  Dm1.tLotePedidoMI.Close;
  Dm1.tLoteSetorMI.Close;
  Dm1.tTalaoMI.Close;
  Dm1.tPedidoItem.Close;
  Dm1.tTalaoGradeMI.Close;
  Dm1.tPedido.Close;
  Dm1.tLoteMI.Close;
  Dm1.tPedidoGrade.Close;
  Action := Cafree;
end;

procedure TfLote.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DM1.tLoteMI.State in [dsEdit] then
    begin
      ShowMessage('Você deve Cancelar ou Confirmar o Lote antes de fechar esta janela!');
      CanClose := False;
    end
  else
    CanClose := True;
end;

procedure TfLote.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfLote.RxDBGrid1DblClick(Sender: TObject);
begin
  if DM1.tLoteMI.State in [dsEdit] then
    begin
      if DM1.tPedidoCancelado.AsBoolean then
        ShowMessage('Pedido esta cancelado!')
      else
      if DM1.tPedidoSuspenso.AsBoolean then
        ShowMessage('Pedido esta suspenso!')
      else
      if DM1.tPedidoMercado.AsString = 'E' then
        ShowMessage('Pedido é exportação!')
      else
        begin
          if DM1.tPedidoNumLote.AsInteger < 1 then
            begin
              DM1.tPedido.Edit;                                  //  3 - Seleciona
              if (DM1.tPedidoGerarLote.AsString = '2') or (DM1.tPedidoGerarLote.IsNull) then        //  2 - Tira seleção
                begin
                  DM1.tPedidoGerarLote.AsString := '3';          //  1 - Lote Gerado
                  tMemPedido.Insert;
                  tMemPedidoPedido.AsInteger := DM1.tPedidoPedido.AsInteger;
                  tMemPedido.Post;
                end;
              DM1.tPedido.Post;
            end;
        end;
    end;
end;

procedure TfLote.BitBtn1Click(Sender: TObject);
begin
  DM1.tLoteMI.Refresh;
  DM1.tLoteMI.IndexFieldNames := 'Lote';
  tLoteMIIns.IndexFieldNames  := 'Lote';
  tLoteMIIns.Refresh;
  tLoteMIIns.Last;
  DM1.tLoteMI.Insert;
  DM1.tLoteMILote.AsInteger   := tLoteMIInsLote.AsInteger + 1;
  DM1.tLoteMINumMapaCompras.AsInteger := 0;
  DM1.tLoteMI.Post;
  DM1.tLoteMI.Edit;
  Habilita;
  Label6.Caption := '';
  vQtdParesPed   := 0;
  Edit2.SetFocus;
  Monta_Setores;
end;

procedure TfLote.BitBtn5Click(Sender: TObject);
//var
// vQtd : Integer;
begin
  if (tMemPedido.RecordCount > 0) and (DM1.tLoteMIDtEmbarque.AsString <> '  /  /  ') then
    begin
      //vQtd       := 0;
      vTalao := 0;
      Screen.Cursor := crHourGlass;
      RxDBFilter1.Active := False;
      DM1.tPedido.IndexFieldNames := 'Pedido';
      tMemPedido.First;
      while not tMemPedido.EOF do
        begin
          DM1.tPedido.SetKey;
          DM1.tPedidoPedido.AsInteger := tMemPedidoPedido.AsInteger;
          if DM1.tPedido.GotoKey then
            begin
              Grava_LotePedido;
              DM1.tPedido.Edit;
              DM1.tPedidoNumLote.AsInteger  := DM1.tLoteMILote.AsInteger;
              DM1.tPedidoGerarLote.AsString := '1';
              DM1.tPedido.Post;
              DM1.tPedidoItem.First;
              while not DM1.tPedidoItem.EOF do
                begin
                  if not (DM1.tPedidoItemCancelado.AsBoolean) then
                    begin
                      vTalao := vTalao + 1;
                      Grava_Talao;
                      DM1.tPedidoGrade.First;
                      while not DM1.tPedidoGrade.EOF do
                        begin
                          Grava_TalaoGrade;
                          DM1.tPedidoGrade.Next;
                        end;
                    end;
                  DM1.tPedidoItem.Next;
                end;
            end;
          tMemPedido.Next;
        end;
      tMemPedido.EmptyTable;
      Grava_LoteSetor;
      DM1.tLoteMIQtdTaloes.AsInteger  := DM1.tTalaoMI.RecordCount;
      DM1.tLoteMICodFabrica.AsInteger := DM1.tPedidoCodFabrica.AsInteger;
      DM1.tLoteMI.Post;
      RxDBFilter1.Active := True;
      Habilita;
      BitBtn1.SetFocus;
      Screen.Cursor := crDefault;
    end
  else
    ShowMessage('Não pode confirmar o lote sem pedido, ou sem a data de embarque');
end;

procedure TfLote.BitBtn4Click(Sender: TObject);
begin
  tMemPedido.First;
  while not tMemPedido.EOF do
    begin
      DM1.tPedido.IndexFieldNames := 'Pedido';
      DM1.tPedido.SetKey;
      DM1.tPedidoPedido.AsInteger := tMemPedidoPedido.AsInteger;
      if DM1.tPedido.GotoKey then
        begin
          DM1.tPedido.Edit;
          DM1.tPedidoGerarLote.AsString := '2';
          DM1.tPedido.Post;
        end;
      tMemPedido.Next;
    end;
  tMemPedido.EmptyTable;
  if DM1.tTalaoMI.RecordCount > 0 then
    DM1.tLoteMI.Cancel
  else
    DM1.tLoteMI.Delete;
  Habilita;
end;

procedure TfLote.FormShow(Sender: TObject);
begin
  Dm1.tOrdImpTalao.Open;
  Dm1.tLotePedidoMI.Open;
  Dm1.tLoteSetorMI.Open;
  Dm1.tTalaoMI.Open;
  Dm1.tPedidoItem.Open;
  Dm1.tTalaoGradeMI.Open;
  Dm1.tPedido.Open;
  Dm1.tLoteMI.Open;
  Dm1.tPedidoGrade.Open;
  RadioGroup1Click(Sender);
  DM1.tLoteMI.Refresh;
  DM1.tLoteMI.Last;
  tMemPedido.EmptyTable;
end;

procedure TfLote.RadioGroup1Click(Sender: TObject);
begin
  RxDBFilter1.Active := False;
  RxDBFilter1.Filter.Clear;
  case RadioGroup1.ItemIndex of
    0: RxDBFilter1.Filter.Add('(GerarLote = 2 or GerarLote = 3 or GerarLote < 0) and Suspenso <> True and Cancelado <> True');
    1: RxDBFilter1.Filter.Add('GerarLote = 1 and Suspenso <> True and Cancelado <> True');
    2: RxDBFilter1.Filter.Add('Suspenso <> True and Cancelado <> True');
  end;
  RxDBFilter1.Active := True;
end;

procedure TfLote.Edit1Change(Sender: TObject);
begin
  try
    DM1.tPedido.IndexFieldNames := 'Pedido';
    DM1.tPedido.FindKey([Edit1.Text]);
  except
    ShowMessage('Digite só números aqui!');
  end;
end;

procedure TfLote.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) and (DM1.tLoteMI.State in [dsEdit]) then
    begin
      if DM1.tPedidoCancelado.AsBoolean then
        ShowMessage('Pedido está cancelado!')
      else
      if DM1.tPedidoSuspenso.AsBoolean then
        ShowMessage('Pedido está suspenso!')
      else
      if DM1.tPedidoMercado.AsString = 'E' then
        ShowMessage('Pedido é exportação!')
      else
        begin
          if DM1.tPedidoNumLote.AsInteger < 1 then
            begin
              DM1.tPedido.Edit;
              if (DM1.tPedidoGerarLote.AsString = '2') or (DM1.tPedidoGerarLote.IsNull) then
                begin                                              //     3 - Seleciona
                  DM1.tPedidoGerarLote.AsString := '3';            //     2 - Tira seleção
                  tMemPedido.Insert;
                  tMemPedidoPedido.AsInteger := DM1.tPedidoPedido.AsInteger;
                  tMemPedido.Post;
                  Edit1.SelectAll;
                end;
              DM1.tPedido.Post;
              DM1.tPedido.Refresh;
            end;
        end;
    end;
end;

procedure TfLote.DBGrid1DblClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente tirar esse pedido da seleção ' +#13+
                ' para gerar lote?',mtConfirmation,[mbYes ,mbNo],0) = mrYes then
    begin
      DM1.tPedido.FindKey([tMemPedidoPedido.AsInteger]);
      DM1.tPedido.Edit;
      DM1.tPedidoGerarLote.AsString := '2';
      DM1.tPedido.Post;
      tMemPedido.Delete;
    end;
end;

procedure TfLote.BitBtn2Click(Sender: TObject);
begin
  tMemPedido.First;
  while not tMemPedido.EOF do
    begin
      DM1.tPedido.IndexFieldNames := 'Pedido';
      DM1.tPedido.SetKey;
      DM1.tPedidoPedido.AsInteger := tMemPedidoPedido.AsInteger;
      if DM1.tPedido.GotoKey then
        begin
          DM1.tPedido.Edit;
          DM1.tPedidoGerarLote.AsString := '2';
          DM1.tPedido.Post;
        end;
      tMemPedido.Next;
    end;
  tMemPedido.EmptyTable;
end;

procedure TfLote.tTalaoGradeMIAfterPost(DataSet: TDataSet);
begin
  DBISaveChanges(tTalaoGradeMI.Handle);
end;

procedure TfLote.BitBtn3Click(Sender: TObject);
begin
  fLoteSetorMI := TfLoteSetorMI.Create(Self);
  fLoteSetorMI.ShowModal;
end;

procedure TfLote.Edit2Change(Sender: TObject);
begin
  try
    DM1.tPedido.IndexFieldNames := 'PedidoCliente';
    DM1.tPedido.FindKey([Edit2.Text]);
  except
    ShowMessage('Digite só números aqui!');
  end;
end;

procedure TfLote.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) and (DM1.tLoteMI.State in [dsEdit]) then
    begin
      if DM1.tPedidoCancelado.AsBoolean then
        ShowMessage('Pedido está cancelado!')
      else
      if DM1.tPedidoSuspenso.AsBoolean then
        ShowMessage('Pedido está suspenso!')
      else
      if DM1.tPedidoMercado.AsString = 'E' then
        ShowMessage('Pedido é exportação!')
      else
        begin
          if DM1.tPedidoNumLote.AsInteger < 1 then
            begin
              DM1.tPedido.Edit;
              if (DM1.tPedidoGerarLote.AsString = '2') or (DM1.tPedidoGerarLote.IsNull) then
                begin                                              //     3 - Seleciona
                  DM1.tPedidoGerarLote.AsString := '3';            //     2 - Tira seleção
                  tMemPedido.Insert;
                  tMemPedidoPedido.AsInteger := DM1.tPedidoPedido.AsInteger;
                  tMemPedido.Post;
                  Edit2.SelectAll;
                end;
              DM1.tPedido.Post;
              DM1.tPedido.Refresh;
            end;
        end;
    end;
end;

procedure TfLote.tMemPedidoAfterPost(DataSet: TDataSet);
begin
  vQtdParesPed   := vQtdParesPed + DM1.tPedidoQtdPares.AsInteger;
  Label6.Caption := IntToStr(vQtdParesPed);
end;

procedure TfLote.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
