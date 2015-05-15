<div id="entete">

</div>
<div class="titre">
    Saisie d'une mati&egrave;re
</div>
<form action ="<?php echo url('matiere', 'saisie'); ?>" method="post">
    <div class="page">
        <fieldset>
            Nom abrégé
            <input type ="text" name ="code" />
            Libellé 
            <input type="text" name="libelle" />

        </fieldset>
    </div>
    <div class="recapitulatif"></div>
    <div class="navigation">
        <?php echo btn_ok("document.forms[0].submit()"); ?>
        <?php echo btn_cancel("document.location=\"" . Router::url('matiere') . "\""); ?>
    </div>
</form>
<div class="status">

</div>