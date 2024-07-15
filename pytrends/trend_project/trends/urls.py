from django.urls import path
from .views import fashion_trends

urlpatterns = [
    path('fashion_trends/', fashion_trends, name='fashion_trends'),
]
