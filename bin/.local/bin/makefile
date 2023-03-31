#!/bin/bash

echo '# Установить все зависимости
install:
    pip install -r requirements.txt

# Update requirements
upr:
    pip freeze > requirements.txt

# Запустить server
run:
    python ./manage.py runserver 127.0.0.1:8000

# Выполнить миграцию
mi:
    python ./manage.py makemigrations
    python ./manage.py migrate

# Убить процесс занимающий порт
kill:
    fuser -k 8000/tcp

# Запуск оболочки
shell:
    python ./manage.py shell

# Импорт базы из файла data.sql
import:
    cat data.sql | sqlite3 db.sqlite3' > Makefile
