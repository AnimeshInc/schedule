<?php
class User extends Table {
    public $user_id = 0;
    public $otdel_id = 0;
    function validate(){
        return false;
    }
}
?>