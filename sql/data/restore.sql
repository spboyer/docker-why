CREATE DATABASE ConferencePlanner
ON ( NAME = 'CONFERENCE', FILENAME = '/usr/src/app/sql/data/conference-planner.mdf' )
LOG ON (  NAME = 'CONFERENCE_log', FILENAME = '/usr/src/sql/data/conference-planner.ldf')
GO