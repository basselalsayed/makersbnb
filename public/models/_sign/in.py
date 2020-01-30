from flask import Flask
from flask import render_template # render the html form
from flask import request # get user input from sign-in form
import hashlib # included in Python library, not installed
import psycopg2
#
#
#
from flask_mail import Message

app = Flask(__name__)

#mail 
  #
  #
  #

#database 
t_host = 'database address'
t_port = '5432'
t_dbname = 'database name'
t_user = 'data user name'
t_pw = 'database user password'
db_conn = psycopg2.connect(host=t_host, port=t_port, dbname=t_dbname, user=t_user, password=t_pw)
db_cursor = db_conn.db_cursor()

@app.route("/")

def showForm(): 
    t_message = "Login Application"
    return render_template("sign_in.html", message = t_message)

    @app.route('/sign_in', methods=["POST", "GET"])
