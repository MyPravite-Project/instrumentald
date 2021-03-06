class instrumentald(
  $project_token = ''
) {

  include packagecloud

  case $operatingsystem {
    'RedHat', 'CentOS': { $package_type = 'rpm' }
    'Debian', 'Ubuntu': { $package_type = 'deb' }
  }

  packagecloud::repo { "expectedbehavior/instrumental":
    type => $package_type,
  }

  package { "instrumentald":
    ensure  => latest,
    require => Packagecloud::Repo["expectedbehavior/instrumental"]
  }

  file { "instrumental-config":
    path    => "/etc/instrumentald.toml",
    owner   => "nobody",
    mode    => "0440",
    require => Package["instrumentald"],
    content => template("instrumentald/instrumentald.toml.erb"),
    notify  => Exec["instrumentald-restart"]
  }

  exec { "instrumentald-restart" :
    refreshonly => true,
    command     => "/etc/init.d/instrumentald restart",
    user        => "root"
  }
}
