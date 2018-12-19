unit UFichaConstrucao_Mat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Grids,
  DBVGrids;

type
  TfFichaConstrucao_Mat = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    StaticText1: TStaticText;
    DBEdit6: TDBEdit;
    StaticText2: TStaticText;
    DBEdit7: TDBEdit;
    StaticText3: TStaticText;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    DBEdit10: TDBEdit;
    StaticText6: TStaticText;
    DBEdit11: TDBEdit;
    StaticText7: TStaticText;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    StaticText8: TStaticText;
    DBEdit14: TDBEdit;
    StaticText9: TStaticText;
    VDBGrid2: TVDBGrid;
    Panel6: TPanel;
    Label6: TLabel;
    DBEdit15: TDBEdit;
    Label7: TLabel;
    DBText1: TDBText;
    Panel7: TPanel;
    Label8: TLabel;
    DBEdit16: TDBEdit;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFichaConstrucao_Mat: TfFichaConstrucao_Mat;

implementation

uses UDM1, UDMFichaConstrucao;

{$R *.dfm}

procedure TfFichaConstrucao_Mat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfFichaConstrucao_Mat.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tPosicao.IndexFieldNames := 'Nome';
end;

procedure TfFichaConstrucao_Mat.BitBtn1Click(Sender: TObject);
begin
  DMFichaConstrucao.cdsFichaConstrucao_Pos.Post;
  Close;
end;

procedure TfFichaConstrucao_Mat.BitBtn2Click(Sender: TObject);
begin
  DMFichaConstrucao.cdsFichaConstrucao_Mat.CancelUpdates;
  Close;
end;

procedure TfFichaConstrucao_Mat.FormShow(Sender: TObject);
begin
  Panel3.Visible  := (DMFichaConstrucao.cdsFichaConstrucao_PosSOMENTEMATERIAL.AsString = 'N');
  Panel4.Visible  := (DMFichaConstrucao.cdsFichaConstrucao_PosINFORMAROPCAOMAT.AsString = 'S');
  Panel5.Visible  := (DMFichaConstrucao.cdsFichaConstrucao_PosINFORMARGRADE.AsString = 'S');
  BitBtn3.Visible := (DMFichaConstrucao.cdsFichaConstrucao_PosINFORMARGRADE.AsString = 'S');
end;

procedure TfFichaConstrucao_Mat.BitBtn3Click(Sender: TObject);
begin
  DMFichaConstrucao.cdsFichaConstrucao_MatTam.First;
  if DMFichaConstrucao.cdsFichaConstrucao_MatTamTAMMAT.AsString <> '' then
  begin
    ShowMessage('Tamanho do material já informado!');
    exit;
  end;
  while not DMFichaConstrucao.cdsFichaConstrucao_MatTam.Eof do
  begin
    DMFichaConstrucao.cdsFichaConstrucao_MatTam.Edit;
    DMFichaConstrucao.cdsFichaConstrucao_MatTamTAMMAT.AsString := DMFichaConstrucao.cdsFichaConstrucao_MatTamTAMREF.AsString;
    DMFichaConstrucao.cdsFichaConstrucao_MatTam.Post;

    DMFichaConstrucao.cdsFichaConstrucao_MatTam.Next;
  end;
end;

end.
