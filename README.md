# Requirements & Setup

Tested with Python 3.5.1

```
pip install -r requirements.txt   # requires Django 1.9
python manage.py migrate
python manage.py createsuperuser  # set your admin creds
python manage.py loaddata movie_fixture.json  # populate DB
python manage.py runserver
```

Navigate to the admin page: [127.0.0.1:8000/admin/](http://127.0.0.1:8000/admin/) and enter your admin credentials as set above.

# Notes

* For the sake of simplicity, this Django application conflates the concept of 'projects' and 'apps', putting both into a hybrid project/app module called `starter`.
* Data pre-processing is performed using a Jupyter notebook in the `data-utils` directory.
