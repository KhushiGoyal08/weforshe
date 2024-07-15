from django.db import models

# Create your models here.
class FashionTrend(models.Model):
    date = models.DateField()
    interest = models.IntegerField()