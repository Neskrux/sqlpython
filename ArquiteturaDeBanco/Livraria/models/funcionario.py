from sqlalchemy import Column, Integer, String, Date, DECIMAL
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Funcionario(Base):
    __tablename__ = "funcionario"

    funcionario_id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String(255), nullable=False)
    cargo = Column(String(100))
    data_admissao = Column(Date)
    salario = Column(DECIMAL(10, 2))

    def __init__(self, nome, cargo=None, data_admissao=None, salario=None):
        self.nome = nome
        self.cargo = cargo
        self.data_admissao = data_admissao
        self.salario = salario

# Exemplo de uso:
# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker

# engine = create_engine('sqlite:///:memory:')
# Base.metadata.create_all(engine)

# Session = sessionmaker(bind=engine)
# session = Session()

# novo_funcionario = Funcionario(nome="João Silva", cargo="Analista", data_admissao="2022-01-01", salario=5000.00)
# session.add(novo_funcionario)
# session.commit()
