# == Class: owncloud::params
#
class owncloud::params {
  $datadirectory   = '/data/owncloud'
  $db_host         = 'localhost'
  $db_name         = 'owncloud'
  $db_pass         = 'owncloud'
  $db_user         = 'owncloud'
  $db_type         = 'pgsql'
  $documentroot    = '/var/www/html/owncloud'
  $manage_db       = true
  $manage_repo     = true
  $nginx_snippet   = true
  $nginx_vhosts    = [ 'owncloud' ]
  $sslcert         = '/etc/pki/tls/certs/owncloud.crt'
  $sslkey          = '/etc/pki/tls/private/owncloud.key'
  $www_user        = 'nginx'
  $www_group       = 'nginx'
  $upload_max_filesize = '200M'
}
