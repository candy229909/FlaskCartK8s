from flask import Flask, render_template, request, redirect, url_for

# 創建 Flask 應用實例
app = Flask(__name__)

# 商品數據列表
products = [
    {"id": 1, "name": "產品1", "price": 100},
    {"id": 2, "name": "產品2", "price": 200},
    {"id": 3, "name": "產品3", "price": 300}
]

# 購物車列表
cart = []

# 定義路由
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
    return '結帳成功'
