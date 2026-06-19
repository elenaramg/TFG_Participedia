from sqlalchemy import create_engine

usuario = '--'
contrasena = '--'
host = '--'
puerto = '--'
base_datos = 'Participedia'

url_conexion = f"postgresql://{usuario}:{contrasena}@{host}:{puerto}/{base_datos}"
engine = create_engine(url_conexion)