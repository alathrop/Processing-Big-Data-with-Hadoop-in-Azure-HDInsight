-- Load the source data
RawLog = LOAD '$InputFolder' USING PigStorage('\t') AS (level:chararray, datetime:chararray, source:chararray, event_id:int, details:chararray);

-- filter the data to remove invalid rows
Log = FILTER RawLog BY event_id IS NOT NULL;

-- Save results
STORE Log INTO '$OutputFolder' USING PigStorage('\t');