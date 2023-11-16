from sqlalchemy import Column, Integer, String, DECIMAL
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Livro(Base):
    __tablename__ = "livro"

    livro_id = Column(Integer, primary_key=True, autoincrement=True)
    titulo = Column(String(255), nullable=False)
    isbn = Column(String(13))
    ano_publicacao = Column(Integer)
    preco = Column(DECIMAL(10, 2))
    numero_paginas = Column(Integer)

    def __init__(self, titulo, isbn=None, ano_publicacao=None, preco=None, numero_paginas=None):
        self.titulo = titulo
        self.isbn = isbn
        self.ano_publicacao = ano_publicacao
        self.preco = preco
        self.numero_paginas = numero_paginas

# Exemplo de uso:
# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker

# engine = create_engine('sqlite:///:memory:')
# Base.metadata.create_all(engine)

# Session = sessionmaker(bind=engine)
# session = Session()

# novo_livro = Livro(titulo="Aventuras de Python", isbn="1234567890123", ano_publicacao=2023, preco=29.99, numero_paginas=200)
# session.add(novo_livro)
# session.commit()
