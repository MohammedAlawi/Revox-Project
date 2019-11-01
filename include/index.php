<?php
class index {

    function __construct() {
        $this->dbMySql = new Database();
		$this->dbSql = new DatabaseSQL();
    }

}
