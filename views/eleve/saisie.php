<h1>Page AJOUT ELEVE</h1>
<div class="page" style="">
    <form action="<?php echo url('eleve', 'saisie'); ?>" method="post" enctype="multipart/form-data">
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
                        Informations internes
                    </a>
                </li>
                <li id="tab3" class="noncourant">
                    <a onclick="onglets(1, 3, 3);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Responsables
                    </a>
                </li>
            </ul>
        </div>
        <div id="onglet1" class="onglet" style="width: 640px; height: 241px; display: block;">
            <fieldset><legend>Identité</legend>
                <label>Nom</label>
                <input type="text" name="nom" maxlength="30" />
                <label>Prénom</label>
                <input type="text" name="prenom" maxlength="30" />
                <label>Autre Nom</label>
                <input type="text" name="autrenom" maxlength="30" />
                <label>Sexe</label>
                <select name="sexe">
                    <option value="M">Masculin</option>
                    <option value="F">Féminin</option>
                </select>
                <label>Pays de nationalité</label>
                <?php echo $nationalite; ?> 
            </fieldset>
            <fieldset><legend>Date et lieu de naissance</legend>
                <label>Date de Naiss.</label>
                <input type="date" name="datenaiss" maxlength="30" />
                <label>Pays de Naiss.</label>
                <?php echo $paysnaiss; ?>
                <label>Lieu de Naiss.</label>
                <input type="text" name="lieunaiss" maxlength="30" />
            </fieldset>
        </div>
        <div id="onglet2" class="onglet" style="width: 640px; min-height: 210px; display: none; height: 141px">
            <fieldset><legend>Informations internes</legend>
                <label>Date entrée : </label>
                <input type="date" name="dateentree" maxlength="30" />
                <label>Provenance :</label>
                <?php echo $provenance; ?>

                <label>Redoublant</label>
                <select name="redoublant">
                    <option value="0">Non</option>
                    <option value="1">Oui</option>
                </select>
                <label>Date de sortie : </label>
                <input type="date" name="datesortie" maxlength="30" />
                <label>Motif de sortie : </label>
                <?php echo $motifsortie; ?>
                <label>Photo </label>
                <input type="file" name="photo" maxlength="30" />
            </fieldset>
        </div>
        <div id="onglet3" class="onglet" style="width:640px;min-height:141px; height: 210px;  display: none">
            <fieldset><legend>Informations responsables</legend>
                Creer le formulaire pour le responsable avec son jquery ou webix
            </fieldset>
        </div>
        <div class="navigation">
             <input type="submit" value="Valider" />
        </div>
    </form>
    <?php if($errors){
        echo $message;
    } ?>
</div>