unit UConsMovTalaoMI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, ExtCtrls, Db, DBTables;

type
  TfConsMovTalaoMI = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    RxDBGrid2: TRxDBGrid;
    GroupBox3: TGroupBox;
    RxDBGrid3: TRxDBGrid;
    GroupBox5: TGroupBox;
    BitBtn3: TBitBtn;
    RxDBGrid5: TRxDBGrid;
    RxDBGrid1: TRxDBGrid;
    tTalaoMovMI: TTable;
    dsTalaoMovMI: TDataSource;
    tTalaoMovMILote: TIntegerField;
    tTalaoMovMITalao: TIntegerField;
    tTalaoMovMISetor: TIntegerField;
    tTalaoMovMIDataEnt: TDateField;
    tTalaoMovMIHoraEnt: TTimeField;
    tTalaoMovMIDataSaida: TDateField;
    tTalaoMovMIHoraSaida: TTimeField;
    tTalaoMovMICodAtelier: TIntegerField;
    tTalaoMovMIlkNomeSetor: TStringField;
    tTalaoMovMIlkNomeAtelier: TStringField;
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fConsMovTalaoMI: TfConsMovTalaoMI;

implementation

uses UDM1, UConsMovTalaoDMI, UAgendaTelef;

{$R *.DFM}

procedure TfConsMovTalaoMI.Edit1Change(Sender: TObject);
begin
  try
    DM1.tLoteMI.IndexFieldNames := 'Lote';
    DM1.tLoteMI.FindNearest([Edit1.Text]);
  except
    ShowMessage('Digite apenas números aqui!');
  end;
end;

procedure TfConsMovTalaoMI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Screen.FormCount < 3 then
    begin
      Dm1.tLoteMI.Close;
      Dm1.tLotePedidoMI.Close;
      DM1.tLoteSetorMI.Close;
      Dm1.tTalaoMI.Close;
      DM1.tTalaoGradeMI.Close;
      DM1.tTalaoMovMI.Close;
      DM1.tMaterial.Close;
      DM1.tGrade.Close;
      DM1.tGradeItem.Close;
      DM1.tProduto.Close;
      DM1.tSetor.Close;
      DM1.tAtelier.Close;
      DM1.tCor.Close;
    end;
  Action := Cafree;
end;

procedure TfConsMovTalaoMI.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfConsMovTalaoMI.BitBtn2Click(Sender: TObject);
begin
  Screen.Cursor                                 := crHourGlass;
  fConsMovTalaoDMI                              := TfConsMovTalaoDMI.Create(Self);
  fConsMovTalaoDMI.qSetores.Params[0].AsInteger := DM1.tLoteMILote.AsInteger;
  fConsMovTalaoDMI.qSetores.Active              := True;
  fConsMovTalaoDMI.qLote.Params[0].AsInteger    := DM1.tLoteMILote.AsInteger;
  fConsMovTalaoDMI.qLote.Active                 := True;
  Screen.Cursor                                 := crDefault;
  fConsMovTalaoDMI.ShowModal;
end;

procedure TfConsMovTalaoMI.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = ([ssAlt])) and (Key = 101) then
    begin
      fAgendaTelef := TfAgendaTelef.Create(Self);
      fAgendaTelef.ShowModal;
    end;
end;

procedure TfConsMovTalaoMI.FormShow(Sender: TObject);
begin
  Dm1.tLoteMI.Open;
  Dm1.tLotePedidoMI.Open;
  DM1.tLoteSetorMI.Open;
  Dm1.tTalaoMI.Open;
  DM1.tTalaoGradeMI.Open;
  DM1.tTalaoMovMI.Open;
  DM1.tMaterial.Open;
  DM1.tGrade.Open;
  DM1.tGradeItem.Open;
  DM1.tGradeItemlk.Open;
  DM1.tProduto.Open;
  DM1.tSetor.Open;
  DM1.tAtelier.Open;
  DM1.tCor.Open;
end;

end.
