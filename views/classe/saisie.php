<div id="entete">

</div>
<div class="titre">Saisie des classes</div>

<form action="<?php echo url('classe', 'saisie'); ?>" method="post" enctype="multipart/form-data">
    <div class="page" style="">
        <fieldset style="float: none; width: 710px; margin: auto;margin-bottom: 10px;"><legend>Saisie de la classe</legend>
            <span class="text" style="width: 150px;"><label>Nom abr&eacute;g&eacute;</label><input type="text" name="nom" /></span>
            <span class="text" style="width: 360px;"><label>Libell&eacute;</label><input type="text" name="libelle" /></span>
            <span class="select" style="width: 150px;">    
                <label>Découpage</label>
                <select name="decoupage">
                     <option value="1">Sequence</option>
                    <option value="2">Trimestre</option>
                    <option value ="3">Semestre</option>
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
                <div id="dialog-form" title="Selectionner un Eleve">
                    <form>

                        <span class="select" style="width: 250px;">
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
                <div id="dialog-pp-form" title="Selectionner un Enseignant">
                    <form>

                        <span class="select" style="width: 250px;">
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
                <div id="dialog-cpe-form" title="Selectionner un Parent Principal">
                    <form>

                        <span class="select" style="width: 250px;">
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
                <div id="dialog-ra-form" title="Selectionner Un Resp. Administratif">
                    <form>

                        <span class="select" style="width: 250px;">
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



        <!-- Donne moi le format de la variable que je dois renvoyer pour te permettre 
        de faire cette interface graphique, j'imagine que la liste des eleves suiffi ou le format 
        JSON de cette liste est adequate -->





        <div id="onglet2" class="onglet" style="display: none">
            <img id="ajout_mat" src="<?php echo SITE_ROOT . "public/img/btn_add.png"; ?>" style="position: relative; margin-top: 3px; margin-bottom: 15px; cursor: pointer;  float: right;">
            <div id="dialog-mat-form" title="Ajout d&apos;une Mati&egrave;re">
                <form>
                    <span class="select" style="margin-bottom: 15px !important; ">
                        <label>Mati&egrave;re</label>
                        <?php echo $comboMatieres; ?>
                    </span>
                    <span class="select">
                        <label>Enseignant</label>
                        <?php echo $comboEnseignants; ?>
                    </span>
                    <span class="select">
                        <label>Coeff.</label>
                        <?php echo $comboEleves; ?>
                    </span>
                </form>    
            </div>

            <table class="dataTable" id="tab_mat">
                <thead><tr><th>Matière</th><th>Enseignants</th><th>Coefficient</th></tr></thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <div class="recapitulatif"><div class="errors">
            <?php
            if ($errors) {
                echo $message;
            }
            ?>
        </div>

    </div>
    <div class="navigation">
        <img  src="<?php echo SITE_ROOT . "public/img/btn_ok.png" ?> " onclick="document.forms[0].submit();" />
        <img  src="<?php echo SITE_ROOT . "public/img/btn_cancel.png" ?> " 
              onclick="document.location = '<?php echo Router::url("classe", "saisie"); ?>'" />
    </div>

</form>
<div class="status"></div>
