<form action="<?php echo Router::url("user", "telephone"); ?>" method="post" >
    <fieldset><legend>Changement de num&eacute;ro de t&eacute;l&eacute;phone</legend>
        <label>Nouveau Num&eacute;ro </label><input type="tel" name="telephone" />
    <input type="submit" value="OK" />
    <input type="button" value="Annuler" />
</fieldset>
</form>
<?php
if($errors){
    echo $message;
}