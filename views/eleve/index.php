<div class="titre">
    Elève
</div>
<div style="margin: 10px;text-align: center;">Liste des élèves : <?php echo $eleves; ?></div>
<div class="page" style="height: 100%">
    <form action="<?php echo url('eleve', 'saisie'); ?>" method="post">
        <div class="tabs" style="width: 100%">
            <ul>
                <li id="tab1" class="courant">
                    <a onclick="onglets(1, 1, 6);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Elève
                    </a>
                </li>
                <li id="tab2" class="noncourant">
                    <a onclick="onglets(1, 2, 6);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/responsable.png"; ?>" />
                        Responsables
                    </a>
                </li>
                <li id="tab3" class="noncourant">
                    <a onclick="onglets(1, 3, 6);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/emploistemps.png"; ?>" />
                        Emploi du temps
                    </a>
                </li>
                <li id="tab4" class="noncourant">
                    <a onclick="onglets(1, 4, 6);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/viescolaire.png"; ?>" />
                        Vie scolaire
                    </a>
                </li>
                <li id="tab5" class="noncourant">
                    <a onclick="onglets(1, 5, 6);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/notes.png"; ?>" />
                        Notes
                    </a>
                </li>
                <li id="tab6" class="noncourant">
                    <a onclick="onglets(1, 6, 6);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/suivi.png"; ?>" />
                        Suivi
                    </a>
                </li>
            </ul>
        </div>
        <div id="onglet1" class="onglet" style="display: block;">
            <?php //echo $identite; ?>
        </div>
        <div id="onglet2" class="onglet" style="display: none;">
            <?php //echo $responsables; ?>
        </div>
        <div id="onglet3" class="onglet" style="display: none;">
            <?php //echo $emplois; ?>
        </div>
        <div id="onglet4" class="onglet" style="display: none;">
            <?php //echo $viescolaire; ?>
        </div>
        <div id="onglet5" class="onglet" style="display: none;"></div>
         <div id="onglet6" class="onglet" style="display: none;"></div>
    </form>
</div>