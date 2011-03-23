
-- --------------------------------------------------
-- Date Created: 03/22/2011 23:43:09
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
    
	DROP TABLE if exists [OrderedDishes];
    
	DROP TABLE if exists [DishUnits];

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
    [ID] integer PRIMARY KEY AUTOINCREMENT  NOT NULL 
);

-- Creating table 'OrderedDishes'
CREATE TABLE [OrderedDishes] (
    [ID] integer PRIMARY KEY AUTOINCREMENT  NOT NULL ,
    [SubOrderID] integer   NOT NULL ,
    [PreOrderAmount] integer   NOT NULL ,
    [ActualOrderAmount] integer   NOT NULL ,
    [DeliveryAmount] integer   NOT NULL ,
    [DeliveriedAmount] nvarchar(2147483647)   NOT NULL ,
    [AccountingDeliveriedAmount] nvarchar(2147483647)   NOT NULL ,
    [OrderedDishDish_OrderedDish_ID] integer   NOT NULL ,
    [DishUnit_ID] integer   NOT NULL 
			
		,CONSTRAINT [FK_OrderedDishDish]
    		FOREIGN KEY ([OrderedDishDish_OrderedDish_ID])
    		REFERENCES [Dishes] ([ID])					
    		
						
		,CONSTRAINT [FK_SubOrderOrderedDish]
    		FOREIGN KEY ([SubOrderID])
    		REFERENCES [SubOrders] ([ID])					
    		
						
		,CONSTRAINT [FK_OrderedDishDishUnit]
    		FOREIGN KEY ([DishUnit_ID])
    		REFERENCES [DishUnits] ([ID])					
    		
			);

-- Creating table 'DishUnits'
CREATE TABLE [DishUnits] (
    [ID] integer PRIMARY KEY AUTOINCREMENT  NOT NULL ,
    [Unit] nvarchar(2147483647)   NOT NULL ,
    [Dish_ID] integer   NOT NULL 
			
		,CONSTRAINT [FK_DishUnitDish]
    		FOREIGN KEY ([Dish_ID])
    		REFERENCES [Dishes] ([ID])					
    		
			);


-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------