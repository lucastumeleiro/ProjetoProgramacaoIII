unit Cargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, framebotoes;

type
  TfrmCargo = class(TForm)
    Image1: TImage;
    lb_Codigo: TLabel;
    lb_Nome: TLabel;
    edt_codigo: TEdit;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    TFrame11: TFrame1;
    procedure FormCreate(Sender: TObject);
    procedure TFrame11btnNovoClick(Sender: TObject);
    procedure TFrame11btnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure TFrame11btnEditarClick(Sender: TObject);
    procedure TFrame11btnExcluirClick(Sender: TObject);
    procedure Habilita();
    procedure Desabilita();
    procedure Limpa();

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargo: TfrmCargo;

implementation

{$R *.dfm}

procedure TfrmCargo.DBGrid1CellClick(Column: TColumn);
begin
  //trazer dados para nome
  Desabilita();
  TFrame11.btnNovo.Enabled:= FALSE;
  TFrame11.btnSalvar.Enabled:= FALSE;
  TFrame11.btnEditar.Enabled:= TRUE;
  TFrame11.btnExcluir.Enabled:= TRUE;
end;

procedure TfrmCargo.Desabilita;
begin
edtNome.Enabled:= FALSE;
end;

procedure TfrmCargo.FormCreate(Sender: TObject);
begin
  Desabilita();
  TFrame11.btnNovo.Enabled:= TRUE;
  TFrame11.btnSalvar.Enabled:= FALSE;
  TFrame11.btnEditar.Enabled:= FALSE;
  TFrame11.btnExcluir.Enabled:= FALSE;
end;

procedure TfrmCargo.Habilita;
begin
  edtNome.Enabled:= TRUE;
end;

procedure TfrmCargo.Limpa;
begin
  edtNome.Clear;
end;

procedure TfrmCargo.TFrame11btnEditarClick(Sender: TObject);
begin
  Habilita();
  TFrame11.btnNovo.Enabled:= TRUE;
  TFrame11.btnSalvar.Enabled:= TRUE;
  TFrame11.btnEditar.Enabled:= FALSE;
  TFrame11.btnExcluir.Enabled:= FALSE;
end;

procedure TfrmCargo.TFrame11btnExcluirClick(Sender: TObject);
begin
  if (MessageDlg('Deseja realmente excluir?',mtConfirmation,mbYesNo,0)= mryes)then
  begin
    //excluir do banco
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

procedure TfrmCargo.TFrame11btnNovoClick(Sender: TObject);
begin
  Limpa();
  Habilita();
  edtnome.SetFocus;
  TFrame11.btnNovo.Enabled:= FALSE;
  TFrame11.btnSalvar.Enabled:= TRUE;
  TFrame11.btnEditar.Enabled:= FALSE;
  TFrame11.btnExcluir.Enabled:= FALSE;
end;

procedure TfrmCargo.TFrame11btnSalvarClick(Sender: TObject);
begin
  if(edtNome.Text='')then
  begin
    ShowMessage('O nome precisa ser preenchido!');
    edtNome.SetFocus;
  end
  else
  begin
    //Salva no banco
    ShowMessage('Dados Salvos!');
    Desabilita();
    TFrame11.btnNovo.Enabled:= TRUE;
    TFrame11.btnSalvar.Enabled:= False;
    TFrame11.btnEditar.Enabled:= False;
    TFrame11.btnExcluir.Enabled:=False;
  end;
end;

end.
