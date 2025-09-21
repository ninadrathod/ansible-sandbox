# ansible-sandbox
This project is a boilerplate setup for ansible based automations.
It will create three docker containers each mapped to ports 2201~2203 respectively

### Create a .env file in the cloned directory with following content:
```
SSH_USER=<set_ssh_user_name>
SSH_PASSWORD=<set_strong_password>
```

### Create a script inside <i>ansible-sandbox</i> directory with the following content
```
#!/bin/sh

# Run this script after creating docker containers.

ssh-keygen -f '/home/<your_user_id>/.ssh/known_hosts' -R '[localhost]:2203'
ssh-keygen -f '/home/<your_user_id>/.ssh/known_hosts' -R '[localhost]:2202'
ssh-keygen -f '/home/<your_user_id>/.ssh/known_hosts' -R '[localhost]:2201'
```
