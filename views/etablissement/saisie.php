<div id="entete">
    
</div>
<div class="titre">
    Saisie des param&egrave;tres de l'&eacute;tablissement
</div>
<form action="<?php echo Router::url("etablissement", "saisie"); ?>" method="post" enctype="multipart/form-data" >
    <div class="page">
         <div class="tabs" style="width: 100%">
            <ul>
                <li id="tab1" class="courant">
                    <a onclick="onglets(1, 1, 2);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/etablissement.png"; ?>" />
                        Identit&eacute;
                    </a>
                </li>
                <li id="tab2" class="noncourant" >
                    <a onclick="onglets(1, 2, 2)">
                         <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/photo.png"; ?>" />
                        Logo
                    </a>
                </li>
            </ul>
         </div>
        <div id="onglet1" class="onglet" style="display: block;">
          
        <fieldset><legend>Identit&eacute;</legend>
            <label>Identifiant</label><input type="text" name="identifiant" />
            <label>Nom</label><input type="text" name="nom" />
            
        </fieldset>
        <fieldset><legend>Coordonn&eacute;es</legend>
            <label>Adresse</label><input type="text" name="adresse" />
            <label>Boite Postal</label><input type="text" name="bp" />
            <label>Tel. 1</label><input type="text" name="tel1" />
            <label>Tel. 2</label><input type="text" name="tel2" />
            <label>Mobile</label><input type="text" name="mobile" />
            <label>Fax</label><input type="text" name="fax" />
            <label>Email</label><input type="text" name="email" />
            <label>Site web</label><input type="text" name="siteweb" />
        </fieldset>
        <fieldset><legend>Chef d'&eacute;tablissement</legend>
            <label>Responsable</label><input type="text" name="responsable" />
        </fieldset>
        </div>
        <div id="onglet2" class="onglet" style="display: none">
            <label>Logo</label><input type="file" name="logo" />
        </div>
    </div>
    <div class="recapitulatif">
        <?php
            if($errors){
                echo $message;
            }
        ?>
    </div>
    <div class="navigation">
        <img src="<?php echo SITE_ROOT . "public/img/btn_ok.png"; ?>" onclick="document.forms[0].submit();" />
        <img src="<?php echo SITE_ROOT . "public/img/btn_cancel.png"; ?>" onclick="document.location = '<?php echo Router::url("etablissement"); ?>'" />
        
    </div>
</form>
<div class="status">

</div>