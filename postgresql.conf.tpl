# -----------------------------
# PostgreSQL configuration file
# -----------------------------
#
# This file consists of lines of the form:
#
#   name = value
#
# (The "=" is optional.)  Whitespace may be used.  Comments are introduced with
# "#" anywhere on a line.  The complete list of parameter names and allowed
# values can be found in the PostgreSQL documentation.
#
# The commented-out settings shown in this file represent the default values.
# Re-commenting a setting is NOT sufficient to revert it to the default value;
# you need to reload the server.
#
# This file is read on server startup and when the server receives a SIGHUP
# signal.  If you edit the file on a running system, you have to SIGHUP the
# server for the changes to take effect, run "pg_ctl reload", or execute
# "SELECT pg_reload_conf()".  Some parameters, which are marked below,
# require a server shutdown and restart to take effect.
#
# Any parameter can also be given as a command-line option to the server, e.g.,
# "postgres -c log_connections=on".  Some parameters can be changed at run time
# with the "SET" SQL command.
#
# Memory units:  kB = kilobytes        Time units:  ms  = milliseconds
#                MB = megabytes                     s   = seconds
#                GB = gigabytes                     min = minutes
#                TB = terabytes                     h   = hours
#                                                   d   = days


#------------------------------------------------------------------------------
# FILE LOCATIONS
#------------------------------------------------------------------------------

# The default values of these variables are driven from the -D command-line
# option or PGDATA environment variable, represented here as ConfigDir.

#data_directory = 'ConfigDir'		# use data in another directory
					# (change requires restart)
#hba_file = 'ConfigDir/pg_hba.conf'	# host-based authentication file
					# (change requires restart)
#ident_file = 'ConfigDir/pg_ident.conf'	# ident configuration file
					# (change requires restart)

# If external_pid_file is not explicitly set, no extra PID file is written.
#external_pid_file = ''			# write an extra PID file
					# (change requires restart)


#------------------------------------------------------------------------------
# CONNECTIONS AND AUTHENTICATION
#------------------------------------------------------------------------------

# - Connection Settings -

listen_addresses = '127.0.0.1'		# what IP address(es) to listen on;
					# comma-separated list of addresses;
					# defaults to 'localhost'; use '*' for all
					# (change requires restart)
port = 5432				# (change requires restart)
max_connections = 20			# (change requires restart)
#superuser_reserved_connections = 3	# (change requires restart)
unix_socket_directories = 'replace_unix_dir'	# comma-separated list of directories
					# (change requires restart)
#unix_socket_group = ''			# (change requires restart)
#unix_socket_permissions = 0777		# begin with 0 to use octal notation
					# (change requires restart)
#bonjour = off				# advertise server via Bonjour
					# (change requires restart)
#bonjour_name = ''			# defaults to the computer name
					# (change requires restart)

# - TCP Keepalives -
# see "man 7 tcp" for details

#tcp_keepalives_idle = 0		# TCP_KEEPIDLE, in seconds;
					# 0 selects the system default
#tcp_keepalives_interval = 0		# TCP_KEEPINTVL, in seconds;
					# 0 selects the system default
#tcp_keepalives_count = 0		# TCP_KEEPCNT;
					# 0 selects the system default

# - Authentication -

#authentication_timeout = 1min		# 1s-600s
#password_encryption = md5		# md5 or scram-sha-256
#db_user_namespace = off

# GSSAPI using Kerberos
#krb_server_keyfile = ''
#krb_caseins_users = off

# - SSL -

#ssl = off
#ssl_ca_file = ''
#ssl_cert_file = 'server.crt'
#ssl_crl_file = ''
#ssl_key_file = 'server.key'
#ssl_ciphers = 'HIGH:MEDIUM:+3DES:!aNULL' # allowed SSL ciphers
#ssl_prefer_server_ciphers = on
#ssl_ecdh_curve = 'prime256v1'
#ssl_dh_params_file = ''
#ssl_passphrase_command = ''
#ssl_passphrase_command_supports_reload = off


