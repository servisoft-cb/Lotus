unit ULeitorTalaoAuxiliar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, RXCtrls, ExtCtrls;

type
  TfLeitorTalaoAuxiliar = class(TForm)
    RxLabel4: TRxLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  fLeitorTalaoAuxiliar: TfLeitorTalaoAuxiliar;

implementation

uses UDM1;

{$R *.dfm}

procedure TfLeitorTalaoAuxiliar.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfLeitorTalaoAuxiliar.Edit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    begin
      if Length(Edit1.Text) < 12 then
        begin
          ShowMessage('Falta nº(s) p/ dar entrada neste talão auxiliar!');
          Edit1.SetFocus;
          Edit1.SelectAll;
        end
      else
      begin
        DM1.tLote.filtered  := False;
        DM1.tLote.filter    := 'Lote = ' + IntToStr(StrToInt(Copy(Edit1.Text,2,5)));
        DM1.tLote.filtered  := True;
        DM1.tTalaoAuxiliar.Filtered := False;
        DM1.tTalaoAuxiliar.Filter   := 'Talao = ' + IntToStr(StrToInt(Copy(Edit1.Text,7,4))) +
                                       ' and CodSetor = ' + IntToStr(StrToInt(Copy(Edit1.Text,11,2)));
        DM1.tTalaoAuxiliar.Filtered := True;
        if (Copy(Edit1.Text,1,1) = '1') then
        begin
          if (DM1.tTalaoAuxiliarDtEntrada.IsNull) and (DM1.tTalaoAuxiliarHrEntrada.IsNull) then
          begin
            DM1.tTalaoAuxiliar.Edit;
            DM1.tTalaoAuxiliarDtEntrada.AsDateTime := Date;
            DM1.tTalaoAuxiliarHrEntrada.AsDateTime := Time;
            DM1.tTalaoAuxiliar.Post;
          end
          else
          begin
            MessageDlg('Talão auxiliar de entrada já lido!',mtWarning,[mbOK],0);
            Edit1.Clear;
            Edit1.SetFocus;
            exit;
          end;
        end
        else
        if (Copy(Edit1.Text,1,1) = '3') then
        begin
          if (DM1.tTalaoAuxiliarDtEntrada.IsNull) or (DM1.tTalaoAuxiliarHrEntrada.IsNull) then
          begin
            MessageDlg('Talão auxiliar de entrada ainda não foi lido!',mtWarning,[mbOK],0);
            Edit1.Clear;
            Edit1.SetFocus;
            exit;
          end
          else
          if (DM1.tTalaoAuxiliarDtSaida.IsNull) and (DM1.tTalaoAuxiliarHrSaida.IsNull) then
          begin
            DM1.tTalaoAuxiliar.Edit;
            DM1.tTalaoAuxiliarDtSaida.AsDateTime := Date;
            DM1.tTalaoAuxiliarHrSaida.AsDateTime := Time;
            DM1.tTalaoAuxiliar.Post;
          end
          else
          begin
            MessageDlg('Talão auxiliar de saída já lido!',mtWarning,[mbOK],0);
            Edit1.Clear;
            Edit1.SetFocus;
            exit;
          end;
        end;
        Label1.Caption := 'Talão lido com sucesso!';
        Timer1.Enabled := True;
      end;
    end;
end;

procedure TfLeitorTalaoAuxiliar.Timer1Timer(Sender: TObject);
begin
  Label1.Caption := 'Aguardando Leitura...';
  Edit1.Clear;
  Edit1.SetFocus;
  Timer1.Enabled := False;
end;

procedure TfLeitorTalaoAuxiliar.FormShow(Sender: TObject);
begin
  DM1.tLote.Open;
  DM1.tTalaoAuxiliar.Open;
end;

end.
