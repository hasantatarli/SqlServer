With BackupInfo as (
    SELECT database_name, 
           MAX(backup_start_date) as backup_start_date, 
           MAX(backup_finish_date) as backup_finish_date
      FROM msdb.dbo.backupset 
     WHERE type ='D' 
     GROUP BY database_name
)
SELECT @@ServerName as ServerName, 
       d.name as DatabaseName,
       d.recovery_model_desc as RecoveryModel, 
       d.state_desc as Status, 
       backup_start_date as BackupStartTime, 
       backup_finish_date as BackupFinishTime, 
       datediff(s,backup_start_date, backup_finish_date) as "BackupDuration(InSec)"
  FROM master.sys.databases d
 LEFT JOIN BackupInfo bi on bi.database_name = d.name
 WHERE d.name <> 'tempdb'
