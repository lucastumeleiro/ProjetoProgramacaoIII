unit Projeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, framebotoes,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Framebotoesproj;

type
  TfrmProjeto = class(TForm)
    PageControl1: TPageControl;
    pgProjeto: TTabSheet;
    pgFuncProjeto: TTabSheet;
    edtCodigo: TEdit;
    lbCodigo: TLabel;
    lbTitulo: TLabel;
    edtTitulo: TEdit;
    lbDescricao: TLabel;
    lbDataInicio: TLabel;
    DateInicio: TDateTimePicker;
    lbDataFinal: TLabel;
    DateFinal: TDateTimePicker;
    lbResponsavel: TLabel;
    cbResponsavel: TComboBox;
    checkboxConcluido: TCheckBox;
    DBGrid1: TDBGrid;
    BindingsList1: TBindingsList;
    DataSource2: TDataSource;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    lbObs: TMemo;
    LinkControlToField6: TLinkControlToField;
    CBProjeto: TComboBox;
    lbProjetofun: TLabel;
    lbFuncionariofun: TLabel;
    CBFuncionario: TComboBox;
    lbdescGrid: TLabel;
    lbdesc: TLabel;
    LinkFillControlToField2: TLinkFillControlToField;
    LinkFillControlToField3: TLinkFillControlToField;
    TFrame11: TFrame1;
    LinkFillControlToField1: TLinkFillControlToField;
    DataSource3: TDataSource;
    BindSourceDB3: TBindSourceDB;
    DBGrid2: TDBGrid;
    DataSource1: TDataSource;
    Framefun: TFrame1;
    DataSource4: TDataSource;
    BindSourceDB2: TBindSourceDB;
    procedure TFrame11btnNovoClick(Sender: TObject);
    procedure TFrame11btnSalvarClick(Sender: TObject);
    procedure TFrame11btnEditarClick(Sender: TObject);
    procedure TFrame11btnExcluirClick(Sender: TObject);
    procedure limpaproj();
    procedure desabilitaproj();
    procedure habilitaproj();
    procedure DBGrid1CellClick(Column: TColumn);
    procedure desabilitafunproj();
    procedure habilitafunproj();
    procedure DBGrid2CellClick(Column: TColumn);
    procedure FramefunbtnSalvarClick(Sender: TObject);
    procedure FramefunbtnEditarClick(Sender: TObject);
    procedure FramefunbtnExcluirClick(Sender: TObject);
    procedure FramefunbtnNovoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProjeto: TfrmProjeto;

implementation

{$R *.dfm}

uses Funcionario, modulo;

procedure TfrmProjeto.TFrame11btnNovoClick(Sender: TObject);
begin
  habilitaproj();
  limpaproj();
  edtTitulo.setFocus;
  TFrame11.btnNovo.Enabled:= FALSE;
  TFrame11.btnSalvar.Enabled:= TRUE;
  TFrame11.btnEditar.Enabled:= FALSE;
  TFrame11.btnExcluir.Enabled:= FALSE;
  DataModule1.FDProjeto.insert;
end;

procedure TfrmProjeto.TFrame11btnSalvarClick(Sender: TObject);
begin
  if(edtTitulo.Text = '') then
  begin
    ShowMessage('Título deve ser preenchido!');
    edtTitulo.SetFocus;

  end
  else if (DateInicio.Date = null) then
  begin
    ShowMessage('Data de inicio vazia!');
    DateInicio.SetFocus;
  end
  else if (DateFinal.Date = null) then
  begin
    ShowMessage('Data final vazia!');
    DateFinal.SetFocus;
  end
  else
  begin
    DataModule1.FDProjeto.Post;
    DataModule1.FDProjeto.Refresh;
    ShowMessage('Dados Salvos!');
    Desabilitaproj();
    TFrame11.btnNovo.Enabled:= TRUE;
    TFrame11.btnSalvar.Enabled:= False;
    TFrame11.btnEditar.Enabled:= False;
    TFrame11.btnExcluir.Enabled:=False;
  end;
end;

procedure TfrmProjeto.TFrame11btnEditarClick(Sender: TObject);
begin
  habilitaproj();
  TFrame11.btnNovo.Enabled:= TRUE;
  TFrame11.btnSalvar.Enabled:= TRUE;
  TFrame11.btnEditar.Enabled:= FALSE;
  TFrame11.btnExcluir.Enabled:= FALSE;
  DataModule1.FDProjeto.Edit;

end;

