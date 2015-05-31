var calendrier, caldatenaiss, caldateentree;

$(document).ready(function () {
    
    //appliquer dans le select du fichier index
    
    $("#listeeleve").change(function () {
        $.ajax({
            url: "./eleve/ajax",
            type: 'POST',
            dataType: "json",
            data: {
                "ideleve": $("#listeeleve").val()
            },
            success: function (result) {
                $("#onglet1").html(result[0]);
                $("#onglet2").html(result[1]);
                $("#onglet3").html(result[2]);
                $("#onglet4").html(result[3]);
                $("#onglet5").html(result[4]);
                $("#onglet6").html(result[5]);
            },
            error: function (xhr, status, error) {
                alertWebix("Veuillez rafraichir la page \n" + status + " " + error);
            }
        });
    });

    calendrier = getCalendar("date");
    caldatenaiss = getCalendar("datenaiss");
    caldateentree = getCalendar("dateentree");
    
    $("#ajout-responsable-dialog-form").dialog({
        autoOpen: false,
        height: 250,
        width: 350,
        modal: true,
        resizable: false,
        buttons: {
            "Ajouter": function () {
                alert("cliquer");
            },
            Annuler: function () {
                $(this).dialog("close");
            }
        }
    });
    $("#ajout-responsable").button().on("click", function () {
        $("#ajout-responsable-dialog-form").dialog("open");
    });
});

var resp = [], incr = 0;
function resetResponsable() {
    document.forms['formresponsable'].reset();
}
function saveResponsable() {
    removeRequiredFields([$("input[name=nom]"), $("input[name=portable]")]);
    if ($("input[name=nom]").val() === "" || $("input[name=portable]").val() === "") {
        alertWebix("Veuillez remplir les champs obligatoires");
        addRequiredFields([$("input[name=nom]"), $("input[name=portable]")]);
        return;
    }
    element = {
        "civilite": $("select[name=civilite]").val(),
        "nom": $("input[name=nom]").val(),
        "prenom": $("input[name=prenom]").val(),
        "adresse": $("input[name=adresse1]").val() + "#" + $("input[name=adresse2]").val() + "#" + $("input[name=adresse3]").val(),
        "telephone": $("input[name=telephone]").val(),
        "portable": $("input[name=portable]").val(),
        "email": $("input[name=email]").val(),
        "profession": $("input[name=profession]").val(),
        "parente": $("select[name=parente]").val(),
        "charge": $("input[name=charge]:checked").map(function () {
            return this.value;
        }).get(),
        "acceptesms": $("input[name=acceptesms]:checked").val(),
        "numsms": $("input[name=numsms]").val(),
        "bp": $("input[name=bp]").val()
    };
    resp.push(element);


    cible = $("#responsablebody");

    nom = document.createElement("td");
    nom.appendChild(document.createTextNode($("input[name=nom]").val()));
    prenom = document.createElement("td");
    prenom.appendChild(document.createTextNode($("input[name=prenom]").val()));
    imgsrc = document.createElement("img");
    imgsrc.setAttribute("src", "../public/img/delete.png");

    imgsrc.setAttribute("onclick", "supprimerLigneResp(" + incr + ");");
    action = document.createElement("td");
    action.appendChild(imgsrc);

    tr = document.createElement("tr");
    tr.appendChild(nom);
    tr.appendChild(prenom);
    tr.appendChild(action);
    cible.append(tr);
    incr++;
    resetResponsable();
    console.log(JSON.stringify(resp));
}
//Soumet effectivement le formulaire des eleves au server
function soumettreFormEleve() {
    removeRequiredFields([$("input[name=nomel]"), $("#datenaiss")]);
    frm = $("form[name=frmeleve]");
    d = caldatenaiss.getValue();
    dNaiss = $("<input type='hidden' name='datenaiss'/>");
    dNaiss.val(d.split(' ')[0]);
    d = caldateentree.getValue();
    dEntree = $("<input type = 'hidden' name = 'dateentree' />");
    dEntree.val(d.split(' ')[0]);

    if ($("input[name=nomel]").val() === "" || dNaiss.val() === "") {
        alertWebix("Veuillez remplir les champs obligatoires");
        addRequiredFields([$("input[name=nomel]"), $("#datenaiss")]);
        onglets(1, 1, 3);
        return;
    }
    if (resp.length === 0) {
        alertWebix("Définir au moins les informations d'un responsable");
        addRequiredFields([$("input[name=nom]"), $("input[name=portable]")]);
        onglets(1, 2, 3);
        return;
    }
    //add the responsable data
    var hidden = $("<input type='hidden' name='responsables'/>");
    hidden.val(JSON.stringify(resp));
    frm.append(hidden);
    //add the date from webix datepicker


    frm.append(dEntree);
    frm.append(dNaiss);
    frm.append($("input[name=hiddenphoto]"));
    frm.submit();
}
function savePhotoEleve() {
    if ($("input[name=photo]").val() === "") {
        alertWebix("Veuillez sélectionner le fichier image");
        return;
    }
    frmphoto = $("#frmphoto");
    var formData = new FormData(document.getElementById("frmphoto"));

    $.ajax({
        url: frmphoto.attr("action"),
        type: 'POST',
        enctype: 'multipart/form-data',
        dataType: "json",
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        success: function (result) {
            $("#btn_photo_action").html(result[0]);
            //cadre pour l'affichage de l'image uploader
            $("#photoeleve").html("<img style = 'width:200px;height:200px;' src ='" + result[1] + "' />");
            $(".errors").html(result[2]);
            //hidden photo contient le nom de la photo a sauvegarder et envoyer plutart au server
            $("input[name=hiddenphoto]").val(result[3]);
            //le input type file
            $("input[name=photo]").val("");
        },
        error: function (xhr, status, error) {
            alert("Veuillez vous reconnecté en rafraichissant la page");
        }
    });
}
function effacerPhotoEleve() {
    $.ajax({
        url: $("input[name=urleffacer]").val() + "/" + $("input[name=hiddenphoto]").val(),
        type: 'POST',
        dataType: "json",
        data: $("#hiddenphoto").val(),
        success: function (result) {
            $("#btn_photo_action").html(result[0]);
            $("#photoeleve").html(result[1]);
            $(".errors").html(result[2]);
            $("input[name=hiddenphoto]").val(result[3]);
            $("input[name=photo]").val("");
        },
        error: function (xhr, status, error) {
            alert(error + " " + xhr + " " + status);
        }
    });
}
//supprime une ligne de la table et de la variable JSON
function supprimerLigneResp(indice) {
    //Supprimer l'element a l'index indice
    alert(indice);
}