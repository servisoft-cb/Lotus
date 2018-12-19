unit UPedAmostraMat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, ToolEdit, CurrEdit, Buttons, RxLookup, DBCtrls,
  RXCtrls, Grids, DBGrids, RXDBCtrl;

type
  TfPedAmostraMat = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    RxLabel1: TRxLabel;
    DBText1: TDBText;
    RxLabel2: TRxLabel;
    DBText2: TDBText;
    RxLabel3: TRxLabel;
    DBText3: TDBText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    StaticText3: TStaticText;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn16: TBitBtn;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vItem: Integer;
    procedure LImpa_Edit;
  public
    { Public declarations }
  end;

var
  fPedAmostraMat: TfPedAmostraMat;
  vAltera: Boolean;

implementation

uses UDM1, UDM2, UPedAmostra, UPosicao, UAgendaTelef;

{$R *.DFM}

procedure TfPedAmostraMat.Limpa_Edit;
begin
  Edit1.Clear;
  Edit2.Clear;
  RxDBLookupCombo1.ClearValue;
  vAltera               := False;
end;

procedure TfPedAmostraMat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfPedAmostraMat.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfPedAmostraMat.BitBtn5Click(Sender: TObject);
var
  vItemAux : Integer;
begin
  if (Edit1.Text <> '') and (RxDBLookupCombo1.Text <> '') then
    begin
      DM1.tPedAmostraMat.Refresh;
      DM1.tPedAmostraMat.Last;
      vItemAux := DM1.tPedAmostraMatOrdem.AsInteger;

      DM1.tPedAmostraMat.Insert;
      DM1.tPedAmostraMatPedido.AsInteger     := DM1.tPedAmostraPedido.AsInteger;
      DM1.tPedAmostraMatItem.AsInteger    := DM1.tPedAmostraItItem.AsInteger;
      if vAltera then
        DM1.tPedAmostraMatOrdem.AsInteger := vItem
      else
        DM1.tPedAmostraMatOrdem.AsInteger    := vItemAux + 1;
      DM1.tPedAmostraMatMaterial.AsString    := Edit1.Text;
      DM1.tPedAmostraMatCor.AsString         := Edit2.Text;
      DM1.tPedAmostraMatCodPosicao.AsInteger := RxDBLookupCombo1.KeyValue;
      DM1.tPedAmostraMat.Post;
      Limpa_Edit;
      Edit1.SetFocus;
    end
  else
    begin
      ShowMessage('Você deve informar "Material", "Posição" e "Consumo p/ Par", para confirmar o item!');
      Edit1.SetFocus;
    end;
end;

procedure TfPedAmostraMat.BitBtn6Click(Sender: TObject);
begin
  Limpa_Edit;
  Edit1.SetFocus;
end;

procedure TfPedAmostraMat.BitBtn16Click(Sender: TObject);
begin
  if not DM1.tPedAmostraMat.IsEmpty then
    begin
      if Edit1.Text = '' then
        begin
          vAltera                   := True;
          vItem                     := DM1.tPedAmostraMatOrdem.AsInteger;
          Edit1.Text                := DM1.tPedAmostraMatMaterial.AsString;
          Edit2.Text                := DM1.tPedAmostraMatCor.AsString;
          RxDBLookupCombo1.KeyValue := DM1.tPedAmostraMatCodPosicao.AsInteger;
          DM1.tPedAmostraMat.Delete;
        end
      else
        ShowMessage('Há um item pendente, você deve confirmar ou cancelar antes de alterar outro item!');
      Edit1.SetFocus;
    end
  else
    ShowMessage('Não há registro p/ ser alterado!');
end;

procedure TfPedAmostraMat.BitBtn7Click(Sender: TObject);
begin
  if not DM1.tPedAmostraMat.IsEmpty then
    begin
      if MessageDlg('Deseja realmente excluir o registro?',mtconfirmation,[mbok,mbno],0)=mrok then
        DM1.tPedAmostraMat.Delete;
    end
  else
    ShowMessage('Não há registro p/ ser excluído!');
end;

procedure TfPedAmostraMat.SpeedButton1Click(Sender: TObject);
begin
  if DM1.tUsuarioPosicao.AsBoolean then
    begin
      fPosicao := TfPosicao.Create(Self);
      fPosicao.ShowModal;
    end
  else
    ShowMessage('Usuário '+ DM1.tUsuarioUsuario.AsString + ' não está autorizado a abrir o formulário de posições!');
end;

procedure TfPedAmostraMat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
