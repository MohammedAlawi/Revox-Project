# Revolution Official Store

Made by ham999dy

© 2018 Revolution Team

## Introduction

![Language](https://img.shields.io/badge/Language-PHP-blue.svg)

![Language](https://img.shields.io/badge/Database-SQLServer-red.svg) 
![Language](https://img.shields.io/badge/Database-MySQL-orange.svg)

Revox Project is a shop written by our team with **PHP**, **SQLSRV**, **MySQL** Also we used free bootstrap templates from google.

The shop come with Admin Portal (you can delete it) also it work from inside the game only , You need to install **MySQL** server (I will not go into details)
also you need to install **PHP** with **SQLSRV Drivers**.

https://docs.microsoft.com/en-us/sql/connect/php/loading-the-php-sql-driver?tduid=(854e1184fdcfd7dfab8cd7e7c0fb04ac)(266696)(2142931)(0400bl60iq4k)()

https://stackoverflow.com/questions/15231676/how-to-enable-pdo-on-appserv-on-windows

http://www.iis-aid.com/articles/how_to_guides/working_pdo_extensions_iis


## Intallation
First you need to excute this SQL Query in your **SQLServer** to make the shop smp
[shop_login.sql](https://github.com/ham999dy/Revox-Project/blob/master/shop_login.sql)

After setting the **MySQL** server you need to open the SQL folder that included with the Shop archive and excute the sql files inside the MySQL server using `phpMyAdmin` (you can download it [from here](https://www.phpmyadmin.net/downloads/)), 

Then You need to edit the Config.php and the Admin/Config.php, Put all your correct **MySQL** & **SQLserver** connection information.

- When you add a new item the item goes to the **MySQL** database.
- When the player buy a new item the item will go to the BILLING database. in **SQLserver**
- The point table is inside the Auth database in **SQLserver**.