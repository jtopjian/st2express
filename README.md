St2 Express
=======

###Introduction

This repo was created as a quick install of the StackStorm automation platform.  It will get you up and running with a single VM running all St2 components, as well as Mistral.

### Instructions
To provision the environment run:

    vagrant up

There will be some red messages but that is fine.  One the vm is up, connect to it via:

    vagrant ssh st2express

You can see the action list via:

    st2 action list

The supervisor script to start,stop,restart,reload, and, clean st2 is run like so:

    st2ctl start|stop|status|restart|reload|clean

### Logging
This installation makes use of the syslog logging configuration files for each of the St2 components.  You will find the logs in:

    /var/log/st2

All actionrunner processes will be using a combined log under st2actions.log and st2actions.audit.log

### Stay in Touch
Any questions please contact us:

#IRC: Freenode#Stackstorm
# EMAIL: support@stackstorm.com
