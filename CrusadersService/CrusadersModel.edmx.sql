
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 07/20/2015 12:04:32
-- Generated from EDMX file: C:\temp\Crusaders\CrusadersService\CrusadersService\CrusadersModel.edmx
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
IF OBJECT_ID(N'[dbo].[FK_PlayersGames]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Games1] DROP CONSTRAINT [FK_PlayersGames];
GO
IF OBJECT_ID(N'[dbo].[FK_ResultsGames]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Games1] DROP CONSTRAINT [FK_ResultsGames];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Games1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Games1];
GO
IF OBJECT_ID(N'[dbo].[GamesResults]', 'U') IS NOT NULL
    DROP TABLE [dbo].[GamesResults];
GO
IF OBJECT_ID(N'[dbo].[Players1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Players1];
GO
IF OBJECT_ID(N'[dbo].[Tickets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tickets];
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

-- Creating table 'GamesResults'
CREATE TABLE [dbo].[GamesResults] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Result] bit  NOT NULL,
    [Opponent] nvarchar(max)  NOT NULL,
    [Venue] nvarchar(max)  NOT NULL,
    [Comp] nvarchar(max)  NOT NULL,
    [Data] nvarchar(max)  NOT NULL,
    [Points] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Players1'
CREATE TABLE [dbo].[Players1] (
    [id] int IDENTITY(1,1) NOT NULL,
    [Number] nvarchar(max)  NOT NULL,
    [FamilyName] nvarchar(max)  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Position] nvarchar(max)  NOT NULL
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

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Games1'
ALTER TABLE [dbo].[Games1]
ADD CONSTRAINT [PK_Games1]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'GamesResults'
ALTER TABLE [dbo].[GamesResults]
ADD CONSTRAINT [PK_GamesResults]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Players1'
ALTER TABLE [dbo].[Players1]
ADD CONSTRAINT [PK_Players1]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Tickets'
ALTER TABLE [dbo].[Tickets]
ADD CONSTRAINT [PK_Tickets]
    PRIMARY KEY CLUSTERED ([id] ASC);
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

-- Creating foreign key on [Player_id] in table 'Games1'
ALTER TABLE [dbo].[Games1]
ADD CONSTRAINT [FK_PlayersGames]
    FOREIGN KEY ([Player_id])
    REFERENCES [dbo].[Players1]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PlayersGames'
CREATE INDEX [IX_FK_PlayersGames]
ON [dbo].[Games1]
    ([Player_id]);
GO

-- Creating foreign key on [Result_id] in table 'Games1'
ALTER TABLE [dbo].[Games1]
ADD CONSTRAINT [FK_ResultsGames]
    FOREIGN KEY ([Result_id])
    REFERENCES [dbo].[GamesResults]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ResultsGames'
CREATE INDEX [IX_FK_ResultsGames]
ON [dbo].[Games1]
    ([Result_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------