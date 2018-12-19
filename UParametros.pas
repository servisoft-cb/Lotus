unit UParametros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBCtrls, Mask, DB, DBTables, ToolEdit,
  CurrEdit, ComCtrls, Grids, DBGrids, RXDBCtrl, RxLookup, DBFilter,
  RxDBComb;

type
  TfParametros = class(TForm)
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Panel3: TPanel;
    SpeedButton10: TSpeedButton;
    SpeedButton1: TSpeedButton;
    StaticText1: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    StaticText2: TStaticText;
    RxDBLookupCombo3: TRxDBLookupCombo;
    StaticText3: TStaticText;
    BitBtn7: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Label10: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    StaticText4: TStaticText;
    CurrencyEdit2: TCurrencyEdit;
    Label15: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    TabSheet3: TTabSheet;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    Label21: TLabel;
    DBEdit19: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label22: TLabel;
    DBEdit20: TDBEdit;
    Label28: TLabel;
    Label30: TLabel;
    DirectoryEdit2: TDirectoryEdit;
    Label23: TLabel;
    DirectoryEdit3: TDirectoryEdit;
    Label20: TLabel;
    Label39: TLabel;
    DBCheckBox17: TDBCheckBox;
    DBEdit18: TDBEdit;
    RxDBComboBox2: TRxDBComboBox;
    DBCheckBox47: TDBCheckBox;
    DBCheckBox48: TDBCheckBox;
    DBCheckBox49: TDBCheckBox;
    DBCheckBox50: TDBCheckBox;
    DBCheckBox51: TDBCheckBox;
    DBCheckBox52: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    Label24: TLabel;
    DBEdit22: TDBEdit;
    Label133: TLabel;
    Label132: TLabel;
    Label60: TLabel;
    RxDBComboBox81: TRxDBComboBox;
    RxDBComboBox80: TRxDBComboBox;
    RxDBComboBox32: TRxDBComboBox;
    RxDBComboBox82: TRxDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo4Enter(Sender: TObject);
  private
    { Private declarations }
    procedure Habilita_Desabilita;
  public
    { Public declarations }
  end;

var
  fParametros: TfParametros;

implementation

uses UDM1, USetor, UAtelier;

{$R *.DFM}

procedure TfParametros.Habilita_Desabilita;
begin
  Panel2.Enabled  := not(Panel2.Enabled);
  Panel3.Enabled  := not(Panel3.Enabled);
  BitBtn1.Enabled := not(BitBtn1.Enabled);
  BitBtn2.Enabled := not(BitBtn2.Enabled);
  BitBtn3.Enabled := not(BitBtn3.Enabled);
  BitBtn4.Enabled := not(BitBtn4.Enabled);
  TabSheet3.Enabled := not(TabSheet3.Enabled);
end;

procedure TfParametros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM1.tOrdImpTalao.Close;
  DM1.tModelista.Close;
  DM1.tSetor.Close;
  DM1.tAtelier.Close;
  Action := Cafree;
end;

procedure TfParametros.BitBtn1Click(Sender: TObject);
begin
  DM1.tParametrosEndSalvarXMLNFe.AsString := DirectoryEdit2.Text;
  DM1.tParametrosEndSalvarPDFNFe.AsString := DirectoryEdit3.Text;
  DM1.tParametros.Post;
  Habilita_Desabilita;
end;

procedure TfParametros.BitBtn2Click(Sender: TObject);
begin
  DM1.tParametros.Cancel;
  Habilita_Desabilita;
end;

procedure TfParametros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if DM1.tParametros.State in [dsEdit] then
    begin
      CanClose := False;
      ShowMessage('Você deve confirmar ou cancelar este parâmetro!');
    end
  else
    CanClose := True;
end;

procedure TfParametros.BitBtn3Click(Sender: TObject);
begin
  DM1.tParametros.Edit;
  Habilita_Desabilita;
end;

