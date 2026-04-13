FROM python:2.7

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Set environment variable
ENV PORT=5000

# Expose port
EXPOSE 5000

# Run application (JSON format - best practice)
CMD ["gunicorn", "-b", ":5000", "-c", "gunicorn.conf.py", "main:app"]

