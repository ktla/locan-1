<table class="dataTable" id="scolariteTable">
    <thead><tr><th>Description de la tranche</th><th>Montant</th><th>Ech&eacute;ances</th><th></th></tr></thead>
    <tbody>
        <?php foreach ($scolarites as $scol){
            $d = new DateFR($scol['ECHEANCES']);
            $echeance = $d->getDateMessage(0);
            echo "<tr><td>".$scol['LIBELLE']."</td><td>".$scol['MONTANT']."</td><td>".$echeance."</td>"
                    . "<td><img style = 'cursor:pointer' src = \"".SITE_ROOT."public/img/delete.png\" onclick = \"supprimerScolarite('".$scol['IDSCOLARITE']."')\"</tr>";
        } ?>
    </tbody>
</table>

<script>
    if (!$.fn.DataTable.isDataTable("#scolariteTable")) {
        $("#scolariteTable").DataTable({
            "bInfo": false,
            "scrollY": 200,
            "searching": false,
            "paging": false,
            "columns": [
                {"width": "55%"},
                {"width": "20%"},
                {"width": "20%"},
                {"width": "5%"}
            ]
        });
    }
</script>
