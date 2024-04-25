--  lists all bands with Glam rock as their main style, ranked by their longevity

SELECT band_name, 
       (YEAR(MAX(end_date)) - YEAR(MIN(start_date)) + 1) AS longevity
  FROM bands
 WHERE band_id IN (SELECT band_id
                     FROM band_styles
                    WHERE style_id = (SELECT style_id
                                        FROM styles
                                       WHERE style_name = 'Glam rock'))
 GROUP BY band_name
 ORDER BY longevity DESC, band_name ASC;