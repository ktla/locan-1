$(document).ready(function () {
    $("select[name=listeusers]").change(function () {
        $.ajax({
            url: "./user/ajax",
            dataType: "json",
            type: "POST",
            data: {
                "iduser": $("select[name=listeusers]").val()
            },
            success: function (result) {
                $("#onglet1").html(result[0]);
                $("#onglet2").html(result[1]);
                $("#onglet3").html(result[2]);
                $(".recapitulatif").html(result[3] + " sessions");
            },
            error: function (xhr, status, error) {
                alertWebix("Veuillez rafraichir la page \n" + status + " " + error);
            }

        });
    });

  
});