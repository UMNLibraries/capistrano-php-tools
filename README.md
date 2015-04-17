Capistrano::PHPTools
====================
This gem provides various utility tasks for PHP based sites that use capistrano for deployment.
Currently it provides a method to clear the APC (Alternative PHP Cache) to avoid encountering memory allocation errors.

Installation & Setup
--------------------
Add the following to your `Gemfile`:

    group :development do
      gem 'capistrano', '~> 3.1'
      gem 'capistrano-php-tools', '~> 1.0'
    end

Then run:

    bundle install

In order to make use of the tools you have to set a `uri` variable in your capistrano settings. This variable
should be the full uri to your deployed site. An example setup would be to set this variable in each stage file.
So in your `config/deploy/production.rb` file:

    set :uri, 'http://example.com'

Usage
-----
Add this line to your `Capfile`

    require 'capistrano/php_tools'

An example which clears the APC after deployment:

    after :finishing, "php_tools:apc_clear"

Credits
-------
Initial implementation of the gem functionality developed by [Chad Fennell](https://github.com/chadfennell).
Gem assembled by [Bryce Kalow](https://github.com/BRKalow).
