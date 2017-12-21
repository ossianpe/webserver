webserver Cookbook
==================
Cookbook creates two app nodes which share content behind a load balancer. This cookbook relies on nginx for both app and lb nodes.

Please note, this was developed on OS X.

Requirements
------------
Nginx cookbook
Bundler
InSpec
ChefDK
Vagrant

Attributes
----------
```ruby
default['webserver']['lb']['config_to_remove'] = ['/etc/nginx/conf.d/default.conf', '/etc/nginx/sites-enabled/000-default']
default['webserver']['lb']['app_nodes'] = ['192.168.1.2','192.168.1.3']
```

Usage
-----
##### Description
#### webserver::app
Configures basic app web page for N number of nodes.
#### webserver::lb
Configures load balancer for nodes described in `default['webserver']['lb']['app_nodes']`

Execution
-----
To run this cookbook in vagrant, please do the following:

Use a Mac computer
Ensure ChefDK is installed
 * `xcode-select --install` - install xcode
 * `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` - install homebrew
 * `brew update`
 * `brew install caskroom/cask/brew-cask`
 * `brew cask install chefdk`
Ensure InSpec is installed
 * `gem install inspec`
 * `gem install kitchen-inspec`
Ensure vagrant is installed
 * `brew cask install vagrant`

Run the following commands:

`bundle` - to ensure gems are up to date
`kitchen converge` - to converge all of the nodes in test kitchen
`kitchen verify` - to see unit tests results

#### Accessing

Navigate to `192.168.33.2` to see the load balancer serving traffic to the web nodes. Please refresh the page to see the hostname toggle at the bottom of the page.

Testing
-----
#### Spec
Ensure gems are up to date by running `bundler`.

#### Unit
Ensure inspec is installed with `gem install kitchen-inspec`.

Author
-------------------
Peter Ossian
