from sqlalchemy import Column, Integer, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Livro(Base):
    __tablename__ = "livro"

    livro_id = Column(Integer, primary_key=True, autoincrement=True)
    # ... (restante dos campos do Livro)

class Autor(Base):
    __tablename__ = "autor"

    autor_id = Column(Integer, primary_key=True, autoincrement=True)
    # ... (restante dos campos do Autor)

class LivroAutor(Base):
    __tablename__ = "livroautor"

    livro_id = Column(Integer, ForeignKey("livro.livro_id"), primary_key=True)
    autor_id = Column(Integer, ForeignKey("autor.autor_id"), primary_key=True)

    livro = relationship("Livro", back_populates="autores")
    autor = relationship("Autor", back_populates="livros")

# Adicione os relacionamentos nas classes Livro e Autor
Livro.autores = relationship("LivroAutor", back_populates="livro")
Autor.livros = relationship("LivroAutor", back_populates="autor")

# Exemplo de uso:
# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker

# engine = create_engine('sqlite:///:memory:')
# Base.metadata.create_all(engine)

# Session = sessionmaker(bind=engine)
# session = Session()

# novo_livro = Livro(titulo="Aventuras de Python", isbn="1234567890123", ano_publicacao=2023, preco=29.99, numero_paginas=200)
# novo_autor = Autor(nome="João Silva", data_nascimento="1990-01-01", nacionalidade="Brasileiro")

# session.add(novo_livro)
# session.add(novo_autor)
# session.commit()

# novo_relacionamento = LivroAutor(livro=novo_livro, autor=novo_autor)
# session.add(novo_relacionamento)
# session.commit()
