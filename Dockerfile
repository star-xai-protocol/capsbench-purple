FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Instalamos curl (por seguridad, algunos leaderboards lo piden)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY purple_ai.py .

# EXPOSE informativo
EXPOSE 9009

# 1. ENTRYPOINT: Ejecuta siempre Python con logs sin buffer (-u)
ENTRYPOINT ["python", "-u", "purple_ai.py"]

# 2. CMD: Argumentos por defecto (que el Leaderboard sobrescribirá sin romper nada)
CMD ["--host", "0.0.0.0", "--port", "9009"]
