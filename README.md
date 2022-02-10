## Overview

The purpose of this repo is to provision a minimum setup of Nomad cluster using Vagrant.
This configuration is not meant for productino workload.

This setup consists of:
* 1 Nomad server
* 2 Nomad clients

## Environment

This configuration has only been tested on `Ubuntu18.04`. 

## Pre-requisites

Ensure `virtualbox` and `vagrant` are installed.

```shell
sudo apt install virtualbox -y
sudo apt install vagrant -y
```

## Environment variables

Ensure below environment vars are present. 

```sh
export nomad=bin/nomad
export NOMAD_ADDR="http://10.0.0.10:4646"
```

## Provision the cluster

```sh
make up
```

## Verify by running sample Nomad job

```sh
make verify
```

## Clean up the cluster

```sh
make destroy
```

## Additional helpful commands
```sh
vagrant status
vagrant ssh <machine_name>
```
