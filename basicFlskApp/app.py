from flask import Flask, request, json,render_template
app = Flask(__name__)
@app.route('/')
def index():
    return render_template("index.html") 

if __name__ == '__main__':    
    # listen on all IPs 
    app.run(host='0.0.0.0')
