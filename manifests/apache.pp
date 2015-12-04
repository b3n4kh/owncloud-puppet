# == Class owncloud::apache
#
# This class is called from owncloud.
#
class owncloud::apache {

  class { 'apache':
    template => 'owncloud/httpd.conf.erb',
  }
}
