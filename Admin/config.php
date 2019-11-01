<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
//ini_set('display_errors','Off');
session_start();
date_default_timezone_set('Asia/Kuwait');
define("URL", "http://127.0.0.1/store/Admin/"); //The Admin panel URL
//The MySQL database information
define("DB_HOST", '127.0.0.1');
define("DB_USER", 'ham999dy');
define("DB_PASS", '123');
define("DB_NAME", 'new_revo');
//The SQLserver Database information
define("DB_HOST_SQL", 'local');
define("DB_USER_SQL", 'ham999dy');
define("DB_PASS_SQL", '123');
//The Game Databases
define("DB_ARCADIA", 'Arcadia');
define("DB_AUTH", 'Auth');
define("DB_BILLING", 'Billing');
define("DB_TELECASTER", 'Telecaster');
//If set to False then the Admin panel will import the item & string from MySQL but if True then from SQLServer
define("GET_DATA_ITEM_FROM_SQLSERVER", false);
//String Resource table name inside Arcadia Database 
define("TABLE_StringResource", 'StringResource_AR');

define("HASH_PASSWORD", "RevoTeam2018");

define("SERVER_NAME", "RevoTeam");
define("DEV_MODE", 0);

//Site Host and scheme
define("REF_HOST", '127.0.0.1');
define("REF_SCHEME", 'http');
