from pyramid.view import view_config

@view_config(route_name='list', renderer='list.mako')
def list_view(request):
    rs = request.db.execute('select name, image from pyramids')
    pyramids = [dict(name=row[0], image=row[1]) for row in rs.fetchall()]
    return {'pyramids': pyramids}
