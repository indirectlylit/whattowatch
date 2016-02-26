from django.core.exceptions import ObjectDoesNotExist
from django.http import JsonResponse
from django.shortcuts import render

import json
import os

from .models import Movie
from .settings import APP_DIR


def main(request):
    context = {}

    # references to client-side templates and sprite sheets
    context['tags'] = os.listdir(os.path.join(APP_DIR, 'static', 'tags'))
    context['sprite_sheets'] = os.listdir(os.path.join(APP_DIR, 'static', 'thumb_sprites'))

    # preload data to skip initial ajax calls
    with open(os.path.join(APP_DIR, 'templates', 'sprites.json')) as f:
        context['sprites'] = f.read()

    context['movies'] = json.dumps([_overview(m) for m in Movie.objects.all()])

    return render(request, "main.html", context=context)


def _overview(movie):
    return {
        'id': movie.rt_id,
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


def api_details(request, rt_id):
    try:
        m = Movie.objects.get(rt_id=rt_id)
    except ObjectDoesNotExist:
        r = JsonResponse({
            'error': "Movie with id '{}' was not found.".format(rt_id)
        })
        r.status_code = 404
        return r

    return JsonResponse(_details(m))
