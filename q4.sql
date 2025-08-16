DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sid INT;

    -- Cursor to loop over all subscriber IDs
    DECLARE cur CURSOR FOR
        SELECT DISTINCT SubscriberID
        FROM WatchHistory;  -- only those who have watched something

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sid;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Call your existing procedure for each subscriber
        CALL GetWatchHistoryBySubscriber(sid);

    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