#------------------------------------------------------------------------------
# RESOURCE USAGE (except WAL)
#------------------------------------------------------------------------------

# - Memory -

shared_buffers = 384MB			# min 128kB
					# (change requires restart)
#huge_pages = try			# on, off, or try
					# (change requires restart)
#temp_buffers = 8MB			# min 800kB
#max_prepared_transactions = 0		# zero disables the feature
					# (change requires restart)
# Caution: it is not advisable to set max_prepared_transactions nonzero unless
# you actively intend to use prepared transactions.
work_mem = 307MB				# min 64kB
#maintenance_work_mem = 77MB		# min 1MB
#autovacuum_work_mem = -1		# min 1MB, or -1 to use maintenance_work_mem
#max_stack_depth = 2MB			# min 100kB
#dynamic_shared_memory_type = posix	# the default is the first option
					# supported by the operating system:
					#   posix
					#   sysv
					#   windows
					#   mmap
					# use none to disable dynamic shared memory
					# (change requires restart)

# - Disk -

#temp_file_limit = -1			# limits per-process temp file space
					# in kB, or -1 for no limit

# - Kernel Resources -

#max_files_per_process = 1000		# min 25
					# (change requires restart)

# - Cost-Based Vacuum Delay -

#vacuum_cost_delay = 0			# 0-100 milliseconds
#vacuum_cost_page_hit = 1		# 0-10000 credits
#vacuum_cost_page_miss = 10		# 0-10000 credits
#vacuum_cost_page_dirty = 20		# 0-10000 credits
#vacuum_cost_limit = 200		# 1-10000 credits

# - Background Writer -

#bgwriter_delay = 200ms			# 10-10000ms between rounds
#bgwriter_lru_maxpages = 100		# max buffers written/round, 0 disables
#bgwriter_lru_multiplier = 2.0		# 0-10.0 multiplier on buffers scanned/round
#bgwriter_flush_after = 0		# measured in pages, 0 disables

# - Asynchronous Behavior -

effective_io_concurrency = 200		# 1-1000; 0 disables prefetching
max_worker_processes = 8		# (change requires restart)
#max_parallel_maintenance_workers = 2	# taken from max_parallel_workers
max_parallel_workers_per_gather = 2	# taken from max_parallel_workers
#parallel_leader_participation = on
max_parallel_workers = 2		# maximum number of max_worker_processes that
					# can be used in parallel operations
#old_snapshot_threshold = -1		# 1min-60d; -1 disables; 0 is immediate
					# (change requires restart)
#backend_flush_after = 0		# measured in pages, 0 disables


#------------------------------------------------------------------------------
# WRITE-AHEAD LOG
#------------------------------------------------------------------------------

# - Settings -

#wal_level = replica			# minimal, replica, or logical
					# (change requires restart)
#fsync = on				# flush data to disk for crash safety
					# (turning this off can cause
					# unrecoverable data corruption)
#synchronous_commit = on		# synchronization level;
					# off, local, remote_write, remote_apply, or on
#wal_sync_method = fsync		# the default is the first option
					# supported by the operating system:
					#   open_datasync
					#   fdatasync (default on Linux and FreeBSD)
					#   fsync
					#   fsync_writethrough
					#   open_sync
#full_page_writes = on			# recover from partial page writes
#wal_compression = off			# enable compression of full-page writes
#wal_log_hints = off			# also do full page writes of non-critical updates
					# (change requires restart)
wal_buffers = -1			# min 32kB, -1 sets based on shared_buffers
					# (change requires restart)
#wal_writer_delay = 200ms		# 1-10000 milliseconds
#wal_writer_flush_after = 1MB		# measured in pages, 0 disables

#commit_delay = 0			# range 0-100000, in microseconds
#commit_siblings = 5			# range 1-1000

# - Checkpoints -

