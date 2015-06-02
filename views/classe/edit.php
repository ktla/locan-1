<div id="entete"></div>
<div class="titre">Modification de la classe</div>
<form action="<?php echo Router::url('classe', 'saisie'); ?>" method="post" enctype="multipart/form-data">
    <div class="page">
        <fieldset style="margin-bottom: 20px;"><legend>Saisie de la classe</legend>
            <span class="select" style="width: 150px;"><label>Nom abr&eacute;g&eacute;</label>
                <?php echo $comboNiveau ?></span>
            <span class="text" style="width: 360px;"><label>Libell&eacute;</label><input type="text" name="libelle" value="<?php echo $libelle; ?>"/></span>
            <span class="select" style="width: 150px;">    
                <label>D&eacute;coupage</label>
                <select name="decoupage">
                    <option value="1" <?php if ($decoupage == 1) echo "selected"; ?>>S&eacute;quence</option>
                    <option value="2" <?php if ($decoupage == 2) echo "selected"; ?>>Trimestre</option>
                    <option value ="3" <?php if ($decoupage == 3) echo "selected"; ?>>Semestre</option>
                </select>
            </span>
            <input type="hidden" name="idclasse" value="<?php echo $idclasse ?>" />
        </fieldset>
        <div class="tabs" style="width: 100%">
            <ul>
                <li id="tab1" class="courant">
                    <a onclick="onglets(1, 1, 2);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        El&egrave;ves
                    </a>
                </li>
                <li id="tab2" class="noncourant">
                    <a onclick="onglets(1, 2, 2);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Mati&egrave;res
                    </a>
                </li>
            </ul>
        </div>
        <div id="onglet1" class="onglet" style="display: block;">
            <fieldset style="width: 45%; height: 415px;"><legend>Elèves</legend>
                <?php //echo $comboEleves; ?>
                <img id="ajout_eleve" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
                <div id="dialog-1" class="dialog" title="Selectionner un Eleve">
                    <span>
                        <label>Choisir Un Eleve</label>
                        <?php echo $comboElevesNonInscrits; ?>
                    </span>
                </div>
                <table class="dataTable" id="tab_elv">
                    <thead><tr><th>Matricule</th><th>Nom et Pr&eacute;nom</th><th></th></tr></thead>
                    <tbody>      <?php
                        foreach ($elevesInscrits as $eleve) {
                            echo "<tr><td>" . $eleve['MATRICULE'] . "</td><td>" . $eleve['CNOM'] . "</td>"
                            . "   <td align = 'center'><img style = 'cursor:pointer' src = '" . SITE_ROOT . "public/img/delete.png'"
                            . " onclick = \"desinscrire('" . $eleve['IDINSCRIPTION'] . "');\"  /></td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </fieldset>

            <fieldset style="width: 45%; height: 128px; margin-left: 10px; "><legend>Prof. Principal</legend>
                <img id="ajout_pp" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
                <div id="dialog-2" class="dialog" title="Selectionner un Enseignant">
                    <span>
                        <label>Choisir Un Enseignant</label>
                        <?php echo $comboEnseignants; ?>
                    </span>
                </div>
                <table class="dataTable" id="tab_pp">
                    <thead><tr><th>Matricule</th><th>Nom et Pr&eacute;nom</th><th></th></tr></thead>
                    <tbody><?php
                        if (isset($prof)) {
                            echo "<tr><td>" . $prof['MATRICULE'] . "</td><td>" . $prof['CNOM'] . "</td>" .
                            " <td align = 'center'><img style = 'cursor:pointer' src = '" . SITE_ROOT . "public/img/delete.png'"
                            . " onclick = \"deletePrincipale(1);\"  /></td></tr>";
                        }
                        ?></tbody>
                </table>
            </fieldset>
            <fieldset style="width: 45%; height: 128px;  margin-left: 10px;"><legend>Cpe. Principal</legend>
                <img id="ajout_cpe" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
                <div id="dialog-3" class="dialog" title="Selectionner un Parent Principal">
                    <span>
                        <label>Choisir Un Parent</label>
                        <?php echo $comboResponsables; ?>
                    </span>
                </div>
                <table class="dataTable" id="tab_cpe">
                    <thead><tr><th>Matricule</th><th>Nom et Pr&eacute;nom</th><th></th></tr></thead>
                    <tbody>
                        <?php
                        if (isset($cpe)) {
                            echo "<tr><td>" . $cpe['CIVILITE'] . "</td><td>" . $cpe['NOM'] . " " . $cpe['PRENOM'] . "</td>" .
                            "<td align = 'center'><img style = 'cursor:pointer' src = '" . SITE_ROOT . "public/img/delete.png'"
                            . " onclick = \"deletePrincipale(2);\"  /></td></tr>";
                        }
                        ?>

                    </tbody>
                </table>

            </fieldset>
            <fieldset style="width: 45%; height: 128px; margin-left: 10px;"><legend>Responsable Administratif</legend>
                <img id="ajout_ra" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
                <div id="dialog-4" class="dialog" title="Selectionner Un Resp. Administratif">
                    <span>
                        <label>Choisir Un Resp. Administratif</label>
                        <?php echo $comboResponsables; ?>
                    </span>
                </div>
                <table class="dataTable" id="tab_ra">
                    <thead><tr><th>Matricule</th><th>Nom et Pr&eacute;nom</th><th></th></tr></thead>
                    <tbody><?php
                        if (isset($admin)) {
                            echo "<tr><td>" . $admin['MATRICULE'] . "</td><td>" . $admin['NOM'] . " " . $admin['PRENOM'] . "</td>" .
                            "<td align = 'center'><img style = 'cursor:pointer' src = '" . SITE_ROOT . "public/img/delete.png'"
                            . " onclick = \"deletePrincipale(3);\"  /></td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </fieldset>
        </div>
        <div id="onglet2" class="onglet" style="display: none; height: 75%">
            <img id="ajout_mat" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
            <div id="dialog-5" class="dialog" title="Ajout d&apos;une Mati&egrave;re">
                <span>
                    <label>Mati&egrave;re</label>
                    <?php echo $comboMatieres; ?>
                </span>
                <span>
                    <label>Enseignant</label>
                    <?php echo $comboEnseignants; ?>
                </span>
                <span>
                    <label>Groupe</label>
                    <select>
                        <option></option>
                        <option> Groupe 1 </option>
                        <option> Groupe 2 </option>
                        <option> Groupe 3 </option>
                    </select>
                </span>
                <span>
                    <label>Coeff.</label>
                    <input id="spinner" name="spin" size ="5" value="2"/>
                </span>
            </div>

            <table class="dataTable" id="tab_mat">
                <thead><tr><th>Matière</th><th>Enseignants</th><th>Coefficient</th><th></th></tr></thead>
                <tbody><?php
                    if (isset($enseignements)) {
                        foreach ($enseignements as $ens) {
                            echo "<tr><td>" . $ens['CODE'] . " - " . $ens['MATIERELIBELLE'] . "</td><td>" . $ens['NOM'] . " " . $ens['PRENOM'] . "</td>"
                            . "<td>" . $ens['COEFF'] . "</td><td align = 'center'><img style = 'cursor:pointer' src = '" . SITE_ROOT . "public/img/delete.png'"
                            . " onclick = \"deleteEnseignement('" . $ens['IDENSEIGNEMENT'] . "');\"  /></td></tr>";
                        }
                    }
                    ?></tbody>
            </table>
        </div>
    </div>
    <div class="recapitulatif">
        <?php
        if ($errors) {
            echo $message;
        }
        ?>
    </div>
    <div class="navigation">
        <img  src="<?php echo SITE_ROOT . "public/img/btn_ok.png" ?> " onclick="document.forms[0].submit();" />
        <img  src="<?php echo SITE_ROOT . "public/img/btn_cancel.png" ?> " 
              onclick="document.location = '<?php echo Router::url("classe", "saisie"); ?>'" />
    </div>
</form>
<div class="status"></div>

