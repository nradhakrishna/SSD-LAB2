
delimiter $$
 create procedure p2(IN s_id INT)
 begin 
 select Shows.Title, WatchHistory.WatchTime from Shows join WatchHistory on Shows.ShowID=WatchHistory.ShowID where WatchHistory.SubscriberID=s_id;
 END$$
 delimiter ;