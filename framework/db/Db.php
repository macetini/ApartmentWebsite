<?php

final class Db {

    private $dbName;
    private $userName;
    private $password;
    public $conn;
    
    private static $_instance = null;
   
    public $sqlArr;

    private function __clone() {}

    private function __construct() {
        
        $this->sqlArr = parse_ini_file("sql/data.ini");       
        
	$this->dbName = "apartment_website";
        
        $this->userName = "macetini";
        
        $this->password = "secret";

        try {
            $this->conn = new PDO('mysql:host=localhost;dbname='.
                    $this->dbName,
                    $this->userName,
                    $this->password);
           
            $this->conn->setAttribute(
                    PDO::ATTR_ERRMODE, 
                    PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo 'ERROR: ' . $e->getMessage();
        }
    }

    public static function getInstance() {
        
        if (!is_object(self::$_instance)) {
            self::$_instance = new Db();
        }

        return self::$_instance;
    }

    public static function query($query) {
        
        $dbConn = Db::getInstance()->conn;

        $result = $dbConn->query($query, PDO::FETCH_ASSOC);

        return $result;
    }
    
    public static function callQuery($queryKey)
    {
        $sqlArr = Db::getInstance()->sqlArr;
                
        $sql = $sqlArr[$queryKey];
        
        $dbConn = Db::getInstance()->conn;
        
        $result = $dbConn->query($sql);

        return $result->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public static function callArg($queryKey, $arg)
    {
        $sqlArr = Db::getInstance()->sqlArr;
                
        $sql = $sqlArr[$queryKey];
        
        $dbConn = Db::getInstance()->conn;
        
        $sth = $dbConn->prepare($sql);
        
        $sth->execute($arg);
        
        return $sth->fetchAll(PDO::FETCH_ASSOC);
    }
}

?>