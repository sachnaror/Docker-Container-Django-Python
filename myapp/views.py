from django.http import HttpResponse


def home(request):
    return HttpResponse("Hello, world! This is my first Django app.")
