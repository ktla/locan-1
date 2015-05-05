<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />

        <title>Gestion des activités académique</title>
        <link href = "<?php echo SITE_ROOT; ?>public/css/style.css" rel = 'stylesheet' type = 'text/css' />
        <link href = "<?php echo SITE_ROOT; ?>public/css/jquery.dataTables.min.css" rel = 'stylesheet' type = 'text/css' />
        <link href = "<?php echo SITE_ROOT; ?>public/css/webix.css" rel = 'stylesheet' type = 'text/css' />
        <link href = "<?php echo SITE_ROOT; ?>public/css/menu.css" rel = 'stylesheet' type = 'text/css' />
        <?php
        global $css;
        if (!empty($css)) {
            echo $css;
        }
        ?>

        <link href = "<?php echo SITE_ROOT; ?>public/img/favicon.ico"
              rel = "shortcut icon" type = "image/vnd.microsoft.icon" />
        <script type="text/javascript" src="<?php echo SITE_ROOT; ?>public/js/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="<?php echo SITE_ROOT; ?>public/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="<?php echo SITE_ROOT; ?>public/js/webix.js"></script>
        <script type="text/javascript" src="<?php echo SITE_ROOT; ?>public/js/scripts.js"></script>

    </head>
    <body>
        <div id="container">
            <!-- tous les includes doivent se passer dans le controller
            Correspondant et l'obtenir sous la forme d'une variable data[];
            Pour le cas du template, c'est le controller de base
            -->


            <?php
            echo $header;
            if ($authentified) {
                echo '<div id = "page-content">' . $content . '</div>';
            } else {
                echo '<div id = "page-connect">' . $content . "</div>";
            }
            ?>

            <div id="page-footer">
                <?php echo $footer; ?>
            </div>

        </div>
    </body>
</html>