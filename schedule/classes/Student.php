<?php
class User extends Table {
    public $user_id = 0;
    public $gruppa_id = 0;
    public $num_zach = '';
    function validate(){
        return false;
    }
}
?>