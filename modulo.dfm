object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 303
  Width = 554
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=BancoProjeto1'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=pG')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorHome = 'C:\Users\lucas\Desktop\Projetos_Delphi\Projeto_1\Win32\Debug\dll'
    Left = 96
    Top = 16
  end
  object FDCargo: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cargo')
    Left = 24
    Top = 72
    object FDCargocodcargo: TIntegerField
      FieldName = 'codcargo'
      Origin = 'codcargo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDCargonomecargo: TWideStringField
      FieldName = 'nomecargo'
      Origin = 'nomecargo'
      Size = 50
    end
  end
  object FDFuncionario: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from funcionario')
    Left = 24
    Top = 136
    object FDFuncionariocodfun: TIntegerField
      FieldName = 'codfun'
      Origin = 'codfun'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDFuncionarionomefun: TWideStringField
      FieldName = 'nomefun'
      Origin = 'nomefun'
      Size = 50
    end
    object FDFuncionariocpffun: TWideStringField
      FieldName = 'cpffun'
      Origin = 'cpffun'
      Size = 14
    end
    object FDFuncionariodatanascfun: TDateField
      FieldName = 'datanascfun'
      Origin = 'datanascfun'
    end
    object FDFuncionarioendfun: TWideStringField
      FieldName = 'endfun'
      Origin = 'endfun'
      Size = 80
    end
    object FDFuncionariofonefun: TWideStringField
      FieldName = 'fonefun'
      Origin = 'fonefun'
      Size = 30
    end
    object FDFuncionariosexofun: TWideStringField
      FieldName = 'sexofun'
      Origin = 'sexofun'
      FixedChar = True
      Size = 1024
    end
    object FDFuncionariosalariofun: TSingleField
      FieldName = 'salariofun'
      Origin = 'salariofun'
    end
    object FDFuncionariocodcargofun: TIntegerField
      FieldName = 'codcargofun'
      Origin = 'codcargofun'
    end
    object FDFuncionarioobsfun: TWideStringField
      FieldName = 'obsfun'
      Origin = 'obsfun'
      Size = 8190
    end
  end
  object DSCargo: TDataSource
    DataSet = FDCargo
    Left = 104
    Top = 72
  end
  object DSFuncionario: TDataSource
    DataSet = FDFuncionario
    Left = 104
    Top = 136
  end
  object DSProjeto: TDataSource
    DataSet = FDProjeto
    Left = 104
    Top = 192
  end
  object FDProjeto: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from projeto')
    Left = 24
    Top = 192
    object FDProjetocodproj: TIntegerField
      FieldName = 'codproj'
      Origin = 'codproj'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDProjetotituloproj: TWideStringField
      FieldName = 'tituloproj'
      Origin = 'tituloproj'
      Size = 100
    end
    object FDProjetoDescproj: TWideStringField
      FieldName = 'Descproj'
      Origin = '"Descproj"'
      Size = 8190
    end
    object FDProjetoinicioproj: TDateField
      FieldName = 'inicioproj'
      Origin = 'inicioproj'
    end
    object FDProjetofimproj: TDateField
      FieldName = 'fimproj'
      Origin = 'fimproj'
    end
    object FDProjetoconclproj: TBooleanField
      FieldName = 'conclproj'
      Origin = 'conclproj'
    end
    object FDProjetocodrespproj: TIntegerField
      FieldName = 'codrespproj'
      Origin = 'codrespproj'
    end
  end
  object DSUsuario: TDataSource
    DataSet = FDUsuario
    Left = 248
    Top = 16
  end
  object FDUsuario: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select count(*) from usuario')
    Left = 200
    Top = 16
    object FDUsuariocount: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'count'
      Origin = 'count'
      ReadOnly = True
    end
  end
  object DSFunProj: TDataSource
    DataSet = FDFunProjDados
    Left = 248
    Top = 72
  end
  object FDFunProj: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from funcionario_projeto'
      '')
    Left = 200
    Top = 72
    object FDFunProjcodproj: TIntegerField
      FieldName = 'codproj'
    end
    object FDFunProjcodfun: TIntegerField
      FieldName = 'codfun'
    end
  end
  object FDFunProjDados: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select p.tituloproj, f.nomefun, f.codfun, p.codproj'
      'from funcionario_projeto fp'
      'inner join funcionario f on fp.codfun = f.codfun'
      'inner join projeto p on fp.codproj = p.codproj')
    Left = 200
    Top = 120
    object FDFunProjDadostituloproj: TWideStringField
      FieldName = 'tituloproj'
      Origin = 'tituloproj'
      Size = 100
    end
    object FDFunProjDadosnomefun: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nomefun'
      Origin = 'nomefun'
      Size = 50
    end
  end
  object DSFunProjDados: TDataSource
    DataSet = FDFunProjDados
    Left = 248
    Top = 120
  end
end
