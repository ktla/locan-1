<div id="entete">
    <div class="logo">
        <img src="<?php echo SITE_ROOT . "public/img/saisieeleve.png"; ?>" />
    </div>
</div>
<div class="titre">
    Ajout d'un nouvel &eacute;l&egrave;ve
</div>
<form action="<?php echo url('eleve', 'saisie'); ?>" method="post" enctype="multipart/form-data">
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
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Responsables
                    </a>
                </li>
                <li id="tab3" class="noncourant">
                    <a onclick="onglets(1, 3, 3);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Ajout d'une photo d'identit&eacute;
                    </a>
                </li>
            </ul>
        </div>
        <div id="onglet1" class="onglet" style="display: block; height: 470px;">
            <fieldset style="clear: both; width: 800px"><legend>Identité</legend>
                <span class="text" style="width: 250px">
                    <label>Nom</label>
                    <input type="text" name="nom" maxlength="30" />
                </span>
                <span class="text" style="width: 228px">
                    <label>Prénom</label>
                    <input type="text" name="prenom" maxlength="30" />
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
                    <input type="date" name="datenaiss" maxlength="30" />
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
                <span class="text" style="width: 200px">
                    <label>CNI</label>
                    <input type="text" name="cni" />
                </span>
                <span class="text" style="width: 200px;" >
                    <label>Identifiant dans l'Etabl.</label>
                    <input type="text" name="identifiant" value="153005" disabled="disabled" />
                </span>
                <span class="text" style="width: 125px;margin-right: 20px;">
                    <label>Date entrée : </label>
                    <input type="date" name="dateentree" maxlength="30" />
                </span>
                <span class="select" style="width: 250px">
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
                <span class="select" style="width: 250px">
                    <label>Classe</label>
                    <?php echo $classes; ?>
                </span>
                <span class="text" style="width: 125px;margin-right: 20px;">
                    <label>Date de sortie : </label>
                    <div id="date" style="margin-top: 10px;"></div>
                    <!-- input type="date" name="datesortie" maxlength="30" / -->
                </span>
                <span class="select" style="width: 250px">
                    <label>Motif de sortie : </label>
                    <?php echo $motifsortie; ?>
                </span>
            </fieldset>
        </div>
        <div id="onglet2" class="onglet" style="display: none; height: 470px;">
            <fieldset style = 'height:446px;width: 300px;'><legend>Responsables</legend>
                
                    <p style="margin-right: 10px;margin-top: 0; text-align: right">
                        <img src="<?php echo SITE_ROOT . "public/img/btn_add.png" ?>" onclick="" />
                    </p>

                    <table class="dataTable" id="responsabletable">
                        <thead><tr><th>Nom</th><th>Pr&eacute;nom</th><th></th></thead>

                        </thead>
                        <tbody>
                            <tr><td>Ainam</td><td>Jean - Paul</td><td>del</td></tr>
                        </tbody>
                    </table>

                
            </fieldset>
            <form name="formresponsable" action="post" >
                <fieldset style="width: 480px;"><legend>Informations li&eacute;es au responsable</legend>
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
                    <div style="height: 15px; clear: both; content: ' ';"></div>
                    <?php
                    foreach ($charges as $charge) {
                        echo "<span style = 'margin-right:15px'>"
                        . "<input type ='checkbox' value = \"" . $charge['IDCHARGE'] . "\" name = 'charge[]' />";
                        echo "<label style = 'font-weight:bold;'>" . $charge['LIBELLE'] . "</label></span>";
                    }
                    ?>
                    <div style="height: 15px; clear: both; content: ' ';"></div>
                    <span class="text" style="width: 140px">
                        <label>T&eacute;l&eacute;phone</label>
                        <input type="text" name="telephone" />
                    </span>
                    <span class="text" style="width: 140px">
                        <label>Portable</label>
                        <input type="text" name="portable" />
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
                        <input type="text" name="numsms" />
                    </span>
                    <div style="height: 30px; clear: both; content: ' ';"></div>
                    <fieldset style="width: 440px;"><legend>Coordonn&eacute;es</legend>
                        
                            <span style="width: 140px;">
                                <label>Adresse</label>
                                <textarea style ='position:relative;' rows ='3' cols ='50' name="adresse1" /></textarea>
                            </span>
                            <span class="text" style="width: 418px;">
                                <label>Code Postal</label>
                                <input type="text" name="cp" />
                            </span>
                        
                    </fieldset>
                </fieldset>
            </form>

            </fieldset>
        </div>
        <div id="onglet3" class="onglet" style=" display: none; height: 470px; ">
            <fieldset style = 'width: 480px;'><legend>Informations responsables</legend>
                <p>Vous pouvez si vous le souhaitez, ajouter une photo d'identit&eacute; sur 
                    la fiche de l'&eacute;l&egrave;ve.
                </p>
                <p>Cette photo est visible sur les &eacute;cran uniquement pour le personnel 
                    de l'&eacute;tablissement et permet l'impression
                </p>
                <p>Vous devez utilisez imp&eacute;rativement un format de photo d'identit&eacute; 
                    r&eacute;glementaire de 35x45 sous peine d'obtenir une photo d&eacute;form&eacute;e.
                </p>
                <p>
                    Les formats gif, jpg, jpeg et png sont accept&eacute;s.
                </p>
                <input type="file" name="photo" maxlength="30" />
            </fieldset>
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
        <?php echo btn_ok("document.forms[0].submit();"); ?>
    </div>
</form>
<div class="status"></div>