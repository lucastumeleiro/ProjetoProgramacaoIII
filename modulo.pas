unit modulo;

interface

uses
  System.SysUtils, System.Classes;

type
  TDataModule1 = class(TDataModule)
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