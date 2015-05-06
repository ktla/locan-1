<div class="titre">Liste des classes</div>
<?php
echo $classes;
?>
<div class="recapitulatif">
    <?php echo $total. " classes"; ?>
</div>
<div class="navigation">
    <form action="<?php echo Router::url("classe", "saisie");  ?>" method="post">
    
        <input type="hidden" value="0" name="saisie" />
        <input type="submit" value="Ajouter" />
    </form>
</div>
<?php
if ($errors) {
    echo "<div style = 'color:red; text-align:center'>Une erreur s'est produite</div>";
}