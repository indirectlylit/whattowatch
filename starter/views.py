from django.http import HttpResponse

def landing_page(request):
    return HttpResponse("This could be the start of a beautiful program!", content_type="text/plain")
