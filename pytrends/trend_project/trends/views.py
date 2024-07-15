# from django.shortcuts import render

# # Create your views here.
from rest_framework.decorators import api_view
from rest_framework.response import Response
from pytrends.request import TrendReq

@api_view(['GET'])
def fashion_trends(request):
    pytrends = TrendReq(hl='en-US', tz=360)
    keyword = request.GET.get('keyword', 'fashion')
    pytrends.build_payload([keyword], cat=0, timeframe='now 7-d', geo='', gprop='')
    trends = pytrends.interest_over_time()
    if 'isPartial' in trends:
        trends = trends.drop(columns=['isPartial'])
    
    trends_list = trends.reset_index().to_dict(orient='records')
    return Response(trends_list)
