<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
class security {

    public static function clean($var) {
        $a = array('=', "'",);
        $var = strip_tags($var);
        $var = htmlspecialchars($var);
        $var = trim($var);
        $var = stripslashes($var);
        $var = str_replace($a, "", $var);
        return $var;
    }
}
