unit modulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDCargo: TFDQuery;
    FDCargocodcargo: TIntegerField;
    FDCargonomecargo: TWideStringField;
    FDFuncionario: TFDQuery;
    DSCargo: TDataSource;
    DSFuncionario: TDataSource;
    DSProjeto: TDataSource;
    FDProjeto: TFDQuery;
    FDProjetocodproj: TIntegerField;
    FDProjetotituloproj: TWideStringField;
    FDProjetoDescproj: TWideStringField;
    FDProjetoinicioproj: TDateField;
    FDProjetofimproj: TDateField;
    FDProjetoconclproj: TBooleanField;
    FDProjetocodrespproj: TIntegerField;
    DSUsuario: TDataSource;
    FDUsuario: TFDQuery;
    FDUsuariocount: TLargeintField;
    DSFunProj: TDataSource;
    FDFunProj: TFDQuery;
    FDFunProjDados: TFDQuery;
    FDFuncionariocodfun: TIntegerField;
    FDFuncionarionomefun: TWideStringField;
    FDFuncionariocpffun: TWideStringField;
    FDFuncionariodatanascfun: TDateField;
    FDFuncionarioendfun: TWideStringField;
    FDFuncionariofonefun: TWideStringField;
    FDFuncionariosexofun: TWideStringField;
    FDFuncionariosalariofun: TSingleField;
    FDFuncionariocodcargofun: TIntegerField;
    FDFuncionarioobsfun: TWideStringField;
    FDFunProjcodproj: TIntegerField;
    FDFunProjcodfun: TIntegerField;
    FDFunProjDadostituloproj: TWideStringField;
    FDFunProjDadosnomefun: TWideStringField;
    DSFunProjDados: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;
  usuario: string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
