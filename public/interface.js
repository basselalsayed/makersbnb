$(document).ready(function() {
  $("#menu").click('#signup', function() {
   $(".signup_form").toggle();
   
  });
  $("#menu").click('#login', function() {
    $(".login_form").toggle();
    
   });
 
  $('.lightbox_trigger').click(function(e) {
		e.preventDefault();
		var image_href = $(this).attr("href");
		if ($('#lightbox').length > 0) { 
			$('#content').html('<img src="' + image_href + '" />');
      $('#lightbox').show();

		}
		else { 
			var lightbox = 
			'<div id="lightbox">' +
				'<p>Click to close</p>' +
				'<div id="content">' +
					'<img src="' + image_href +'" />' +
				'</div>' +	
			'</div>';
      $('body').append(lightbox);

		}
		
	});
	$('body').on('click', '#lightbox', function(){ //must use live, as the lightbox element is inserted into the DOM
		$('#lightbox').hide();
	});

});
// $(document).ready(function() {
//   $("#signUpButton").click(function() {
//    $("#signUpForm").toggle();
//   });

  $(document).ready(function() {
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
     }
 
 // Check for empty fields
 if (is_empty (form.t_email.value,"your email address")) { form.t_email.focus();  return false;}
 if (is_empty (form.t_password.value,"your password")) { form.t_password.focus();  return false;}

 //check for unexpected chars
 if (charCheck(form.t_email.value)===false) {form.t_email.focus(); return false;}
 if (charCheck(form.t_password.value)===false) {form.t_password.focus(); return false;}


        return true ;
}
 }
