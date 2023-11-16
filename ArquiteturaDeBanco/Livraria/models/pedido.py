from sqlalchemy import Column, Integer, Date, String, DECIMAL
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from models.clientePedido import ClientePedido
Base = declarative_base()

class Pedido(Base):
    __tablename__ = 'pedido'
    pedido_id = Column(Integer, primary_key=True, autoincrement=True)
    data_pedido = Column(Date)
    status_pedido = Column(String(50))
    total_pedido = Column(DECIMAL(10, 2))
    clientes = relationship('ClientePedido', back_populates='pedido')

    def __init__(self, data_pedido, status_pedido=None, total_pedidos=None, clientes=None):
        self.data_pedido = data_pedido
        self.status_pedido = status_pedido
        self.total_pedido = total_pedidos
        self.clientes = clientes