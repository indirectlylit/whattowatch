from django.conf.urls import url
from django.contrib import admin

from . import views

urlpatterns = [
    url(r'^$', views.main),
    url(r'^api/movies/(?P<rt_id>\w+)/?', views.api_movie),
    url(r'^api/movies/?', views.api_all),
    url(r'^admin/?', admin.site.urls),
]
