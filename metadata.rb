name             'webserver'
maintainer       'Peter Ossian'
maintainer_email 'msuossianpe@gmail.com'
license          'All rights reserved'
description      'Installs/Configures a load balancer with two app nodes.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'nginx',              '= 7.0.0'
