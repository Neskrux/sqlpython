from datetime import datetime
from sqlalchemy import create_engine
from sqlalchemy.orm import Session
from models import Base, Autor, Editora, Categoria, Cliente, Funcionario, Livro, Pedido, Estoque, LivroAutor, LivroCategoria, ClientePedido
from services.db import create_db
# Cria o banco de dados
create_db()
print("livraria")

# Conecta-se ao banco de dados
USER = "root"
PASSWORD = "Bbhhssgg134679852"
SERVER = "localhost"
PORT = 3306
DATABASE = "livraria"
instancia = f"mysql+pymysql://{USER}:{PASSWORD}@{SERVER}:{PORT}/{DATABASE}"

engine = create_engine(instancia, echo=True)

# Inicializa a sessão
session = Session(bind=engine, autoflush=True)

# Cria as tabelas no banco de dados
Base.metadata.create_all(bind=engine)

# Inserção em Autor
autores = [
    Autor(nome="Autor1", data_nascimento=datetime(1990, 1, 1), nacionalidade="Nacionalidade1"),
    Autor(nome="Autor2", data_nascimento=datetime(1995, 2, 2), nacionalidade="Nacionalidade2"),
    
]
session.add_all(autores)

# Inserção em Editora
editoras = [
    Editora(nome="Editora1", endereco="Endereco1", telefone="123456789"),
    Editora(nome="Editora2", endereco="Endereco2", telefone="987654321"),
    
]
session.add_all(editoras)

# Inserção em Categoria
categorias = [
    Categoria(nome_categoria="Categoria1", descricao_categoria="Descricao1"),
    Categoria(nome_categoria="Categoria2", descricao_categoria="Descricao2"),
    
]
session.add_all(categorias)

# Inserção em Cliente
clientes = [
    Cliente(nome="Cliente1", endereco="EnderecoCliente1", email="cliente1@example.com", telefone="123456789"),
    Cliente(nome="Cliente2", endereco="EnderecoCliente2", email="cliente2@example.com", telefone="987654321"),
    
]
session.add_all(clientes)

# Inserção em Funcionario
funcionarios = [
    Funcionario(nome="Funcionario1", cargo="Cargo1", data_admissao=datetime(2021, 1, 1), salario=5000.0),
    Funcionario(nome="Funcionario2", cargo="Cargo2", data_admissao=datetime(2022, 2, 2), salario=6000.0),
    
]
session.add_all(funcionarios)

# Inserção em Livro
livros = [
    Livro(titulo="Livro1", isbn="ISBN1", ano_publicacao=2020, preco=50.0, numero_paginas=200),
    Livro(titulo="Livro2", isbn="ISBN2", ano_publicacao=2021, preco=60.0, numero_paginas=250),
    
]
session.add_all(livros)

# Inserção em Pedido
pedidos = [
    Pedido(data_pedido=datetime(2023, 1, 1), status_pedido="Em andamento", total_pedido=100.0),
    Pedido(data_pedido=datetime(2023, 2, 2), status_pedido="Concluído", total_pedido=150.0),
    
]
session.add_all(pedidos)

# Inserção em Estoque
estoques = [
    Estoque(quantidade_estoque=100),
    Estoque(quantidade_estoque=150),
   
]
session.add_all(estoques)

# Inserção em LivroAutor
livro_autores = [
    LivroAutor(livro_id=1, autor_id=1),
    LivroAutor(livro_id=2, autor_id=2),
    
]
session.add_all(livro_autores)

# Inserção em LivroCategoria
livro_categorias = [
    LivroCategoria(livro_id=1, categoria_id=1),
    LivroCategoria(livro_id=2, categoria_id=2),
    
]
session.add_all(livro_categorias)

# Inserção em ClientePedido
cliente_pedidos = [
    ClientePedido(cliente_id=1, pedido_id=1),
    ClientePedido(cliente_id=2, pedido_id=2),
    
]
session.add_all(cliente_pedidos)

# Atualização de Dados

# Atualizar 5 registros (exemplo de atualização em 5 registros)

# Atualizar registros em Autor
autores_para_atualizar = session.query(Autor).filter(Autor.autor_id.in_([1, 2, 3, 4, 5])).all()
for autor in autores_para_atualizar:
    autor.nome = "NovoNome"
    

# Atualizar registros em Editora
editoras_para_atualizar = session.query(Editora).filter(Editora.editora_id.in_([1, 2, 3, 4, 5])).all()
for editora in editoras_para_atualizar:
    editora.nome = "NovaEditora"
   

# Atualizar registros em Categoria
categorias_para_atualizar = session.query(Categoria).filter(Categoria.categoria_id.in_([1, 2, 3, 4, 5])).all()
for categoria in categorias_para_atualizar:
    categoria.nome_categoria = "NovaCategoria"
 

# Atualizar registros em Cliente
clientes_para_atualizar = session.query(Cliente).filter(Cliente.cliente_id.in_([1, 2, 3, 4, 5])).all()
for cliente in clientes_para_atualizar:
    cliente.nome = "NovoCliente"
   

# Atualizar registros em Funcionario
funcionarios_para_atualizar = session.query(Funcionario).filter(Funcionario.funcionario_id.in_([1, 2, 3, 4, 5])).all()
for funcionario in funcionarios_para_atualizar:
    funcionario.nome = "NovoFuncionario"
  

