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

