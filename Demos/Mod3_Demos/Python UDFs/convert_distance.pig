REGISTER 'wasb:///data/convert_distance.py' using jython as convert_distance;

-- Load the freight traffic data
Source = LOAD '/data/annual_freight_traffic' AS (traffic:chararray);

-- use the UDF to structure and convert the data
ConvertedTraffic = FOREACH Source GENERATE FLATTEN(convert_distance.to_miles(traffic));

-- Save the results
STORE ConvertedTraffic INTO '/data/freight_miles';



