
-- Find activities within 5 miles of Times Square (40.7580° N, 73.9855° W)
DECLARE @lat DECIMAL(12,9) = 40.7580
DECLARE @long DECIMAL(12,9) = -73.9855

SELECT a.Name, l.Name AS Location, 
    (3959 * ACOS(
        COS(RADIANS(@lat)) * COS(RADIANS(l.Latitude)) * 
        COS(RADIANS(l.Longitude) - RADIANS(@long)) + 
        SIN(RADIANS(@lat)) * SIN(RADIANS(l.Latitude))
    )) AS DistanceMiles
FROM Activity.Activity a
JOIN Entity.Location l ON a.LocationID = l.LocationID
WHERE (3959 * ACOS(
        COS(RADIANS(@lat)) * COS(RADIANS(l.Latitude)) * 
        COS(RADIANS(l.Longitude) - RADIANS(@long)) + 
        SIN(RADIANS(@lat)) * SIN(RADIANS(l.Latitude))
    )) <= 5
ORDER BY DistanceMiles
