# URL Shortener Library

This is a library to manage database storage of short URLs

    Copyright 2017 Mark Roland.
    Released under the MIT license.

## TODO:

 - Write unit tests
 - Test build processes (phpunit, phpcs, phpdoc, build.xml)

## Installation

```sh
    composer require markroland/url-shortener-lib
```

## Build

### Build using Phing

```sh
    phing
```

```sh
    phing phpdoc
```

```sh
    phing phpcs
```

### PHPUnit

```sh
    phpunit --bootstrap tests/bootstrap.php tests
```

### Code Coverage

```sh
    phpunit --coverage-html ./report ./tests
```

### PHP Documentation

PHP Documentation is compiled using [phpDocumentor](http://www.phpdoc.org), which is assumed
to be installed globally on the server. It uses phpdoc.dist.xml for runtime configuration.

```sh
    phpdoc
```

### Code Sniff

```sh
    phpcs -n --report-width=100 ./src
```
