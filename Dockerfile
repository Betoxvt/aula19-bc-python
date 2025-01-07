FROM python:3.13
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
ENV PATH="/root/.local/bin/:$PATH"
EXPOSE 8501
COPY pyproject.toml uv.lock .python-version /src/
WORKDIR /src
RUN uv sync --frozen
ENTRYPOINT ["uv", "run", "fastapi", "dev", "main.py", "--host", "0.0.0.0", "--port", "8501"]