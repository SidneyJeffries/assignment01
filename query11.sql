/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

-- Enter your SQL query here
SELECT
  s.id AS station_id,
  s.geom AS station_geog,
  ROUND(
    ST_Distance(
      s.geom::geography,
      ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::geography
    ) / 50.0
  ) * 50 AS distance
FROM indego.station_status AS s
ORDER BY distance;

