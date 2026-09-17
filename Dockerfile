FROM python:3.12-slim-bookworm

# Yahan 'git' add kiya gaya hai
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg gcc python3-dev git && \
    rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN python -m pip install --no-cache-dir --upgrade pip setuptools && \
    python -m pip install --no-cache-dir -r requirements.txt && \
    apt-get purge -y gcc python3-dev && \
    apt-get autoremove -y

CMD ["python", "-m", "SHIVMUSIC"]
