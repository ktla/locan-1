<?php if ($authentified) { ?>
<div id = "page-header">
        <!-- h1>ENTETE DU SITE CONTENANT NOS DEUX LOGO</h1 -->
    </div>
    <div id = "menu">
        <a href = "<?php echo SITE_ROOT; ?>">Home</a> | 
        <a href = "<?php echo SITE_ROOT; ?>about">A Propos</a> | 
        <a href = "<?php echo SITE_ROOT; ?>eleve">Eleve</a> |
        <a href = "<?php echo SITE_ROOT; ?>matiere">Matiere</a> |
        <a href = "<?php echo SITE_ROOT; ?>note">Note</a> |
          <a href = "<?php echo SITE_ROOT; ?>personnel">Personnel</a> |
        <a href = "<?php echo SITE_ROOT; ?>connexion/disconnect">Deconnexion</a>
        ?>
    </div>
    <?php
}
        