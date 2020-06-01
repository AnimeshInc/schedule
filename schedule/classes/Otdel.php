<?php
class User extends Table {
    public $otdel_id = 0;
    public $name = '';
    public $active = 1;
    function validate(){
        return false;
    }
}
?>