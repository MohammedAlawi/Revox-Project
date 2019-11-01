<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("Vewi_TPL_File")){
	die("File not Found!");
}
?><!DOCTYPE html>
<html>
    <head>
        <title><?= SERVER_NAME ?></title>
        <link rel="stylesheet" href="<?= URL ?>style/css/main.css" type="text/css" />
        <link rel="stylesheet" href="<?= URL ?>style/css/styleCharge.css" type="text/css" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<script  src='<?= URL ?>style/js/jquery-2.1.1.min.js'></script>
		<script  src='<?= URL ?>style/js/s.js'></script>
		

        <!--<script src="block/code.js" type="text/javascript"></script>-->
        
        <style>
            body{
                background: url(img/bg_repeat.jpg);
            }
            #main {
                background-image: url(img/body_bg.png);
                background-repeat: no-repeat;
                background-size: cover;
                margin-top: 20px;
                margin-left: 20px;
                height: 600px;
                min-height: 100%;
                width: 755px;
            }
            #body{
                margin-top: 80px
            }
            .top_menu {
                position: relative;
                background-image: url(img/topmenu_bar.jpg);
                background-size: cover;
                height: 80px;
                text-align: center;
                position: relative;
                border-radius: 5px 5px 5px 5px;
            }

            #top_menu li {
                display: inline-block;
                margin: 1px 0 0 0;
                position: relative;
                margin: 0 0 0 -4px;
                transition: all 600ms;
                -webkit-transition: all 600ms;
                -moz-transition: all 600ms;
                -ms-transition: all 600ms;
                -o-transition: all 600ms;
            }
            
            #left {
                width: 200px;
                float: left;
                margin-top: 50px;
            }
            #bodyOrignal{
                margin: 50px 0 0 200px;
                height: auto;
                min-height: 421px;
                position: relative;
                z-index: 5;
                border: 5px;
                border-radius: 5px;
                padding: 10px;
                box-shadow: inset 0 0 0 1px #161b1e, inset 0 0 20px rgba(0,0,0,.25), inset 0 0 6px rgba(0,0,0,1), 0 0 15px rgba(0,0,0,.35);
            }
            .row{
                margin-top: 17px;
            }
            .col-lg-4{
                width: 33.33333333%;
                float: left;
                text-align: center;
                margin: 0px 0px 31px 0;
            }
            #accoutnDetails{
                height: 0;
                margin: -10px 15px 0 15px;
                padding: 0;
            }
            #accP {
                font-size: 18px;
            }
            #account{ 
                text-align: left;
                position: absolute;
                z-index: 2;
            }
            #point{
                text-align: right;
                z-index: 1;
            }
            #getItem{
                text-align: center;
            }
            select {
                font-family: MuseoSans, Arial, Helvetica, Sans-serif;
                font-size: 12px;
                width: 80%;
                padding: 8px;
                color: #4f5356;
                background: url(img/input_bg.png) repeat-x;
                border: none;
                border-radius: 3px;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                margin: 5px;
                -webkit-transition: all 300ms;
                -moz-transition: all 300ms;
                -o-transition: all 300ms;
                -ms-transition: all 300ms;
                transition: all 300ms;
                box-shadow: 0 0 0 1px #28333a, inset 0 0 4px rgba(0,0,0,.5), inset 0 1px 1px rgba(0,0,0,.5), 0 0 5px rgba(0,0,0,1);
                text-shadow: 1px 1px 1px rgba(0,0,0,.6);
            }
            select:focus {
                color:#f6c85c;
                box-shadow: 0 0 0 1px #3d4f5d, inset 0 0 4px rgba(0,0,0,.5), inset 0 1px 1px rgba(0,0,0,.5), 0 0 5px rgba(0,0,0,1);
            }
        </style>
    </head>
    <body>
        <div id="main">
			<div id="navbar">
                <div class="top_menu">
                    <ul id="top_menu">
                        <li><a href="<?=URL?>?go=offer">New Offers</a></li>
                        <li><a href="<?=URL?>?go=supplies">Supplies</a></li>
                        <li><a href="<?=URL?>?go=weapons">Weapons</a></li>
                        <li><a href="<?=URL?>?go=armor">Armor</a></li>
                        <li><a href="<?=URL?>?go=decor">Decorations</a></li>
                        <li><a href="<?=URL?>?go=charge">Charge</a></li>
                    </ul>
                </div>
            </div>
            <div id="accoutnDetails">
                <br>
                <div id="account">
                    Account Name: <font id="accP"><?=$_SESSION['dataPlay'][0]['account']?></font>
                </div>
                <div id="point">
                    Point: <font id="accP"><?=$login->CheackAcoount($_SESSION['dataPlay'][0]['account_id'])[0]['point']?></font> point.
                </div>
            </div>