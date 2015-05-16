<div id="entete"></div>
<div class="titre">

</div>
<form action="<?php echo Router::url("user", "telephone"); ?>" method="post" >
    <div class="page">
        <fieldset><legend>Changement de num&eacute;ro de t&eacute;l&eacute;phone</legend>
            <label>Nouveau Num&eacute;ro </label><input type="tel" name="telephone" />
        </fieldset>
    </div>
    <div class="recapitulatif">
        
        
    </div>
    <div class="navigation">
         <?php echo btn_ok("document.forms[0].submit();"); ?>
        <?php echo btn_cancel("document.location=\"". Router::url("user", "fiche") . "\""); ?>
    </div>
</form>

<?php
if ($errors) {
    echo $message;
}
?>
<div class="status"></div>