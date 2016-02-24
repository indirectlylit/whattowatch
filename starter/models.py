from django.db import models


class Movie(models.Model):
    # pk
    rt_id = models.CharField(max_length=100, primary_key=True)

    # required fields
    rt_link = models.TextField(blank=False)
    runtime = models.IntegerField(blank=False)
    audience_score = models.IntegerField(blank=False)
    critics_score = models.IntegerField(blank=False)
    title = models.TextField(blank=False)
    year = models.IntegerField(blank=False)
    synopsis = models.TextField(blank=False)
    mpaa_rating = models.CharField(max_length=50, blank=False)

    # optional fields
    imdb_id = models.CharField(max_length=100)
    actors = models.TextField()  # keep it simple
    audience_rating = models.CharField(max_length=50)
    critics_rating = models.CharField(max_length=50)

    def __str__(self):
        return "id={}, title={}".format(self.rt_id, self.title)
