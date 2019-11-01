<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
ini_set('display_errors','Off'); //If you want to display the errors Set it to On
session_start();
date_default_timezone_set('Asia/Kuwait');
define("URL", "http://127.0.0.1/Store/");  //The Itemshop URL
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
//String Resource table name inside Arcadia Database 
define("TABLE_StringResource", 'StringResource_AR');
//The session Time out
define("TIME_STILL_LOGIN", 300); // 5 minutes
define("SERVER_NAME", "RevoTeam"); //Site Name
define("DEV_MODE", true);

//The paypal Charge information
define("MOD_PAYPAL", "sandbox"); // live or sandbox
define("ClientID", "AV8i1-nYhZRKgBzpYJyrcu9HfTBtTFpPBUb-A_NqPpJsYSHezw67u5Tr1SmOFBO1VtghIhMecZfuU_iX");
define("ClientSecret", "ENdQzodN93dNFMKHOEWBX19YNfk4L2d1dXImow7bCye_Ey2LUdUn-AnYtsO-D8HotLcOXRyiriR7Yywf");