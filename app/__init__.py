from flask import Flask, render_template, request, redirect, url_for

# �Ы� Flask ���ι��
app = Flask(__name__)

# �ӫ~�ƾڦC��
products = [
    {"id": 1, "name": "���~1", "price": 100},
    {"id": 2, "name": "���~2", "price": 200},
    {"id": 3, "name": "���~3", "price": 300}
]

# �ʪ����C��
cart = []

# �w�q����
@app.route('/')
def index():
    return render_template('index.html', products=products)

@app.route('/add_to_cart/<int:product_id>')
def add_to_cart(product_id):
    product = next((product for product in products if product['id'] == product_id), None)
    if product:
        cart.append(product)
    return redirect(url_for('index'))

@app.route('/cart')
def show_cart():
    return render_template('cart.html', cart=cart)

@app.route('/checkout', methods=['POST'])
def checkout():
    cart.clear()
    return '���b���\'
