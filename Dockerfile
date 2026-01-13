# 1. Base Image: Use Python 3.10 (Same as before for consistency)
FROM python:3.10-slim

# 2. Python Optimizations for Docker
# Prevents Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE=1
# Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# 3. Dependency Installation (Standard/Professional Workflow)
# Copy the dependency manifest first to leverage Docker cache
COPY requirements.txt .
# Install dependencies from the list
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy the Agent Source Code
COPY purple_ai.py .

# 5. Startup Command
# Explicitly using 'python3' as preferred
CMD ["python3", "purple_ai.py"]