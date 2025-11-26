SELECT TOP 10    -- Menampilkan 10 produk dengan total pendapatan terbesar
    ProductID,
    SUM(LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 2
GROUP BY ProductID
HAVING SUM(LineTotal) > 50000
ORDER BY TotalRevenue DESC;

SELECT ProductID, SUM(OrderQty) AS TotalQty   -- Menampilkan ProductID dan total jumlah OrderQty per produk
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

SELECT ProductID, SUM(OrderQty) AS TotalQty -- Menampilkan produk yang memiliki OrderQty di atas rata-rata
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) > (
    SELECT AVG(OrderQty) FROM Sales.SalesOrderDetail
);

SELECT SalesOrderID, SUM(LineTotal) AS TotalRevenue -- Menampilkan total pendapatan per SalesOrderID
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY TotalRevenue DESC;

SELECT TOP 5 ProductID, LineTotal --  Menampilkan 5 produk dengan LineTotal terbesar
FROM Sales.SalesOrderDetail
ORDER BY LineTotal DESC;

SELECT ProductID, OrderQty, LineTotal  -- Menampilkan produk dengan OrderQty minimal 5 dan LineTotal > 10.000
FROM Sales.SalesOrderDetail
WHERE OrderQty >= 5 AND LineTotal > 10000;

SELECT ProductID, SUM(LineTotal) AS TotalRevenue -- Menampilkan 5 produk urutan ke-11 sampai ke-15 berdasarkan pendapatan
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY TotalRevenue DESC
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY;
