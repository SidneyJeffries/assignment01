/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here
SELECT
  s.id   AS station_id,
  s.geom AS station_geog,
  COUNT(*) AS num_trips
FROM (
    SELECT start_time, start_station::int AS start_station
    FROM indego.indego_trips_2021_q3

    UNION ALL

    SELECT start_time, start_station::int AS start_station
    FROM indego.indego_trips_2022_q3
) AS t
JOIN indego.station_status AS s
  ON s.id = t.start_station
WHERE EXTRACT(HOUR FROM t.start_time) BETWEEN 7 AND 9
GROUP BY
  s.id,
  s.geom
ORDER BY
  num_trips DESC
LIMIT 5;

/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
