name             'test-cook'
maintainer       'Test for TC LTD'
maintainer_email 'sereda.roman@gmail.com'
license          'All rights reserved'
description      'Installs/Configures test-cook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
source_url 'https://github.com/rsereda/test_task' if respond_to?(:source_url)
issues_url 'https://github.com/rsereda/test_task/issues' if respond_to?(:issues_url)

depends 'mysql', '~> 6.0'