#checkpoint_timeout = 5min		# range 30s-1d
max_wal_size = 3GB
min_wal_size = 1GB
checkpoint_completion_target = 0.9	# checkpoint target duration, 0.0 - 1.0
#checkpoint_flush_after = 0		# measured in pages, 0 disables
#checkpoint_warning = 30s		# 0 disables

# - Archiving -

#archive_mode = off		# enables archiving; off, on, or always
				# (change requires restart)
#archive_command = ''		# command to use to archive a logfile segment
				# placeholders: %p = path of file to archive
				#               %f = file name only
				# e.g. 'test ! -f /mnt/server/archivedir/%f && cp %p /mnt/server/archivedir/%f'
#archive_timeout = 0		# force a logfile segment switch after this
				# number of seconds; 0 disables


#------------------------------------------------------------------------------
# REPLICATION
#------------------------------------------------------------------------------

# - Sending Servers -

# Set these on the master and on any standby that will send replication data.

#max_wal_senders = 10		# max number of walsender processes
				# (change requires restart)
#wal_keep_segments = 0		# in logfile segments; 0 disables
#wal_sender_timeout = 60s	# in milliseconds; 0 disables

#max_replication_slots = 10	# max number of replication slots
				# (change requires restart)
#track_commit_timestamp = off	# collect timestamp of transaction commit
				# (change requires restart)

# - Master Server -

# These settings are ignored on a standby server.

#synchronous_standby_names = ''	# standby servers that provide sync rep
				# method to choose sync standbys, number of sync standbys,
				# and comma-separated list of application_name
				# from standby(s); '*' = all
#vacuum_defer_cleanup_age = 0	# number of xacts by which cleanup is delayed

# - Standby Servers -

# These settings are ignored on a master server.

#hot_standby = on			# "off" disallows queries during recovery
					# (change requires restart)
#max_standby_archive_delay = 30s	# max delay before canceling queries
					# when reading WAL from archive;
					# -1 allows indefinite delay
#max_standby_streaming_delay = 30s	# max delay before canceling queries
					# when reading streaming WAL;
					# -1 allows indefinite delay
#wal_receiver_status_interval = 10s	# send replies at least this often
					# 0 disables
#hot_standby_feedback = off		# send info from standby to prevent
					# query conflicts
#wal_receiver_timeout = 60s		# time that receiver waits for
					# communication from master
					# in milliseconds; 0 disables
#wal_retrieve_retry_interval = 5s	# time to wait before retrying to
					# retrieve WAL after a failed attempt

# - Subscribers -

# These settings are ignored on a publisher.

#max_logical_replication_workers = 4	# taken from max_worker_processes
					# (change requires restart)
#max_sync_workers_per_subscription = 2	# taken from max_logical_replication_workers


#------------------------------------------------------------------------------
# QUERY TUNING
#------------------------------------------------------------------------------

# - Planner Method Configuration -

#enable_bitmapscan = on
#enable_hashagg = on
#enable_hashjoin = on
#enable_indexscan = on
#enable_indexonlyscan = on
#enable_material = on
#enable_mergejoin = on
#enable_nestloop = on
#enable_parallel_append = on
#enable_seqscan = on
#enable_sort = on
#enable_tidscan = on
#enable_partitionwise_join = off
#enable_partitionwise_aggregate = off
#enable_parallel_hash = on
#enable_partition_pruning = on

# - Planner Cost Constants -

#seq_page_cost = 1.0			# measured on an arbitrary scale
random_page_cost = 1.1			# same scale as above
#cpu_tuple_cost = 0.01			# same scale as above
#cpu_index_tuple_cost = 0.005		# same scale as above
#cpu_operator_cost = 0.0025		# same scale as above
#parallel_tuple_cost = 0.1		# same scale as above
#parallel_setup_cost = 1000.0	# same scale as above

#jit_above_cost = 100000		# perform JIT compilation if available
					# and query more expensive than this;
					# -1 disables
