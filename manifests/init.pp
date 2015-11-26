# Class: owncloud
# ===========================
#
class owncloud (
  $db_host         = $::owncloud::params::db_host,
  $db_name         = $::owncloud::params::db_name,
  $db_pass         = $::owncloud::params::db_pass,
  $db_user         = $::owncloud::params::db_user,
  $db_type         = $::owncloud::params::db_type,
  $nginx_snippet   = $::owncloud::params::nginx_snippet,
  $nginx_vhost     = $::owncloud::params::nginx_snippet,
  $manage_db       = $::owncloud::params::manage_db,
  $manage_repo     = $::owncloud::params::manage_repo,
  $datadirectory   = $::owncloud::params::datadirectory,
) inherits ::owncloud::params {
  validate_bool($nginx_snippet)
  validate_bool($nginx_vhost)
  validate_bool($manage_db)
  validate_bool($manage_repo)


  file { "${::owncloud::documentroot}/config/autoconfig.php":
    ensure  => present,
    owner   => $::owncloud::www_user,
    group   => $::owncloud::www_group,
    content => template('owncloud/autoconfig.php.erb'),
  }

  class { '::owncloud::install': } ->
  class { '::owncloud::database': } ->
  class { '::owncloud::nginx': } ->
  Class['::owncloud']

}
