# Usa uma imagem base leve do Python
FROM python:3.12-slim

# Define o comando padrão para o container
CMD ["python3", "-c", "print('Hello, World!')"]
