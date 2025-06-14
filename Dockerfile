# Use official Python 3.10 slim image as base
FROM python:3.10-slim

# Install system dependencies needed for Odoo and Python packages
RUN apt-get update && apt-get install -y \
    git \
    libxml2-dev \
    libxslt-dev \
    libpq-dev \
    python3-dev \
    build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Set working directory inside container
WORKDIR /app

# Copy your project files to /app in container
COPY . /app

# Create and activate virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Make start.sh executable
RUN chmod +x start.sh

# Start Odoo when container runs
CMD ["./start.sh"]
