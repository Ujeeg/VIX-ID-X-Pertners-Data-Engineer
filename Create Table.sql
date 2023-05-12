Create Table DimCustomer (
CustomerID INT NOT NULL,
CustomerName varchar(50) Not null,
Age INT not null,
Gender varchar(50) not null,
City varchar(50) not null,
NoHP varchar (50) not null,
constraint PK_DimCostumer Primary key (Customerid)
);

Create Table DimProduct (
ProductID INT not null,
ProductName varchar(255) not null,
ProductCategory varchar(255) not null,
ProductUnitPrice INT not null,
constraint PK_DimProduct Primary Key (ProductID)
);

Create Table DimStatusOrder (
StatusID INT not null,
StatusOrder varchar(50) not null,
StatusOrderDESC varchar(50) not null,
constraint PK_DimStatusOrder Primary Key (StatusID)
);

Create Table FactSalesOrder (
OrderID INT not null,
CustomerID INT not null,
ProductID INT not null,
Quantity INT not null,
Amount INT not null,
StatusID INT not null,
OrderDAte DATE not null,
constraint PK_FactSalesOrder Primary Key (OrderID),

constraint FK_DimCustomer Foreign Key (CustomerID)
references DimCustomer(CustomerID),

constraint FK_DimProduct Foreign Key (ProductID)
references DimProduct(ProductID),

constraint FK_DimStatusOrder Foreign Key (StatusID)
references DimStatusOrder(StatusID)
);


