from sqlalchemy import Column, Integer, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Livro(Base):
    __tablename__ = "livro"

    livro_id = Column(Integer, primary_key=True, autoincrement=True)
    # ... (restante dos campos do Livro)

class Categoria(Base):
    __tablename__ = "categoria"

    categoria_id = Column(Integer, primary_key=True, autoincrement=True)
    # ... (restante dos campos do Categoria)

class LivroCategoria(Base):
    __tablename__ = "livrocategoria"

    livro_id = Column(Integer, ForeignKey("livro.livro_id"), primary_key=True)
    categoria_id = Column(Integer, ForeignKey("categoria.categoria_id"), primary_key=True)

    livro = relationship("Livro", back_populates="categorias")
    categoria = relationship("Categoria", back_populates="livros")

# Adicione os relacionamentos nas classes Livro e Categoria
Livro.categorias = relationship("LivroCategoria", back_populates="livro")
Categoria.livros = relationship("LivroCategoria", back_populates="categoria")

# Exemplo de uso:
# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker

# engine = create_engine('sqlite:///:memory:')
# Base.metadata.create_all(engine)

# Session = sessionmaker(bind=engine)
# session = Session()

# novo_livro = Livro(titulo="Aventuras de Python", isbn="1234567890123", ano_publicacao=2023, preco=29.99, numero_paginas=200)
# nova_categoria = Categoria(nome_categoria="Ação", descricao_categoria="Livros de ação")

# session.add(novo_livro)
# session.add(nova_categoria)
# session.commit()

# novo_relacionamento = LivroCategoria(livro=novo_livro, categoria=nova_categoria)
# session.add(novo_relacionamento)
# session.commit()
