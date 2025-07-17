# Use Python base image
FROM python:3.11-slim

# Set environment variables to prevent Python from writing .pyc files and buffering stdout
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Set required environment variables here or inject them externally
# ENV API_ID=your_api_id
# ENV API_HASH=your_api_hash
# ENV STRING_SESSION=your_string_session

# Default command to run Userge
CMD ["python3", "-m", "userge"]
