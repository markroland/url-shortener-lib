# URL Shortener Stored Procedures

# Set temporary delimiter
DELIMITER $$

# Begin add_shortcut
DROP PROCEDURE IF EXISTS add_shortcut;
CREATE PROCEDURE add_shortcut(
    shortcut_var VARCHAR(32),
    destination_url_var VARCHAR(2000),
    set_referrer_var TINYINT(1),
    client_id_var SMALLINT(3),
    OUT last_id SMALLINT
)
BEGIN

    INSERT INTO `short_url`
    SET shortcut = shortcut_var,
        destination_url = destination_url_var,
        date_created = NOW(),
        set_referrer = set_referrer_var,
        client_id = client_id_var;

    SET last_id = LAST_INSERT_ID();

END$$
# End add_shortcut

# Begin update_shortcut
DROP PROCEDURE IF EXISTS update_shortcut;
CREATE PROCEDURE update_shortcut(
    shortcut_var VARCHAR(32),
    destination_url_var VARCHAR(2000),
    set_referrer_var TINYINT(1),
    client_id_var SMALLINT(3)
)
BEGIN

    UPDATE `short_url`
    SET destination_url = destination_url_var,
        set_referrer = set_referrer_var,
        client_id = client_id_var
    WHERE shortcut = shortcut_var;

END$$
# End update_shortcut

# Begin get_shortcuts
DROP PROCEDURE IF EXISTS get_shortcuts;
CREATE PROCEDURE get_shortcuts(client_id_var SMALLINT(3))
BEGIN
    IF client_id_var = 0 THEN
        SELECT short_url.*, count(short_url_tracking.shortcut_id) as hits
        FROM short_url
            LEFT JOIN short_url_tracking USING(shortcut_id)
        WHERE client_id = 0
        GROUP BY shortcut_id
        ORDER BY shortcut_id ASC;
    ELSEIF client_id_var > 0 THEN
        SELECT short_url.*, count(short_url_tracking.shortcut_id) as hits
        FROM short_url
            LEFT JOIN short_url_tracking USING(shortcut_id)
        WHERE client_id = client_id_var
        GROUP BY shortcut_id
        ORDER BY shortcut_id ASC;
    ELSE
        SELECT short_url.*, count(short_url_tracking.shortcut_id) as hits
        FROM short_url
            LEFT JOIN short_url_tracking USING(shortcut_id)
        GROUP BY shortcut_id
        ORDER BY shortcut_id ASC;
    END IF;
END$$
# End get_shortcuts

# Begin get_shortcut
DROP PROCEDURE IF EXISTS get_shortcut;
CREATE PROCEDURE get_shortcut(
    shortcut_var VARCHAR(32)
)
BEGIN
    SELECT * FROM `short_url` WHERE shortcut = shortcut_var;
END$$
# End get_shortcut

# Begin get_shortcut_tracking
DROP PROCEDURE IF EXISTS get_shortcut_tracking;
CREATE PROCEDURE get_shortcut_tracking(
    shortcut_var VARCHAR(32)
)
BEGIN
    SELECT * FROM `short_url_tracking` WHERE shortcut = shortcut_var ORDER BY id ASC;
END$$
# End get_shortcut_tracking

# Begin track_shortcut_request
DROP PROCEDURE IF EXISTS track_shortcut_request;
CREATE PROCEDURE track_shortcut_request(
    shortcut_id_var SMALLINT(3),
    ip_address_var VARCHAR(64),
    source_var VARCHAR(32)
)
BEGIN
    INSERT INTO `short_url_tracking`
    SET shortcut_id = shortcut_id_var,
        request_time = NOW(),
        ip_address = INET_ATON(ip_address_var),
        source = source_var;
END$$
# End track_shortcut_request
