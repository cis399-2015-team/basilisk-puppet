class iptables {

  stage { 'fw_pre':  before  => Stage['main']; }
  stage { 'fw_post': require => Stage['main']; }

  class { 'iptables::pre':
    stage => 'fw_pre',
  }

  class { 'iptables::post':
    stage => 'fw_post',
  }

 resources { "firewall":
    purge => true
 }

}
