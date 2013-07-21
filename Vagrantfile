# -*- mode: ruby -*-
# vi: set ft=ruby :

require './digital-ocean-credentials.rb'

Vagrant.configure('2') do |config|

  config.ssh.private_key_path = DIGITAL_OCEAN_CREDENTIALS::PRIVATE_KEY_PATH

  config.vm.box = 'digital_ocean'
  config.vm.hostname = 'mike-stok-pairing'

  config.vm.provision :shell, path: 'install-packages.sh'
  config.vm.provision :shell, path: 'install-github-auth.sh'
  config.vm.provision :shell, path: 'install-users.sh'
  config.vm.provision :shell, path: 'install-noip.sh'

  config.vm.provider :digital_ocean do |provider|
    provider.client_id = DIGITAL_OCEAN_CREDENTIALS::CLIENT_ID
    provider.api_key = DIGITAL_OCEAN_CREDENTIALS::API_KEY

    provider.image = 'CentOS 6.4 x64'
    provider.region = 'San Francisco 1'
  end
end