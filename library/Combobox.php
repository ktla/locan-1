<?php

class Combobox {

    private $data; //Donne est execute par 
    public $id; //Colonne contenant le value des <option value = row[id]>, cache a l'utilisateur
    public $show; //Colonne visible a l'utilisateur, afficher entre les <option>row[show]<option>
    public $name; //name du <select name = name>
    public $first; //Information a afficher en premier dans le select (premier option)
    private $selected; //Existe t-il un element selectionner au depart TRUE ou FALSE
    public $selectedid; //Si selected = TRUE, indiquer l'identifiant de cet element qui devrai etre selectionner par defaut
    public $other = FALSE;  //Precise s'il ya possibilite de choisir en dernier lieu ---Autre---
   
    /* Id utiliser, meme chose pour name */
    public $idname;
    public $textother = "--Autre | Pr&eacute;ciser--"; //Text a afficher s'il l'option autre existe
    public $onchange = "";  //Fonction appelee lorsque la valeur change

    function __construct($data, $name = '', $id = "", $show = '', $selected = FALSE, $select = 0) {
        $this->first = "";
        $this->selected = $selected;
        $this->id = $id;
        $this->show = $show;
        $this->name = $name;
        $this->idname = $name;
        $this->selectedid = $select;
        $this->data = $data;
    }

    function view($width = '100%') {
        //var_dump($this->data);
        
        if (!count($this->data) && !$this->other) {
            return "<p class=\"infos\">Aucun enregistrement</p>";
        }
        $str = "";
        $str .= "<select name=\"" . $this->name . "\"".(!empty($this->onchange) ?"onChange ='" . $this->onchange."'":"").
                " style=\"width:" . $width . "\" id = '" . $this->idname . "'>";
        if (!empty($this->first)) {
            $str .= "<option value=\"0\">" . $this->first . "</option>";
        }
        if (count($this->data) > 0) {
            foreach ($this->data as $row) {
                if ($this->selected && !strcasecmp($row[$this->id], $this->selectedid)) {
                    $str .= "<option value=\"" . $row[$this->id] . "\" selected = 'selected'>" . $row[$this->show] . "</option>";
                } else {
                    $str .= "<option value=\"" . $row[$this->id] . "\">" . $row[$this->show] . "</option>";
                }
            }
        }
        if ($this->other) {
            $str .= "<option value=\"other\">" . $this->textother . "</option>";
        }
        $str .= "</select>";
        return $str;
    }

}
