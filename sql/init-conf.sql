IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE TABLE [Attendees] (
        [ID] int NOT NULL IDENTITY,
        [EmailAddress] nvarchar(256) NULL,
        [UserName] nvarchar(256) NULL,
        [FirstName] nvarchar(200) NOT NULL,
        [LastName] nvarchar(200) NOT NULL,
        CONSTRAINT [PK_Attendees] PRIMARY KEY ([ID])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE TABLE [Conferences] (
        [ID] int NOT NULL IDENTITY,
        [Name] nvarchar(200) NOT NULL,
        CONSTRAINT [PK_Conferences] PRIMARY KEY ([ID])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE TABLE [Tags] (
        [ID] int NOT NULL IDENTITY,
        [Name] nvarchar(32) NOT NULL,
        CONSTRAINT [PK_Tags] PRIMARY KEY ([ID])
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE TABLE [ConferenceAttendee] (
        [ConferenceID] int NOT NULL,
        [AttendeeID] int NOT NULL,
        CONSTRAINT [PK_ConferenceAttendee] PRIMARY KEY ([ConferenceID], [AttendeeID]),
        CONSTRAINT [FK_ConferenceAttendee_Attendees_AttendeeID] FOREIGN KEY ([AttendeeID]) REFERENCES [Attendees] ([ID]) ON DELETE CASCADE,
        CONSTRAINT [FK_ConferenceAttendee_Conferences_ConferenceID] FOREIGN KEY ([ConferenceID]) REFERENCES [Conferences] ([ID]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE TABLE [Speakers] (
        [ID] int NOT NULL IDENTITY,
        [Bio] nvarchar(4000) NULL,
        [ConferenceID] int NULL,
        [Name] nvarchar(200) NOT NULL,
        [WebSite] nvarchar(1000) NULL,
        CONSTRAINT [PK_Speakers] PRIMARY KEY ([ID]),
        CONSTRAINT [FK_Speakers_Conferences_ConferenceID] FOREIGN KEY ([ConferenceID]) REFERENCES [Conferences] ([ID]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE TABLE [Tracks] (
        [TrackID] int NOT NULL IDENTITY,
        [ConferenceID] int NOT NULL,
        [Name] nvarchar(200) NOT NULL,
        CONSTRAINT [PK_Tracks] PRIMARY KEY ([TrackID]),
        CONSTRAINT [FK_Tracks_Conferences_ConferenceID] FOREIGN KEY ([ConferenceID]) REFERENCES [Conferences] ([ID]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE TABLE [Sessions] (
        [ID] int NOT NULL IDENTITY,
        [Abstract] nvarchar(4000) NULL,
        [AttendeeID] int NULL,
        [ConferenceID] int NOT NULL,
        [EndTime] datetimeoffset NULL,
        [StartTime] datetimeoffset NULL,
        [Title] nvarchar(200) NOT NULL,
        [TrackId] int NULL,
        CONSTRAINT [PK_Sessions] PRIMARY KEY ([ID]),
        CONSTRAINT [FK_Sessions_Attendees_AttendeeID] FOREIGN KEY ([AttendeeID]) REFERENCES [Attendees] ([ID]) ON DELETE NO ACTION,
        CONSTRAINT [FK_Sessions_Conferences_ConferenceID] FOREIGN KEY ([ConferenceID]) REFERENCES [Conferences] ([ID]) ON DELETE CASCADE,
        CONSTRAINT [FK_Sessions_Tracks_TrackId] FOREIGN KEY ([TrackId]) REFERENCES [Tracks] ([TrackID]) ON DELETE NO ACTION
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE TABLE [SessionSpeaker] (
        [SessionId] int NOT NULL,
        [SpeakerId] int NOT NULL,
        CONSTRAINT [PK_SessionSpeaker] PRIMARY KEY ([SessionId], [SpeakerId]),
        CONSTRAINT [FK_SessionSpeaker_Sessions_SessionId] FOREIGN KEY ([SessionId]) REFERENCES [Sessions] ([ID]) ON DELETE CASCADE,
        CONSTRAINT [FK_SessionSpeaker_Speakers_SpeakerId] FOREIGN KEY ([SpeakerId]) REFERENCES [Speakers] ([ID]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE TABLE [SessionTag] (
        [SessionID] int NOT NULL,
        [TagID] int NOT NULL,
        CONSTRAINT [PK_SessionTag] PRIMARY KEY ([SessionID], [TagID]),
        CONSTRAINT [FK_SessionTag_Sessions_SessionID] FOREIGN KEY ([SessionID]) REFERENCES [Sessions] ([ID]) ON DELETE CASCADE,
        CONSTRAINT [FK_SessionTag_Tags_TagID] FOREIGN KEY ([TagID]) REFERENCES [Tags] ([ID]) ON DELETE CASCADE
    );
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE INDEX [IX_ConferenceAttendee_AttendeeID] ON [ConferenceAttendee] ([AttendeeID]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE INDEX [IX_Sessions_AttendeeID] ON [Sessions] ([AttendeeID]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE INDEX [IX_Sessions_ConferenceID] ON [Sessions] ([ConferenceID]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE INDEX [IX_Sessions_TrackId] ON [Sessions] ([TrackId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE INDEX [IX_SessionSpeaker_SpeakerId] ON [SessionSpeaker] ([SpeakerId]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE INDEX [IX_SessionTag_TagID] ON [SessionTag] ([TagID]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE INDEX [IX_Speakers_ConferenceID] ON [Speakers] ([ConferenceID]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    CREATE INDEX [IX_Tracks_ConferenceID] ON [Tracks] ([ConferenceID]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170609012038_initial')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20170609012038_initial', N'2.1.0-preview2-30571');
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170611145333_AttendeeUsernameUnique')
BEGIN
    CREATE UNIQUE INDEX [IX_Attendees_UserName] ON [Attendees] ([UserName]);
END;

GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20170611145333_AttendeeUsernameUnique')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20170611145333_AttendeeUsernameUnique', N'2.1.0-preview2-30571');
END;

GO