$(document).ready(function () {
    $('#tab_elv, #tab_mat').DataTable({
        "paging": false,
        "bInfo": false
    });
    $('#tab_pp, #tab_ra, #tab_cpe').DataTable({
        "paging": false,
        "bInfo": false,
        "searching": false
    });

    var pop1 = popup("#dialog-form", ajoutEleve);
    var pop2 = popup("#dialog-pp-form", ajoutEleve);
    var pop3 = popup("#dialog-cpe-form", ajoutEleve);
    var pop4 = popup("#dialog-ra-form", ajoutEleve);
    var pop5 = popup("#dialog-mat-form", ajoutEleve);
    pop5.dialog("option", "height", 250);

    $("#ajout_eleve").button().on("click", function () {
        pop1.dialog("open");
    });
    $("#ajout_responsable").button().on("click", function () {
        pop1.dialog("open");
    });
    $("#ajout_pp").button().on("click", function () {
        pop2.dialog("open");
    });
    $("#ajout_cpe").button().on("click", function () {
        pop3.dialog("open");
    });
    $("#ajout_ra").button().on("click", function () {
        pop4.dialog("open");
    });

    $("#ajout_mat").button().on("click", function () {
        pop5.dialog("open");
    });
});
function popup(id, func) {
    var dial = $(id).dialog({
        autoOpen: false,
        height: 160,
        width: 350,
        modal: true,
        resizable: false,
        buttons: {
            "Ajouter": func,
            Annuler: function () {
                dial.dialog("close");
            }
        }
    });
    return dial;
}

/*
 * Ajout eleve - Classe fenetre popup
 */
var ajoutEleve = function () {
    alert("test");
};