unit UPedidoMat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Db, DbTables, Grids, DBGrids,
  RXCtrls, Menus, RXDBCtrl, RXLookup, ToolEdit, CurrEdit, DBFilter,
  RzDBCmbo, SMDBGrid;

type
  TfPedidoMat = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    DBText1: TDBText;
    RxLabel2: TRxLabel;
    DBText2: TDBText;
    RxLabel3: TRxLabel;
    DBText3: TDBText;
    RxDBLookupCombo3: TRxDBLookupCombo;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText4: TStaticText;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    CurrencyEdit1: TCurrencyEdit;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    RxDBFilter1: TRxDBFilter;
    StaticText3: TStaticText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RadioGroup1: TRadioGroup;
    BitBtn16: TBitBtn;
    BitBtn2: TBitBtn;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    SMDBGrid2: TSMDBGrid;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBLookupCombo2Enter(Sender: TObject);
    procedure RxDBLookupCombo2CloseUp(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure RzDBLookupComboBox1Enter(Sender: TObject);
    procedure RzDBLookupComboBox1CloseUp(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    vItemMat : Integer;

    procedure Ajusta_MatPedido;
  public
    { Public declarations }
  end;

var
  fPedidoMat: TfPedidoMat;

implementation

uses UPedido, UDM1, UAgendaTelef, UProdutoMat, UConsMaterialParaFicha,
  uIntegracao;

{$R *.DFM}

procedure TfPedidoMat.Ajusta_MatPedido;
begin
  DM1.tPedidoMaterial.Refresh;
  DM1.tPedidoItem.Edit;
  DM1.tPedidoItemCodCabedal1.AsInteger    := 0;
  DM1.tPedidoItemCodCabedal2.AsInteger    := 0;
  DM1.tPedidoItemCodPalmilha.AsInteger    := 0;
  DM1.tPedidoItemCodCorPalmilha.AsInteger := 0;
  DM1.tPedidoItemCodCorSolado.AsInteger   := 0;
  DM1.tPedidoItemCodSolado.AsInteger      := 0;
  DM1.tPedidoItemCodForma.AsInteger       := 0;
  DM1.tPedidoItem.Post;
  DM1.tPedidoMaterial.First;
  while not DM1.tPedidoMaterial.EOF do
    begin
      DM1.tPosicao.FindKey([DM1.tPedidoMaterialCodPosicao.AsInteger]);
      if DM1.tPedidoMateriallkTipo.AsString = 'S' then
        begin
          DM1.tPedidoItem.Edit;
          DM1.tPedidoItemCodCorSolado.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
          DM1.tPedidoItemCodSolado.AsInteger    := DM1.tPedidoMaterialCodMaterial.AsInteger;
          DM1.tPedidoItem.Post;
        end
      else
      if DM1.tPedidoMateriallkTipo.AsString = 'C' then
        begin
          DM1.tPedidoItem.Edit;
          if DM1.tPedidoItemCodCabedal1.AsInteger = 0 then
            DM1.tPedidoItemCodCabedal1.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger
          else
            DM1.tPedidoItemCodCabedal2.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
          DM1.tPedidoItem.Post;
        end
      else
      if DM1.tPedidoMateriallkTipo.AsString = 'F' then
        begin
          DM1.tPedidoItem.Edit;
          DM1.tPedidoItemCodCorForro.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
          DM1.tPedidoItemCodForro.AsInteger    := DM1.tPedidoMaterialCodMaterial.AsInteger;
          DM1.tPedidoItem.Post;
        end
      else
      if DM1.tPedidoMateriallkTipo.AsString = 'T' then
        begin
          DM1.tPedidoItem.Edit;
          DM1.tPedidoItemCodCorTaloneira.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
          DM1.tPedidoItemCodTaloneira.AsInteger    := DM1.tPedidoMaterialCodMaterial.AsInteger;
          DM1.tPedidoItem.Post;
        end
      else
      if DM1.tPedidoMateriallkTipo.AsString = 'P' then
        begin
          DM1.tPedidoItem.Edit;
          DM1.tPedidoItemCodPalmilha.AsInteger    := DM1.tPedidoMaterialCodMaterial.AsInteger;
          DM1.tPedidoItemCodCorPalmilha.AsInteger := DM1.tPedidoMaterialCodCor.AsInteger;
          DM1.tPedidoItem.Post;
        end
      else
      if DM1.tPedidoMateriallkTipo.AsString = 'E' then
        begin
          DM1.tPedidoItem.Edit;
          DM1.tPedidoItemCodEtiqueta.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
          DM1.tPedidoItem.Post;
        end
      else
      if DM1.tPedidoMateriallkTipo.AsString = '1' then
        begin
          DM1.tPedidoItem.Edit;
          DM1.tPedidoItemCodForma.AsInteger := DM1.tPedidoMaterialCodMaterial.AsInteger;
          DM1.tPedidoItem.Post;
        end;
      DM1.tPedidoMaterial.Next;
    end;
end;

procedure TfPedidoMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Action := CaFree;
end;

procedure TfPedidoMat.RxDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := 0;
end;

procedure TfPedidoMat.BitBtn5Click(Sender: TObject);
begin
  if (RzDBLookupCombobox1.Text = '') or (CurrencyEdit1.Value = 0) or (RxDBLookupCombo1.Text = '') then
    ShowMessage('Existem campos em branco')
  else
  if (DM1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo3.Text = '') then
    ShowMessage('É obrigatório informar a cor')
  else
    begin
      if BitBtn16.Tag = 1  then
       begin
         if DM1.tPedidoMaterial.Locate('Ordem',vItemMat,[loCaseInsensitive])then
           DM1.tPedidoMaterial.Edit;
       end
      else
      if DM1.tPedidoMaterial.State in [dsBrowse] then
        begin
          DM1.tPedidoMaterial.Refresh;
          fPedido.tPedidoMaterialIns.Refresh;
          fPedido.tPedidoMaterialIns.Last;
          DM1.tPedidoMaterial.Insert;
          DM1.tPedidoMaterialPedido.AsInteger       := DM1.tPedidoPedido.AsInteger;
          DM1.tPedidoMaterialItemPed.AsInteger      := DM1.tPedidoItemItem.AsInteger;
          if vItemMat > 0 then
            DM1.tPedidoMaterialOrdem.AsInteger      := vItemMat
          else
            DM1.tPedidoMaterialOrdem.AsInteger      := fPedido.tPedidoMaterialInsOrdem.AsInteger + 1;
        end;
      if (DM1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo3.Text <> '') then
        DM1.tPedidoMaterialCodCor.AsInteger     := RxDBLookupCombo3.KeyValue
      else
        DM1.tPedidoMaterialCodCor.AsInteger     := 0;
      if RzDBLookupCombobox1.Text <> '' then
        DM1.tPedidoMaterialCodMaterial.AsInteger := RzDBLookupCombobox1.KeyValue;
      DM1.tPedidoMaterialCodPosicao.AsInteger   := RxDBLookupCombo1.KeyValue;
      Case RadioGroup1.ItemIndex of
        0 : DM1.tPedidoMaterialImpTalao.AsString := 'S';
        1 : DM1.tPedidoMaterialImpTalao.AsString := 'N';
      end;
      DM1.tPedidoMaterialConsumoPr.AsFloat      := CurrencyEdit1.Value;
      DM1.tPedidoMaterial.Post;
      RzDBLookupCombobox1.ClearKeyValue;
      RxDBLookupCombo3.ClearValue;
      CurrencyEdit1.Clear;
      RzDBLookupCombobox1.SetFocus;
    end;
      {DM1.tPedidoMaterial.Refresh;
      fPedido.tPedidoMaterialIns.Refresh;
      fPedido.tPedidoMaterialIns.Refresh;
      fPedido.tPedidoMaterialIns.Last;
      if  vEdit = 1 then
        DM1.tPedidoMaterial.Edit
      else
        DM1.tPedidoMaterial.Insert;
      DM1.tPedidoMaterialPedido.AsInteger       := DM1.tPedidoPedido.AsInteger;
      DM1.tPedidoMaterialItemPed.AsInteger      := DM1.tPedidoItemItem.AsInteger;
      if vItem > 0 then
        DM1.tPedidoMaterialOrdem.AsInteger      := vItem
      else
        DM1.tPedidoMaterialOrdem.AsInteger        := fPedido.tPedidoMaterialInsOrdem.AsInteger + 1;
      if (DM1.tMaterialLancaCor.AsBoolean) and (RxDBLookupCombo3.Text <> '') then
        DM1.tPedidoMaterialCodCor.AsInteger     := RxDBLookupCombo3.KeyValue
      else
        DM1.tPedidoMaterialCodCor.AsInteger     := 0;
      if RzDBLookupCombobox1.Text <> '' then
        DM1.tPedidoMaterialCodMaterial.AsInteger := RzDBLookupCombobox1.KeyValue;
      DM1.tPedidoMaterialCodPosicao.AsInteger   := RxDBLookupCombo1.KeyValue;
      Case RadioGroup1.ItemIndex of
        0 : DM1.tPedidoMaterialImpTalao.AsString := 'S';
        1 : DM1.tPedidoMaterialImpTalao.AsString := 'N';
      end;
      DM1.tPedidoMaterialConsumoPr.AsFloat      := CurrencyEdit1.Value;
      DM1.tPedidoMaterial.Post;
      RzDBLookupCombobox1.ClearKeyValue;
      RxDBLookupCombo3.ClearValue;
      CurrencyEdit1.Clear;
      RzDBLookupCombobox1.SetFocus;
    end;
  vEdit := 0;}
  BitBtn16.Tag := 0;
  BitBtn6.Click;
end;

procedure TfPedidoMat.BitBtn6Click(Sender: TObject);
begin
  RzDBLookupCombobox1.ClearkeyValue;
  RxDBLookupCombo3.ClearValue;
  RxDBLookupCombo1.ClearValue;
  CurrencyEdit1.Clear;
  RadioGroup1.ItemIndex := 0;
  vItemMat := 0;
end;

procedure TfPedidoMat.BitBtn7Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o registro?',mtconfirmation,[mbok,mbno],0)=mrok then
    DM1.tPedidoMaterial.Delete;
end;

procedure TfPedidoMat.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPedidoMat.FormShow(Sender: TObject);
begin
  vItemMat := 0;
  BitBtn16.Tag := 0;
  RxDBFilter1.Active := True;
  Panel1.Enabled   := not(DM1.tPedido.State in [dsBrowse]);
  BitBtn5.Enabled  := not(DM1.tPedido.State in [dsBrowse]);
  BitBtn6.Enabled  := not(DM1.tPedido.State in [dsBrowse]);
  BitBtn16.Enabled := not(DM1.tPedido.State in [dsBrowse]);
  BitBtn7.Enabled  := not(DM1.tPedido.State in [dsBrowse]);
  BitBtn2.Enabled  := not(DM1.tPedido.State in [dsBrowse]);

{  if vEdit = 'C' then
    begin
      Panel1.Enabled     := False;
      RxDBGrid1.ReadOnly := True;
    end
  else
    begin
      Panel1.Enabled     := True;
      RxDBGrid1.ReadOnly := False;
    end;}
  {if (vEdit = 'S') or (vEdit = 'N') then
    begin
    Panel1.Enabled     := True;
    end
  else
    Panel1.Enabled   := not(DM1.tPedido.State in [dsBrowse]);}
end;

procedure TfPedidoMat.RxDBLookupCombo2Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfPedidoMat.RxDBLookupCombo2CloseUp(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Codigo';
end;

procedure TfPedidoMat.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tPosicao.IndexFieldNames := 'Nome';
end;

procedure TfPedidoMat.RxDBLookupCombo1Exit(Sender: TObject);
begin
  DM1.tPosicao.IndexFieldNames := 'Codigo';
end;

procedure TfPedidoMat.BitBtn16Click(Sender: TObject);
begin
  BitBtn16.Tag := 1;
  if DM1.tPedidoMaterialOrdem.AsInteger > 0 then
    begin
      vItemMat := DM1.tPedidoMaterialOrdem.AsInteger;
      RzDBLookupComboBox1.KeyValue := DM1.tPedidoMaterialCodMaterial.AsInteger;
      if DM1.tPedidoMaterialCodCor.AsInteger > 0 then
        RxDBLookupCombo3.KeyValue := DM1.tPedidoMaterialCodCor.AsInteger;
      RxDBLookupCombo1.KeyValue := DM1.tPedidoMaterialCodPosicao.AsInteger;
      if DM1.tPedidoMaterialImpTalao.AsString = 'S' then
        RadioGroup1.ItemIndex := 0
      else
        RadioGroup1.ItemIndex := 1;
      CurrencyEdit1.Value := DM1.tPedidoMaterialConsumoPr.AsFloat;
    end;
end;

procedure TfPedidoMat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
  if Key = Vk_F2 then
  begin
    fConsMaterialParaFicha     := TfConsMaterialParaFicha.Create(Self);
    fConsMaterialParaFicha.Tag := 1;
    fConsMaterialParaFicha.ShowModal;
  end;
end;

procedure TfPedidoMat.BitBtn2Click(Sender: TObject);
begin
  Ajusta_MatPedido;
  DM1.tLote.Filtered := False;
  DM1.tLote.Filter   := 'NroPedido = '''+DM1.tPedidoPedido.AsString+''' and ItemPed = '''+DM1.tPedidoItemItem.AsString+'''';
  DM1.tLote.Filtered := True;
  DM1.tLote.First;
  while not DM1.tLote.Eof do
    begin
      DM1.tTalao.First;
      while not DM1.tTalao.Eof do
        begin
          DM1.tTalao.Edit;
          DM1.tTalaoCodCabedal1.AsInteger     := DM1.tPedidoItemCodCabedal1.AsInteger;
          DM1.tTalaoCodCabedal2.AsInteger     := DM1.tPedidoItemCodCabedal2.AsInteger;
          DM1.tTalaoCodcor.AsInteger          := DM1.tPedidoItemCodCor.AsInteger;
          DM1.tTalaoCodCorForro.AsInteger     := DM1.tPedidoItemCodCorForro.AsInteger;
          DM1.tTalaoCodCorPalmilha.AsInteger  := DM1.tPedidoItemCodCorPalmilha.AsInteger;
          DM1.tTalaoCodCorSolado.AsInteger    := DM1.tPedidoItemCodCorSolado.AsInteger;
          DM1.tTalaoCodForro.AsInteger        := DM1.tPedidoItemCodForro.AsInteger;
          DM1.tTalaoCodEtiqueta.AsInteger     := DM1.tPedidoItemCodEtiqueta.AsInteger;
          DM1.tTalaoCodSolado.AsInteger       := DM1.tPedidoItemCodSolado.AsInteger;
          DM1.tTalaoCodTaloneira.AsInteger    := DM1.tPedidoItemCodTaloneira.AsInteger;
          DM1.tTalaoCodCorTaloneira.AsInteger := DM1.tPedidoItemCodCorTaloneira.AsInteger;
          DM1.tTalaoCodPalmilha.AsInteger     := DM1.tPedidoItemCodPalmilha.AsInteger;
          DM1.tTalaoCodForma.AsInteger        := DM1.tPedidoItemCodForma.AsInteger;
          DM1.tTalao.Post;
          Prc_Gravar_Talao_FB(DM1.tTalaoLote.AsInteger,DM1.tTalaoItem.AsInteger);

          DM1.tTalao.Next;
        end;
      DM1.tLote.Next;
    end;
  ShowMessage('Ajustado materiais do lote!');
  DM1.tPedido.Edit;
end;

procedure TfPedidoMat.RzDBLookupComboBox1Enter(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Nome';
end;

procedure TfPedidoMat.RzDBLookupComboBox1CloseUp(Sender: TObject);
begin
  DM1.tMaterial.IndexFieldNames := 'Codigo';
end;

procedure TfPedidoMat.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := 0;
end;

procedure TfPedidoMat.BitBtn3Click(Sender: TObject);
begin
  fConsMaterialParaFicha     := TfConsMaterialParaFicha.Create(Self);
  fConsMaterialParaFicha.Tag := 1;
  fConsMaterialParaFicha.ShowModal;
end;

end.