procedure TfParametros.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfParametros.BitBtn7Click(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger = 0 then
    ShowMessage('Falta informar a ordem')
  else
  if RxDBLookupCombo2.Text = '' then
    ShowMessage('Falta informar o setor')
  else                
  if DM1.tOrdImpTalao.Locate('CodSetor',RxDBLookupCombo2.KeyValue,[loCaseInsensitive]) then
    ShowMessage('Setor já informado')
  else
    begin
      DM1.tSetor.IndexFieldNames := 'Codigo';
      DM1.tSetor.FindKey([RxDBLookupCombo2.KeyValue]);
      if RxDBLookupCombo3.Text <> '' then
        begin
          DM1.tAtelier.IndexFieldNames := 'Codigo';
          DM1.tAtelier.FindKey([RxDBLookupCombo3.KeyValue]);
        end;
      DM1.tOrdImpTalao.SetKey;
      DM1.tOrdImpTalaoOrdem.AsInteger := CurrencyEdit1.AsInteger;
      if DM1.tOrdImpTalao.GotoKey then
        ShowMessage('Esta ordem já esta lançada')
      else
        begin
          DM1.tOrdImpTalao.Insert;
          DM1.tOrdImpTalaoOrdem.AsInteger := CurrencyEdit1.AsInteger;
          DM1.tOrdImpTalaoCodSetor.AsInteger := RxDBLookupCombo2.KeyValue;
          if RxDBLookupCombo3.Text <> '' then
            DM1.tOrdImpTalaoCodAtelier.AsInteger  := RxDBLookupCombo3.KeyValue;
          DM1.tOrdImpTalaoCapacidadeDia.AsInteger := CurrencyEdit2.AsInteger;
          DM1.tOrdImpTalao.Post;
          BitBtn8.Click;
        end;
    end;
  CurrencyEdit1.SetFocus;
end;

procedure TfParametros.BitBtn16Click(Sender: TObject);
begin
  CurrencyEdit1.AsInteger := DM1.tOrdImpTalaoOrdem.AsInteger;
  RxDBLookupCombo2.KeyValue := DM1.tOrdImpTalaoCodSetor.AsInteger;
  if DM1.tOrdImpTalaoCodAtelier.AsInteger > 0 then
    RxDBLookupCombo3.KeyValue := DM1.tOrdImpTalaoCodAtelier.AsInteger;
  CurrencyEdit2.AsInteger := DM1.tOrdImpTalaoCapacidadeDia.AsInteger;
  DM1.tOrdImpTalao.Delete;
  CurrencyEdit1.SetFocus;
end;

procedure TfParametros.BitBtn9Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro selecionado?',mtConfirmation,[mbOK,mbNo],0) = mrOK then
    begin
      DM1.tOrdImpTalao.Delete;
      CurrencyEdit1.SetFocus;
    end;
end;

procedure TfParametros.BitBtn8Click(Sender: TObject);
begin
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  RxDBLookupCombo2.ClearValue;
  RxDBLookupCombo3.ClearValue;
end;

procedure TfParametros.SpeedButton10Click(Sender: TObject);
begin
  if DM1.tUsuarioSetor.AsBoolean then
    begin
      fSetor := TfSetor.Create(Self);
      fSetor.ShowModal;
      DM1.tSetor.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfParametros.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioAtelier.AsBoolean then
    begin
      fAtelier := TfAtelier.Create(Self);
      fAtelier.ShowModal;
      DM1.tAtelier.Refresh;
    end
  else
    ShowMessage('Usuário "' + DM1.tUsuarioUsuario.AsString + '" não autorizado a abrir este formulário!');
end;

procedure TfParametros.FormShow(Sender: TObject);
begin
  DM1.tOrdImpTalao.Open;
  DM1.tModelista.Open;
  DM1.tSetor.Open;
  DM1.tAtelier.Open;
  PageControl1.ActivePageIndex := 0;

  DirectoryEdit2.Text := DM1.tParametrosEndSalvarXMLNFe.AsString;
  DirectoryEdit3.Text := DM1.tParametrosEndSalvarPDFNFe.AsString;
end;

procedure TfParametros.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then
  begin
    DBEdit10.ReadOnly := not(DBEdit10.ReadOnly);
    DBEdit20.ReadOnly := not(DBEdit20.ReadOnly);
    DBEdit22.ReadOnly := not(DBEdit22.ReadOnly);
    GroupBox1.Visible := not(GroupBox1.Visible);
    DirectoryEdit2.ReadOnly := not(DirectoryEdit2.ReadOnly);
    DirectoryEdit3.ReadOnly := not(DirectoryEdit3.ReadOnly);
  end;
end;

procedure TfParametros.RxDBLookupCombo4Enter(Sender: TObject);
begin
  DM1.tSetor.IndexFieldNames := 'Nome';
end;

end.
