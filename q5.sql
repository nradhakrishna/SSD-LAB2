DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport2()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sid INT;

    -- Cursor to get all subscribers
    DECLARE cur CURSOR FOR
        SELECT SubscriberID FROM Subscribers;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sid;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Call procedure for each subscriber
        CALL GetWatchHistoryBySubscriber(sid);

    END LOOP;

    CLOSE cur;
END$$

DELIMITER ;
