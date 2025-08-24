FROM python:3.10-slim

RUN apt-get update && \
	apt-get install -y ca-certificates && \
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies specified in requirements.txt
RUN pip install --use-deprecated=legacy-resolver --no-cache-dir --prefer-binary -r requirements.txt

EXPOSE 80

EXPOSE 443

CMD [ "python", "-m", "flask", "run", "--host", "0.0.0.0", "--port", "80" ]