CREATE TABLE systemlog
(event_time DATETIME,
 level VARCHAR(20),
 source VARCHAR(30),
 event_id INTEGER,
 category VARCHAR(20),
 details VARCHAR(MAX)
);