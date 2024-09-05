unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, MemDS,
  DBAccess, Uni;

type
  TfPrincipal = class(TForm)
    pgPrincipal: TPageControl;
    tbDados: TTabSheet;
    tbEditar: TTabSheet;
    pnDadosTop: TPanel;
    pnDadosBot: TPanel;
    btInserir: TBitBtn;
    btEditar: TBitBtn;
    btExcluir: TBitBtn;
    dbgDados: TDBGrid;
    btAtualizar: TBitBtn;
    pnEditPrin: TPanel;
    pnEditBt: TPanel;
    btGravar: TBitBtn;
    btCancelar: TBitBtn;
    lbProdutos: TLabel;
    pnEditar: TPanel;
    Conn: TUniConnection;
    qDados: TUniQuery;
    qDadosid_lcto: TIntegerField;
    qDadosnome_produto: TStringField;
    qDadosmarca: TStringField;
    qDadosquantidade: TIntegerField;
    dsDados: TDataSource;
    Label1: TLabel;
    edId: TDBEdit;
    Label2: TLabel;
    edNmProd: TDBEdit;
    Label3: TLabel;
    edMrc: TDBEdit;
    Label4: TLabel;
    edQtde: TDBEdit;
    procedure btInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btAtualizarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

procedure TfPrincipal.btAtualizarClick(Sender: TObject);
begin

  qdados.Close;
  qdados.Open;

end;

procedure TfPrincipal.btCancelarClick(Sender: TObject);
begin
  qdados.CancelUpdates;
  tbDados.Show;
  dbgDados.Refresh;

end;

procedure TfPrincipal.btEditarClick(Sender: TObject);
begin

  tbEditar.Show;

end;

procedure TfPrincipal.btExcluirClick(Sender: TObject);
begin
  qdados.Delete;
  qdados.ApplyUpdates;
end;

procedure TfPrincipal.btGravarClick(Sender: TObject);
begin
  If qdados.State in [dsEdit, dsInsert] then
  begin
    qdados.Post;
    qDados.ApplyUpdates;
  end;

  tbDados.Show;
  dbgDados.Refresh;
end;

procedure TfPrincipal.btInserirClick(Sender: TObject);

begin

  tbEditar.show;

  if qdados.Active = false then
  qdados.Active := true;
  qdados.Append;



end;

procedure TfPrincipal.FormShow(Sender: TObject);
begin
   pgPrincipal.ActivePage := tbDados;

   tbDados.TabVisible  := false;
   tbEditar.TabVisible := false;
end;

//criação de uma query dinamica para pegar o nextval do id_lcto
procedure TfrmPrincipal.qDadosNewRecord(DataSet: TDataSet);
// a var é o nome da minha query dinamica e coloco o tipo dela
var
  q : TUniQuery;
begin
// essa parte é o object inspector onde eu coloco minhas configurações da query
// o nil é o sem dono (Não há necessidade de um dono aqui), poderia ser o form1 mas n precisa
  q := TUniQuery.Create(nil);

  // crio o try com a finalidade de liberar a memoria sem chances de erros ent faço o try finnaly
  try
  // limpo a query mesmo sabendo que ela estara vazia, só para evitar erros
    q.sql.Clear;
    // coloco meu sql     obs: sql é string ent coloca ele ente ''
    q.sql.Add('SELECT nextval(''produtos_id_lcto_seq'') as seq');
    // o open serve para ativar minha query e rodar meu comando sql
    q.Open;


    qdadosid_lcto.AsInteger := q.FieldByName('seq').AsInteger;
  finally

    // free serve para limpar a memoria da query
    q.free;
  end;
end;

end.


// Height 360
//width 370    pgPrincipal.ActivePage := tbDados;
//  tbDados.TabVisible := false;
//  tbEditar.TabVisible := false;