#jit_inline_above_cost = 500000		# inline small functions if query is
					# more expensive than this; -1 disables
#jit_optimize_above_cost = 500000	# use expensive JIT optimizations if
					# query is more expensive than this;
					# -1 disables

#min_parallel_table_scan_size = 8MB
#min_parallel_index_scan_size = 512kB
effective_cache_size = 1GB

# - Genetic Query Optimizer -

#geqo = on
#geqo_threshold = 12
#geqo_effort = 5			# range 1-10
#geqo_pool_size = 0			# selects default based on effort
#geqo_generations = 0			# selects default based on effort
#geqo_selection_bias = 2.0		# range 1.5-2.0
#geqo_seed = 0.0			# range 0.0-1.0

# - Other Planner Options -

#default_statistics_target = 100	# range 1-10000
#constraint_exclusion = partition	# on, off, or partition
#cursor_tuple_fraction = 0.1		# range 0.0-1.0
#from_collapse_limit = 8
#join_collapse_limit = 8		# 1 disables collapsing of explicit
					# JOIN clauses
#force_parallel_mode = off
#jit = off				# allow JIT compilation


#------------------------------------------------------------------------------
# REPORTING AND LOGGING
#------------------------------------------------------------------------------

# - Where to Log -

#log_destination = 'stderr'		# Valid values are combinations of
					# stderr, csvlog, syslog, and eventlog,
					# depending on platform.  csvlog
					# requires logging_collector to be on.

# This is used when logging to stderr:
#logging_collector = off		# Enable capturing of stderr and csvlog
					# into log files. Required to be on for
					# csvlogs.
					# (change requires restart)

# These are only used if logging_collector is on:
#log_directory = 'log'			# directory where log files are written,
					# can be absolute or relative to PGDATA
#log_filename = 'postgresql-%Y-%m-%d_%H%M%S.log'	# log file name pattern,
					# can include strftime() escapes
#log_file_mode = 0600			# creation mode for log files,
					# begin with 0 to use octal notation
#log_truncate_on_rotation = off		# If on, an existing log file with the
					# same name as the new log file will be
					# truncated rather than appended to.
					# But such truncation only occurs on
					# time-driven rotation, not on restarts
					# or size-driven rotation.  Default is
					# off, meaning append to existing files
					# in all cases.
#log_rotation_age = 1d			# Automatic rotation of logfiles will
					# happen after that time.  0 disables.
#log_rotation_size = 10MB		# Automatic rotation of logfiles will
					# happen after that much log output.
					# 0 disables.

# These are relevant when logging to syslog:
#syslog_facility = 'LOCAL0'
#syslog_ident = 'postgres'
#syslog_sequence_numbers = on
#syslog_split_messages = on

# This is only relevant when logging to eventlog (win32):
# (change requires restart)
#event_source = 'PostgreSQL'

# - When to Log -

#log_min_messages = warning		# values in order of decreasing detail:
					#   debug5
					#   debug4
					#   debug3
					#   debug2
					#   debug1
					#   info
					#   notice
					#   warning
					#   error
					#   log
					#   fatal
					#   panic

#log_min_error_statement = error	# values in order of decreasing detail:
					#   debug5
					#   debug4
					#   debug3
					#   debug2
					#   debug1
					#   info
					#   notice
					#   warning
					#   error
					#   log
					#   fatal
					#   panic (effectively off)

#log_min_duration_statement = -1	# -1 is disabled, 0 logs all statements
					# and their durations, > 0 logs only
					# statements running at least this number
					# of milliseconds


# - What to Log -

