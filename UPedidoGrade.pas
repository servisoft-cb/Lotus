unit UPedidoGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, ToolEdit, CurrEdit, Buttons, Db,
  DBTables, MemTable, Grids, DBVGrids, DBGrids, Variants;

type
  TfPedidoGrade = class(TForm)
    tProdutoTam: TTable;
    tProdutoTamCodProd: TIntegerField;
    tProdutoTamTam: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    VDBGrid1: TVDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox4CloseUp(Sender: TObject);
    procedure DBLookupComboBox4DropDown(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure VDBGrid1CellClick(Column: TColumn);
    procedure VDBGrid1ColEnter(Sender: TObject);
    procedure VDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure MontaGrade;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPedidoGrade: TfPedidoGrade;

implementation

uses UPedido, UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfPedidoGrade.MontaGrade;
begin
  Edit1.Text := DM1.tGradeCodLetra.AsString;
  Edit2.Text := DM1.tGradeLargura.AsString;
  if fPedido.vEdit <> 'C' then
    begin
      if DM1.tGradeTipoDig.AsString = 'P' then
        begin
          CurrencyEdit1.ReadOnly := False;
          CurrencyEdit2.ReadOnly := True;
          VDBGrid1.ReadOnly      := False;
        end
      else
        begin
          CurrencyEdit1.ReadOnly := True;
          CurrencyEdit2.ReadOnly := False;
          VDBGrid1.ReadOnly      := True;
        end;
    end;

  if fPedido.vEdit = 'N' then
    begin
      fPedido.tPedidoItemIns.Refresh;
      fPedido.tPedidoItemIns.Last;
      fPedido.tAuxPedidoGrade.First;
      while not fPedido.tAuxPedidoGrade.Eof do
        fPedido.tAuxPedidoGrade.delete;
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
        begin
          fPedido.tAuxPedidoGrade.Insert;
          fPedido.tAuxPedidoGradeCodGrade.AsInteger := DM1.tGradeItemCodGrade.AsInteger;
          fPedido.tAuxPedidoGradePosicao.AsInteger       := DM1.tGradeItemPosicao.AsInteger;
          fPedido.tAuxPedidoGradeQtd.AsString            := '';
          fPedido.tAuxPedidoGradeVlrUnitario.AsString    := '';
          fPedido.tAuxPedidoGradeVlrTotal.AsString       := '';
          fPedido.tAuxPedidoGrade.Post;
          DM1.tGradeItem.Next;
        end;
    end;
  fPedido.tAuxPedidoGrade.First;
end;

procedure TfPedidoGrade.FormShow(Sender: TObject);
begin
  BitBtn5.Caption := 'Continuar';
  if fPedido.vEdit = 'C' then
    begin
      BitBtn5.Caption := 'Fechar';
      DbLookupComboBox4.Enabled := False;
      CurrencyEdit1.Enabled     := False;
      CurrencyEdit2.Enabled     := False;
      VDBGrid1.ReadOnly         := True;
    end
  else
  if fPedido.vEdit = 'S' then
    begin
      DbLookupComboBox4.Enabled := False;
      CurrencyEdit1.Enabled     := True;
      CurrencyEdit2.Enabled     := True;
      VDBGrid1.ReadOnly         := False;
    end
  else
    begin
      DbLookupComboBox4.Enabled := True;
      CurrencyEdit1.Enabled     := True;
      CurrencyEdit2.Enabled     := True;
      VDBGrid1.ReadOnly         := False;
    end;

//  if DM1.tMaterialPrecoGrade.AsBoolean = false then
    vDBGrid1.Columns[2].Destroy;
  if fPedido.vEdit = 'C' then
    begin
      DM1.tGrade.IndexFieldNames := 'Codigo';
      DM1.tGrade.FindKey([DM1.tPedidoItemCodGrade.AsInteger]);
      DBLookupComboBox4.KeyValue := DM1.tGradeCodigo.AsInteger;
      CurrencyEdit1.AsInteger    := DM1.tPedidoItemQtdPares.AsInteger;
    end
  else
  if fPedido.vEdit = 'S' then
    begin
      fPedido.tAuxPedidoGrade.First;
      DM1.tGrade.IndexFieldNames := 'Codigo';
      DM1.tGrade.FindKey([fPedido.tAuxPedidoGradeCodGrade.AsInteger]);
      DBLookupComboBox4.KeyValue := DM1.tGradeCodigo.AsInteger;
    end
  else
    begin
      DM1.tGrade.IndexFieldNames := 'Codigo';
      DM1.tGrade.FindKey([DM1.tProdutoCodGrade.AsInteger]);
      DBLookupComboBox4.KeyValue := DM1.tGradeCodigo.AsInteger;
    end;
  MontaGrade;
  if fPedido.vEdit = 'S' then
    begin
      CurrencyEdit1.Value := fPedido.CurrencyEdit1.Value;
      CurrencyEdit2.Value := 0;
      if DM1.tGradeTipoDig.AsString = 'T' then
        CurrencyEdit2.Value := CurrencyEdit1.AsInteger / DM1.tGradeQtdParTotal.AsInteger;
    end;
end;

procedure TfPedidoGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPedidoGrade.VDBGrid1Enter(Sender: TObject);
begin
 if CurrencyEdit1.Value = 0 then
   begin
     if fPedido.vEdit <> 'C' then
       begin
         ShowMessage('É obrigatório informar a quantidade total!');
         CurrencyEdit1.SetFocus;
       end;
   end
 else
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfPedidoGrade.BitBtn5Click(Sender: TObject);
var
 vQtd, vVlrTotal : Real;
 vCorreto : Boolean;
begin
  //fPedido.vTipo_Item = 'N';
  fPedido.vQtd_ParesTalao := 0;
  fPedido.vQtd_Talao      := 0;
  if fPedido.vEdit <> 'C' then
    begin
      if CurrencyEdit2.AsInteger > 0 then
        fPedido.vQtd_Talao := CurrencyEdit2.AsInteger
      else
      if CurrencyEdit3.AsInteger > 0 then
        fPedido.vQtd_ParesTalao := CurrencyEdit3.AsInteger;
      vCorreto := True;
      fPedido.tAuxPedidoGrade.First;
      while not fPedido.tAuxPedidoGrade.Eof do
        begin
          if fPedido.tAuxPedidoGradeQtd.AsFloat > 0 then
            begin
              tProdutoTam.Refresh;
              tProdutoTam.SetKey;
              tProdutoTamCodProd.AsInteger := DM1.tProdutoCodigo.AsInteger;
              tProdutoTamTam.AsString      := fPedido.tAuxPedidoGradelkTamanho.AsString;
              if not tProdutoTam.GotoKey then
                vCorreto := False;
            end;
          fPedido.tAuxPedidoGrade.Next;
        end;
      if vCorreto then
        begin
          vQtd      := 0;
          vVlrTotal := 0;
          fPedido.tAuxPedidoGrade.First;
          while not fPedido.tAuxPedidoGrade.Eof do
            begin
              vQtd := vQtd + fPedido.tAuxPedidoGradeQtd.AsFloat;
              vVlrTotal := vVlrTotal + (fPedido.tAuxPedidoGradeQtd.AsFloat * fPedido.tAuxPedidoGradeVlrUnitario.AsFloat);
              fPedido.tAuxPedidoGrade.Next;
            end;
          if vQtd <> CurrencyEdit1.Value then
            begin
              ShowMessage('Quantidade da grade diferente da quantidade total!');
              CurrencyEdit1.SetFocus;
            end
          else
            begin
              fPedido.CurrencyEdit1.Value := vQtd;
              fPedido.CurrencyEdit3.Value := vVlrTotal;
              Close
            end;
        end
      else
        begin
          ShowMessage('Há tamanho(s) c/ quantidade, que não está cadastrado p/ essa referência!');
          CurrencyEdit1.SetFocus;
        end;
    end
  else
  if fPedido.vEdit = 'C' then
    Close;
end;

procedure TfPedidoGrade.DBLookupComboBox4CloseUp(Sender: TObject);
begin
  if DBLookupComboBox4.Text <> '' then
    begin
      Edit1.Text := DM1.tGradeCodLetra.AsString;
      Edit2.Text := DM1.tGradeLargura.AsString;
    end;
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfPedidoGrade.DBLookupComboBox4DropDown(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfPedidoGrade.DBLookupComboBox4Exit(Sender: TObject);
begin
  MontaGrade;
end;

procedure TfPedidoGrade.VDBGrid1CellClick(Column: TColumn);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfPedidoGrade.VDBGrid1ColEnter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;


procedure TfPedidoGrade.VDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfPedidoGrade.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vQtdPares : Integer;
begin
  vQtdPares := 0;
  if (Key = Vk_Return) and (DM1.tGradeTipoDig.AsString = 'T') then
  begin
    DM1.tGradeItem.First;
    while not DM1.tGradeItem.Eof do
      begin
        if fPedido.tAuxPedidoGrade.Locate('CodGrade;Posicao',VarArrayOf([DM1.tGradeItemCodGrade.AsInteger,DM1.tGradeItemPosicao.AsInteger]),[locaseinsensitive]) then
          begin
            fPedido.tAuxPedidoGrade.Edit;
            fPedido.tAuxPedidoGradeQtd.AsInteger := DM1.tGradeItemQtdPar.AsInteger * CurrencyEdit2.AsInteger;
            vQtdPares := vQtdPares + fPedido.tAuxPedidoGradeQtd.AsInteger;
            fPedido.tAuxPedidoGrade.Post;
          end;
        DM1.tGradeItem.Next;
      end;
     CurrencyEdit1.AsInteger := vQtdPares;
  end;
end;

procedure TfPedidoGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
