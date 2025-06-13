FROM python:3.10

# Set work directory
WORKDIR /app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

RUN useradd -rms /bin/bash app
RUN mkdir /app/static && mkdir /app/media  && chown -R app:app /app && chmod 755 /app
USER app
COPY --chown=app:app . .