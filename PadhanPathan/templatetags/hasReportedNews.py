from django import template
from PadhanPathan.models import *

register = template.Library()


@register.filter(name='hasReportedNews')
def hasReportedNews(request, id):
    News_id = News.objects.get(id=id)
    try:
        answer_is = ReportNews.objects.get(reported_by=request, News=News_id)
    except:
        return False
    return answer_is.reported
