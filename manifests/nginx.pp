#Configure owncloud nginx vhost
class owncloud::nginx (
  $vhosts     = [ $name ],
  $sslkey     = undef,
  $sslcert    = undef
  ) {

  class { 'nginx': }
  nginx::resource::vhost { 'owncloud':
    ssl                  => true,
    ssl_cert             => $sslcert,
    ssl_key              => $sslkey,
    server_name          => $vhosts,
    proxy                => 'http://localhost:8888',
    use_default_location => false
  }

}
