FROM python:3.9-slim

# Set Workdir
WORKDIR /app

# Copy file
COPY . /app

# Install Dependencies & Create user & group
RUN groupadd -r appUserGroup && \
    useradd -r -g appUserGroup appuser && \
    pip install -r requirements.txt && \
    chown -R appUserGroup:appuser /app

# EXpose Port & User
EXPOSE 80

USER appuser

# CMD Command Run
ENTRYPOINT [ "python", "app.py" ]