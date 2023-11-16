from sqlalchemy import Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Editora(Base):
    __tablename__ = "editora"

    editora_id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String(255), nullable=False)
    endereco = Column(String(255))
    telefone = Column(String(15))

    def __init__(self, nome, endereco=None, telefone=None):
        self.nome = nome
        self.endereco = endereco
        self.telefone = telefone

# Exemplo de uso:
# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker

# engine = create_engine('sqlite:///:memory:')
# Base.metadata.create_all(engine)

# Session = sessionmaker(bind=engine)
# session = Session()

# nova_editora = Editora(nome="Editora ABC", endereco="Rua ABC, 123", telefone="123-456-7890")
# session.add(nova_editora)
# session.commit()
