CREATE OR REPLACE VIEW house_data.v_median_price_per_district_year AS
SELECT
d.lad23cd,
d.district,
EXTRACT(YEAR FROM p."date")::int AS year,
ROUND(percentile_cont(0.5) WITHIN GROUP (ORDER BY p.price)::numeric, 2) AS median_price
FROM house_data.house_price_paid p
JOIN house_data.districts d ON d.district_id = p.district_id
GROUP BY d.lad23cd, d.district, EXTRACT(YEAR FROM p."date");

CREATE OR REPLACE VIEW house_data.v_median_price_per_county_year AS
SELECT
c.county,
EXTRACT(YEAR FROM p."date")::int AS year,
ROUND(percentile_cont(0.5) WITHIN GROUP (ORDER BY p.price)::numeric, 2) AS median_price
FROM house_data.house_price_paid p
JOIN house_data.districts d ON d.district_id = p.district_id
JOIN house_data.counties c ON c.county_id = d.county_id
GROUP BY c.county, EXTRACT(YEAR FROM p."date");

CREATE OR REPLACE VIEW house_data.v_median_price_per_month_year AS
SELECT
EXTRACT(YEAR FROM p."date")::int  AS year,
EXTRACT(MONTH FROM p."date")::int AS month,
ROUND(percentile_cont(0.5) WITHIN GROUP (ORDER BY p.price)::numeric, 2) AS median_price
FROM house_data.house_price_paid p
GROUP BY EXTRACT(YEAR FROM p."date"), EXTRACT(MONTH FROM p."date");

CREATE OR REPLACE VIEW house_data.v_total_sales_per_district_year AS
SELECT
d.lad23cd,
d.district,
EXTRACT(YEAR FROM p."date")::int AS year,
COUNT(*) AS total_house_sales
FROM house_data.house_price_paid p
JOIN house_data.districts d ON d.district_id = p.district_id
GROUP BY d.lad23cd, d.district, EXTRACT(YEAR FROM p."date");

CREATE OR REPLACE VIEW house_data.v_total_sales_per_county_year AS
SELECT
c.county,
EXTRACT(YEAR FROM p."date")::int AS year,
COUNT(*) AS total_house_sales
FROM house_data.house_price_paid p
JOIN house_data.districts d ON d.district_id = p.district_id
JOIN house_data.counties c ON c.county_id = d.county_id
GROUP BY c.county, EXTRACT(YEAR FROM p."date");

CREATE OR REPLACE VIEW house_data.v_median_price_per_year AS
SELECT
EXTRACT(YEAR FROM p."date")::int AS year,
ROUND(percentile_cont(0.5) WITHIN GROUP (ORDER BY p.price)::numeric, 2) AS median_price
FROM house_data.house_price_paid p
GROUP BY EXTRACT(YEAR FROM p."date");
