# -*- mode: ruby -*-
# vi: set ft=ruby :

require './digital-ocean-credentials.rb'

Vagrant.configure('2') do |config|
  USERS_TO_CREATE = "'mike=Mike Stok' 'pair=Pairing Partner'"
  USERS_RUBY_VERSION = '1.9.3-p448'

  config.ssh.private_key_path = DIGITAL_OCEAN_CREDENTIALS::PRIVATE_KEY_PATH

  config.vm.box = 'digital_ocean'
  config.vm.hostname = 'mike-stok-pairing'

  config.vm.synced_folder 'shared-dir', '/vagrant'

  config.vm.provision :shell, path: 'install-packages.sh'
  config.vm.provision :shell do |s|
    s.path = 'install-users.sh'
    s.args = "#{USERS_RUBY_VERSION} #{USERS_TO_CREATE}"
  end
  config.vm.provision :shell, inline: 'su - pair -c "gem install github-auth"'

  if File.exist? 'no-ip/no-ip2.conf'
    config.vm.synced_folder 'no-ip', '/vagrant/no-ip'
    config.vm.provision :shell, path: 'install-noip.sh'
  end

  config.vm.provider :digital_ocean do |provider|
    provider.client_id = DIGITAL_OCEAN_CREDENTIALS::CLIENT_ID
    provider.api_key = DIGITAL_OCEAN_CREDENTIALS::API_KEY

    provider.image = 'CentOS 6.4 x64'
    provider.region = 'San Francisco 1'
    # Need 1GB of RAM to compile ruby...
    provider.size = '1GB'
  end
end
