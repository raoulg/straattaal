#FROM raoulgrouls/torch-python-slim:py3.12-torch2.7.1-arm64-uv0.8.13
FROM raoulgrouls/torch-python-slim:py3.12-torch2.7.1-amd64-uv0.8.13

WORKDIR /app

COPY backend/requirements.txt requirements.txt
RUN uv pip install --no-cache --system -r requirements.txt

COPY artefacts artefacts
COPY backend/app.py .
COPY backend/utils.py .
COPY frontend frontend

RUN --mount=source=dist,target=/dist PYTHONDONTWRITEBYTECODE=1 uv pip install --system --no-cache-dir /dist/*.whl

EXPOSE 80

CMD ["python", "app.py"]
