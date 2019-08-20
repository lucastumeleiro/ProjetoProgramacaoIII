unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    lb_Usuario: TLabel;
    lb_senha: TLabel;
    edt_usuario: TEdit;
    edt_senha: TEdit;
    btn_login: TSpeedButton;
    procedure efetuarLogin();
    procedure btn_loginClick(Sender: TObject);
    procedure edt_senhaExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses FormPrincipal, modulo;

procedure TFrmLogin.btn_loginClick(Sender: TObject);
begin
  efetuarLogin;
end;

procedure TFrmLogin.edt_senhaExit(Sender: TObject);
begin
  btn_login.Click;
end;

procedure TFrmLogin.efetuarLogin;
begin
  if (edt_usuario.Text='') then
  begin
    edt_usuario.SetFocus;
    ShowMessage('Usuário Vazio!');
  end
  else if (edt_senha.Text='') then
  begin
    edt_senha.SetFocus;
    edt_senha.Clear;
    ShowMessage('Senha Vazia!');
  end
  else
  begin
    usuario:= edt_usuario.Text;
    frmFormPrincipal:= TfrmFormPrincipal.Create(self);
    frmFormPrincipal.Showmodal;
    FrmLogin.Close;
  end;

end;

end.
