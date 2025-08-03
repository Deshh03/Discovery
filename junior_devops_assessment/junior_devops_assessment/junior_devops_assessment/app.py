from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return '<h1>Hello from the solved backend solution!</h1>'

@app.route('/data')
def get_data():
    return jsonify({"message": "Data from the solved backend solution!"})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
