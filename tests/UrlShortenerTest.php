<?php

namespace markroland\UrlShortener\Tests;

class UrlShortenerTest extends \PHPUnit_Framework_TestCase {

    protected static $UrlShortener;

    protected static $pdo_conn;

    /*
    public function setup()
    {

        // Connect to database
        try {
            self::$pdo_conn = new \PDO(
                'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=' . DB_CHARSET . '',
                DB_USER,
                DB_PASSWORD
            );
            self::$pdo_conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        } catch (\PDOException $e) {
            // print($e->getMessage() . PHP_EOL);
        }

        self::$UrlShortener = new \markroland\UrlShortener(self::$pdo_conn);
    }
    //*/

    public function test_get_field_list()
    {
    }
}