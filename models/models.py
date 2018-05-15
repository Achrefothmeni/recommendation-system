from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate, MigrateCommand
from flask_script import Manager
from flask import Flask
import os
import sys
sys.path.append(os.path.abspath(os.path.dirname(__file__) + '/' + '../..'))
from rec.settings import app, db


class Product(db.Model):
    __tablename__ = 'products'
    id = db.Column('id', db.String(300), primary_key = True)
    name = db.Column('name', db.String(200))
    description = db.Column('description', db.String(600))
    category = db.Column('category', db.String(20))
    price = db.Column('price', db.Float)
    image = db.Column('image', db.String(500))
    top_1 = db.Column('top_1', db.String(300))
    top_2 = db.Column('top_2', db.String(300))
    top_3 = db.Column('top_3', db.String(300))

    def __init__(self,id,name,description,category,price,image):
        self.id = id
        self.name = name
        self.description = description
        self.category = category
        self.price = price
        self.image = image
    

class Similar_Product(db.Model):
    __tablename__ = 'similar_products'
    id = db.Column('id', db.String(300), primary_key = True)
    name = db.Column('name', db.String(200))
    description = db.Column('description', db.String(600))
    category = db.Column('category', db.String(20))
    price = db.Column('price', db.Float)
    image = db.Column('image', db.String(500))

    def __init__(self,id,name,description,category,price,image):
        self.id = id
        self.name = name
        self.description = description
        self.category = category
        self.price = price
        self.image = image


class User(db.Model):
    __tablename__ = 'users'
    username = db.Column('username', db.String(20), primary_key = True)
    password = db.Column('password', db.String(25))

    def __init__(self,username,password):
        self.username = username
        self.password = password

    @property
    def serialize(self):
       """Return object data in easily serializeable format"""
       return {
           'username' : self.username,
           'password' : self.password
        }







migrate = Migrate(app,db)
manager = Manager(app)

manager.add_command('db', MigrateCommand)

if __name__ == '__main__':
    manager.run()

