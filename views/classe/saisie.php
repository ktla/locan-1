<div id="entete">
    <div class="logo"><img src="<?php echo SITE_ROOT . "public/img/wide_classe.png"; ?>" /></div>
</div>
<div class="titre">Saisie des classes</div>

<form action="<?php echo url('classe', 'saisie'); ?>" method="post" enctype="multipart/form-data">
    <div class="page" style="">
        <fieldset style="margin:auto; width: 710px;margin-bottom: 10px;float: none;"><legend>Saisie de la classe</legend>
            <span class="text" style="width: 150px;"><label>Nom abrégé</label><input type="text" name="nom" /></span>
            <span class="text" style="width: 360px;"><label>Libellé</label><input type="text" name="libelle" /></span>
            <span class="select" style="width: 150px;">    
                <label>Découpage</label>
                <select name="decoupage">
                    <option value="1">Trimestre</option>
                    <option value ="2">Semestre</option>
                </select>
            </span>
        </fieldset>


        <div class="tabs" style="width: 100%">
            <ul>
                <li id="tab1" class="courant">
                    <a onclick="onglets(1, 1, 2);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Elèves
                    </a>
                </li>
                <li id="tab2" class="noncourant">
                    <a onclick="onglets(1, 2, 2);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Matières
                    </a>
                </li>
            </ul>
        </div>

        <div id="onglet1" class="onglet" style="display: block;">
            <fieldset style="width: 45%; height: 415px;"><legend>Elèves</legend>
                <?php //echo $comboEleves; ?>
                <img id="ajout_eleve" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
                <?php
                //la variable $eleves contient la liste des eleves de la BD
                //Tu peux en faire ce que tu veux, si tu veux dialog = $("#dialog-form").dialog({
                //var_dump($eleves); 
                ?>
                <div id="dialog-1" title="Selectionner un Eleve">
                    <form class="form"> 
                        <span>
                            <label>Choisir Un Eleve</label>
                            <?php echo $comboEleves; ?>
                        </span>
                    </form>    
                </div>

                <table class="dataTable" id="tab_elv">
                    <thead><tr><th>Matricule</th><th>Nom et Pr&eacute;nom</th></tr></thead>
                    <tbody>

                    </tbody>
                </table>
            </fieldset>

            <fieldset style="width: 45%; height: 128px; margin-left: 10px; "><legend>Prof. Principal</legend>
                <img id="ajout_pp" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
                <div id="dialog-2" title="Selectionner un Enseignant">
                    <form class="form">
                        <span>
                            <label>Choisir Un Enseignant</label>
                            <?php echo $comboEnseignants; ?>
                        </span>
                    </form>    
                </div>

                <table class="dataTable" id="tab_pp">
                    <thead><tr><th>Matricule</th><th>Nom et Pr&eacute;nom</th></tr></thead>
                    <tbody>

                    </tbody>
                </table>
            </fieldset>
            <fieldset style="width: 45%; height: 128px;  margin-left: 10px;"><legend>Cpe. Principal</legend>
                <img id="ajout_cpe" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
                <div id="dialog-3" title="Selectionner un Parent Principal">
                    <form class="form" style="width: 182px;">
                        <span>
                            <label>Choisir Un Parent</label>
                            <?php echo $comboEleves; ?>
                        </span>
                    </form>    
                </div>

                <table class="dataTable" id="tab_cpe">
                    <thead><tr><th>Matricule</th><th>Nom et Pr&eacute;nom</th></tr></thead>
                    <tbody>

                    </tbody>
                </table>

            </fieldset>
            <fieldset style="width: 45%; height: 128px; margin-left: 10px;"><legend>Responsable Administratif</legend>

                <img id="ajout_ra" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
                <div id="dialog-4" title="Selectionner Un Resp. Administratif">
                    <form class="form">
                        <span style="width: 182px;">
                            <label>Choisir Un Resp. Administratif</label>
                            <?php echo $comboEleves; ?>
                        </span>
                    </form>    
                </div>

                <table class="dataTable" id="tab_ra">
                    <thead><tr><th>Matricule</th><th>Nom et Pr&eacute;nom</th></tr></thead>
                    <tbody>

                    </tbody>
                </table>
            </fieldset>

        </div>
        <div id="onglet2" class="onglet" style="display: none">
            <img id="ajout_mat" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
            <div id="dialog-5" title="Ajout d&apos;une Mati&egrave;re">
                <form class="form">
                    <span style="width: 182px;">
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
                            <option> Groupe 1 </option>
                            <option> Groupe 2 </option>
                            <option> Groupe 3 </option>
                        </select>
                    </span>
                    <span>
                        <label>Coeff.</label>
                        <input id="spinner" name="spin" size ="5" value="2"/>
                    </span>
                </form>    
            </div>

            <table class="dataTable" id="tab_mat">
                <thead><tr><th>Matière</th><th>Enseignants</th><th>Coefficient</th></tr></thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <div class="recapitulatif" >
        <?php
        if ($errors) {
            echo "<div class = 'errors'>" . $message . "</div>";
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