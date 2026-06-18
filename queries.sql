-- ============================================
-- Calgary Public Library Data Analysis
-- Dataset: Calgary Public Library Locations and Hours
-- Source: data.calgary.ca
-- Analyst: Hussein Joumaa
-- ============================================


-- 1. List all branch names and their quadrant (NW, SW, NE, SE)
SELECT 
    name,
    quadrant,
    address
FROM library_locations
ORDER BY quadrant, name;


-- 2. Count how many library branches exist per quadrant
SELECT 
    quadrant,
    COUNT(*) AS branch_count
FROM library_locations
GROUP BY quadrant
ORDER BY branch_count DESC;


-- 3. Find branches that are currently open on weekends
SELECT 
    name,
    saturday_hours,
    sunday_hours
FROM library_locations
WHERE saturday_hours IS NOT NULL 
  AND saturday_hours != 'Closed'
ORDER BY name;


-- 4. Identify branches with the longest weekday hours
-- (useful for resource allocation analysis)
SELECT 
    name,
    monday_hours,
    quadrant
FROM library_locations
WHERE monday_hours IS NOT NULL
  AND monday_hours != 'Closed'
ORDER BY name;


-- 5. Count branches by type (community vs. regional vs. central)
SELECT 
    location_type,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM library_locations), 1) AS percentage
FROM library_locations
GROUP BY location_type
ORDER BY total DESC;

