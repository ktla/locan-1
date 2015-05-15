//$('div.dataTables_scrollBody').height( 100 );
$(document).ready(function () {
    $('#dataTable, #dataTable2').DataTable({
        "aaSorting": [],
        "scrollCollapse": true,
        "scrollY": 470,
        "pageLength": 200,
        "language": {
            "sProcessing": "Traitement en cours...",
            "sSearch": "Rechercher&nbsp;:",
            "sLengthMenu": "Afficher _MENU_ &eacute;l&eacute;ments",
            "sInfo": "Affichage de l'&eacute;lement _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
            "sInfoEmpty": "Affichage de l'&eacute;lement 0 &agrave; 0 sur 0 &eacute;l&eacute;ments",
            "sInfoFiltered": "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
            "sInfoPostFix": "",
            "sLoadingRecords": "Chargement en cours...",
            "sZeroRecords": "Aucun &eacute;l&eacute;ment &agrave; afficher",
            "sEmptyTable": "Aucune donn&eacute;e disponible dans le tableau",
            "oPaginate": {
                "sFirst": "Premier",
                "sPrevious": "Pr&eacute;c&eacute;dent",
                "sNext": "Suivant",
                "sLast": "Dernier"
            },
            "oAria": {
                "sSortAscending": ": activer pour trier la colonne par ordre croissant",
                "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
            }
        }
    });
});



function deleteRow(_url, name) {
    webix.modalbox({
        title: "Suppression d'une ligne",
        buttons: ["Oui", "Non"],
        width: "300px",
        text: "Etes-vous certain de vouloir supprimer " + name,
        callback: function (result) {
            if (result == 0) {
                document.location = _url;
            }
        }
    });
}

function editRow(_url){
    document.location = _url;
}
/*
 * Fonction permettant d'afficher et cacher le menu.
 *
 */
$(document).ready(function () {
    (function () {
        var p_el, i = 0;
        p_el = document.querySelectorAll("#menu-accordeon li > p");
        for (; i < p_el.length; i++) {
            p_el.item(i).addEventListener('click', function (e) {
                var p, lis;
                p = e.target.parentNode;
                lis = p.nextSibling.childNodes;
                if (getComputedStyle(lis[0], false).maxHeight === '240px') {
                    for (var j = 0; j < lis.length; j++)
                        lis[j].style.maxHeight = '0px';
                    p.style.backgroundImage = "-webkit-linear-gradient(top, #729EBF 50%, #333A40 100%)";
                    p.style.backgroundImage = "-o-linear-gradient(bottom, #729EBF 50%, #333A40 100%)";
                    p.style.backgroundImage = "-moz-linear-gradient(bottom, #729EBF 50%, #333A40 100%)";
                    p.style.backgroundImage = "linear-gradient(bottom, #729EBF 50%, #333A40 100%)";


                } else {

                    for (var j = 0; j < lis.length; j++)
                        lis[j].style.maxHeight = '240px';
                    p.style.backgroundImage = "-webkit-linear-gradient(left, white 30%, #729EBF 100%)";
                    p.style.backgroundImage = "-o-linear-gradient(left, white 30%, #729EBF 100%)";
                    p.style.backgroundImage = "-moz-linear-gradient(left, white 30%, #729EBF 100%)";
                    p.style.backgroundImage = "linear-gradient(left, white 30%, #729EBF 100%)";

                }
            }, false);

        }
    })();
    //Ajouter le scrolling en fonction de hauteur de la page visible
    //var headerHeight = $("#page-header").css("height");
    //headerHeight = headerHeight.substring(0, headerHeight.indexOf("p"));
    var max = $(window).height() - 154;
    $("#menu").css({maxHeight: max});
    var h = $("#entete").height() + $(".navigation").height() + $(".recapitulatif").height()
            + $(".status").height() + $(".titre").height();
    $(".page").css({height: $(window).height() - h - 97});
    //$("#entete").css({height: 154});
    //$("#page-content").css({maxHeight: window.innerHeight - 10});
});

function onglets(premier, actuel, nombre) {
    for (i = premier; i < nombre + 1; i++) {
        if (i == actuel) {
            document.getElementById('tab' + i).className = 'courant';
            document.getElementById('onglet' + i).style.display = 'block';
        } else {
            document.getElementById('tab' + i).className = 'noncourant';
            document.getElementById('onglet' + i).style.display = 'none';
        }
    }
}


