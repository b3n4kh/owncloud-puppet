# == Class: owncloud::params
#
class owncloud::params {
  $datadirectory   = '/data/owncloud'
  $db_host         = 'localhost'
  $db_name         = 'owncloud'
  $db_pass         = 'owncloud'
  $db_user         = 'owncloud'
  $db_type         = 'pgsql'
  $documentroot    = '/var/www/html/owncloud/data'
  $manage_db       = true
  $manage_repo     = true
  $nginx_snippet   = true
  $nginx_vhosts    = [ 'owncloud' ]
  $sslkey          = '/etc/pki/tls/private/owncloud.key'
  $sslcert         = '/etc/pki/tls/certs/owncloud.crt'
  $www_user        = 'apache'
  $www_group       = 'apache'
}
