var calendrier;
$(document).ready(function () {
    calendrier = getCalendar("date");
});

function submitForm() {
    if ($("input[name=nom]").val() === "" || $("input[name=portable]").val() === "") {
        alertWebix("Veuillez remplir les champs obligatoires");
        addRequiredFields([$("input[name=nom]"), $("input[name=portable]"), $("select[name=function]")]);
        return;
    }
    date = calendrier.getValue(), dates = date.split(' ');
    document.getElementById("datenaiss").value = dates[0];
    document.forms[0].submit();
}

function showPersonnelByFunction() {
    $.ajax({
        url: "./personnel/ajax",
        type: 'POST',
        enctype: 'multipart/form-data',
        dataType: "json",
        data: {
            "fonction": $("select[name=fonction]").val()
        },
        success: function (result) {
            $(".page").html(result[0]);
            $(".recapitulatif").html(result[1]);
        },
        error: function (xhr, status, error) {
            alert("Veuillez vous reconnecté en rafraichissant la page \n" + error);
        }
    });
}