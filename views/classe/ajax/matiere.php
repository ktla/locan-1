<table class="dataTable" id="tab_mat">
    <thead><tr><th>Mati&egrave;re</th><th>Enseignants</th><th>Coefficient</th><th></th></tr></thead>
    <tbody>
        <?php
        foreach ($enseignements as $ens) {
            echo "<tr><td>" . $ens['CODE'] . " - " . $ens['MATIERELIBELLE'] . "</td><td>" . $ens['NOM'] . " " . $ens['PRENOM'] . "</td>"
            . "<td>" . $ens['COEFF'] . "</td><td align = 'center'><img style = 'cursor:pointer' src = '" . SITE_ROOT . "public/img/delete.png'"
                . " onclick = \"deleteEnseignement('".$ens['IDENSEIGNEMENT']."');\"  /></td></tr>";
        }
        ?>
    </tbody>
</table>
<script>
    if (!$.fn.DataTable.isDataTable("#tab_mat")) {
        $('#tab_mat').DataTable({
            "paging": false,
            "bInfo": false,
            "scrollY": 300,
            "columns": [
                {"width": "40%"},
                {"width": "40%"},
                {"width": "5%"},
                {"width": "5%"}
            ]
        });
    }
</script>