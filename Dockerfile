# Use official Python 3.10 slim image as base
FROM python:3.10-slim

# Install system dependencies for Odoo and Python packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    libxml2-dev \
    libxslt1-dev \
    libpq-dev \
    python3-dev \
    build-essential \
    libffi-dev \
    libssl-dev \
    libjpeg-dev \
    libldap2-dev \
    libsasl2-dev \
    zlib1g-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libevent-dev \
    curl \
    ca-certificates \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy all your Odoo project files to /app
COPY . /app

# Set up and activate a virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip \
 && pip install wheel setuptools \
 && pip install --no-cache-dir -r requirements.txt

# Ensure start.sh is executable
RUN chmod +x start.sh

# Expose Odoo's default port
EXPOSE 8069

# Start the Odoo server
CMD ["./start.sh"]
