# 1. Base Image: Use a lightweight and recent Python version
FROM python:3.12-slim

# 2. Environment config: Prevents .pyc files and enables unbuffered logging (VITAL for debugging)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 3. Set the working directory inside the container
WORKDIR /app

# 4. Install dependencies first (leverages Docker cache for faster builds)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy your Agent's code
COPY purple_ai.py .

# 6. Command to run the agent
# Since the agent acts as a client connecting to the server, we just execute the script.
CMD ["python", "purple_ai.py"]
