<div id="entete">
    
</div>
<div class="titre">
    Gestion des droits utilisateurs
</div>
<form action="<?php echo Router::url("user", "droits"); ?>" method="post">
    <div class="page">
        
    </div>
    <div class="recapitulatif">
        <?php echo $total; ?> droits;
    </div>
    <div class="navigation">
        <?php echo btn_ok("document.forms[0].submit()"); ?>
        <?php echo btn_cancel("document.location=\"". Router::url("user"). "\""); ?>
    </div>
</form>
<div class="status">
    
</div>