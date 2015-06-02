<div id="entete"><span class="select" style="width: 200px">
        <label>Classes : </label>
    <?php echo $comboClasses; ?></span></div>
<div class="titre">Saisie de la scolarit&eacute;</div>
<div class="page">
    <p style="text-align: right;margin-top: 0"><img id="img-ajout" style="cursor: pointer" src="<?php echo SITE_ROOT . "public/img/btn_add.png" ?>" />
    <input type="hidden" name="echeances" value="" /></p>
    <div id="scolarite-dialog-form" title="Ajouter une scolarite" >
        <span><label>Libell&eacute; de la tranche</label><input type="text" name="libelle" /></span>
        <span><label>Montant de la tranche</label><input type="text" name="montant" /></span>
        <span><label>Date de l'&eacute;ch&eacute;ance</label><div id="echeances" style="margin-top: 10px;z-index: 10"></div></span>
    </div>
    <div id="scolarite-content">
        <table class="dataTable" id="scolariteTable">
            <thead><tr><th>Description de la tranche</th><th>Montant</th><th>Ech&eacute;ances</th><th></th></tr></thead>
            <tbody></tbody>
        </table>
    </div>
</div>
<div class="recapitulatif"></div>
<div class="navigation">
    <?php 
    if(isAuth(208)){
        echo btn_ok("document.location='".Router::url("scolarite")."'"); 
    }else{
        echo btn_ok_disabled();
    }?></div>
<div class="status"></div>
