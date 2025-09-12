# from flask import Flask, render_template, request

# app = Flask(__name__)

# @app.route("/")
# def main():
#     model = {"title": "Hello Build Trigger."}
#     return render_template('index.html', model=model)

# if __name__ == "__main__":
#     app.run(host='0.0.0.0', port=8080, debug=True, threaded=True)

from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, GCP Cloud Build + Artifact Registry!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80, debug=True, threaded=True)

