<!-- div class="breadcrumb"><a href ="">Document</a><a  href ="">Document</a><a href ="">Document</a></div -->
<div class="titre">Liste des matieres</div>
<?php
echo $matieres;
?>
<div class="recapitulatif">
    <?php echo $total. " mati&egrave;s au total"; ?>
</div>
<a href="<?php echo url('matiere', 'add'); ?>">Ajouter</a>
<?php
if ($errors) {
    echo "<div style = 'color:red; text-align:center'>Une erreur s'est produite</div>";
}