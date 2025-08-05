CREATE TABLE [dbo].[FactSalesOrder] (

	[SalesOrderKey] int NOT NULL, 
	[SalesOrderDateKey] int NOT NULL, 
	[ProductKey] int NOT NULL, 
	[CustomerKey] int NOT NULL, 
	[Quantity] int NULL, 
	[SalesTotal] decimal(18,0) NULL
);


GO
ALTER TABLE [dbo].[FactSalesOrder] ADD CONSTRAINT FK_6558101e_677e_4db2_bdce_aee1fb86d5e8 FOREIGN KEY ([SalesOrderDateKey]) REFERENCES [dbo].[DimDate]([DateKey]);
GO
ALTER TABLE [dbo].[FactSalesOrder] ADD CONSTRAINT FK_747ed2c3_eeb7_45e2_bbc8_667ac33e724e FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct]([ProductKey]);
GO
ALTER TABLE [dbo].[FactSalesOrder] ADD CONSTRAINT FK_87059a1b_4d1c_4279_b41f_c486e890c4ca FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer]([CustomerKey]);