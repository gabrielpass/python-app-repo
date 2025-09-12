# from flask import Flask

# app = Flask(__name__)

# @app.route("/")
# def hello():
#     return "Hello, GCP Cloud Build + Artifact Registry!"

# if __name__ == "__main__":
#     app.run(host="0.0.0.0", port=80, debug=True, threaded=True)

import os
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, World!"

if __name__ == "__main__":
    # Usa a porta do ambiente ou 8080 como default
    port = int(os.environ.get("PORT", 8080))
    app.run(host="0.0.0.0", port=port)
