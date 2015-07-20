
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/20/2015 19:59:47
-- Generated from EDMX file: C:\temp\crusaders_service\CrusadersService\CrusadersModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_GameTicket]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tickets] DROP CONSTRAINT [FK_GameTicket];
GO
IF OBJECT_ID(N'[dbo].[FK_ResultsGames]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Games1] DROP CONSTRAINT [FK_ResultsGames];
GO
IF OBJECT_ID(N'[dbo].[FK_PlayerGame_Player]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlayerGame] DROP CONSTRAINT [FK_PlayerGame_Player];
GO
IF OBJECT_ID(N'[dbo].[FK_PlayerGame_Game]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlayerGame] DROP CONSTRAINT [FK_PlayerGame_Game];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Games1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Games1];
GO
IF OBJECT_ID(N'[dbo].[GameResults]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GameResults];
GO
IF OBJECT_ID(N'[dbo].[Players]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Players];
GO
IF OBJECT_ID(N'[dbo].[Tickets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tickets];
GO
IF OBJECT_ID(N'[dbo].[PlayerGame]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlayerGame];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Games1'
CREATE TABLE [dbo].[Games1] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Opponent] nvarchar(max)  NOT NULL,
    [Venue] nvarchar(max)  NOT NULL,
    [Comp] nvarchar(max)  NOT NULL,
    [Data] nvarchar(max)  NOT NULL,
    [Image] nvarchar(max)  NOT NULL,
    [Result_id] int  NULL,
    [Player_id] int  NULL
);
GO

-- Creating table 'GameResults'
CREATE TABLE [dbo].[GameResults] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Result] bit  NOT NULL,
    [Opponent] nvarchar(max)  NOT NULL,
    [Venue] nvarchar(max)  NOT NULL,
    [Comp] nvarchar(max)  NOT NULL,
    [Data] nvarchar(max)  NOT NULL,
    [Points] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Players'
CREATE TABLE [dbo].[Players] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Number] nvarchar(max)  NOT NULL,
    [FamilyName] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Position] nvarchar(max)  NOT NULL,
    [Avatar] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Tickets'
CREATE TABLE [dbo].[Tickets] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Game_id] int  NULL,
    [AgeOrType] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PlayerGame'
CREATE TABLE [dbo].[PlayerGame] (
    [Players_id] int  NOT NULL,
    [Games_id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Games1'
ALTER TABLE [dbo].[Games1]
ADD CONSTRAINT [PK_Games1]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'GameResults'
ALTER TABLE [dbo].[GameResults]
ADD CONSTRAINT [PK_GameResults]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Players'
ALTER TABLE [dbo].[Players]
ADD CONSTRAINT [PK_Players]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [PK_Tickets]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Players_id], [Games_id] in table 'PlayerGame'
ALTER TABLE [dbo].[PlayerGame]
ADD CONSTRAINT [PK_PlayerGame]
    PRIMARY KEY NONCLUSTERED ([Players_id], [Games_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Game_id] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [FK_GameTicket]
    FOREIGN KEY ([Game_id])
    REFERENCES [dbo].[Games1]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_GameTicket'
CREATE INDEX [IX_FK_GameTicket]
ON [dbo].[Tickets]
    ([Game_id]);
GO

-- Creating foreign key on [Result_id] in table 'Games1'
ALTER TABLE [dbo].[Games1]
ADD CONSTRAINT [FK_ResultsGames]
    FOREIGN KEY ([Result_id])
    REFERENCES [dbo].[GameResults]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ResultsGames'
CREATE INDEX [IX_FK_ResultsGames]
ON [dbo].[Games1]
    ([Result_id]);
GO

-- Creating foreign key on [Players_id] in table 'PlayerGame'
ALTER TABLE [dbo].[PlayerGame]
ADD CONSTRAINT [FK_PlayerGame_Player]
    FOREIGN KEY ([Players_id])
    REFERENCES [dbo].[Players]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Games_id] in table 'PlayerGame'
ALTER TABLE [dbo].[PlayerGame]
ADD CONSTRAINT [FK_PlayerGame_Game]
    FOREIGN KEY ([Games_id])
    REFERENCES [dbo].[Games1]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayerGame_Game'
CREATE INDEX [IX_FK_PlayerGame_Game]
ON [dbo].[PlayerGame]
    ([Games_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------