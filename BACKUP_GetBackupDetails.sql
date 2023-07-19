DECLARE @BackupStartDateBegin date --= '20230101'
DECLARE @BackupStartDateFinish date = '20230101'
DECLARE @DatabaseName varchar(128) = 'BANK'
DECLARE @BackupType char(1) = '' -- D: Full, L: Log, I: Differential, F: File/File Group Backup Type
DECLARE @cmd varchar(max) = ''


set @cmd = '
SELECT server_name AS ServerName,
       database_name AS DatabaseName, 
       bs.name AS BackupSetName,
	   bs.description BackupSetDescription,
       backup_start_date AS BackupStartDate, 
       backup_finish_date AS BackupEndDate, 
       CASE WHEN type = ''D'' then ''Full''
            WHEN type = ''L'' then ''Log''
            WHEN type = ''I'' then ''Differential''
            WHEN type = ''F'' then ''File/File Group'' 
       ELSE type end AS BackupType,
       expiration_date AS [ExpireDate],
       CASE 
	    	WHEN is_compressed = 1 then ''Compressed''
		    ELSE ''Not Compressed'' end AS [Compression],
	   CASE device_type
	    	WHEN 2 then ''Disk''
		    WHEN 5 then ''Tape''
		    WHEN 7 then ''Virtual Device''
		    WHEN 9 then ''Azure Storage''
		    WHEN 105 then ''A permenant backup device''
		    ELSE ''Other Device'' end AS DeviceType,
	   user_name AS BackupUserName,
	   CASE 
	    	WHEN is_copy_only = 1 then ''Copy Only Backup''
		    ELSE ''Normal Backup'' end AS [CopyOnly],
       cast((backup_size)/1024/1024 AS decimal(18,2)) AS BackupSizeMB,
	   cast((compressed_backup_size) /1024/1024 AS decimal(18,2)) AS CompressSizeMB,
	   physical_device_name AS PhysicalDeviceName
  FROM msdb.dbo.backupset bs
 INNER JOIN msdb.dbo.backupmediaset bms on bs.media_set_id = bms.media_set_id 
 INNER JOIN	msdb.dbo.backupmediafamily bmf on bs.media_set_id = bmf.media_set_id
 WHERE 1=1 '

if ISNULL(@DatabaseName,'') <> ''
    set @cmd = @cmd +  ' AND  database_name  = '''+ @DatabaseName+''''


if ISNULL(@BackupStartDateBegin,'') <> ''
    set @cmd = @cmd + ' AND backup_start_date >= ''' + cast(@BackupStartDateBegin AS varchar(20)) + ''''

if ISNULL(@BackupStartDateFinish,'') <> ''
    set @cmd = @cmd + ' AND cast(backup_start_date AS date) <= ''' + cast(@BackupStartDateFinish AS varchar(20)) + ''''

if ISNULL(@BackupType,'') <> ''
    set @cmd = @cmd +' AND Type = ''' + @BackupType +''''
    
set @cmd = @cmd + ' ORDER BY bs.database_name, type, backup_Start_Date desc
'

print @cmd
EXEC (@cmd)


