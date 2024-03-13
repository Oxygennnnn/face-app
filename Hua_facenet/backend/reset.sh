find ./apps -path "*/migrations/*.py" -not -name "__init__.py" -delete
rm -rf ./apps/*/migrations/__pycache__
rm db.sqlite3

python manage.py makemigrations
python manage.py migrate
export DJANGO_SUPERUSER_PASSWORD=admin
python manage.py createsuperuser --noinput --username admin --email admin@admin.com
python manage.py collectstatic --noinput
