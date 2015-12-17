#### ansible playground

##### common notes

* nothing here yet

##### running ansible in cygwin

###### required packages

* curl
* python (2.7.x)
* python-crypto
* python-openssl
* python-setuptools
* python-yaml
* git (2.5.x)
* nano (prefered)
* openssh
* openssl
* openssl-devel
* libyaml

###### install dependencies

`easy_install-2.7 PyYAML`

`easy_install-2.7 Jinja2`

`easy_install-2.7 pip`

###### install ansible as python package

`pip install ansible`

###### fix ssh mux_client_request_session error

add `ssh_args = -o ControlMaster=no` to [ssh_connection] in ansible.cfg
