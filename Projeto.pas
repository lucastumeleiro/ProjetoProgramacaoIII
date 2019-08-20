unit Projeto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, framebotoes,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

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
    Obs: TMemo;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProjeto: TfrmProjeto;

implementation

{$R *.dfm}


end.
