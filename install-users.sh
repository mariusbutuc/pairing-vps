#!/bin/bash

set -e

if [ $# -lt 2 ]; then
  echo "usage: $0 ruby_version user_spec [user_spec...]" >&2
  exit 1
fi

ruby_version="$1"; shift

build_rbenv=/tmp/install-my-rbenv.sh

cat > $build_rbenv <<'ETX'
#!/bin/bash

set -e

ruby_version="$1"; shift

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# Need > 512MB RAM for this to compile.
rbenv install $ruby_version
rbenv global $ruby_version
rbenv rehash
ETX
chmod +x $build_rbenv

for spec in "$@"; do
  user_name=$(echo "$spec" | sed -e 's/=.*//')
  comment=$(echo "$spec" | sed -e 's/.*=//')

  echo "Adding $user_name user"
  useradd -c "$comment" $user_name
  user_home=$(eval "echo ~$user_name")
  mkdir $user_home/.ssh
  cp ~root/.ssh/authorized_keys $user_home/.ssh
  chown -R $user_name.$user_name $user_home/.ssh
  chmod 755 $user_home/.ssh
  chmod 644 $user_home/.ssh/authorized_keys

  echo "Setting up rbenv + ruby $ruby_version for $user_name"
  su - $user_name -c "$build_rbenv $ruby_version"
done

rm -f $build_rbenv