#debug_print_parse = off
#debug_print_rewritten = off
#debug_print_plan = off
#debug_pretty_print = on
#log_checkpoints = off
#log_connections = off
#log_disconnections = off
#log_duration = off
#log_error_verbosity = default		# terse, default, or verbose messages
#log_hostname = off
#log_line_prefix = '%m [%p] '		# special values:
					#   %a = application name
					#   %u = user name
					#   %d = database name
					#   %r = remote host and port
					#   %h = remote host
					#   %p = process ID
					#   %t = timestamp without milliseconds
					#   %m = timestamp with milliseconds
					#   %n = timestamp with milliseconds (as a Unix epoch)
					#   %i = command tag
					#   %e = SQL state
					#   %c = session ID
					#   %l = session line number
					#   %s = session start timestamp
					#   %v = virtual transaction ID
					#   %x = transaction ID (0 if none)
					#   %q = stop here in non-session
					#        processes
					#   %% = '%'
					# e.g. '<%u%%%d> '
#log_lock_waits = off			# log lock waits >= deadlock_timeout
#log_statement = 'none'			# none, ddl, mod, all
#log_replication_commands = off
#log_temp_files = -1			# log temporary files equal or larger
					# than the specified size in kilobytes;
					# -1 disables, 0 logs all temp files
#log_timezone = 'GMT'

#------------------------------------------------------------------------------
# PROCESS TITLE
#------------------------------------------------------------------------------

#cluster_name = ''			# added to process titles if nonempty
					# (change requires restart)
#update_process_title = on


#------------------------------------------------------------------------------
# STATISTICS
#------------------------------------------------------------------------------

# - Query and Index Statistics Collector -

#track_activities = on
#track_counts = on
#track_io_timing = off
#track_functions = none			# none, pl, all
#track_activity_query_size = 1024	# (change requires restart)
#stats_temp_directory = 'pg_stat_tmp'


# - Monitoring -

#log_parser_stats = off
#log_planner_stats = off
#log_executor_stats = off
#log_statement_stats = off


#------------------------------------------------------------------------------
# AUTOVACUUM
#------------------------------------------------------------------------------

#autovacuum = on			# Enable autovacuum subprocess?  'on'
					# requires track_counts to also be on.
#log_autovacuum_min_duration = -1	# -1 disables, 0 logs all actions and
					# their durations, > 0 logs only
					# actions running at least this number
					# of milliseconds.
#autovacuum_max_workers = 3		# max number of autovacuum subprocesses
					# (change requires restart)
#autovacuum_naptime = 1min		# time between autovacuum runs
#autovacuum_vacuum_threshold = 50	# min number of row updates before
					# vacuum
#autovacuum_analyze_threshold = 50	# min number of row updates before
					# analyze
#autovacuum_vacuum_scale_factor = 0.2	# fraction of table size before vacuum
#autovacuum_analyze_scale_factor = 0.1	# fraction of table size before analyze
#autovacuum_freeze_max_age = 200000000	# maximum XID age before forced vacuum
					# (change requires restart)
#autovacuum_multixact_freeze_max_age = 400000000	# maximum multixact age
					# before forced vacuum
					# (change requires restart)
#autovacuum_vacuum_cost_delay = 20ms	# default vacuum cost delay for
					# autovacuum, in milliseconds;
					# -1 means use vacuum_cost_delay
#autovacuum_vacuum_cost_limit = -1	# default vacuum cost limit for
					# autovacuum, -1 means use
					# vacuum_cost_limit


#------------------------------------------------------------------------------
# CLIENT CONNECTION DEFAULTS
#------------------------------------------------------------------------------

# - Statement Behavior -

#client_min_messages = notice		# values in order of decreasing detail:
					#   debug5
					#   debug4
					#   debug3
					#   debug2
					#   debug1
					#   log
					#   notice
					#   warning
					#   error
#search_path = '"$user", public'	# schema names
#row_security = on
#default_tablespace = ''		# a tablespace name, '' uses the default
#temp_tablespaces = ''			# a list of tablespace names, '' uses
					# only default tablespace
