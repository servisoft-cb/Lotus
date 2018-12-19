unit UPedAmostraGrade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, ToolEdit, CurrEdit, Grids, DBVGrids, Buttons,
  ExtCtrls;

type
  TfPedAmostraGrade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel5: TPanel;
    BitBtn5: TBitBtn;
    VDBGrid1: TVDBGrid;
    CurrencyEdit1: TCurrencyEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure VDBGrid1Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox4CloseUp(Sender: TObject);
    procedure DBLookupComboBox4DropDown(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure VDBGrid1CellClick(Column: TColumn);
    procedure VDBGrid1ColEnter(Sender: TObject);
    procedure VDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure MontaGrade;
  public
    { Public declarations }
  end;

var
  fPedAmostraGrade: TfPedAmostraGrade;

implementation

uses UPedAmostra, UDM1, UDM2, UAgendaTelef;

{$R *.DFM}

procedure TfPedAmostraGrade.MontaGrade;
begin
  Edit1.Text := DM1.tGradeCodLetra.AsString;
  Edit2.Text := DM1.tGradeLargura.AsString;
  if vEdit <> 'C' then
    begin
      if DM1.tGradeTipoDig.AsString = 'P' then
        begin
          CurrencyEdit1.ReadOnly := False;
          VDBGrid1.ReadOnly      := False;
        end
      else
        begin
          CurrencyEdit1.ReadOnly := True;
          VDBGrid1.ReadOnly      := True;
        end;
    end;

  if vEdit = 'N' then
    begin
      fPedAmostra.tAuxPedAmostraGrade.First;
      while not fPedAmostra.tAuxPedAmostraGrade.Eof do
        fPedAmostra.tAuxPedAmostraGrade.delete;
      DM1.tGradeItem.First;
      while not DM1.tGradeItem.Eof do
        begin
          fPedAmostra.tAuxPedAmostraGrade.Insert;
          fPedAmostra.tAuxPedAmostraGradeCodGrade.AsInteger := DM1.tGradeItemCodGrade.AsInteger;
          fPedAmostra.tAuxPedAmostraGradePosicao.AsInteger  := DM1.tGradeItemPosicao.AsInteger;
          fPedAmostra.tAuxPedAmostraGradeQtd.AsString       := '';
          fPedAmostra.tAuxPedAmostraGrade.Post;
          DM1.tGradeItem.Next;
        end;
    end;
  fPedAmostra.tAuxPedAmostraGrade.First;
end;

procedure TfPedAmostraGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPedAmostraGrade.FormShow(Sender: TObject);
begin
  BitBtn5.Caption := 'Continuar';
  if vEdit = 'C' then
    begin
      BitBtn5.Caption := 'Fechar';
      DbLookupComboBox4.Enabled := False;
      CurrencyEdit1.Enabled     := False;
      VDBGrid1.ReadOnly         := True;
    end
  else
  if vEdit = 'S' then
    begin
      DbLookupComboBox4.Enabled := False;
      CurrencyEdit1.Enabled     := True;
      VDBGrid1.ReadOnly         := False;
    end
  else
    begin
      DbLookupComboBox4.Enabled := True;
      CurrencyEdit1.Enabled     := True;
      VDBGrid1.ReadOnly         := False;
    end;

    vDBGrid1.Columns[2].Destroy;
  if vEdit = 'C' then
    begin
      DM1.tGrade.IndexFieldNames := 'Codigo';
      DM1.tGrade.FindKey([DM1.tPedAmostraItCodGrade.AsInteger]);
      DBLookupComboBox4.KeyValue := DM1.tGradeCodigo.AsInteger;
      CurrencyEdit1.AsInteger    := DM1.tPedAmostraItQtdPares.AsInteger;
      MontaGrade;
    end
  else
  if vEdit = 'S' then
    begin
      fPedAmostra.tAuxPedAmostraGrade.First;
      DM1.tGrade.IndexFieldNames := 'Codigo';
      DM1.tGrade.FindKey([fPedAmostra.tAuxPedAmostraGradeCodGrade.AsInteger]);
      DBLookupComboBox4.KeyValue := DM1.tGradeCodigo.AsInteger;
      MontaGrade;
    end;
{  else
    begin
      DM1.tGrade.IndexFieldNames := 'Codigo';
      DM1.tGrade.FindKey([DM1.tProdutoCodGrade.AsInteger]);
      DBLookupComboBox4.KeyValue := DM1.tGradeCodigo.AsInteger;
    end;}
  if vEdit = 'S' then
    CurrencyEdit1.Value := fPedAmostra.CurrencyEdit1.Value;
end;

procedure TfPedAmostraGrade.VDBGrid1Enter(Sender: TObject);
begin
 if CurrencyEdit1.Value = 0 then
   begin
     if vEdit <> 'C' then
       begin
         ShowMessage('É obrigatório informar a quantidade total!');
         CurrencyEdit1.SetFocus;
       end;
   end
 else
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfPedAmostraGrade.BitBtn5Click(Sender: TObject);
var
 vQtd : Real;
begin
  if vEdit <> 'C' then
    begin
      vQtd      := 0;
      fPedAmostra.tAuxPedAmostraGrade.First;
      while not fPedAmostra.tAuxPedAmostraGrade.Eof do
        begin
          vQtd := vQtd + fPedAmostra.tAuxPedAmostraGradeQtd.AsFloat;
          fPedAmostra.tAuxPedAmostraGrade.Next;
        end;
      if vQtd <> CurrencyEdit1.Value then
        begin
          ShowMessage('Quantidade da grade diferente da quantidade total!');
          CurrencyEdit1.SetFocus;
        end
      else
        begin
          fPedAmostra.CurrencyEdit1.Value := vQtd;
          Close
        end;
    end
  else
  if vEdit = 'C' then
    Close;
end;

procedure TfPedAmostraGrade.DBLookupComboBox4CloseUp(Sender: TObject);
begin
  if DBLookupComboBox4.Text <> '' then
    begin
      Edit1.Text := DM1.tGradeCodLetra.AsString;
      Edit2.Text := DM1.tGradeLargura.AsString;
    end;
  DM1.tGrade.IndexFieldNames := 'Codigo';
end;

procedure TfPedAmostraGrade.DBLookupComboBox4DropDown(Sender: TObject);
begin
  DM1.tGrade.IndexFieldNames := 'Nome';
end;

procedure TfPedAmostraGrade.DBLookupComboBox4Exit(Sender: TObject);
begin
  MontaGrade;
end;

procedure TfPedAmostraGrade.VDBGrid1CellClick(Column: TColumn);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfPedAmostraGrade.VDBGrid1ColEnter(Sender: TObject);
begin
 if vDBGrid1.SelectedIndex = 0 then
   vDBGrid1.SelectedIndex := 1;
end;

procedure TfPedAmostraGrade.VDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfPedAmostraGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
