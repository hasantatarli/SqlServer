select
  session_id as SPID,
  DB_NAME(r.database_id) as DatabaseName
  command RunningCommand,
  a.text as Query,
  start_time as BackupStartTime,
  percent_complete as "BackupComplete(%)",
  dateadd(second, estimated_completion_time / 1000, getdate()) as "EstimatedCompletionTime"
from
  sys.dm_exec_requests r
  cross apply sys.dm_exec_sql_text(r.sql_handle) a
where
  r.command in('BACKUP DATABASE', 'RESTORE DATABASE')