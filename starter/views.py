from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse
from django.shortcuts import render

import json

from .models import Movie


def main(request):
    return render(request, "main.html")


def _overview(movie):
    return {
        'rt_id': movie.rt_id,
        'audience_score': movie.audience_score,
        'critics_score': movie.critics_score,
        'title': movie.title,
        'year': movie.year,
        'mpaa_rating': movie.mpaa_rating,
    }


def _details(movie):
    return {
        'rt_link': movie.rt_link,
        'runtime': movie.runtime,
        'synopsis': movie.synopsis,
        'imdb_id': movie.imdb_id,
        'actors': movie.actors,
        'audience_rating': movie.audience_rating,
        'critics_rating': movie.critics_rating,
    }


def api_all(request):
    return JsonResponse([_overview(m) for m in Movie.objects.all()], safe=False)


def api_movie(request, rt_id):
    try:
        m = Movie.objects.get(rt_id=rt_id)
    except ObjectDoesNotExist:
        r = JsonResponse({
            'error': "Movie with id '{}' was not found.".format(rt_id)
        })
        r.status_code = 404
        return r

    return JsonResponse({**_details(m), **_overview(m)})
