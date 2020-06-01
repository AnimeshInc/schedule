<?php
class User extends Table {
    public $gruppa_id = 0;
    public $name = '';
    public $special_id = 0;
    public $date_begin = null;
    public $date_end = null;
    function validate(){
        return false;
    }
}
?>