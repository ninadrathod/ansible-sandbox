# ansible-sandbox
This project is a boilerplate setup for Ansible-based automations.
It will create three Docker containers, each mapped to ports 2201~2203, respectively

### Go to your project directory
```
cd <path_to_project_directory>/ansible-sandbox
```
### Create a .env file in the cloned directory with the following content:
```
SSH_USER=ansibean
SSH_PASSWORD=<set_strong_password>
```

### Create a script named "remove_known_host.sh" inside <i>ansible-sandbox</i> directory with the following content
```
#!/bin/sh

# Run this script after creating Docker containers.

ssh-keygen -f '/home/<user_user_id>/.ssh/known_hosts' -R '[localhost]:2203'
ssh-keygen -f '/home/<user_user_id>/.ssh/known_hosts' -R '[localhost]:2202'
ssh-keygen -f '/home/<user_user_id>/.ssh/known_hosts' -R '[localhost]:2201'
ssh-keygen -f '/home/<user_user_id>/.ssh/known_hosts' -R '[0.0.0.0]:2203'
ssh-keygen -f '/home/<user_user_id>/.ssh/known_hosts' -R '[0.0.0.0]:2202'
ssh-keygen -f '/home/<user_user_id>/.ssh/known_hosts' -R '[0.0.0.0]:2201'
```
### Run Docker containers using the Makefile
```
make up
```
### Now, generate SSH keys using the following command <br> (This command is needed only for the initial setup)
```
ssh-keygen
```
NOTE: Enter `id_ansibean` (same as the one you used in the .env file) when this prompt appears, <i>Enter file in which to save the key: </i><br>
No need to pass any input for the next questions. Just press the enter key. This will create a public-private key pair and save it to your project directory.
### Now, copy the public keys into your containers using the following commands.
NOTE: Run one at a time. Enter the same password that you used in the .env file when prompted
```
ssh-copy-id -p 2201 ansibean@0.0.0.0
ssh-copy-id -p 2202 ansibean@0.0.0.0
ssh-copy-id -p 2203 ansibean@0.0.0.0
```
