from sqlalchemy import Column, Integer, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class ClientePedido(Base):
    __tablename__ = 'clientepedido'
    cliente_id = Column(Integer, ForeignKey('Cliente.cliente_id'), primary_key=True)
    pedido_id = Column(Integer, ForeignKey('Pedido.pedido_id'), primary_key=True)
    cliente = relationship('Cliente', back_populates='pedidos')
    pedido = relationship('Pedido', back_populates='clientes')


