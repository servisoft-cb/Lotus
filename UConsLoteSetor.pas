unit UConsLoteSetor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, ExtCtrls, Mask,
  RXCtrls, RxLookup;

type
  TfConsLoteSetor = class(TForm)
    Panel3: TPanel;
    DBText1: TDBText;
    RxDBGrid2: TRxDBGrid;
    StaticText1: TStaticText;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    StaticText2: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsLoteSetor: TfConsLoteSetor;

implementation

uses UConsLoteExp, UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfConsLoteSetor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsLoteSetor.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsLoteSetor.RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = vk_Delete) then
    Key := vk_Return;
end;

procedure TfConsLoteSetor.BitBtn5Click(Sender: TObject);
begin
  if RxDBLookupCombo1.Text = '' then
    DM1.tLoteSetorCodAtelier.AsInteger := 0
  else
    DM1.tLoteSetorCodAtelier.AsInteger := RxDBLookupCombo1.KeyValue;
  Edit1.Clear;
  DM1.tLoteSetor.Post;
  Panel1.Enabled := False;
  RxDBGrid2.SetFocus;
end;

procedure TfConsLoteSetor.RxDBGrid2DblClick(Sender: TObject);
begin
  if DM1.tLoteSetorlkAtelier.AsBoolean then
    begin
      Panel1.Enabled := True;
      Edit1.Text := DM1.tLoteSetorlkNomeAtelier.AsString;
      DM1.tLoteSetor.Edit;
      RxDBLookupCombo1.SetFocus;
    end
  else
    ShowMessage('Este setor não é atelier');
end;

procedure TfConsLoteSetor.Panel1Exit(Sender: TObject);
begin
  Edit1.Clear;
  Panel1.Enabled := False;
  RxDBLookupCombo1.ClearValue;
end;

procedure TfConsLoteSetor.BitBtn2Click(Sender: TObject);
begin
  Edit1.Clear;
  DM1.tLoteSetor.Cancel;
  Panel1.Enabled := False;
  RxDBGrid2.SetFocus;
end;

procedure TfConsLoteSetor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
