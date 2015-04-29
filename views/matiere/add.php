<form action ="<?php echo url('matiere', 'add'); ?>" method="post">
    <table cellpadding = "10" cellspacing = "0">
        <tr><td> Nom abrégé </td><td>
                <input type ="text" name ="code" /></td></tr><tr>
            <td> Libellé </td><td>
                <input type="text" name="libelle" /></td></tr>
        <tr><td colspan="2" align ="right">
                <input type="submit" value="Ok" /></td>
        </tr>

    </table>
</form>