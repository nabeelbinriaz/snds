# Use an official Python runtime as a parent image (choose the appropriate Python version)
FROM python:3.10

# Specify a working directory (optional but recommended)


# Copy the current directory contents into the container at /app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 8000 (or the port your FastAPI app listens on)
EXPOSE 8000

# Install Chrome (if required)
RUN apt-get update && apt-get install -y wget gnupg2 && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb

# Run your FastAPI app when the container launches
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
