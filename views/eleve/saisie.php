<div id="entete">
    <div class="logo">
        <img src="<?php echo SITE_ROOT . "public/img/saisieeleve.png"; ?>" />
    </div>
</div>
<script>
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
            requiredFields([$("input[name=nom]"), $("input[name=portable]")]);
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
</script>
<div id="tesst"></div>
<div class="titre">
    Ajout d'un nouvel &eacute;l&egrave;ve
</div>

<div class="page" style="">
    <div class="tabs" style="width: 100%">
        <ul>
            <li id="tab1" class="courant">
                <a onclick="onglets(1, 1, 3);">
                    <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                    Informations administratives
                </a>
            </li>
            <li id="tab2" class="noncourant">
                <a onclick="onglets(1, 2, 3);">
                    <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/responsable.png"; ?>" />
                    Responsables
                </a>
            </li>
            <li id="tab3" class="noncourant">
                <a onclick="onglets(1, 3, 3);">
                    <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/photo.png"; ?>" />
                    Ajout d'une photo d'identit&eacute;
                </a>
            </li>
        </ul>
    </div>
    <div id="onglet1" class="onglet" style="display: block; height: 470px;">
        <form action="<?php echo url('eleve', 'saisie'); ?>" name = 'frmeleve' method="post" enctype="multipart/form-data">
            <fieldset style="clear: both; width: 800px"><legend>Identité</legend>
                <span class="text" style="width: 250px">
                    <label>Nom</label>
                    <input type="text" name="nomel" maxlength="30" />
                </span>
                <span class="text" style="width: 228px">
                    <label>Prénom</label>
                    <input type="text" name="prenomel" maxlength="30" />
                </span>
                <span class="text" style="width: 228px">
                    <label>Autre Nom</label>
                    <input type="text" name="autrenom" maxlength="30" />
                </span>
                <span class="select" style="width: 255px;margin-right: 10px; clear: both;">
                    <label>Sexe</label>
                    <select name="sexe">
                        <option value="M">Masculin</option>
                        <option value="F">Féminin</option>
                    </select>
                </span>
                <span class="select" style="width: 234px;">
                    <label>Pays de nationalité</label>
                    <?php echo $nationalite; ?> 
                </span>
            </fieldset>
            <div style="height: 40px; clear: both; content: ' ';"></div>
            <fieldset style="clear: both; width: 350px">
                <legend>Date et lieu de naissance</legend>
                <span class="text" style="width: 140px">
                    <label>Date de Naissance</label>
                    <div id="datenaiss" style="margin-top: 10px;"></div>

                </span>
                <span class="select" style="width: 180px">`
                    <label>Pays de Naiss.</label>
                    <?php echo $paysnaiss; ?>
                </span>
                <span class="text" style="width: 328px">
                    <label>Lieu de Naissance</label>
                    <input type="text" name="lieunaiss" maxlength="30" />
                </span>
            </fieldset>
            <fieldset style="width: 419px; margin-left: 10px">
                <legend>Informations internes</legend>
                <span class="text" style="width: 130px">
                    <label>CNI</label>
                    <input type="text" name="cni" />
                </span>
                <span class="text" style="width: 250px;" >
                    <label>Identifiant dans l'Etabl.</label>
                    <input type="text" name="identifiant" value="" disabled="disabled" />
                </span>
                <span class="text" style="width: 125px;margin-right: 20px;">
                    <label>Date entrée : </label>
                    <div id="dateentree" style="margin-top: 10px;"></div>
                    <input type="hidden" name="dateentree" maxlength="30" />
                </span>
                <span class="select" style="width: 257px">
                    <label>Provenance :</label>
                    <?php echo $provenance; ?>
                </span>
                <span class="select" style="width: 130px">
                    <label>Redoublant</label>
                    <select name="redoublant">
                        <option value="0">Non</option>
                        <option value="1">Oui</option>
                    </select>
                </span>
                <span class="text" style="width: 250px">
                    <label>Classe</label>
                    <input type="text" name="classe" disabled="disabled" value="R.A.S" />
                </span>
                <span class="text" style="width: 125px;margin-right: 20px;">
                    <label>Date de sortie : </label>
                    <div id="date" style="margin-top: 10px;"></div>
                    <input type="hidden" name="datesortie" maxlength="30" />
                </span>
                <span class="text" style="width: 250px">
                    <label>Motif de sortie : </label>
                    <input type="text" name="motifsortie" disabled="disabled" value="R.A.S" />
                </span>
            </fieldset>
        </form>
    </div>
    <div id="onglet2" class="onglet" style="display: none; height: 470px;">

        <fieldset style = 'height:446px;width: 300px;'><legend>Responsables</legend>

            <p style="margin: 0; text-align: right">
                <img src="<?php echo SITE_ROOT . "public/img/btn_add.png" ?>" onclick="" />
            </p>

            <table class="dataTable" id="responsabletable">
                <thead><tr><th>Nom</th><th>Pr&eacute;nom</th><th></th></thead>

                </thead>
                <tbody id="responsablebody">

                </tbody>
            </table>


        </fieldset>
        <form name="formresponsable"  action='' method="post" enctype="multipart/form-data">
            <fieldset style="width: 480px; height: 446px;"><legend>Informations li&eacute;es au responsable</legend>
                <span class="select" style="width: 50px">
                    <label>Civilit&eacute;</label>
                    <?php echo $civilite; ?>
                </span>
                <span class="text" style="width: 170px">
                    <label>Nom</label>
                    <input type="text" name="nom" />
                </span>
                <span class="text" style="width: 200px">
                    <label>Pr&eacute;nom</label>
                    <input type="text" name="prenom" />
                </span>
                <span class="select" style="width: 120px; clear: both">
                    <label>Parent&eacute;</label>
                    <?php echo $parente; ?>
                </span>
                <span class="text" style="width: 315px" >
                    <label>Profession</label>
                    <input type="text" name="profession" />
                </span>
                <div style="height: 10px; clear: both; content: ' ';"></div>
                <?php
                foreach ($charges as $charge) {
                    echo "<span style = 'margin-right:15px'>"
                    . "<input type ='checkbox' value = \"" . $charge['IDCHARGE'] . "\" name = 'charge' />";
                    echo "<label style = 'font-weight:bold;'>" . $charge['LIBELLE'] . "</label></span>";
                }
                ?>
                <span class="text" style="width: 140px">
                    <label>Portable</label>
                    <input type="text" name="portable" />
                </span>
                <span class="text" style="width: 140px">
                    <label>T&eacute;l&eacute;phone</label>
                    <input type="text" name="telephone" />
                </span>
                <span class="text" style="width: 140px">
                    <label>E-mail</label>
                    <input type="text" name="email" />
                </span>
                <span  style="width: 200px; display: block; float: left; position: relative; top: 20px;">
                    <input type="checkbox" name="acceptesms" checked ='checked' />
                    Accepte l'envoi de SMS

                </span>
                <span class="text" style="width: 140px;" >
                    <label>N° envoi de SMS</label>
                    <input type="text" name="numsms" maxlength="20"/>
                </span>

                <fieldset style="width: 440px;"><legend>Coordonn&eacute;es</legend>

                    <span class="text" style="width: 418px;">
                        <label>Adresse</label>
                        <input type="text" name="adresse1" placeholder = 'Adresse'/>
                    </span>
                    <span class="text" style="width: 418px;margin-top:-10px;" placeholder = 'Adresse'>
                        <input type="text" name="adresse2" placeholder = 'Adresse'/>
                    </span>
                    <span class="text" style="width: 418px; margin-top:-10px;">
                        <input type="text" name="adresse3" placeholder = 'Adresse' />
                    </span>
                    <span class="text" style="width: 418px;">
                        <label>Boite Postale</label>
                        <input type="text" name="bp" />
                    </span>

                </fieldset>
                <div  style="position: relative; top: 10px; margin-right: 10px; clear: both;" class="navigation">
                    <?php echo btn_ok("saveResponsable()"); ?>
                    <?php echo btn_cancel("resetResponsable();") ?>
                </div>
            </fieldset>
        </form>

        </fieldset>
    </div>
    <div id="onglet3" class="onglet" style=" display: none; height: 470px; ">
        <form action="<?php echo Router::url("eleve", "photo", "upload"); ?>"  enctype="multipart/form-data" id="frmphoto">
            <fieldset style = 'width: 400px; height: 270px;'><legend>Photo d'identit&eacute;</legend>
                <p>Vous pouvez si vous le souhaitez, ajouter une photo d'identit&eacute; sur 
                    la fiche de l'&eacute;l&egrave;ve.
                </p>
                <p>Cette photo est visible sur les &eacute;cran uniquement pour le personnel 
                    de l'&eacute;tablissement et permet l'impression
                </p>
                <p>Vous devez utilisez imp&eacute;rativement un format de photo d'identit&eacute; 
                    r&eacute;glementaire de 200x200 px sous peine d'obtenir une photo d&eacute;form&eacute;e.
                </p>
                <p>
                    Les formats gif, jpg, jpeg et png sont accept&eacute;s.
                </p>
                <input type="file" name="photo" maxlength="30" required="" style="margin: 0; padding: 0" />
                <div  style="position: relative; top: 10px; margin-right: 10px; clear: both;" class="navigation">
                    <div id="btn_photo_action"><?php echo btn_add("savePhotoEleve()"); ?>
                        <?php echo btn_effacer_disabled(""); ?>
                    </div>

                </div>
                <input type="hidden" name="urleffacer" value="<?php echo Router::url("eleve", "photo"); ?>" />
                <input type="hidden" name="hiddenphoto" />
            </fieldset>

            <div id="photoeleve" style="border: 1px solid #000; float: left;  position: relative;width: 200px; height: 200px;margin: 8px 20px;">

            </div>
        </form>
    </div>
</div>
<div class="recapitulatif">
    <div class="errors">
        <?php
        if ($errors)
            echo $message;
        ?>
    </div>
</div>
<div class="navigation">
    <?php echo btn_ok("soumettreFormEleve();"); ?>
</div>

<div class="status"></div>