#check_function_bodies = on
#default_transaction_isolation = 'read committed'
#default_transaction_read_only = off
#default_transaction_deferrable = off
#session_replication_role = 'origin'
#statement_timeout = 0			# in milliseconds, 0 is disabled
#lock_timeout = 0			# in milliseconds, 0 is disabled
#idle_in_transaction_session_timeout = 0	# in milliseconds, 0 is disabled
#vacuum_freeze_min_age = 50000000
#vacuum_freeze_table_age = 150000000
#vacuum_multixact_freeze_min_age = 5000000
#vacuum_multixact_freeze_table_age = 150000000
#vacuum_cleanup_index_scale_factor = 0.1	# fraction of total number of tuples
						# before index cleanup, 0 always performs
						# index cleanup
#bytea_output = 'hex'			# hex, escape
#xmlbinary = 'base64'
#xmloption = 'content'
#gin_fuzzy_search_limit = 0
#gin_pending_list_limit = 4MB

# - Locale and Formatting -

#datestyle = 'iso, mdy'
#intervalstyle = 'postgres'
#timezone = 'GMT'
#timezone_abbreviations = 'Default'     # Select the set of available time zone
					# abbreviations.  Currently, there are
					#   Default
					#   Australia (historical usage)
					#   India
					# You can create your own file in
					# share/timezonesets/.
#extra_float_digits = 0			# min -15, max 3
#client_encoding = sql_ascii		# actually, defaults to database
					# encoding

# These settings are initialized by initdb, but they can be changed.
#lc_messages = 'C'			# locale for system error message
					# strings
#lc_monetary = 'C'			# locale for monetary formatting
#lc_numeric = 'C'			# locale for number formatting
#lc_time = 'C'				# locale for time formatting

# default configuration for text search
#default_text_search_config = 'pg_catalog.simple'

# - Shared Library Preloading -

#shared_preload_libraries = ''	# (change requires restart)
#local_preload_libraries = ''
#session_preload_libraries = ''
#jit_provider = 'llvmjit'		# JIT library to use

# - Other Defaults -

#dynamic_library_path = '$libdir'


#------------------------------------------------------------------------------
# LOCK MANAGEMENT
#------------------------------------------------------------------------------

#deadlock_timeout = 1s
#max_locks_per_transaction = 64		# min 10
					# (change requires restart)
#max_pred_locks_per_transaction = 64	# min 10
					# (change requires restart)
#max_pred_locks_per_relation = -2	# negative values mean
					# (max_pred_locks_per_transaction
					#  / -max_pred_locks_per_relation) - 1
#max_pred_locks_per_page = 2            # min 0


#------------------------------------------------------------------------------
# VERSION AND PLATFORM COMPATIBILITY
#------------------------------------------------------------------------------

# - Previous PostgreSQL Versions -

#array_nulls = on
#backslash_quote = safe_encoding	# on, off, or safe_encoding
#default_with_oids = off
#escape_string_warning = on
#lo_compat_privileges = off
#operator_precedence_warning = off
#quote_all_identifiers = off
#standard_conforming_strings = on
#synchronize_seqscans = on

# - Other Platforms and Clients -

#transform_null_equals = off


#------------------------------------------------------------------------------
# ERROR HANDLING
#------------------------------------------------------------------------------

#exit_on_error = off			# terminate session on any error?
#restart_after_crash = on		# reinitialize after backend crash?
#data_sync_retry = off			# retry or panic on failure to fsync
					# data?
					# (change requires restart)


#------------------------------------------------------------------------------
# CONFIG FILE INCLUDES
#------------------------------------------------------------------------------

# These options allow settings to be loaded from files other than the
# default postgresql.conf.  Note that these are directives, not variable
# assignments, so they can usefully be given more than once.

#include_dir = '...'			# include files ending in '.conf' from
					# a directory, e.g., 'conf.d'
#include_if_exists = '...'		# include file only if it exists
#include = '...'			# include file


#------------------------------------------------------------------------------
# CUSTOMIZED OPTIONS
#------------------------------------------------------------------------------

# Add settings for extensions here
