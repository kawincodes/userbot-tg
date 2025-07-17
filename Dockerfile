# Use Python base image
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Create required directories for logging
RUN mkdir -p /app/logs

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Set required ENV variables (inject externally in prod)
# ENV API_ID=...
# ENV API_HASH=...
# ENV STRING_SESSION=...

# Run the Userge bot
CMD ["python3", "-m", "userge"]
