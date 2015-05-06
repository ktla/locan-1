<h1>Page AJOUT ELEVE</h1>
<div class="page" style="height: 100%">
    <form action="<?php echo url('classe', 'saisie'); ?>" method="post" enctype="multipart/form-data">
        <div style="margin-bottom: 5px;">
            <fieldset><legend>Saisie de la classe</legend>
                <label>Nom abrégé</label><input type="text" name="nom" />
                <label>Libellé</label><input type="text" name="libelle" />
                <label>Découpage</label>
                <select name="decoupage">
                    <option value="1">Trimestre</option>
                    <option value ="2">Semestre</option>
                </select>
            </fieldset>
        </div>
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
        <div id="onglet1" class="onglet" style="width: 700px; height: 241px; display: block;">
            <!-- Donne moi le format de la variable que je dois renvoyer pour te permettre 
            de faire cette interface graphique, j'imagine que la liste des eleves suiffi ou le format 
            JSON de cette liste est adequate -->
            <?php echo $comboEleves; ?>
            <input type="button" value="Ajouter" />
            <?php  //la variable $eleves contient la liste des eleves de la BD
            //Tu peux en faire ce que tu veux, si tu veux que je change le format, jette un coup d'oeil
            //dans le controller classeController et la methode saisie, c'est la que j'envoi cette variable sous la forme 
            //d'un tableau
            //var_dump($eleves); ?>
            <table class="dataTable" id="dataTable">
                <thead><tr><th>Matricule</th><th>Nom et Prénom</th><th>Date de naissance</th></tr></thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
        <div id="onglet2" class="onglet" style="width: 700px; min-height: 210px; display: none; height: 141px">
            
        </div>
        <div id="onglet3" class="onglet" style="width:700px;min-height:141px; height: 210px;  display: none">
            <label>Matière</label><?php echo $comboMatieres; ?>
            <label>Enseignants</label><?php echo $comboEnseignants; ?>
            <label>Coeff. </label><input type="text" name="coeff" value="1" max="6" min="1" size="5" />
            <img src="<?php echo SITE_ROOT . "public/img/ajouter.gif"; ?>" />
            
            <table style="margin-top:5px;" class="dataTable" id="dataTable2">
                <thead><tr><th>Matière</th><th>Enseignants</th><th>Coefficient</th></tr></thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
        <div class="navigation">
             <input type="submit" value="Valider" />
        </div>
    </form>
    <?php if($errors){
        echo $message;
    } ?>
</div>