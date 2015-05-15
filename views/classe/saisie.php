<div id="entete">

</div>
<div class="titre">Saisie des classes</div>

<form action="<?php echo url('classe', 'saisie'); ?>" method="post" enctype="multipart/form-data">
    <div class="page" style="">
        
            <fieldset><legend>Saisie de la classe</legend>
                <label>Nom abrégé</label><input type="text" name="nom" />
                <label>Libellé</label><input type="text" name="libelle" />
                <label>Découpage</label>
                <select name="decoupage">
                    <option value="1">Trimestre</option>
                    <option value ="2">Semestre</option>
                </select>
            </fieldset>
       
        <div class="tabs" style="width: 100%">
            <ul>
                <li id="tab1" class="courant">
                    <a onclick="onglets(1, 1, 3);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Elèves
                    </a>
                </li>
                <li id="tab2" class="noncourant">
                    <a onclick="onglets(1, 2, 3);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Professeur Principal
                    </a>
                </li>
                <li id="tab3" class="noncourant">
                    <a onclick="onglets(1, 3, 3);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Matières
                    </a>
                </li>
            </ul>
        </div>
        <div id="onglet1" class="onglet" style="display: block;">
            <!-- Donne moi le format de la variable que je dois renvoyer pour te permettre 
            de faire cette interface graphique, j'imagine que la liste des eleves suiffi ou le format 
            JSON de cette liste est adequate -->
            <?php echo $comboEleves; ?>
            <input type="button" value="Ajouter" />
            <?php
            //la variable $eleves contient la liste des eleves de la BD
            //Tu peux en faire ce que tu veux, si tu veux que je change le format, jette un coup d'oeil
            //dans le controller classeController et la methode saisie, c'est la que j'envoi cette variable sous la forme 
            //d'un tableau
            //var_dump($eleves); 
            ?>
            <table class="dataTable" id="dataTable">
                <thead><tr><th>Matricule</th><th>Nom et Prénom</th><th>Date de naissance</th></tr></thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div id="onglet2" class="onglet" style=" display: none;">
            <!-- Puisque tu a la liste des enseignant dans la variable $enseignants
            tu peux en faire ce que tu veux. Je propose que tu creai pluto un tableau avec leur ID et leur nom
            et tu met des radiobutton a cote pour qu'on coche le proffesseur principale pour cette classe
            on supporse donc qu'on a un prof principal par classe 
            -->
            <?php var_dump($enseignants); ?>
        </div>
        <div id="onglet3" class="onglet" style="display: none">
            <label>Matière</label><?php echo $comboMatieres; ?>
            <label>Enseignants</label><?php echo $comboEnseignants; ?>
            <label>Coeff. </label><input type="text" name="coeff" value="1" max="6" min="1" size="5" />
            <img src="<?php echo SITE_ROOT . "public/img/ajouter.gif"; ?>" />

            <table class="dataTable" id="dataTable2">
                <thead><tr><th>Matière</th><th>Enseignants</th><th>Coefficient</th></tr></thead>
                <tbody>
                   
                </tbody>
            </table>
        </div>
    </div>
    <div class="recapitulatif"></div>
    <div class="navigation">
        <img  src="<?php echo SITE_ROOT . "public/img/btn_ok.png" ?> " onclick="document.forms[0].submit();" />
        <img  src="<?php echo SITE_ROOT . "public/img/btn_cancel.png" ?> " 
              onclick="document.location = '<?php echo Router::url("classe", "saisie"); ?>'" />
    </div>

</form>
<div class="status"></div>
<?php
if ($errors) {
    echo $message;
}
?>
