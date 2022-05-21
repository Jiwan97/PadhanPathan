from django import template
from PadhanPathan.models import *

register = template.Library()


@register.filter(name='hasReported')
def hasReported(request, id):
    Course_id = Course.objects.get(id=id)
    try:
        answer_is = ReportCourses.objects.get(reported_by=request, Course=Course_id)
    except:
        return False
    return answer_is.reported
