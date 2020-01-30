from flask import Flask
from flask import render_template # render the html form
from flask import request # get user input from sign-in form
import hashlib # included in Python library, not installed
import psycopg2
import flask_mail 
import Mail  
#
#
#
from flask_mail import Message

app = Flask(__name__)

#mail 
def smtp_config(config_name, smtp=1):
    with open(config_name) as f: 
        config_data = json.load(f)
        if smtp not in {1,2}:
            raise ValueError("stmp can only be 1 or 2")
        if stmp==2: 
            MAIL_USERNAME = config_data['MAIL_USERNAME'][1]
            MAIL_PASSWORD = config_data['MAIL_PASSWORD'][1]
        else: 
            MAIL_USERNAME = config_data['MAIL_USERNAME'][0]
            MAIL_PASSWORD = config_data['MAIL_PASSWORD'][0]
        MAIL_SERVER = config_data['MAIL_SERVER']
        MAIL_PORT = config_data['MAIL_PORT']
        MAIL_USE_TLS = bool(config_data['MAIL_USE_TLS'])
        return [MAIL_USERNAME, MAIL_PASSWORD, MAIL_SERVER, MAIL_SERVER, MAIL_SERVER, MAIL_PORT, MAIL_USE_TLS]

        mail = Mail()

#database 
t_host = 'database address'
t_port = '5432'
t_dbname = 'makers_bnb'
t_user = 'username'
t_pw = 'password'
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

         return redirect("/index_logged_in", code=302)

             if t_stage == "forgot":
             smtp_data = smtp_config('config.json', smtp=1)
            app.config.update(dict(
            MAIL_SERVER = smtp_data[2],
             MAIL_PORT = smtp_data[3],
            MAIL_USE_TLS = smtp_data[4],
            MAIL_USERNAME = smtp_data[0],
            MAIL_PASSWORD = smtp_data[1],
            ))
            mail.init_app(app)
            t_subject = "Password reset link"
            t_recipients = t_email
            t_sender = "an email will go here?"

         s = ""
        s += "Dear " + s_email + "<br>"
        s += "<br>"
        s += "You forgot your password?" + "<br>"
        s += "<br>"
        s += "Here is your password reset link. Please click on the following link or paste it into your web browser:" + "<br>"
        s += "<br>"
        s += "<a href='http://localhost:/9292/sign_in.py?forgot=step2&ID_user=" + ID_user
        s += "'>https://localhost:/9292/sign_in.py?forgot=step2&ID_user=" + ID_user
        s += "</a>" + "<br>"
        s += "<br>"
        s += "Feel free to reply to this message." + "<br>"
        s += "<br>"

         msg = Message(
            body = s,
            subject = t_subject,
            recipients = [t_recipients],
            sender = t_sender,
            reply_to = t_sender
            )

        mail.send(msg)

        t_message = "Login: Password reset link was sent to your email address."
        return render_template("sign_in.html", message = t_message)

        if t_stage == "reset":
            #
            #
            #

#cmd line testin
 if __name__ == "__main__":
     app.run(debug=True)