procedure TfrmProjeto.TFrame11btnExcluirClick(Sender: TObject);
begin
if (MessageDlg('Deseja realmente excluir?',mtConfirmation,mbYesNo,0)= mryes)then
  begin
    DataModule1.FDProjeto.Delete;
  end
  else
  begin
    limpaproj();
    TFrame11.btnNovo.Enabled:= TRUE;
    TFrame11.btnSalvar.Enabled:= FALSE;
    TFrame11.btnEditar.Enabled:= FALSE;
    TFrame11.btnExcluir.Enabled:= FALSE;
  end;
end;

procedure TfrmProjeto.habilitaproj();
begin
  edtCodigo.Enabled:=TRUE;
  edtTitulo.Enabled:=TRUE;
  lbObs.Enabled:=TRUE;
  DateInicio.Enabled:=TRUE;
  DateFinal.Enabled:=TRUE;
  cbResponsavel.Enabled:=TRUE;
  checkboxConcluido.Enabled:=TRUE;
end;
procedure TfrmProjeto.habilitafunproj();
begin
  CBProjeto.Enabled:=TRUE;
  CBFuncionario.Enabled:=TRUE;
end;

procedure TfrmProjeto.DBGrid1CellClick(Column: TColumn);
begin
  Desabilitaproj();
  TFrame11.btnNovo.Enabled:= TRUE;
  TFrame11.btnSalvar.Enabled:= TRUE;
  TFrame11.btnEditar.Enabled:= TRUE;
  TFrame11.btnExcluir.Enabled:= TRUE;
end;

procedure TfrmProjeto.desabilitaproj();
begin
  edtCodigo.Enabled:=FALSE;
  edtTitulo.Enabled:=FALSE;
  lbObs.Enabled:=FALSE;
  DateInicio.Enabled:=FALSE;
  DateFinal.Enabled:=FALSE;
  cbResponsavel.Enabled:=FALSE;
  checkboxConcluido.Enabled:=FALSE;
end;

procedure TfrmProjeto.DBGrid2CellClick(Column: TColumn);
begin
  Desabilitafunproj();
  Framefun.btnNovo.Enabled:= TRUE;
  Framefun.btnSalvar.Enabled:= TRUE;
  Framefun.btnEditar.Enabled:= TRUE;
  Framefun.btnExcluir.Enabled:= TRUE;
end;

procedure TfrmProjeto.desabilitafunproj();
begin
  CBProjeto.Enabled:=FALSE;
  CBFuncionario.Enabled:=FALSE;
end;

procedure TfrmProjeto.limpaproj();
begin
  edtCodigo.clear;
  edtTitulo.Clear;
end;

procedure TfrmProjeto.FramefunbtnSalvarClick(Sender: TObject);
begin
    DataModule1.FDFunProj.Post;
    DataModule1.FDFunProj.Refresh;
    ShowMessage('Dados Salvos!');
    Desabilitafunproj();
    Framefun.btnNovo.Enabled:= TRUE;
    Framefun.btnSalvar.Enabled:= False;
    Framefun.btnEditar.Enabled:= False;
    Framefun.btnExcluir.Enabled:=False;
end;

procedure TfrmProjeto.FramefunbtnEditarClick(Sender: TObject);
begin
  habilitafunproj();
  Framefun.btnNovo.Enabled:= TRUE;
  Framefun.btnSalvar.Enabled:= TRUE;
  Framefun.btnEditar.Enabled:= FALSE;
  Framefun.btnExcluir.Enabled:= FALSE;
  DataModule1.FDFunProj.Edit;
end;
procedure TfrmProjeto.FramefunbtnExcluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja realmente excluir?',mtConfirmation,mbYesNo,0)= mryes)then
  begin
    DataModule1.FDFunProj.Delete;
    DataModule1.FDFunProj.Refresh;
    Datamodule1.FDFunProjDados.Refresh;
  end
  else
  begin
    Framefun.btnNovo.Enabled:= TRUE;
    Framefun.btnSalvar.Enabled:= FALSE;
    Framefun.btnEditar.Enabled:= FALSE;
    Framefun.btnExcluir.Enabled:= FALSE;
  end;
end;
procedure TfrmProjeto.FramefunbtnNovoClick(Sender: TObject);
begin
  habilitafunproj();
  CBProjeto.setFocus;
  Framefun.btnNovo.Enabled:= FALSE;
  Framefun.btnSalvar.Enabled:= TRUE;
  Framefun.btnEditar.Enabled:= FALSE;
  Framefun.btnExcluir.Enabled:= FALSE;
  DataModule1.FDFunProj.Insert;
end;

end.
