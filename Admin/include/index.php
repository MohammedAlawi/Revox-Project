<?php
class index {

    function __construct() {
		//if(GET_DATA_ITEM_FROM_SQLSERVER === true)
		$this->dbSql = new DatabaseSQL();
		$this->dbMySql = new Database();
    }

}
