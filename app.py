from flask import Flask, jsonify, render_template, redirect, request, url_for, session, flash, send_from_directory
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import os
from os.path import join, dirname, realpath
from flask_migrate import Migrate, MigrateCommand
from flask_script import Manager
from models.models import Product, User, Similar_Product
from rec.settings import *


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/api/user')
def user_api():
    return jsonify( [user.serialize for user in User.query.all()])


@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(app.config['UPLOAD_FOLDER'],filename)


@app.route('/')
def home():
    session['add_product'] = False
    return render_template('home.html')


@app.route('/add-product', methods=['GET','POST'])
def add_product():
    if (session['add_product'] == False) :
        return render_template('add-product.html', err= True)
    else:
        if request.method == 'POST':
            name = request.form['name']
            description = request.form['description']
            category = request.form['category']
            price = request.form['price']
            file = request.files['file']
            if 'file' not in request.files:
                flash('No file part')
                return redirect(request.url)
            # if user does not select file, browser also
            # submit a empty part without filename
            if file.filename == '':
                flash('No selected file')
                return redirect(request.url)
            if file and allowed_file(file.filename):
                filename = secure_filename(file.filename)
                file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            product_id = name.replace(" ", "_").replace("-","_").replace("(","_").replace(")","_").lower()+"_"+category.replace(" ", "_").lower()
            
            product = Product(product_id,name,description,category,price,file.filename)
            db.session.add(product)
            db.session.commit()
            return redirect(url_for('products'))
        else:
            return render_template('add-product.html')

@app.route('/delete-product/<id>', methods=['GET','POST'])
def delete_product(id):
    product = Product.query.filter_by(id=id).first()
    db.session.delete(product)
    db.session.commit()
    return redirect(url_for('products'))
    


@app.route('/products', methods=['GET','POST'])
def products():
    if request.method == 'GET':
        products = Product.query.all()
        nb1 = Product.query.filter(Product.category == 'Computer').count()
        nb2 = Product.query.filter(Product.category == 'Smart Phone').count()
        nb = nb1+nb2
        return render_template('products.html',products=products,nb=nb)
    else:
        category = request.form['category']
        word = request.form['word']
        prod1 = Product.query.filter(Product.category == category)
        prod2 = Product.query.filter(Product.description == word) 
        nb1 = Product.query.filter(Product.category == category).count()
        nb2 = Product.query.filter(Product.description == word).count()
        nb = nb1+nb2
        return render_template('products.html',products=prod1,nb=nb)
       

@app.route('/products-details/<id>')
def product_details(id):
    product = Product.query.filter_by(id=id).first()
    similar_products = Product.query.filter(Product.id.in_([product.top_1, product.top_2, product.top_3]))
    return render_template('product-details.html',product=product, similar_products=similar_products)


@app.route('/search/',methods=['GET','POST'])
def search():
    if request.method == 'POST':
        word = request.form['word']
        products = Product.query.filter(Product.name.like("%"+word+"%")).all()
        nb = Product.query.filter(Product.name.like("%"+word+"%")).count()
        return render_template('products.html',products=products, nb=nb)

@app.route('/signin', methods=['GET','POST'] )
def signin():
    if request.method == 'POST':
        l_user = User.query.filter(User.username == request.form['username']).first()
        if l_user:
            if l_user.password == request.form['password']:
                session['username'] = request.form['username']
                session['logged_in'] = True
                session['add_product'] = True
                return redirect (url_for('products'))
            else:
                return render_template('login.html', err=True)
        else:
            return render_template('login.html', err=True)
    else:
        return render_template('login.html', err=False)


@app.route('/signup', methods=['GET','POST'])
def signup():
    if request.method == 'POST':
        username = request.form['username']
        existing_user = User.query.filter(User.username == username).first()
        '''user = User(username, request.form['password'])
        db.session.add(user)
        db.session.commit()'''
        if existing_user is None:
            user = User(username, request.form['password'])
            db.session.add(user)
            db.session.commit()
            return redirect(url_for('signin'))
        else:
            return render_template('signup.html', err=True)
    else:
        return render_template('signup.html', err=False)

@app.route('/signout')
def signout():
    session.pop('logged_in', None)
    flash('You were logged out')
    return redirect(url_for('signin'))



@app.route('/shopping-card')
def shopping_card():
    
    return render_template('shopping-cart.html')

@app.route('/shopping-card/<id>')
def add_shopping_card(id):
    if "cart" not in session:
        session["cart"] = []
        return redirect(url_for('products'))
    else:
        session["cart"].append(id)
        return redirect(url_for('products'))

@app.route('/shopping-card/delete/')
def delete_shopping_card():
    session.pop('cart', None)
    return render_template('shopping-cart.html')


if __name__ == '__main__':
    
    app.run(debug=True)



