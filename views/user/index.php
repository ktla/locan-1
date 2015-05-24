<div id="entete">
    <div class="logo"> <img src="<?php echo SITE_ROOT . "public/img/wide_user.png" ?>" /></div>
    <div style="margin-left: 150px;">
        <span class="select" style="width: 200px">
            <label>Utilisateurs</label>     
            <?php echo $comboUser; ?>
        </span>
    </div>
</div>
<div class="titre">
    Gestion des utilisateurs
</div>
<form action="<?php echo Router::url("user"); ?>" method="post" enctype="multipart/form-data" >
    <div class="page">
        <div class="tabs" style="width: 100%">
            <ul>
                <li id="tab1" class="courant">
                    <a onclick="onglets(1, 1, 3);"><img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Informations utilisateur
                    </a>
                </li>
                <li id="tab2" class="noncourant">
                    <a onclick="onglets(1, 2, 3);"><img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Droits utilisateurs
                    </a>
                </li>
                <li id="tab3" class="noncourant">
                    <a onclick="onglets(1, 3, 3);"><img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Ses Connexions
                    </a>
                </li>
            </ul>
        </div>
        <div id="onglet1" class="onglet" style="display: block;height: 500px"></div>
        <div id="onglet2" class="onglet" style="display: none; height: 500px"></div>
        <div id="onglet3" class="onglet" style="display: none; height: 500px"></div>
    </div>
    <div class="recapitulatif">

    </div>
    <div class="navigation">
        <?php echo btn_ok("document.forms[0].submit()"); ?>
    </div>
</form>
<div class="status"></div>