# = Definition: mysql::rights
#
# A basic helper used to create a database.
#
# == Parameters:
#
# $ensure:: defaults to present
#
define percona::database (
  $ensure = present,
  $character_set = 'latin1'
) {

  if $::mysql_uptime != 0 {
    mysql_database { $name:
      ensure        => $ensure,
      require       => File[$::percona::config_file],
    }
  }
}
