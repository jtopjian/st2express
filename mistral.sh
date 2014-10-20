config=/etc/mistral/mistral.conf
upstart=/etc/init/mistral.conf

write_config()
{
if [ -e "$config" ]; then
    rm $config
fi
touch $config
cat <<mistral_config >$config
[database]
connection = mysql://mistral:mistral@controller/mistral

[pecan]
auth_enable=false
mistral_config
}

write_upstart()
{
if [ -e "$upstart" ]; then
    rm $upstart
fi
touch $upstart
cat <<mistral_upstart >$upstart
description "OpenStack Workflow Services"
script
    /opt/openstack/mistral/.venv/bin/python /opt/openstack/mistral/mistral/cmd/launch.py --config-file /etc/mistral/mistral.conf
end script
mistral_upstart
}

setup_mistral_db() {
  mysql -uroot -pStackStorm -e "create database mistral"
  mysql -uroot -pStackStorm -e "grant all privileges on mistral.* to 'mistral'@'%' identified by 'mistral'"
}

install_mistral() {
    # Install prerequisites.
    apt-get -y install libssl-dev
    apt-get -y install libyaml-dev
    apt-get -y install libffi-dev
    apt-get -y install libxml2-dev libxslt1-dev python-dev python-virtualenv
    apt-get -y install mysql-client
    apt-get -y install libmysqlclient-dev git

    setup_mistral_db

    # Clone mistral from github.
    mkdir -p /opt/openstack
    cd /opt/openstack
    if [ -d "/opt/openstack/mistral" ]; then
        rm -r /opt/openstack/mistral
    fi
    git clone -b STORM-425/workflow https://github.com/StackStorm/mistral.git

    # Setup virtualenv for running mistral.
    cd /opt/openstack/mistral
    virtualenv --no-site-packages .venv
    . /opt/openstack/mistral/.venv/bin/activate
    pip install -r requirements.txt
    pip install mysql-python
    python setup.py install

    # Create configuration files.
    mkdir -p /etc/mistral
    write_config
    write_upstart
}

# Run mysql install script
. /vagrant/mysql.sh

install_mistral
sudo pip install -U git+https://github.com/stackforge/python-mistralclient.git
