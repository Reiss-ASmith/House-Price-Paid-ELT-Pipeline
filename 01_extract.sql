--imports files into tables above
COPY raw_house_data.local_authority_districts_map 
FROM '/imports/local_authority_districts_map.csv'
WITH (FORMAT csv, DELIMITER ',', HEADER true);

COPY raw_house_data.house_price_paid
FROM '/imports/pp-complete.csv'
WITH (FORMAT csv, DELIMITER ',', HEADER false);