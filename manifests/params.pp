# == Class: owncloud::params
#
class owncloud::params {
  $documentroot = '/var/www/html/owncloud/data'
  $datadirectory  = '/data/owncloud'
  $db_host         = 'localhost'
  $db_name         = 'owncloud'
  $db_pass         = 'owncloud'
  $db_user         = 'owncloud'
  $db_type         = 'pgsql'
  $nginx_snippet   = true
  $manage_db       = true
  $manage_repo     = true
}
