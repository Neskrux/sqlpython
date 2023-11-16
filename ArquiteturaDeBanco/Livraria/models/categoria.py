from sqlalchemy import Column, Integer, String, Text
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Categoria(Base):
    __tablename__ = "categoria"

    categoria_id = Column(Integer, primary_key=True, autoincrement=True)
    nome_categoria = Column(String(255), nullable=False)
    descricao_categoria = Column(Text)

    def __init__(self, nome_categoria, descricao_categoria=None):
        self.nome_categoria = nome_categoria
        self.descricao_categoria = descricao_categoria

# Exemplo de uso:
# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker

# engine = create_engine('sqlite:///:memory:')
# Base.metadata.create_all(engine)

# Session = sessionmaker(bind=engine)
# session = Session()

# nova_categoria = Categoria(nome_categoria="Eletrônicos", descricao_categoria="Produtos eletrônicos em geral.")
# session.add(nova_categoria)
# session.commit()
