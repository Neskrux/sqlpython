from sqlalchemy import Column, Integer, String, Date
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
Base = declarative_base()

class Autor(Base):
    __tablename__ = "autor"

    autor_id = Column(Integer, primary_key=True, autoincrement=True)
    nome = Column(String(255), nullable=False)
    data_nascimento = Column(Date)
    nacionalidade = Column(String(100))

    def __init__(self, nome, data_nascimento=None, nacionalidade=None):
        self.nome = nome
        self.data_nascimento = data_nascimento
        self.nacionalidade = nacionalidade

livros = relationship("LivroAutor", back_populates="autor")



# Exemplo de uso:
# from sqlalchemy import create_engine
# from sqlalchemy.orm import sessionmaker

# engine = create_engine('sqlite:///:memory:')
# Base.metadata.create_all(engine)

# Session = sessionmaker(bind=engine)
# session = Session()

# novo_autor = Autor(nome="John Doe", data_nascimento="1990-01-01", nacionalidade="Brasileiro")
# session.add(novo_autor)
# session.commit()
