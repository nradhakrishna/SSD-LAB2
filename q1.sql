DELIMITER $$

CREATE PROCEDURE    ListAllSubscribers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE subName VARCHAR(100);

    -- Cursor for subscriber names
    DECLARE cur CURSOR FOR 
        SELECT SubscriberName FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Create a temporary table to store results
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_subs (
        Subscriber VARCHAR(100)
    );
    TRUNCATE temp_subs;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO subName;
        IF done = 1 THEN 
            LEAVE read_loop;
        END IF;

        -- Insert each name into temp table
        INSERT INTO temp_subs VALUES (subName);
    END LOOP;

    CLOSE cur;

    -- Return all subscriber names
    SELECT * FROM temp_subs;
END$$

DELIMITER ;
