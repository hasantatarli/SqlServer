DECLARE @Day int = 0
DECLARE @BackupType char(1) = '' -- D: Full, L: Log, I: Differential, F: File/File Group Backup Type
DECLARE @cmd varchar(max) = ''


set @cmd = '
SELECT database_name as DatabaseName, 
       backup_start_date as BackupStartDate, 
       backup_finish_date as BackupEndDate, 
       case when type = ''D'' then ''Full''
            when type = ''L'' then ''Log''
            when type = ''I'' then ''Differential''
            when type = ''F'' then ''File/File Group'' 
       else ''Other'' end as BackupType,
       round(backup_size/1024/1024/1024,3) as "BackupSize(InGB)",
       *
  FROM msdb.dbo.backupset
 WHERE 1=1 '

if ISNULL(@Day,0) <> 0
    set @cmd = @cmd + ' and backup_start_date BETWEEN DATEADD(dd, -' + CAST(@Day as  varchar(10)) +', GETDATE()) AND GETDATE()' 

if ISNULL(@BackupType,'') <> ''
    set @cmd = @cmd +' AND Type = ''' + @BackupType +''''
    
set @cmd = @cmd + ' ORDER BY database_name, type, backup_Start_Date desc
'

print @cmd
EXEC (@cmd)

