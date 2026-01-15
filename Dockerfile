# 1. Base Image
FROM python:3.10-slim

# 2. Configuración de entorno
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/app

WORKDIR /app

# 3. Instalación de dependencias
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copia de código
COPY purple_ai.py .

# 5. Puerto para agentes participantes
EXPOSE 8100

# 6. Ejecución (Siguiendo el estándar del leaderboard)
ENTRYPOINT ["python", "purple_ai.py"]
CMD ["--host", "0.0.0.0", "--port", "8100"]
