# Vagrant::SSH

An easy way to execute SSH commands on your Vagrant image.

## Installation

Add it to your application's Gemfile:

```bash
gem 'vagrant-ssh'
```

Or install it yourself as:

```bash
$ gem install vagrant-ssh
```

## Usage

To create an SSH connection to your Vagrant box:

```bash
@ssh = VagrantSsh::Shell.new('33.33.33.33')
@ssh.execute 'whoami'
=> I, [2015-07-13T16:42:25.127602 #82100]  INFO -- : Executing SSH command: whoami
=> I, [2015-07-13T16:42:25.142657 #82100]  INFO -- : vagrant
```
