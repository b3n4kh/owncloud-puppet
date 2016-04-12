# == Class owncloud::install
#
# This class is called from owncloud for install.
#
class owncloud::install {

  if $::owncloud::manage_repo {
        include ::epel

        yumrepo { 'ownCloud:stable':
          name     => 'owncloud-stable',
          descr    => "ownCloud Server Version stable (CentOS_7)",
          baseurl  => "http://download.owncloud.org/download/repositories/stable/CentOS_7",
          gpgcheck => 1,
          gpgkey   => "https://download.owncloud.org/download/repositories/stable/CentOS_7/repodata/repomd.xml.key",
          enabled  => 1,
          before   => Package[$::owncloud::package_name],
        }
      }

  package { $::owncloud::package_name:
    ensure => present,
  }
}
