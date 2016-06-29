#
#  Install java
#
class { 'java': }

#
# Install Tomcat Webserver
# 
tomcat::install { '/opt/tomcat':
  #source_url => 'http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.tar.gz',
  source_url => 'https://s3.amazonaws.com/hpe-devops/com/apache/apache-tomcat-7.0.70.tar.gz',
  #source_url => 'https://s3.amazonaws.com/hpe-devops/com/apache/apache-tomcat-6.0.45.tar.gz',
  #source_url => 'https://s3.amazonaws.com/hpe-devops/com/apache/apache-tomcat-8.0.36.tar.gz'
}
tomcat::instance { 'default':
  catalina_home => '/opt/tomcat',
}

#
# Setup IP Tables to manage firewall ports
#
service { 'iptables' : 
  ensure => false,
}

#
#  Deploy Application War File from CM location
#
tomcat::war { 'sample.war':
  war_source => 'https://s3.amazonaws.com/hpe-devops/com/apache/sample.war',
  catalina_base => '/opt/tomcat',
}
