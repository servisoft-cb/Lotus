unit UConsCPagarHist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls;

type
  TfConsCPagarHist = class(TForm)
    Panel1: TPanel;
    RxDBGrid3: TRxDBGrid;
    Panel2: TPanel;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    DBText3: TDBText;
    Label6: TLabel;
    DBText4: TDBText;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    DBText5: TDBText;
    Label8: TLabel;
    DBText6: TDBText;
    Label9: TLabel;
    DBText7: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsCPagarHist: TfConsCPagarHist;

implementation

Uses UDM1, UAgendaTelef;

{$R *.DFM}

procedure TfConsCPagarHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfConsCPagarHist.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsCPagarHist.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

end.
