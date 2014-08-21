from django.shortcuts import render

def landing_page(request):
    return render(request, "starter/landing_page.html")
