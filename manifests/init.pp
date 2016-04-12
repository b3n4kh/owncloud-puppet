# Class: owncloud
# ===========================
#
class owncloud (
  $datadirectory   = $::owncloud::params::datadirectory,
  $db_host         = $::owncloud::params::db_host,
  $db_name         = $::owncloud::params::db_name,
  $db_pass         = $::owncloud::params::db_pass,
  $db_user         = $::owncloud::params::db_user,
  $db_type         = $::owncloud::params::db_type,
  $documentroot    = $::owncloud::params::documentroot,
  $manage_db       = $::owncloud::params::manage_db,
  $manage_repo     = $::owncloud::params::manage_repo,
  $nginx_vhosts    = $::owncloud::params::nginx_vhosts,
  $sslcert         = $::owncloud::params::sslcert,
  $sslkey          = $::owncloud::params::sslkey,
  $www_user        = $::owncloud::params::www_user,
  $www_group       = $::owncloud::params::www_group,
  $package_name    = 'owncloud'
) inherits ::owncloud::params {
  validate_bool($manage_db)
  validate_bool($manage_repo)
  validate_absolute_path($sslkey)
  validate_absolute_path($sslcert)

  file { "${documentroot}/config":
    ensure => directory,
    owner  => $www_user,
    group  => $www_group,
  }

  file { "${documentroot}/config/autoconfig.php":
    ensure  => present,
    owner   => $www_user,
    group   => $www_group,
    content => template('owncloud/autoconfig.php.erb'),
  }

  class { '::owncloud::install': } ->
  class { '::owncloud::database':
    dbname     => $db_name,
    dbuser     => $db_user,
    dbpassword => $db_pass
  } ->
  class { '::owncloud::nginx':
    vhosts  => $nginx_vhosts,
    sslkey  => $sslkey,
    sslcert => $sslcert
  } ->
  Class['::owncloud']

}
