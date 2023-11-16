from sqlalchemy import Column, Integer
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Estoque(Base):
    __tablename__ = "estoque"

    estoque_id = Column(Integer, primary_key=True, autoincrement=True)
    quantidade_estoque = Column(Integer)

    def __init__(self, quantidade_estoque=None):
        self.quantidade_estoque = quantidade_estoque

# Exemplo de uso:
# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker

# engine = create_engine('sqlite:///:memory:')
# Base.metadata.create_all(engine)

# Session = sessionmaker(bind=engine)
# session = Session()

# novo_estoque = Estoque(quantidade_estoque=100)
# session.add(novo_estoque)
# session.commit()
