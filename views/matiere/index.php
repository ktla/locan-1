<!-- div class="breadcrumb"><a href ="">Document</a><a  href ="">Document</a><a href ="">Document</a></div -->
<div class="titre">Liste des matieres</div>
<?php
echo $matieres;
?>
<div class="recapitulatif">
    <?php echo $total. " mati&egrave;res au total"; ?>
</div>
<div class="navigation">
    <input type="button" onclick="document.location='<?php echo url('matiere', 'saisie'); ?>'" value ="Ajouter" />
</div>
<?php
if ($errors) {
    echo "<div style = 'color:red; text-align:center'>Une erreur s'est produite</div>";
}