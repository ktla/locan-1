<div id="entete">

</div>
<div class="titre">Liste des matieres</div>
<div class="page">
    <?php
    echo $matieres;
    ?>
</div>

<div class="recapitulatif">
    <?php echo $total . " mati&egrave;res au total"; ?>
</div>
<div class="navigation">
    <?php echo btn_add("document.location=\"". Router::url("matiere", "saisie")."\""); ?>
</div>
<div class="status"></div>