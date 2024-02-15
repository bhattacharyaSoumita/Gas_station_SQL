USE [GAS STATION]
GO
/*checkinh whether thete is any duplicate value in primary key */
SELECT [Fill ID],
Count(*) AS [Count]
FROM [dbo].[Gas Station Fills]
GROUP BY [Fill ID]
HAVING Count(*) <> 1;


/*Altering Tables to add the constraints */

ALTER TABLE [dbo].[Gas Station Fills]
ALTER COLUMN [Fill ID] NVARCHAR (50) NOT NULL
;

ALTER TABLE [dbo].[Gas Station Fills]
ALTER COLUMN [Vehicle ID] NVARCHAR (50) NOT NULL
;

ALTER TABLE [dbo].[Vehicles]
ALTER COLUMN [Vehicle ID] NVARCHAR (50) NOT NULL
;

--Defining the Keys
--PK

ALTER TABLE [dbo].[Gas Station Fills]
ADD PRIMARY KEY ([Fill ID]);

ALTER TABLE [dbo].[Vehicles]
ADD PRIMARY KEY ([Vehicle ID]);

--FK
ALTER TABLE [dbo].[Gas Station Fills]
ADD FOREIGN KEY ([Vehicle ID])
REFERENCES [dbo].[Vehicles] ([Vehicle ID]);


--Created Master Table by Joining Gas Station Fills Table and Vehicles Tables

SELECT A.[Fill ID],
       A.[Vehicle ID],
	   A.[Fuel Type],
	   A.[Cost of Fill (£)],
	   A.[Customer Membership],
	   B.[Vehicle Name],
	   B.[Vehicle Type],
	   B.[Vehicle Cost (£)]

INTO [Gas Station - Master]	

FROM [dbo].[Gas Station Fills] AS A
LEFT JOIN [dbo].[Vehicles] AS B
ON A.[Vehicle ID] = B.[Vehicle ID]

SELECT * FROM [Gas Station - Master]