# Exclusão de Dados

# Excluir registros em Autor
autor_a_excluir = session.query(Autor).filter(Autor.autor_id == 3).first()
if autor_a_excluir:
    session.delete(autor_a_excluir)

# Excluir registros em Editora
editora_a_excluir = session.query(Editora).filter(Editora.editora_id == 2).first()
if editora_a_excluir:
    session.delete(editora_a_excluir)

# Excluir registros em Categoria
categoria_a_excluir = session.query(Categoria).filter(Categoria.categoria_id == 3).first()
if categoria_a_excluir:
    session.delete(categoria_a_excluir)

# Excluir registros em Cliente
cliente_a_excluir = session.query(Cliente).filter(Cliente.cliente_id == 4).first()
if cliente_a_excluir:
    session.delete(cliente_a_excluir)

# Excluir registros em Funcionario
funcionario_a_excluir = session.query(Funcionario).filter(Funcionario.funcionario_id == 5).first()
if funcionario_a_excluir:
    session.delete(funcionario_a_excluir)

# Consulta de Dados

# Realizar as 20 consultas definidas nos requisitos funcionais

# Consulta 1: Todos os registros da tabela "Autor"
all_autores = session.query(Autor).all()

# Consulta 2: Autores nascidos após uma data específica
autores_after_date = session.query(Autor).filter(Autor.data_nascimento > datetime(1990, 1, 1)).all()

# Consulta 3: Livros publicados em um ano específico
livros_by_year = session.query(Livro).filter(Livro.ano_publicacao == 2020).all()

clientes_with_pedidos = (
    session.query(Cliente)
    .join(ClientePedido)
    .join(Pedido)
    .options(joinedload(Cliente.pedidos))
    .all()
)

# Consulta 5: Total de vendas por categoria
total_sales_by_categoria = (
    session.query(LivroCategoria.categoria_id, func.sum(Livro.preco))
    .join(Livro)
    .group_by(LivroCategoria.categoria_id)
    .all()
)

# Consulta 6: Livros em estoque
livros_in_estoque = session.query(Livro).join(Estoque).filter(Estoque.quantidade_estoque > 0).all()

# Consulta 7: Funcionários ordenados por data de admissão
funcionarios_ordered_by_admissao = session.query(Funcionario).order_by(Funcionario.data_admissao).all()

# Consulta 8: Pedidos com status "Em andamento"
pedidos_em_andamento = session.query(Pedido).filter(Pedido.status_pedido == 'Em andamento').all()

# Consulta 9: Clientes que fizeram pedidos acima de um certo valor
clientes_com_pedidos_valor_alto = (
    session.query(Cliente)
    .join(ClientePedido)
    .join(Pedido)
    .group_by(Cliente.cliente_id)
    .having(func.sum(Pedido.total_pedido) > 1000)
    .all()
)

# Consulta 10: Livros escritos por um autor específico
livros_by_autor = (
    session.query(Livro)
    .join(LivroAutor)
    .join(Autor)
    .filter(Autor.nome == 'Nome do Autor')
    .all()
)

# Consulta 11: Número total de pedidos
total_pedidos = session.query(func.count(Pedido.pedido_id)).scalar()

# Consulta 12: Livros com preço acima de uma certa quantia
livros_preco_alto = session.query(Livro).filter(Livro.preco > 50.0).all()

# Consulta 13: Pedidos feitos por um cliente específico
pedidos_cliente_especifico = (
    session.query(Pedido)
    .join(ClientePedido)
    .join(Cliente)
    .filter(Cliente.nome == 'Nome do Cliente')
    .all()
)

# Consulta 14: Média salarial dos funcionários
media_salarial_funcionarios = session.query(func.avg(Funcionario.salario)).scalar()

# Consulta 15: Livros em uma determinada categoria
livros_categoria_especifica = (
    session.query(Livro)
    .join(LivroCategoria)
    .join(Categoria)
    .filter(Categoria.nome_categoria == 'Ficção')
    .all()
)

# Consulta 16: Clientes que não fizeram nenhum pedido
clientes_sem_pedidos = (
    session.query(Cliente)
    .outerjoin(ClientePedido)
    .filter(ClientePedido.pedido_id.is_(None))
    .all()
)

# Consulta 17: Total de vendas por editora
total_vendas_por_editora = (
    session.query(Editora.nome, func.sum(Livro.preco))
    .join(Livro)
    .group_by(Editora.editora_id)
    .all()
)

# Consulta 18: Livros com mais de 300 páginas
livros_mais_300_paginas = session.query(Livro).filter(Livro.numero_paginas > 300).all()

# Consulta 19: Funcionários que foram admitidos no último ano
funcionarios_recentemente_admitidos = (
    session.query(Funcionario)
    .filter(Funcionario.data_admissao >= datetime(2022, 1, 1))
    .all()
)

# Consulta 20: Pedidos com status "Concluído" e total superior a 500
pedidos_concluidos_valor_alto = (
    session.query(Pedido)
    .filter(Pedido.status_pedido == 'Concluído', Pedido.total_pedido > 500.0)
    .all()
)

# Fechar a sessão
session.close()