unit UCalculaDatas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, RXCtrls, DBCtrls, Buttons;

type
  TfCalculaDatas = class(TForm)
    Panel1: TPanel;
    RxLabel1: TRxLabel;
    DBText1: TDBText;
    RxLabel2: TRxLabel;
    DBText2: TDBText;
    RxLabel3: TRxLabel;
    DBText3: TDBText;
    RxLabel4: TRxLabel;
    DBText4: TDBText;
    Bevel1: TBevel;
    BitBtn5: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCalculaDatas: TfCalculaDatas;

implementation

uses UDM1;

{$R *.DFM}

procedure TfCalculaDatas.BitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TfCalculaDatas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //aqui 01/04/2010
  //DM1.tProgramacaoItens.Post;
  Action := Cafree;
end;

procedure TfCalculaDatas.FormShow(Sender: TObject);
begin
  //aqui 01/04/2010
  //DM1.tProgramacaoItens.Edit;
end;

end.
