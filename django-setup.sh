#!/usr/bin/env bash

python -m venv "$PWD/.env"
source "$PWD/.env/bin/activate"

pip install django django-extensions psycopg2 ipython
django-admin startproject core "$PWD"
python manage.py startapp $1

mkdir -p "$PWD/$1/templates/$1/"
cp -f /home/rabind/Documents/Templates/Django/settings.py "$PWD/core/"
cp -f /home/rabind/Documents/Templates/html/base.html "$PWD/$1/templates/$1/"
cp -f /home/rabind/Documents/Templates/html/home.html "$PWD/$1/templates/$1/"
cp -f /home/rabind/Documents/Templates/Django/core_urls.py "$PWD/core/urls.py"
cp -f /home/rabind/Documents/Templates/Django/app_urls.py "$PWD/$1/urls.py"
cp -f /home/rabind/Documents/Templates/Django/views.py "$PWD/$1/views.py"

sed -i "s/book/$1/g" "$PWD/core/settings.py"
sed -i "s/book/$1/g" "$PWD/core/urls.py"
sed -i "s/book/$1/g" "$PWD/$1/urls.py"
sed -i "s/book/$1/g" "$PWD/$1/views.py"
sed -i "s/book/$1/g" "$PWD/$1/templates/$1/home.html"



