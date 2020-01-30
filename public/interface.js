// $(document).ready(function() {
//   $("#signUpButton").click(function() {
//    $("#signUpForm").toggle();
//   });

  $(document).ready(function() {
    $("#signUpButton").click(function() {
    $("#signUpForm").toggle();
    });
    $( "#datepicker" ).datepicker();
    $( "#datepicker2" ).datepicker();
    $("#OpenDialog").click(function () {
     $("#dialog").dialog({modal: true, height: 500, width: 700 });
   });
 });


 function isEmpty (fixwhat, s_called)
           {
               if (fixwhat=="")
               {
               alert("Please enter " + s_called);
               return true;
               } else {
               return false;
               }
           
             function charCheck(fixwhat)
           {
               var validchars = '@-_.0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
               if(isValid(fixwhat,validchars))
               {
                   return true;
               } else {
                   alert("Please use only letters or numbers in this field");
                   return false;
               }
           }

           function isValid(string,validchars)
           {
               for (var i=0; i< string.length; i++)
               {
               if (validchars.indexOf(string.charAt(i)) === -1) {return false;}

           
           // Check for empty fields
           if (is_empty (form.t_email.value,"your email address")) { form.t_email.focus();  return false;}
           if (is_empty (form.t_password.value,"your password")) { form.t_password.focus();  return false;}

           //check for unexpected chars
           if (charCheck(form.t_email.value)===false) {form.t_email.focus(); return false;}
           if (charCheck(form.t_password.value)===false) {form.t_password.focus(); return false;}


          return true ;
       }
      }
    }