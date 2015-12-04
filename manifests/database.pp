#Configure owncloud postgres database
class owncloud::database (
  $dbname     = $name,
  $dbuser     = undef,
  $dbpassword = undef
  ) {

  class { 'postgresql::server': }

  postgresql::server::db { $dbname:
    name     => $dbname,
    user     => $dbuser,
    password => $dbpassword,
    owner    => $dbuser
  }

  postgresql::server::pg_hba_rule { "allow icinga ipv4 access to ${dbname}":
    description => 'Open up postgresql for icinga',
    type        => 'host',
    database    => $dbname,
    user        => $dbuser,
    address     => '127.0.0.1/32',
    auth_method => 'trust',
    order       => '1'
  }

  postgresql::server::pg_hba_rule { "allow icinga ipv6 access to ${dbname}":
    description => 'Open up postgresql for icinga',
    type        => 'host',
    database    => $dbname,
    user        => $dbuser,
    address     => '::1/128',
    auth_method => 'trust',
    order       => '2'
  }

  postgresql::server::pg_hba_rule { "allow icinga local access to ${dbname}":
    description => 'Open up postgresql for icinga',
    type        => 'local',
    database    => $dbname,
    user        => $dbuser,
    auth_method => 'trust',
    order       => '3'
  }
}
