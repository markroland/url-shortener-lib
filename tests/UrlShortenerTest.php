<?php

namespace markroland\UrlShortener\Tests;

class UrlShortenerTest extends PHPUnit_Framework_TestCase {

    protected $UrlShortener;

    public function setup()
    {

        $this->UrlShortener = new markroland\UrlShortener();
    }

    public function test_get_field_list()
    {
    }
}