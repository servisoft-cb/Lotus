unit UExcTalao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, ExtCtrls, Db, DBTables;

type
  TfExcTalao = class(TForm)
    Panel1: TPanel;
    StaticText1: TStaticText;
    CurrencyEdit1: TCurrencyEdit;
    StaticText2: TStaticText;
    CurrencyEdit2: TCurrencyEdit;
    Bevel1: TBevel;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    tTalaoMov: TTable;
    dsTalaoMov: TDataSource;
    tTalaoMovLote: TIntegerField;
    tTalaoMovTalao: TIntegerField;
    tTalaoMovSetor: TIntegerField;
    tTalaoMovDataEnt: TDateField;
    tTalaoMovHoraEnt: TTimeField;
    tTalaoMovDataSaida: TDateField;
    tTalaoMovHoraSaida: TTimeField;
    tTalaoMovCodAtelier: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fExcTalao: TfExcTalao;

implementation

uses UAgendaTelef;

{$R *.DFM}

procedure TfExcTalao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfExcTalao.BitBtn3Click(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger < 1 then
    ShowMessage('Falta informar o número do lote')
  else
  if CurrencyEdit2.AsInteger < 1 then
    ShowMessage('Falta informar o número do talão')
  else
    begin
      if MessageDlg('                                  ATENÇÃO'
                    +#13#13+
                    'Vai ser deletado o movimento do talão de todos os setores!'+#13+
                    '          só vai deixar o setor 1',mtInformation,
                    [mbOK,mbNO],0) = mrOK then
        begin
          tTalaoMov.Filtered := False;
          tTalaoMov.Filter   := 'Lote = '''+CurrencyEdit1.Text+''' and Talao = '''+CurrencyEdit2.Text+'''';
          tTalaoMov.Filtered := True;
          tTalaoMov.First;
          while not tTalaoMov.Eof do
            begin
              if tTalaoMovSetor.AsInteger = 1 then
                begin
                  tTalaoMov.Edit;
                  tTalaoMovDataSaida.Clear;
                  tTalaoMovHoraSaida.Clear;
                  tTalaoMov.Post;
                  tTalaoMov.Next;
                end
              else
                tTalaoMov.Delete;
            end;
          tTalaoMov.Filtered := False;
          tTalaoMov.Refresh;
        end;
    end;
end;

procedure TfExcTalao.BitBtn6Click(Sender: TObject);
begin
  Close;
end;

procedure TfExcTalao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
