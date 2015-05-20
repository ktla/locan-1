<div id="entete">

</div>
<div class="titre">
    Saisie d'une mati&egrave;re
</div>
<form action ="<?php echo url('matiere', 'saisie'); ?>" method="post">
    <div class="page">
        <fieldset style="margin: auto; width: 450px; float: none;">
            <span class="text" style="width: 200px"><label>Nom abr&eacute;g&eacute;</label><input type ="text" name ="code" /></span>
            <span class="text" style="width: 200px"><label>Libell&eacute;</label><input type="text" name="libelle" /></span>
        </fieldset>
    </div>
    <div class="recapitulatif"><div class="errors">
            <?php
            if ($errors)
                echo $message;
            ?>
        </div>
    </div>
    <div class="navigation">
        <?php echo btn_ok("document.forms[0].submit()"); ?>
        <?php echo btn_cancel("document.location=\"" . Router::url('matiere') . "\""); ?>
    </div>
</form>
<div class="status">

</div>