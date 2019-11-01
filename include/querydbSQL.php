<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
class querydbSQL extends index {

    function __construct() {
        parent::__construct();
    }

    function Select($dbname, $table) {
        try {
            $sth = $this->dbSql->prepare('SELECT * FROM [' . $dbname . '].[dbo].[' . $table . ']');
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
				echo "[2001]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    public function SelectW($dbname, $table, $array) {
        try{
            $parts = array();
            foreach ($array as $key => $value) {
                $parts[] = "[" . $key . "] = '" . $value . "'";
            }
            $sth = $this->dbSql->prepare("SELECT * FROM [$dbname].[dbo].[$table] WHERE " . implode(" AND ", $parts));
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
				echo "[2002]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    function SelectWhere($dbname, $table, $where) {
        try {
            $sth = $this->dbSql->prepare("SELECT * FROM [$dbname].[dbo].[$table] WHERE $where ");
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
				echo "[2003]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    function Insert($dbname, $table, $array) {
        try {
            $kayval = array_keys($array);
            $sth = $this->dbSql->prepare("INSERT INTO [$dbname].[dbo].[$table] ([" . implode('],[', $kayval) . "])VALUES('" . implode("','", $array) . "')");
            $data = $sth->execute();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[2004]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    function Update($dbname, $table, $array, $where) {
        try {
            $parts = array();
            foreach ($array as $key => $value) {
                $parts[] = "[" . $key . "] = '" . $value . "'";
            }
            $sth = $this->dbSql->prepare("UPDATE [$dbname].[dbo].[$table] SET " . implode(",", $parts) . " WHERE $where");
            $data = $sth->execute();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[2004]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }
    function UpdateQ($dbname, $table,  $query) {
        try {
            $sth = $this->dbSql->prepare("UPDATE [$dbname].[dbo].[$table] $query");
            $data = $sth->execute();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[2005]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

    function Delete($dbname, $table, $where, $limit = 1) {
        try {
            $sth = $this->dbSql->prepare("DELETE FROM [$dbname].[dbo].[$table] WHERE $where LIMIT $limit");
            $data = $sth->execute();
            return $data;
        } catch (Exception $ex) {
            if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[2006]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }

}
