from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import os
from os.path import join, dirname, realpath


ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif'])
APP_ROOT = os.path.dirname(os.path.abspath(__file__))
UPLOAD_FOLDER = os.path.join(APP_ROOT, 'static/uploads')

app = Flask(__name__)
app.secret_key = 'afh6x3dxj9d3xoisq45dfd6ml546nc3e'
app.config['SQLALCHEMY_DATABASE_URI']='postgres://postgres:0000@localhost/rec_sys_db'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db=SQLAlchemy(app)
