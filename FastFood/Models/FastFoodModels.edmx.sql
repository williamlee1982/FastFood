
-- --------------------------------------------------
-- Date Created: 03/22/2011 22:27:12
-- compatible SQLite
-- Generated from EDMX file: e:\documents\Visual Studio 2010\Projects\FastFood\FastFood\Models\FastFoodModels.edmx
-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

    
	DROP TABLE if exists [Orders];
    
	DROP TABLE if exists [SubOrders];
    
	DROP TABLE if exists [Customers];
    
	DROP TABLE if exists [SideDishes];
    
	DROP TABLE if exists [SubOrderTemplates];
    
	DROP TABLE if exists [Dishes];

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Orders'
CREATE TABLE [Orders] (
    [ID] integer PRIMARY KEY AUTOINCREMENT  NOT NULL ,
    [OrderDate] datetime   NOT NULL ,
    [Customer_ID] integer   NOT NULL ,
    [SideDish_ID] integer   NOT NULL 
			
		,CONSTRAINT [FK_OrderCustomer]
    		FOREIGN KEY ([Customer_ID])
    		REFERENCES [Customers] ([ID])					
    		
						
		,CONSTRAINT [FK_OrderRecipe]
    		FOREIGN KEY ([SideDish_ID])
    		REFERENCES [SideDishes] ([ID])					
    		
			);

-- Creating table 'SubOrders'
CREATE TABLE [SubOrders] (
    [ID] integer PRIMARY KEY AUTOINCREMENT  NOT NULL ,
    [OrderID] integer   NOT NULL ,
    [Recipient] nvarchar(2147483647)   NOT NULL ,
    [RecipientAddress] nvarchar(2147483647)   NOT NULL 
			
		,CONSTRAINT [FK_OrderSubOrder]
    		FOREIGN KEY ([OrderID])
    		REFERENCES [Orders] ([ID])					
    		
			);

-- Creating table 'Customers'
CREATE TABLE [Customers] (
    [ID] integer PRIMARY KEY AUTOINCREMENT  NOT NULL 
);

-- Creating table 'SideDishes'
CREATE TABLE [SideDishes] (
    [ID] integer PRIMARY KEY AUTOINCREMENT  NOT NULL 
);

-- Creating table 'SubOrderTemplates'
CREATE TABLE [SubOrderTemplates] (
    [ID] integer PRIMARY KEY AUTOINCREMENT  NOT NULL ,
    [CustomerID] integer   NOT NULL ,
    [Recipient] nvarchar(2147483647)   NOT NULL ,
    [RecipientAddress] nvarchar(2147483647)   NOT NULL ,
    [Code] nvarchar(2147483647)   NOT NULL 
			
		,CONSTRAINT [FK_CustomerSubOrderTemplate]
    		FOREIGN KEY ([CustomerID])
    		REFERENCES [Customers] ([ID])					
    		
			);

-- Creating table 'Dishes'
CREATE TABLE [Dishes] (
    [ID] integer PRIMARY KEY AUTOINCREMENT  NOT NULL ,
    [SubOrderDish_Dish_ID] integer   NOT NULL 
			
		,CONSTRAINT [FK_SubOrderDish]
    		FOREIGN KEY ([SubOrderDish_Dish_ID])
    		REFERENCES [SubOrders] ([ID])					
    		
			);


-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------