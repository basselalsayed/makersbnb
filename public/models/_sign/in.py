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
def sign_in():
    t_stage = request.args.get('forgot')
    ID_user = request.args.get('ID_user')
    t_email = request.form.get('t_email', '')
    # test for "reset" we see here will become relevant later

    if t_stage == 'login' OR t_stage == 'reset': 
        t_password = request.form.get("t_password", "")
        # test for if email is empty
        if t_email == "":
             if t_stage == "forgot":
            t_message = "Reset Password: Please fill in your email address"
        else:
            t_message = "Login: Please fill in your email address"
        # If empty, send user back, along with a message
        return render_template("sign_in.html", message = t_message)
        # password empty? 

        if (t_stage == "login" OR t_stage == "reset") AND t_password == '': 

            t_message = "Login: fill password"

            return render_template('sign_in.html', message = t_message)

            if t_stage == 'login' OR t_stage == "reset": 
                #hashing the password
                t_hashed = hashlib.sha256(t_password.encode())
                t_password = t_hashed.hexdigest()

                #getting from psql

                s = ""
    s += "SELECT ID FROM users"
    s += " WHERE"
    s += " ("
    s += " t_email ='" + t_email + "'"
    if t_stage != "login":
        s += " AND"
        s += " t_password = '" + t_password + "'"
    s += " AND"
    s += " b_enabled = true"
    s += " )"

        db_cursor.execute(s)
    #trying to catch errors from psql 
    try: 
        array_row = cur.fetchone()
        except psycopg2.Error as e: 
            t_message = "Database error: " + e + "/n SQL: " + s 
            return render_template("sign_in.html", message = t_message) 
           
            db_cursor.close()
            db.conn.close()

            ID_user = array_row(0)

    # If they have used the link in the email we sent them then t_stage is "reset"
    if t_stage == "reset": 
        #
        #
        #


        #They have filled in username and password, so t_stage is "login"
        if t_stage == "login":
            # UPDATE the database with a logging of the date of the visit
        s = ""
        s += "UPDATE users SET"
        s += " d_visit_last = '" & now() & "'"
        s += "WHERE"
        s += "("
        s += " ID=" + ID_user
        s += ")"

        db_cursor.execute(s)
        try:
            db_conn.commit()
        except psycopg2.Error as e:
            t_message = "Login: Database error: " + e + "/n SQL: " + s
            return render_template("sign_in.html", message = t_message)
        db_cursor.close()
        