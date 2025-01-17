object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Projeto'
  ClientHeight = 394
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 494
    Height = 394
    ActivePage = tbEditar
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 492
    ExplicitHeight = 386
    object tbDados: TTabSheet
      Caption = 'Dados'
      object pnDadosTop: TPanel
        Left = 0
        Top = 0
        Width = 486
        Height = 41
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 484
        object lbProdutos: TLabel
          Left = 0
          Top = 8
          Width = 70
          Height = 21
          Caption = 'Produtos :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object btAtualizar: TBitBtn
          Left = 407
          Top = 4
          Width = 75
          Height = 33
          Caption = 'Atualizar'
          TabOrder = 0
          OnClick = btAtualizarClick
        end
      end
      object pnDadosBot: TPanel
        Left = 0
        Top = 323
        Width = 486
        Height = 41
        Align = alBottom
        TabOrder = 1
        ExplicitTop = 315
        ExplicitWidth = 484
        object btInserir: TBitBtn
          Left = 0
          Top = 4
          Width = 75
          Height = 33
          Caption = 'Inserir'
          TabOrder = 0
          OnClick = btInserirClick
        end
        object btEditar: TBitBtn
          Left = 201
          Top = 4
          Width = 75
          Height = 33
          Caption = 'Editar'
          TabOrder = 1
          OnClick = btEditarClick
        end
        object btExcluir: TBitBtn
          Left = 407
          Top = 4
          Width = 75
          Height = 33
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btExcluirClick
        end
      end
      object dbgDados: TDBGrid
        Left = 0
        Top = 41
        Width = 486
        Height = 282
        Align = alClient
        DataSource = dsDados
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
    end
    object tbEditar: TTabSheet
      Caption = 'Editar'
      ImageIndex = 1
      object pnEditar: TPanel
        Left = 0
        Top = 0
        Width = 486
        Height = 364
        Align = alClient
        TabOrder = 0
        object pnEditBt: TPanel
          Left = 1
          Top = 322
          Width = 484
          Height = 41
          Align = alBottom
          TabOrder = 0
          object btGravar: TBitBtn
            Left = 5
            Top = 4
            Width = 75
            Height = 33
            Caption = 'Gravar'
            TabOrder = 0
            OnClick = btGravarClick
          end
          object btCancelar: TBitBtn
            Left = 405
            Top = 4
            Width = 75
            Height = 33
            Caption = 'Cancelar'
            TabOrder = 1
            OnClick = btCancelarClick
          end
        end
        object pnEditPrin: TPanel
          Left = 1
          Top = 1
          Width = 484
          Height = 321
          Align = alClient
          TabOrder = 1
          object Label1: TLabel
            Left = 5
            Top = 8
            Width = 45
            Height = 15
            Caption = 'C'#243'digo :'
            FocusControl = edId
          end
          object Label2: TLabel
            Left = 142
            Top = 8
            Width = 85
            Height = 15
            Caption = 'Nome Produto :'
            FocusControl = edNmProd
          end
          object Label3: TLabel
            Left = 143
            Top = 61
            Width = 39
            Height = 15
            Caption = 'Marca :'
            FocusControl = edMrc
          end
          object Label4: TLabel
            Left = 5
            Top = 61
            Width = 68
            Height = 15
            Caption = 'Quantidade :'
            FocusControl = edQtde
          end
          object edId: TDBEdit
            Left = 5
            Top = 24
            Width = 75
            Height = 23
            DataField = 'id_lcto'
            DataSource = dsDados
            ReadOnly = True
            TabOrder = 0
          end
          object edNmProd: TDBEdit
            Left = 142
            Top = 24
            Width = 131
            Height = 23
            DataField = 'nome_produto'
            DataSource = dsDados
            TabOrder = 1
          end
          object edMrc: TDBEdit
            Left = 142
            Top = 77
            Width = 131
            Height = 23
            DataField = 'marca'
            DataSource = dsDados
            TabOrder = 2
          end
          object edQtde: TDBEdit
            Left = 5
            Top = 77
            Width = 75
            Height = 23
            DataField = 'quantidade'
            DataSource = dsDados
            TabOrder = 3
          end
        end
      end
    end
  end
  object Conn: TUniConnection
    ProviderName = 'PostgreSQL'
    Port = 5432
    Database = 'postgres'
    Username = 'postgres'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 253
    Top = 219
    EncryptedPassword = '8FFF90FF8CFF8BFF98FF8DFF9AFF8CFF'
  end
  object qDados: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO produtos'
      '  (id_lcto, nome_produto, marca, quantidade)'
      'VALUES'
      '  (:id_lcto, :nome_produto, :marca, :quantidade)')
    SQLDelete.Strings = (
      'DELETE FROM produtos'
      'WHERE'
      '  id_lcto = :Old_id_lcto')
    SQLUpdate.Strings = (
      'UPDATE produtos'
      'SET'
      
        '  id_lcto = :id_lcto, nome_produto = :nome_produto, marca = :mar' +
        'ca, quantidade = :quantidade'
      'WHERE'
      '  id_lcto = :Old_id_lcto')
    SQLLock.Strings = (
      'SELECT * FROM produtos'
      'WHERE'
      '  id_lcto = :Old_id_lcto'
      'FOR UPDATE NOWAIT')
    SQLRefresh.Strings = (
      'SELECT id_lcto, nome_produto, marca, quantidade FROM produtos'
      'WHERE'
      '  id_lcto = :id_lcto')
    SQLRecCount.Strings = (
      'SELECT count(*) FROM ('
      'SELECT * FROM produtos'
      ''
      ') t')
    Connection = Conn
    SQL.Strings = (
      'select * from produtos;')
    Left = 101
    Top = 219
    object qDadosid_lcto: TIntegerField
      FieldName = 'id_lcto'
    end
    object qDadosnome_produto: TStringField
      FieldName = 'nome_produto'
      Size = 50
    end
    object qDadosmarca: TStringField
      FieldName = 'marca'
      Size = 50
    end
    object qDadosquantidade: TIntegerField
      FieldName = 'quantidade'
    end
  end
  object dsDados: TDataSource
    DataSet = qDados
    Left = 184
    Top = 224
  end
end
