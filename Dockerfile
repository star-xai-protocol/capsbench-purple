# 1. Imagen Base (Python 3.10 es estable y ligera)
FROM python:3.10-slim

# 2. Configuración para ver los logs inmediatamente (VITAL para debugging)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3. Directorio de trabajo
WORKDIR /app

# 4. Instalamos dependencias primero (para aprovechar caché de Docker)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiamos TU código (asegúrate de que purple_ai.py esté en la carpeta)
COPY purple_ai.py .
# Si tienes más archivos (como utils.py), usa: COPY . .

# 6. Puerto (El Purple Agent suele usar 8000 u 8100, asegúrate cuál usa tu código)
EXPOSE 8100

# 7. Ejecución
# Usamos el formato exec ["..."] que es más seguro
ENTRYPOINT ["python", "purple_ai.py"]

# Argumentos por defecto (puedes sobreescribirlos si hace falta)
CMD ["--host", "0.0.0.0", "--port", "8100"]
