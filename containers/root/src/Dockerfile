FROM python:3.10
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt
EXPOSE 80
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]