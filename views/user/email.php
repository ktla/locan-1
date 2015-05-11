<form action="<?php echo Router::url("user", "email"); ?>" method="post" >
    <fieldset><legend>Changement de l'Email</legend>
        <label>Email actuel</label><input type="email" name="emailactuel" />
        <label>Nouvel email</label><input type="email" name="newemail"  />
        <label>Confirmation du nouvel email</label><input type="email" name="confemail" />
        <input type="submit" value="OK" />
        <input type="button" value="Annuler" />
    </fieldset>
</form>