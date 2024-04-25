--  lists all bands with Glam rock as their main style, ranked by their longevity

-- Write a SQL script that lists all bands with Glam rock as their main style, ranked by their longevity

-- Requirements:

-- Import this table dump: metal_bands.sql.zip
-- Column names must be: band_name and lifespan (in years until 2022 - please use 2022 instead of YEAR(CURDATE()))
-- You should use attributes formed and split for computing the lifespan
-- Your script can be executed on any database

-- Solution:

SELECT band_name, 
       (YEAR('2022-01-01') - formed) - IF(split = 0, formed, split) AS lifespan
  FROM bands
 WHERE style LIKE '%Glam rock%'
 ORDER BY lifespan DESC, band_name ASC;