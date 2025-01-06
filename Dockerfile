FROM python:3.13

# Instalando o UV
RUN pip install uv

# Copiar o conteúdo do diretório atual para o contêiner
COPY . /src

# Definir o diretório de trabalho
WORKDIR /src

# Instalar as dependências do projeto com Poetry
RUN uv sync

# Expor a porta em que a aplicação estará escutando
EXPOSE 8501

# Definir o entrypoint para executar o servidor Uvicorn
ENTRYPOINT ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8501"]