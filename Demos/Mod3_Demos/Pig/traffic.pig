-- Load the source data
Source = LOAD '/data/traffic.csv' USING PigStorage(',') AS (year:int, collection_point:int, start:chararray, end:chararray, distance:float, cycles:float, motorbikes:float, cars:float, vans:float, trucks:float);

-- filter the data to remove header row
Data = FILTER Source BY year IS NOT NULL;

-- Group by year
YearGroups = GROUP Data BY year;

-- Aggregate cars
YearlyTotals = FOREACH YearGroups GENERATE group as year, SUM(Data.distance) AS totaldistance, SUM(Data.vans) AS totalvans, SUM(Data.trucks) AS totaltrucks;

-- Sort by year
SortedTotals = ORDER YearlyTotals BY year;

-- Save results
STORE SortedTotals INTO '/data/annual_freight_traffic' USING PigStorage(' ');
