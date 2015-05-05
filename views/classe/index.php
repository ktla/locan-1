<div class="titre">
    Gestion des classes
</div>
<div style="margin: 10px;text-align: center;"><h1>Information relative a afficher<br/>
        Confere easyscol page classe</h1></div>

<div class="page" style="height: 100%">
    <form action="<?php echo url('classe', 'saisie'); ?>" method="post">
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
                        Enseignants
                    </a>
                </li>
                <li id="tab3" class="noncourant">
                    <a onclick="onglets(1, 3, 3);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Emploi du temps
                    </a>
                </li>
                
            </ul>
        </div>
        <div id="onglet1" class="onglet" style="display: block;">Liste des eleves</div>
        <div id="onglet2" class="onglet" style="display: none;">liste des enseignant</div>
        <div id="onglet3" class="onglet" style="display: none;">Emploi du temps de la classe</div>
    </form>
</div>