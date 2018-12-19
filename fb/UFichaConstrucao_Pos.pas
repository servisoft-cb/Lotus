unit UFichaConstrucao_Pos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TfFichaConstrucao_Pos = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFichaConstrucao_Pos: TfFichaConstrucao_Pos;

implementation

uses UDM1, UDMFichaConstrucao;

{$R *.dfm}

procedure TfFichaConstrucao_Pos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfFichaConstrucao_Pos.RxDBLookupCombo1Enter(Sender: TObject);
begin
  DM1.tPosicao.IndexFieldNames := 'Nome';
end;

procedure TfFichaConstrucao_Pos.BitBtn1Click(Sender: TObject);
begin
  DMFichaConstrucao.cdsFichaConstrucao_Pos.Post;
  Close;
end;

end.
