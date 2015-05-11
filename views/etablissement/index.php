<div class="tabs" style="width: 100%">
    <ul>
        <li id="tab1" class="courant">
            <a onclick="onglets(1, 1, 3);">
                <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/etablissement.png"; ?>" />
                Etablissement
            </a>
        </li>
        <li id="tab2" class="noncourant">
            <a onclick="onglets(1, 2, 3);">
                <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/personnel.png"; ?>" />
                Personels
            </a>
        </li>
        <li id="tab3" class="noncourant">
            <a onclick="onglets(1, 3, 3);">
                <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                Elèves
            </a>
        </li>

    </ul>
</div>
<div id="onglet1" class="onglet" style="display: block;">
    <fieldset><legend>Etablissement</legend>
        <?php echo $ets; ?>
    </fieldset>
     <fieldset><legend>Responsable</legend>
        <?php echo $responsable; ?>
    </fieldset>
     <fieldset><legend>Adresse</legend>
        <?php echo $adresse; ?>
    </fieldset>
    <fieldset><legend>Coordonn&eacute;es</legend>
        <?php echo $tel1. " " . $tel2 . " ". $mobile . " ". $email; ?>
    </fieldset>
</div>
<div id="onglet2" class="onglet" style="display: none;">
    <?php echo $personnels; ?>
</div>
<div id="onglet3" class="onglet" style="display: none;">
    <?php echo $eleves; ?>
</div>