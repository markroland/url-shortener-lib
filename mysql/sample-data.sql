INSERT INTO `short_url` (`shortcut_id`, `shortcut`, `destination_url`, `date_created`, `set_referrer`, `client_id`)
VALUES
    (1, 'google', 'http://google.com', '2017-01-25 12:00:00', 0, 1),
    (2, 'yahoo', 'http://yahoo.com', '2017-01-25 12:00:00', 1, 0),
    (3, 'qsa-test', 'http://google.com?foo=x', '2017-01-25 12:00:00', 0, 0);
