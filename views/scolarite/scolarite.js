var echeances;

$(document).ready(function(){
    $("#dataTable").DataTable({
        "bInfo": false,
        "scrollY": 200
    });
    
    $("#comboClasses").change(function(){
       loadScolarite();
    });
    //Popup form
    $("#scolarite-dialog-form").dialog({
        autoOpen: false,
        height: 250,
        width: 350,
        modal: true,
        resizable: false,
        buttons: {
            "Ajouter": function () {
                ajoutScolarite();
                $(this).dialog("close");
            },
            Annuler: function () {
                $(this).dialog("close");
            }
        }
    });
    echeances = getCalendar("echeances");
    
    //Bouton pour le popup
    $("#img-ajout").on("click",function(){ 
        $("#scolarite-dialog-form").dialog("open");
    });
    
    $("#scolariteTable").DataTable({
        "bInfo": false,
        "scrollY": 200,
        "searching": false,
        "paging": false,
        "columns":[
            {"width": "55%"},
            {"width": "20%"},
            {"width": "20%"},
            {"width": "5%"}
        ]
    });
});

function ajoutScolarite(){
    removeRequiredFields([$("#comboClasses")]);
    if($("#comboClasses").val() === 0 || $("#comboClasses").val() === ""){
        alertWebix("Veuillez choisir d'abord une classe");
        addRequiredFields([$("#comboClasses")]);
        return;
    }
    var d = echeances.getValue();
    $("input[name=echeances]").val(d.split(' ')[0]);
    $.ajax({
       url : "./ajax/ajouter",
       type : "POST",
       dataType : "json",
       data:{
           "idclasse" : $("#comboClasses").val(),
           "libelle" : $("input[name=libelle]").val(),
           "montant": $("input[name=montant]").val(),
           "echeances": $("input[name=echeances]").val(),
       },
       success: function(result){
           $("#scolarite-content").html(result[0]);
       },
       error: function(xhr, status, error){
           alert("Une erreur s'est produite " + xhr + " " + error);
       }
    });
}
function supprimerScolarite(_id){
    $.ajax({
       url : "./ajax/supprimer",
       type : "POST",
       dataType : "json",
       data:{
           "idscolarite" : _id,
           "idclasse" : $("#comboClasses").val()
       },
       success: function(result){
           $("#scolarite-content").html(result[0]);
       },
       error: function(xhr, status, error){
           alert("Une erreur s'est produite " + xhr + " " + error);
       }
    });
}

/**
 * Charge la liste de scolarite pour une classe donnne dans la datatable
 * @returns {undefined}
 */
function loadScolarite(){
    $.ajax({
       url : "./ajax/load",
       type : "POST",
       dataType : "json",
       data:{
           "idclasse" : $("#comboClasses").val()
       },
       success: function(result){
           $("#scolarite-content").html(result[0]);
       },
       error: function(xhr, status, error){
           alert("Une erreur s'est produite " + xhr + " " + error);
       }
    });
}