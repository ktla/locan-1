/*// Using validation to check for the presence of an input
 $("#form").submit(function (event) {
 // If .required's value's length is zero
 if ($(".required").val().length === 0) {
 // Usually show some kind of error message here
 // Prevent the form from submitting
 event.preventDefault();
 } else {
 // Run $.ajax() here
 }
 });
 // Setting up a loading indicator using Ajax Events
 $( "#loading_indicator" )
 .ajaxStart(function() {
 $( this ).show();
 })
 .ajaxStop(function() {
 $( this ).hide();
 });
 
 $("button").click(function(){
 $.ajax({url: "demo_test.txt", success: function(result){
 $("#div1").html(result);
 ,
 error: function (xhr, status, error) {
 alert("Erreur de type : " + error);
 }
 }});
 $.ajax({
 url: 'ajax/personnel',
 type: "GET",
 data: $("function").val(),
 success: function (data) {
 $("#personnel")
 },
 error: function(xml, status, error){
 alert("Erreur de type : " + error);
 }*/


$(document).ready(function () {
    // Global ajax cursor change
    $(document).ajaxStart(function () {
        $("#loading").show();
    }).ajaxStop(function () {
        $("#loading").hide();
    });

});