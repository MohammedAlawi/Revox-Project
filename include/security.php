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
	
	private function validip($ip) {
        if (!empty($ip) && $ip == long2ip(ip2long($ip))) {
            $reserved_ips = array(
                array('0.0.0.0', '2.255.255.255'),
                array('10.0.0.0', '10.255.255.255'),
                array('127.0.0.0', '127.255.255.255'),
                array('169.254.0.0', '169.254.255.255'),
                array('172.16.0.0', '172.31.255.255'),
                array('192.0.2.0', '192.0.2.255'),
                array('192.168.0.0', '192.168.255.255'),
                array('255.255.255.0', '255.255.255.255')
            );

            foreach ($reserved_ips as $r) {
                $min = ip2long($r[0]);
                $max = ip2long($r[1]);
                if ((ip2long($ip) >= $min) && (ip2long($ip) <= $max))
                    return false;
            }
            return true;
        } else
            return false;
    }

    public static function getip() {
        if (isset($_SERVER)) {
            if (isset($_SERVER['HTTP_X_FORWARDED_FOR']) && (new security)->validip($_SERVER['HTTP_X_FORWARDED_FOR'])) {
                $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
            } elseif (isset($_SERVER['HTTP_CLIENT_IP']) && (new security)->validip($_SERVER['HTTP_CLIENT_IP'])) {
                $ip = $_SERVER['HTTP_CLIENT_IP'];
            } else {
                $ip = $_SERVER['REMOTE_ADDR'];
            }
        } else {
            if (getenv('HTTP_X_FORWARDED_FOR') && (new security)->validip(getenv('HTTP_X_FORWARDED_FOR'))) {
                $ip = getenv('HTTP_X_FORWARDED_FOR');
            } elseif (getenv('HTTP_CLIENT_IP') && (new security)->validip(getenv('HTTP_CLIENT_IP'))) {
                $ip = getenv('HTTP_CLIENT_IP');
            } else {
                $ip = getenv('REMOTE_ADDR');
				}
        }
        return $ip;
    }
}
