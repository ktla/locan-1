<div id="entete">
    <label>Date</label><input type="date" name="datejour" />
    <label>Classe</label>
    <select name="classe"><option>5eme</option><option>6eme</option></select>
    <label>Début du cours</label><input type="time" name="debutcours" />
    <label>Fin du cours</label><input type="time" name="fincours" />
</div>

<div class="page" style="">
    <div class="titre">Appel en salle</div>

    <form action="<?php echo url('salle', 'appel'); ?>" method="post">
        <fieldset><legend>Liste des élèves</legend>
            <div id="listeeleve" style="max-height: 600px; overflow: auto" >
               <?php
               //Affichage de la table, confere easyscol
               //Puisque je t'envoie la liste des eleves de cette classe dans une variable eleves
               //arrange toi a afficher le tableau la et me le renvoyer
               foreach($eleves as $eleve){
                   var_dump($eleve);
               }
               ?>
            </div>
        </fieldset>
    </form>
</div>