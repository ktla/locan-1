$(document).ready(function () {
    $('#tab_elv, #tab_mat').DataTable({
        "paging": false,
        "bInfo": false,
        "scrollY": 200,
    });
    $('#tab_pp, #tab_ra, #tab_cpe').DataTable({
        "paging": false,
        "bInfo": false,
        "searching": false
    });

    var pop1 = popup("#dialog-1");
    var pop2 = popup("#dialog-2");
    var pop3 = popup("#dialog-3");
    var pop4 = popup("#dialog-4");
    var pop5 = popup("#dialog-5");
    pop5.dialog("option", "height", 250);

    $("#ajout_eleve").button().on("click", function () {
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
    var spinner = $("#spinner").spinner({
        max: 6,
        min: 1
    });
});

function AddMatiere(mat, ens, grp, cof){
    this.matiere = mat;
    this.enseignant = ens;
    this.groupe = grp;
    this.coef = cof;
}
/**
 * Ajout eleve - classe fenetre popup
 * @param {type} id
 * @returns {undefined}
 */
var ajoutForm = function(id){
   var elems = id.split('-'), elem = parseInt(elems[1]), tmp = [];
    switch(elem){
        case 5:
                tmp = $(id + " span select");
                var mat = new AddMatiere(tmp[0].value, tmp[1].value, tmp[2].value, $(id + " span input").val()); 
                alert(mat.coef);
                break;
        default: alert($(id + " span select").val());
           
    }
};
function popup(_id) {
    var dial = $(_id).dialog({
        autoOpen: false,
        height: 160,
        width: 350,
        modal: true,
        resizable: false,
        buttons: {
            "Ajouter": function(){
                ajoutForm(_id);
                dial.dialog("close");
            },
            Annuler: function () {
                dial.dialog("close");
            }
        }
    });
    return dial;
}
