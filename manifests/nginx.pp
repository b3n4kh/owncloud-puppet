#Configure owncloud nginx vhost
class owncloud::nginx (
    $vhosts     = [ $name ],
    $sslkey     = undef,
    $sslcert    = undef
  ) {

  php::fpm::pool { 'owncloud':
    listen => '127.0.0.1:9001',
    php_admin_value => {
      'upload_max_filesize' => '100M',
      'post_max_size'       => '100M'
    }
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
    ssl_dhparam          => '/etc/nginx/dhparam.pem',
    server_name          => $vhosts,
	  rewrite_to_https     => true,
    www_root             => '/var/www/html/owncloud',
    include_files        => [ '/etc/nginx/managed/owncloud.conf' ],
    use_default_location => false
  }

}
