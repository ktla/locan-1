
<table class="dataTable" id="dataTable2">
    <thead><tr><th>CODE</th><th>LIBELLE</th><th>ACTIF</th></tr></thead>
    <tbody>
        <?php
        foreach ($droits as $droit) {
            echo "<tr><td>" . $droit['CODEDROIT'] . "</td><td>" . $droit['LIBELLE'] . "</td><td>"
            . "<input type = 'checkbox' name = 'droits' value = '" . $droit['CODEDROIT'] . "' /></td></tr>";
        }
        ?>
    </tbody>
</table>