<?php

/**
 * urlShortener
 *
 * PHP version 5
 *
 * @category  urlShortener
 * @package   urlShortener
 * @author    Mark Roland <code@markroland.com>
 * @copyright 2017 Mark Roland
 * @license   https://opensource.org/licenses/MIT MIT
 * @link      https://github.com/markroland/url-shortener-lib
 **/

namespace markroland;

/**
 * urlShortener Class
 *
 * @category  urlShortener
 * @package   urlShortener
 * @author    Mark Roland <code@markroland.com>
 * @copyright 2017 Mark Roland
 * @license   https://opensource.org/licenses/MIT MIT
 * @version   Release: @package_version@
 * @link      https://github.com/markroland/url-shortener-lib
 **/
class urlShortener
{

    /**
     * @var Database Connection
     */
    private $db_conn;

    /**
     * Class constructor
     *
     * @param string $connection A PDO database connection
     */
    public function __construct(\PDO $connection)
    {
        $this->db_conn = $connection;
    }

    /**
     * Turn a long URL into a short URL
     *
     * @param string $shortcut A short string to use as the path for the URL shortcut
     * @param destination $destination The destination URL
     * @param integer $set_referrer Set to 1 to use a Javascript redirect to set the HTTP Referrer
     * @param string $client_id Associate the shortcut with a specific Client (not required)
     *
     * @return boolean Result of query
     */
    public function create_short_url($shortcut, $destination, $set_referrer = 0, $client_id = 0)
    {
        $result = null;
        try {
            $query = $this->db_conn->prepare('CALL add_shortcut(?,?,?,?, @last_id)');
            $result = $query->execute(array(
                $shortcut,
                $destination,
                $set_referrer,
                $client_id,
            ));
        } catch (\PDOException $e) {
            throw $e;
        }
        return $result;
    }

    /**
     * Updated a shortcut
     *
     * @param string $shortcut A short string to use as the path for the URL shortcut
     * @param destination $destination The destination URL
     * @param integer $set_referrer Set to 1 to use a Javascript redirect to set the HTTP Referrer
     * @param string $client_id Associate the shortcut with a specific Client (not required)
     *
     * @return boolean Result of query
     */
    public function update_short_url($shortcut, $destination, $set_referrer = 0, $client_id = 0)
    {
        $result = null;
        try {
            $query = $this->db_conn->prepare('CALL update_shortcut(?,?,?,?)');
            $result = $query->execute(array(
                $shortcut,
                $destination,
                $set_referrer,
                $client_id,
            ));
        } catch (\PDOException $e) {
            throw $e;
        }
        return $result;
    }

    /**
     * Turn a long URL into a short URL, hosted by http://bit.ly
     *
     * @param string $url Any valid URL
     *
     * @return string A shortened URL starting with "http://bit.ly"
     */
    public function get_url_stats($shortcut)
    {
        $result = null;
        try {
            $query = $this->db_conn->prepare('CALL get_shortcut_tracking(?)');
            $query->execute(array(
                $shortcut
            ));
            $result = $query->fetchAll();
        } catch (\PDOException $e) {
            throw $e;
        }
        return $result;
    }

    /**
     * Get information about shortcuts
     *
     * @param integer An optional Client ID used to filter request.
     *
     * @return array An array of information about the shortcuts
     */
    public function get_shortcuts($client_id = null)
    {
        $result = null;
        try {
            $query = $this->db_conn->prepare('CALL get_shortcuts(?)');
            $query->execute(array(
                $client_id
            ));
            $result = $query->fetchAll();
        } catch (\PDOException $e) {
            throw $e;
        }
        return $result;
    }

    /**
     * Look up a specific shortct
     *
     * @param string The shortcut code string to be looked up
     *
     * @return array An array of data about the shortcut
     */
    public function get_shortcut($shortcut)
    {
        $result = null;
        try {
            $query = $this->db_conn->prepare('CALL get_shortcut(?)');
            $query->execute(array(
                $shortcut
            ));
            $result = $query->fetch();
        } catch (\PDOException $e) {
            throw $e;
        }
        return $result;
    }

    /**
     * Track a shortcut request
     *
     * @param string $shortcut The numerical ID of the requested shortcut
     * @param string $ip_address The IP address that issued the request
     * @param string $source A source of the request
     *
     * @return null
     */
    public function track_shortcut_request($shortcut_id, $ip_address, $source)
    {
        try {
            $query = $this->db_conn->prepare('CALL track_shortcut_request(?,?,?)');
            $query->execute(array(
                $shortcut_id,
                $ip_address,
                $source
            ));
        } catch (\PDOException $e) {
            throw $e;
        }
    }
}
