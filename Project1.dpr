program Project1;

uses
  Vcl.Forms,
  login in 'login.pas' {FrmLogin},
  FormPrincipal in 'FormPrincipal.pas' {frmFormPrincipal},
  Cargo in 'Cargo.pas' {frmCargo},
  framebotoes in 'framebotoes.pas' {Frame1: TFrame},
  Funcionario in 'Funcionario.pas' {frmFuncionario},
  modulo in 'modulo.pas' {DataModule1: TDataModule},
  Projeto in 'Projeto.pas' {frmProjeto},
  Framebotoesproj in 'Framebotoesproj.pas' {Frame2: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Mensagem:';
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TfrmFormPrincipal, frmFormPrincipal);
  Application.CreateForm(TfrmFuncionario, frmFuncionario);
  Application.CreateForm(TfrmCargo, frmCargo);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmProjeto, frmProjeto);
  Application.Run;
end.
