<form action="<?php echo Router::url("user", "mdp"); ?>" method="post" >
<fieldset><legend>Changement de mot de passe</legend>
    <label>Mot de passe actuel</label><input type="password" name="pwdactuel" />
    <label>Nouveau mot de passe</label><input type="password" name="newpwd"  />
    <label>Confirmation du mot de passe</label><input type="password" name="confpwd" />
    <input type="submit" value="OK" />
    <input type="button" value="Annuler" />
</fieldset>
</form>
<?php
if($errors){
    echo $message;
}