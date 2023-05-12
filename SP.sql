CREATE PROCEDURE summary_order_status
  @StatusID INT
AS
BEGIN
  SELECT 
    a.OrderID,
    b.CustomerName,
    c.ProductName,
    a.Quantity,
    a.StatusID
  FROM dbo.FactSalesOrder a
  INNER JOIN dbo.DimCustomer b ON a.CustomerID = b.CustomerID
  INNER JOIN dbo.DimProduct c ON a.ProductID = c.ProductID
  WHERE a.StatusID = @StatusID;
END;
