<div id="entete"></div>
<div class="titre">Gestion de la scolarit&eacute;</div>
<div class="page">
    <?php echo $scolarites; ?>
</div>
<div class="recapitulatif"></div>
<div class="navigation"><?php echo btn_add("document.location=\"".Router::url("scolarite", "saisie")."\""); ?></div>
<div class="status"></div>
