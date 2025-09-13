/* ==============================================================================
   SQL CTAS
-------------------------------------------------------------------------------
   This script creates a permanent table for screenshot
=================================================================================
*/

SELECT
   *
INTO Sales.MonthlyOrders
FROM Sales.Orders
WHERE ;

/* ==============================================================================
   SQL Temporary Tables
-------------------------------------------------------------------------------
   This script provides a generic example of data migration using a temporary
   table. 
=================================================================================
*/

!!!Important: # is needed for creating temporary table

/* ==============================================================================
   Step 1: Create Temporary Table (#Orders)
============================================================================== */
SELECT
    *
INTO #Orders
FROM Sales.Orders;
  
/* ==============================================================================
   Step 2: Clean Data in Temporary Table
============================================================================== */
DELETE FROM #Orders
WHERE OrderStatus = 'Delivered';
  
/* ==============================================================================
   Step 3: Load Cleaned Data into Permanent Table (Sales.OrdersTest)
============================================================================== */
SELECT
    *
INTO Sales.OrdersTest
FROM #Orders;

!!!Important: It's adviced to use VIEW or CTAS for storing the data, temporary table is only used for temporary result

   Priority: VIEW -> CTE -> SubQuery -> CTAS -> Temporary Table

