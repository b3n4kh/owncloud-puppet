#Configure owncloud nginx vhost
class owncloud::nginx (
    $vhosts     = [ $name ],
    $sslkey     = undef,
    $sslcert    = undef
  ) {

  php::fpm::pool { 'owncloud':
    listen => '127.0.0.1:9001',
  }

  class { 'nginx': }

  nginx::resource::upstream { 'php-handler':
    ensure      => present,
    members     => [
      '127.0.0.1:9001',
    ]
  }

  nginx::resource::vhost { 'owncloud':
    ssl                  => true,
    ssl_cert             => $sslcert,
    ssl_key              => $sslkey,
    server_name          => $vhosts,
    www_root             => '/var/www/html/owncloud',
    include_files        => [ '/etc/nginx/managed/owncloud.conf' ],
    use_default_location => false
  }

}
