<div id="entete">
    
</div>
<div class="titre">Modification de mon email</div>

<form action="<?php echo Router::url("user", "email"); ?>" method="post" >
    <div class="page">
    <fieldset><legend>Changement de l'Email</legend>
        <label>Email actuel</label><input type="email" name="emailactuel" />
        <label>Nouvel email</label><input type="email" name="newemail"  />
        <label>Confirmation du nouvel email</label><input type="email" name="confemail" />
       
    </fieldset>
    </div>
    <div class="recapitulatif"></div>
    <div class="navigation">
        <?php echo btn_ok("document.forms[0].submit();"); ?>
        <?php echo btn_cancel("document.location=\"". Router::url("user", "fiche") . "\""); ?>
    </div>
</form>
<div class="status"></div>