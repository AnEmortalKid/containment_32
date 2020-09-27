import os
import logging
import sqlite3

from pyramid.config import Configurator
from pyramid.events import ApplicationCreated
from pyramid.events import NewRequest
from pyramid.events import subscriber
from pyramid.httpexceptions import HTTPFound
from pyramid.session import UnencryptedCookieSessionFactoryConfig

from wsgiref.simple_server import make_server

logging.basicConfig()
log = logging.getLogger(__file__)

here = os.path.dirname(os.path.abspath(__file__))

if __name__ == '__main__':
    # configuration settings
    settings = { "db": os.path.join(here, 'pyramids.db'), "mako.directories": os.path.join(here, 'templates')}
    config = Configurator(settings=settings, session_factory=UnencryptedCookieSessionFactoryConfig('pyramids'))
    config.include('pyramid_mako')
    # routes setup
    config.add_route('list', '/')
    # scan for @view_config and @subscriber decorators
    config.scan('db')
    config.scan('views')
    config.scan()
    # serve app
    app = config.make_wsgi_app()
    server = make_server('0.0.0.0', 8080, app)
    server.serve_forever()