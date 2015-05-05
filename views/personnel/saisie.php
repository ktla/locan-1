<div class="titre">
    Saisie d'un nouvel Personnel
</div>
<div>
    <form action="<?php echo url("personnel", "saisie"); ?>" method="post">
        <fieldset><legend> Identit&eacute;</legend>
            <label>Civilit&eacute;</label>
            <?php echo $civilite; ?>
            <label> Nom </label>
            <input type="text" name="nom" maxlength="30" />
            <label> Pr&eacute;nom</label>
            <input type="text" name="prenom" maxlength="30" />
            <label>Autre noms</label>
            <input type="text" name="autrenom" maxlength="30" />
            <label>Fonction</label>
            <?php echo $functions; ?>
            <label>Grade</label>
            <input type="text" name="grade" maxlength="15" />
            <label>Date de naissance</label>
            <input type="date" name="datenaiss" />
            <label>T&eacute;l&eacute;phone</label>
            <input type="text" name="telephone" maxlength="15" />
            <label>Portable</label>
            <input type="text" name="portable" maxlength="15" />
        </fieldset>
        <div class="navigation">
        <input type="submit" value="Ok" />
        <input type="button" value="Annuler" />
        </div>
    </form>
</div>
<?php
if($errors){
    echo "<div class='error'>Quelque chose de grave s'est produit</div>";
}