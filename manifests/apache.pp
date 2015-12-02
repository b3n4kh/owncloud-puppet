# == Class owncloud::apache
#
# This class is called from owncloud.
#
class owncloud::apache {

  class { '::apache':
    default_vhost => false,
    mpm_module    => 'prefork',
    purge_configs => false,
  }
  apache::listen { '8888': }
}
