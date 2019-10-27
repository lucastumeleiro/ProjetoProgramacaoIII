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
end
