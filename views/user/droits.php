<div id="entete">

</div>
<div class="titre">
    Gestion des droits utilisateurs
</div>
<form action="<?php echo Router::url("user", "droits"); ?>" method="post">
    <div class="page">
        <div class="tabs" style="width: 100%">
            <ul>
                <li id="tab1" class="courant">
                    <a onclick="onglets(1, 1, 5);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Mon compte
                    </a>
                </li>
                <li id="tab2" class="noncourant">
                    <a onclick="onglets(1, 2, 5);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Informations internes
                    </a>
                </li>
                <li id="tab3" class="noncourant">
                    <a onclick="onglets(1, 3, 5);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Vie scolaire
                    </a>
                </li>
                <li id="tab4" class="noncourant">
                    <a onclick="onglets(1, 4, 5);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Notes et bulletins
                    </a>
                </li>
                <li id="tab5" class="noncourant">
                    <a onclick="onglets(1, 5, 5);">
                        <img border ="0" alt="" src="<?php echo SITE_ROOT . "public/img/icons/eleve.png"; ?>" />
                        Administrations
                    </a>
                </li>

            </ul>
        </div>
        <div id="onglet1" class="onglet" style="display: block;height: 500px">
            <?php
            $i = 0;
            $table = "<table class = 'dataTable'>";
            $table .= "<thead><th>Libell&eacute; du droit</th>";
            foreach ($profiles as $profile) {
                $table .= "<th>" . $profile['PROFILE'] . "</th>";
            }
            $table .= "</thead><tbody>";
            for ($i = 0; $droits[$i]["CODEDROIT"] < 200; $i++) {
                $droit = $droits[$i];
                
                $table .= "<tr><td>" . $droit['LIBELLE'] . "</td>";
                foreach ($profiles as $profile) {
                    $liste = is_null($listedroits[$profile['IDPROFILE']]) ? array() : $listedroits[$profile['IDPROFILE']];
                    if (in_array($droit['CODEDROIT'], $liste)) {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' "
                                . (isAuth($droit['CODEDROIT']) ? "checked" : "") . "/></td>";
                    } else {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' /></td>";
                    }
                }
                $table .= "</tr>";
            }
            $table .= "</tbody></table>";
            print $table;
            ?>
        </div>
        <div id="onglet2" class="onglet" style="display: none;height: 500px">
            <?php
            $table = "<table class = 'dataTable'>";
            $table .= "<thead><th>Libell&eacute; du droit</th>";
            foreach ($profiles as $profile) {
                $table .= "<th>" . $profile['PROFILE'] . "</th>";
            }
            $table .= "</thead><tbody>";
            for (; $droits[$i]["CODEDROIT"] < 300; $i++) {
                $droit = $droits[$i];
                $table .= "<tr><td>" . $droit['LIBELLE'] . "</td>";
                foreach ($profiles as $profile) {
                    $liste = is_null($listedroits[$profile['IDPROFILE']]) ? array() : $listedroits[$profile['IDPROFILE']];
                    if (in_array($droit['CODEDROIT'], $liste)) {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' "
                                . (isAuth($droit['CODEDROIT']) ? "checked" : "") . "/></td>";
                    } else {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' /></td>";
                    }
                }
                $table .= "</tr>";
            }
            $table .= "</tbody></table>";
            print $table;
            ?>
        </div>
        <div id="onglet3" class="onglet" style="display: none;height: 500px">
            <?php
            $table = "<table class = 'dataTable'>";
            $table .= "<thead><th>Libell&eacute; du droit</th>";
            foreach ($profiles as $profile) {
                $table .= "<th>" . $profile['PROFILE'] . "</th>";
            }
            $table .= "</thead><tbody>";
            for (; $droits[$i]["CODEDROIT"] < 400; $i++) {
                $droit = $droits[$i];
               
                $table .= "<tr><td>" . $droit['LIBELLE'] . "</td>";
                foreach ($profiles as $profile) {
                    $liste = is_null($listedroits[$profile['IDPROFILE']]) ? array() : $listedroits[$profile['IDPROFILE']];
                    if (in_array($droit['CODEDROIT'], $liste)) {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' "
                                . (isAuth($droit['CODEDROIT']) ? "checked" : "") . "/></td>";
                    } else {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' /></td>";
                    }
                }
                $table .= "</tr>";
            }
            $table .= "</tbody></table>";
            print $table;
            ?>
        </div>
        <div id="onglet4" class="onglet" style="display: none;height: 500px">
            <?php
            $table = "<table class = 'dataTable'>";
            $table .= "<thead><th>Libell&eacute; du droit</th>";
            foreach ($profiles as $profile) {
                $table .= "<th>" . $profile['PROFILE'] . "</th>";
            }
            $table .= "</thead><tbody>";
            for (; $droits[$i]["CODEDROIT"] < 500; $i++) {
                $droit = $droits[$i];
                $table .= "<tr><td>" . $droit['LIBELLE'] . "</td>";
                foreach ($profiles as $profile) {
                    $liste = is_null($listedroits[$profile['IDPROFILE']]) ? array() : $listedroits[$profile['IDPROFILE']];
                    if (in_array($droit['CODEDROIT'], $liste)) {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' "
                                . (isAuth($droit['CODEDROIT']) ? "checked" : "") . "/></td>";
                    } else {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' /></td>";
                    }
                }
                $table .= "</tr>";
            }
            $table .= "</tbody></table>";
            print $table;
            ?>
        </div>
        <div id="onglet5" class="onglet" style="display: none;height: 500px">
            <?php
            $table = "<table class = 'dataTable'>";
            $table .= "<thead><th>Libell&eacute; du droit</th>";
            foreach ($profiles as $profile) {
                $table .= "<th>" . $profile['PROFILE'] . "</th>";
            }
            $table .= "</thead><tbody>";
            while (isset($droits[$i])) {
                $droit = $droits[$i];
                $table .= "<tr><td>" . $droit['LIBELLE'] . "</td>";
                foreach ($profiles as $profile) {
                    $liste = is_null($listedroits[$profile['IDPROFILE']]) ? array() : $listedroits[$profile['IDPROFILE']];
                    if (in_array($droit['CODEDROIT'], $liste)) {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' "
                                . (isAuth($droit['CODEDROIT']) ? "checked" : "") . "/></td>";
                    } else {
                        $table .= "<td><input type = 'checkbox' name = '" . $profile['IDPROFILE'] . "[]' value = '" . $droit["CODEDROIT"] . "' /></td>";
                    }
                }
                $table .= "</tr>";
                $i++;
            }
            $table .= "</tbody></table>";
            print $table;
            ?>
        </div>
    </div>
    <div class="recapitulatif">
        <?php echo $total; ?> droits
    </div>
    <input type="hidden" name="soumis" value="1" />
    <div class="navigation">
        <?php echo btn_ok("document.forms[0].submit()"); ?>
        <?php echo btn_cancel("document.location=\"" . Router::url("user") . "\""); ?>
    </div>
</form>
<div class="status">

</div>
