CREATE TABLE [dbo].[DimDate] (

	[DateKey] int NOT NULL, 
	[DateAltKey] date NOT NULL, 
	[DayOfWeek] int NOT NULL, 
	[WeekDayName] varchar(10) NULL, 
	[DayOfMonth] int NOT NULL, 
	[Month] int NOT NULL, 
	[MonthName] varchar(12) NULL, 
	[Year] int NOT NULL
);


GO
ALTER TABLE [dbo].[DimDate] ADD CONSTRAINT UQ_ee3ac542_4ddf_445f_a824_a1806d1259d4 unique NONCLUSTERED ([DateKey]);