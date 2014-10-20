St2 Express
=======

###Introduction

This repo was created as a quick install of the StackStorm automation platform.  It will get you up and running with a single VM running all St2 components, as well as Mistral.

### Setup

At the top of the Vagrantfile are two variables that need your username and password to the release server (in order to grab the packages).

    st2user=""
    st2pass=""

Just add the credentials you were given there and run:

    vagrant up

Once the provisioning is done, you should be able to ssh to the host and start your journey with St2.
