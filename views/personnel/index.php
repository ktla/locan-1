<div style="text-align: center;margin-bottom: 5px;">Fonction <?php echo $functions; ?></div>

<div class="titre">
    Gestion du Personnel
</div>


<!-- div class="breadcrumb"><a href ="">Document</a><a  href ="">Document</a><a href ="">Document</a></div -->

<?php
if (!$personnels) {
    echo "Aucune donnée à afficher";
} else {

    echo $personnels;
}
?>
<div class="recapitulatif">
    <?php echo $total . " membres du personnel"; ?>
</div>
<div class="navigation">
    <input type="button" value="Ajouter"/>
</div>