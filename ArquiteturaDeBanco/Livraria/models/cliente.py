from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from models.clientePedido import ClientePedido
Base = declarative_base()

class Cliente(Base):
    __tablename__ = 'cliente'

    cliente_id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String(255), nullable=False)
    endereco = Column(String(255))
    email = Column(String(255))
    telefone = Column(String(15))

    def __init__(self, nome, endereco=None, email=None, telefone=None):
        self.nome = nome
        self.endereco = endereco
        self.telefone = telefone
        self.email = email

    # Usando a string para referenciar 'ClientePedido'
    pedidos = relationship('ClientePedido', back_populates='cliente')
    
