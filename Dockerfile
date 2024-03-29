FROM python:3.6
ENV PYTHONUNBUFFERED 1
ENV C_FORCE_ROOT true
RUN mkdir /src
RUN mkdir /static
WORKDIR /src

ADD ./src /src
RUN pip install --upgrade pip
RUN pip install -r requirements.pip
CMD python manage.py collectstatic --no-input; python manage.py makemigrations agender; python manage.py migrate; python manage.py runserver 0.0.0.0:8000
