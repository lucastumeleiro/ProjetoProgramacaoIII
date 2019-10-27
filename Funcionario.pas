unit Funcionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, framebotoes, Vcl.Grids, Vcl.ComCtrls, Vcl.Mask, Data.DB,
  Vcl.DBGrids, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmFuncionario = class(TForm)
    Image1: TImage;
    lbCodigo: TLabel;
    lbNome: TLabel;
    lbEndereco: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    edtEndereco: TEdit;
    lbCPF: TLabel;
    edtCPF: TMaskEdit;
    lbNascimento: TLabel;
    edtNascimento: TDateTimePicker;
    lbTelefone: TLabel;
    edtTelefone: TMaskEdit;
    lbSalario: TLabel;
    lbSexo: TRadioGroup;
    lbCargo: TLabel;
    cbCargo: TComboBox;
    edtSalario: TEdit;
    TFrame11: TFrame1;
    Obs: TMemo;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB3: TBindSourceDB;
    procedure TFrame11btnNovoClick(Sender: TObject);
    procedure TFrame11btnSalvarClick(Sender: TObject);
    procedure TFrame11btnEditarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Habilita();
    procedure Desabilita();
    procedure Limpa();
    procedure TFrame11btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFuncionario: TfrmFuncionario;

implementation

{$R *.dfm}

uses modulo;

procedure TfrmFuncionario.DBGrid1CellClick(Column: TColumn);
begin
  Desabilita();
  //trazer dados para nome
  TFrame11.btnNovo.Enabled:= TRUE;
  TFrame11.btnSalvar.Enabled:= FALSE;
  TFrame11.btnEditar.Enabled:= TRUE;
  TFrame11.btnExcluir.Enabled:= TRUE;
end;

procedure TfrmFuncionario.Desabilita;
begin
  edtNome.Enabled:= FALSE;
  edtEndereco.Enabled:= FALSE;
  edtCPF.Enabled:= FALSE;
  edtNascimento.Enabled:= FALSE;
  edtTelefone.Enabled:= FALSE;
  edtSalario.Enabled:= FALSE;
end;

procedure TfrmFuncionario.Habilita;
begin
  edtNome.Enabled:= TRUE;
  edtEndereco.Enabled:= TRUE;
  edtCPF.Enabled:= TRUE;
  edtNascimento.Enabled:= TRUE;
  edtTelefone.Enabled:= TRUE;
  edtSalario.Enabled:= TRUE;
  lbSexo.Enabled:= TRUE;
  cbCargo.Enabled:= TRUE;
end;

procedure TfrmFuncionario.Limpa;
begin
  edtNome.Clear;
  edtEndereco.Clear;
  edtCPF.Clear;
  edtTelefone.Clear;
  edtSalario.Clear;
end;

procedure TfrmFuncionario.TFrame11btnEditarClick(Sender: TObject);
begin
  Habilita();
  TFrame11.btnNovo.Enabled:= TRUE;
  TFrame11.btnSalvar.Enabled:= TRUE;
  TFrame11.btnEditar.Enabled:= FALSE;
  TFrame11.btnExcluir.Enabled:= FALSE;
  DataModule1.FDFuncionario.Edit;
end;

procedure TfrmFuncionario.TFrame11btnExcluirClick(Sender: TObject);
begin
if (MessageDlg('Deseja realmente excluir?',mtConfirmation,mbYesNo,0)= mryes)then
  begin
    DataModule1.FDFuncionario.Delete;
  end
  else
  begin
    Limpa();
    TFrame11.btnNovo.Enabled:= TRUE;
    TFrame11.btnSalvar.Enabled:= FALSE;
    TFrame11.btnEditar.Enabled:= FALSE;
    TFrame11.btnExcluir.Enabled:= FALSE;
  end;
end;

procedure TfrmFuncionario.TFrame11btnNovoClick(Sender: TObject);
begin
  Limpa();
  Habilita();
  edtNome.SetFocus;
  TFrame11.btnNovo.Enabled:= FALSE;
  TFrame11.btnSalvar.Enabled:= TRUE;
  TFrame11.btnEditar.Enabled:= FALSE;
  TFrame11.btnExcluir.Enabled:= FALSE;
  DataModule1.FDFuncionario.Insert;
end;

procedure TfrmFuncionario.TFrame11btnSalvarClick(Sender: TObject);
begin
  if(edtNome.Text='')then
  begin
    ShowMessage('O nome precisa ser preenchido!');
    edtNome.SetFocus;
  end
  else if (edtCPF.Text='   .   .   -  ') then
  begin
    ShowMessage('O CPF precisa ser preenchido!');
    edtCPF.SetFocus;
  end
  else if (edtEndereco.Text='') then
  begin
    ShowMessage('O Endereço precisa ser preenchido!');
    edtEndereco.SetFocus;
  end
  else
  begin
    DataModule1.FDFuncionario.Post;
    DataModule1.FDFuncionario.Refresh;
    ShowMessage('Dados Salvos!');
    Desabilita();
    TFrame11.btnNovo.Enabled:= TRUE;
    TFrame11.btnSalvar.Enabled:= False;
    TFrame11.btnEditar.Enabled:= False;
    TFrame11.btnExcluir.Enabled:=False;
  end;
end;

end.
