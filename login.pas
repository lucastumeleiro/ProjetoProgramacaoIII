unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Buttons, Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    lb_Usuario: TLabel;
    lb_senha: TLabel;
    edt_usuario: TEdit;
    edt_senha: TEdit;
    btn_login: TSpeedButton;
    lbqtdlogin: TLabel;
    lbqtd: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
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

uses FormPrincipal, modulo, FireDAC.Stan.Param;

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
    DataModule1.FDUsuario.SQL.Clear;
    DataModule1.FDUsuario.SQL.Add('Select count(*) from USUARIO where login =:pLogin AND senha =:pSenha');
    DataModule1.FDUsuario.ParamByName('pLogin').AsString := edt_Usuario.Text;
    DataModule1.FDUsuario.ParamByName('pSenha').AsString := edt_Senha.Text;
    DataModule1.FDUsuario.Open;

    if(lbqtd.Caption = '1')then
    begin
      modulo.usuario := edt_Usuario.Text;
      frmFormPrincipal := TFrmFormPrincipal.Create(self);
      frmFormPrincipal.ShowModal;
      frmLogin.Close;
    end
    else
    begin
      showmessage('Usuário ou senha inválidos');
      edt_Usuario.Clear;
      edt_Senha.Clear;
      edt_Usuario.SetFocus;
   end;
  end;
end;
End.
