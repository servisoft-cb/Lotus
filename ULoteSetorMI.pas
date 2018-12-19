unit ULoteSetorMI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, RXDBCtrl, DBFilter;

type
  TfLoteSetorMI = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn6: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    BitBtn3: TBitBtn;
    RxDBFilter1: TRxDBFilter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLoteSetorMI: TfLoteSetorMI;

implementation

uses ULote, UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfLoteSetorMI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RxDBFilter1.Active := False;
  Action := Cafree;
end;

procedure TfLoteSetorMI.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  vRepetido : array[1..8] of Integer;
  i : Integer;
  flag : String[1];
begin
  flag := 'S';
  for i := 1 to 8 do
    vRepetido[i] := 0;
  fLote.mSetorAux.First;
  while not fLote.mSetorAux.Eof do
    begin
      if fLote.mSetorAuxOrdem.AsInteger > fLote.mSetorAux.RecordCount then
        begin
          ShowMessage('Nº da ordem maior que setores existentes');
          flag := 'N';
          fLote.mSetorAux.Last;
        end
      else
        begin
          if fLote.mSetorAuxAtelier.AsBoolean then
            begin
              DM1.tSetor.IndexFieldNames       := 'Codigo';
              DM1.tSetor.FindKey([fLote.mSetorAuxCodSetor.AsInteger]);
              if (DM1.tSetorAtelier.AsBoolean) and (fLote.mSetorAuxCodAtelier.AsInteger < 1) then
                ShowMessage('O setor ' + fLote.mSetorAuxCodSetor.AsString + ' é atelier, e não foi informado o atelier');
            end;
          vRepetido[fLote.mSetorAuxOrdem.AsInteger] := vRepetido[fLote.mSetorAuxOrdem.AsInteger] + 1;
        end;
      fLote.mSetorAux.Next;
    end;
  if flag = 'S' then
    begin
      for i := 1 to fLote.mSetorAux.RecordCount do
        begin
          if vRepetido[i] > 1 then
            begin
              ShowMessage('A ordem ' + IntToStr(i) + ' foi digitada mais de uma vez');
              flag := 'N';
            end
          else
          if vRepetido[i] = 0 then
            begin
              ShowMessage('A ordem ' + IntToStr(i) + ' não foi informada');
              flag := 'N';
            end;
        end;
    end;
  if flag = 'N' then
    CanClose := False
  else
    CanClose := True;
end;

procedure TfLoteSetorMI.BitBtn3Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o setor?',mtconfirmation,[mbok,mbno],0)=mrok then
    fLote.mSetorAux.Delete;
end;

procedure TfLoteSetorMI.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfLoteSetorMI.FormShow(Sender: TObject);
begin
  RxDBFilter1.Active := True;
end;

procedure TfLoteSetorMI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
