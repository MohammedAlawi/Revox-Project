<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
class querydb extends index {

    function __construct() {
        parent::__construct();
    }

    function Select($table) {
        try {
            $sth = $this->dbMySql->prepare('SELECT * FROM `' . $table . '`');
            $sth->setFetchMode(PDO::FETCH_ASSOC);
            $sth->execute();
            $data = $sth->fetchAll();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[1001]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    function SelectW($table, $array) {
        try{
            $parts = array();
            foreach ($array as $key => $value) {
                $parts[] = "`" . $key . "` = '" . $value . "'";
            }
            $sth = $this->dbMySql->prepare("SELECT * FROM `$table` WHERE " . implode(" AND ", $parts));
            $sth->setFetchMode(PDO::FETCH_ASSOC);
            $sth->execute();
            $data = $sth->fetchAll();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[1002]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    function SelectWhere($table, $where) {
        try {
            $sth = $this->dbMySql->prepare("SELECT * FROM $table WHERE $where ");
            $sth->setFetchMode(PDO::FETCH_ASSOC);
            $sth->execute();
            $data = $sth->fetchAll();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[1003]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    function Insert($table, $array) {
        try {
            $kayval = array_keys($array);
            $sth = $this->dbMySql->prepare("INSERT INTO `$table` (`" . implode('`,`', $kayval) . "`)VALUES('" . implode("','", $array) . "')");
            $data = $sth->execute();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[1004]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    function Update($table, $array, $where) {
        try {
            $parts = array();
            foreach ($array as $key => $value) {
                $parts[] = "`" . $key . "` = '" . $value . "'";
            }
            $sth = $this->dbMySql->prepare("UPDATE `$table` SET " . implode(",", $parts) . " WHERE $where");
            $data = $sth->execute();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[1004]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }
    function UpdateQ($table,  $query) {
        try {
            $sth = $this->dbMySql->prepare("UPDATE `$table` $query");
            $data = $sth->execute();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[1005]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    function Delete($table, $where, $limit = 1) {
        try {
            $sth = $this->dbMySql->prepare("DELETE FROM `$table` WHERE $where LIMIT $limit");
            $data = $sth->execute();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[1006]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

}
