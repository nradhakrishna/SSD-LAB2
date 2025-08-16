# Lab 2 - SQL Stored Procedures and Cursors
# Course: CS6.302 - Software System Development

## Student Details
Roll Number: 2025201069


---

## Steps to Execute

1. Open MySQL Workbench.
2. Create and select the database:
   CREATE DATABASE lab2;
   USE lab2;

3. Create the required tables and insert the sample data (given in the assignment).
   - Shows
   - Subscribers
   - WatchHistory

4. Load each procedure by running the corresponding SQL file in order:
   - q1.sql → Creates ListAllSubscribers()
   - q2.sql → Creates GetWatchHistoryBySubscriber(IN sub_id INT)
   - q3.sql → Creates AddSubscriberIfNotExists(IN subName VARCHAR(100))
   - q4.sql → Creates SendWatchTimeReport()
   - q5.sql → Creates GetAllSubscribersWatchHistory()

5. To test each procedure (not included in submission files), run:
   CALL ListAllSubscribers();
   CALL GetWatchHistoryBySubscriber(1);
   CALL AddSubscriberIfNotExists('Alex Johnson');
   CALL SendWatchTimeReport();
   CALL GetAllSubscribersWatchHistory();

---

## Approach / Explanation

- **Q1: ListAllSubscribers()**
  - Used a CURSOR to iterate over the `Subscribers` table row by row.
  - Fetched each subscriber name into a variable and printed it.

- **Q2: GetWatchHistoryBySubscriber(IN sub_id INT)**
  - Took a subscriber ID as input.
  - Used a JOIN between `WatchHistory` and `Shows` to return show title, genre, release year, and watch time.

- **Q3: AddSubscriberIfNotExists(IN subName VARCHAR(100))**
  - Checked if the subscriber already exists using `COUNT(*)`.
  - Inserted the new subscriber only if not found, with `CURDATE()` as subscription date.

- **Q4: SendWatchTimeReport()**
  - Declared a CURSOR over all subscribers with at least one watch record.
  - For each subscriber, called Q2 (`GetWatchHistoryBySubscriber`) to display their watch history.

- **Q5: GetAllSubscribersWatchHistory()**
  - Declared a CURSOR over **all subscribers**, even those with no watch history.
  - Called Q2 for each subscriber so their watch history (or empty result) is displayed.

---

## Git Repository
GitHub Repo Link: https://github.com/nradhakrishna/SSD-LAB2