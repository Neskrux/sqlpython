from urllib.parse import quote
from sqlalchemy_utils import database_exists, create_database
from sqlalchemy import create_engine
from sqlalchemy.orm import Session, declarative_base


USER = "root"
PASSWORD= "Bbhhssgg134679852"
SERVER = "localhost"
PORT = 3306
DATABASE = "livraria"

instancia = f"mysql+pymysql://{USER}:{PASSWORD}@{SERVER}:{PORT}/{DATABASE}"


if not database_exists(url=instancia):
  create_database(url = instancia)

engine = create_engine(instancia, echo=True)
session = Session(bind=engine, autoflush=True)

Base = declarative_base()


from models.cliente import Cliente
from models.autor import Autor
from models.categoria import Categoria
from models.editora import Editora
from models.funcionario import Funcionario
from models.livro import Livro
from models.estoque import Estoque
from models.livroAutor import LivroAutor
from models.livroCategoria import LivroCategoria
from models.pedido import Pedido
from models.clientePedido import ClientePedido


