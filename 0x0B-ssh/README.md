# SSH: Secure Shell

Sure, SSH (Secure Shell) is a network protocol that allows secure communication between two devices by encrypting the data transmitted over a network. It's widely used for accessing remote systems securely, executing commands on a remote machine, transferring files, and more.

### Uses of SSH:

- **Remote Access:** SSH allows you to log in to a remote machine securely and execute commands as if you were directly using the terminal on that machine.

- **File Transfer:** Securely transfer files between devices using tools like SCP (Secure Copy) or SFTP (Secure File Transfer Protocol) which run over SSH.

- **Tunneling:** SSH can create encrypted tunnels to forward ports and securely transmit other types of network traffic.

### Overview:

SSH keys are a matching set of cryptographic keys which can be used for authentication. Each set contains a public and a private key. The public key can be shared freely without concern, while the private key must be vigilantly guarded and never exposed to anyone.

To authenticate using SSH keys, a user must have an SSH key pair on their local computer. On the remote server, the public key must be copied to a file within the user’s home directory at `~/.ssh/authorized_keys`. This file contains a list of public keys, one-per-line, that are authorized to log into this account.



### Generating and Working with SSH Keys

Generating a new SSH public and private key pair on our local computer

A number of cryptographic algorithms can be used to generate SSH keys, including RSA, DSA, and ECDSA. **RSA** keys are generally preferred and are the **default** key type.



#### Creating SSH key:

```bash
#!/usr/bin/env bash
# a Bash script that creates an RSA key pair.
#     Name of the created private key must be school
#     Number of bits in the created key to be created 4096
#     The created key must be protected by the passphrase betty


ssh-keygen -b 4096 -N "betty"
```

- `-b 4096`: Specifies the number of bits in the key, set to 4096 bits for higher security than the default `2048`.
- `-N "betty"`: Sets a passphrase for the key. The `-N` flag is used to specify the passphrase directly in the command. In this case, the passphrase is `betty` the **passphrase** is optional but we will have to enter any passphrase every time we  use the private key, as an additional security measure.
- `-f keys_file`: we can also specify the location where the keys will be stored so in this case the keys will be stored in current directory The actual keys will be saved as "school" (private key) and "school.pub" (public key). 
   **By default** the standard naming convention is `id_rsa` for the **private key** and `id_rsa.pub` for the **public key** in the default `~/.ssh` directory. 



#### change or remove the passphrase

```bash
$ ssh-keygen -p
```

and then follow the steps to enter the path to the private key and then old and the new passphrase



#### Displaying the SSH Key Fingerprint

```bash
$ ssh-keygen -l
```

and then pass the file where the private key is



### Connecting the remote server

we can connect the remote server using simply the **private key**:

```bash
#!/usr/bin/env bash

remote_user="ubuntu"
remote_host="34.204.101.876"
private_key_path="$HOME/.ssh/id_rsa"

ssh -i "$private_key_path" "$remote_user@$remote_host"
```

- `-i` to define the path to the private key file



but the best is to use the `ssh_config` 

#### ssh_config

`ssh_config` is a configuration file for the OpenSSH client. It allows users to configure various aspects of the SSH client's behavior, such as defining connection options, aliases for hosts, specifying user settings, setting up proxy configurations, and much more.

- The global `ssh_config` file is typically located at `/etc/ssh/ssh_config`.
- User-specific configurations can be placed in `~/.ssh/config`.

##### Benefits:

- **Convenience:** It allows you to set up aliases for hosts, reducing the need to remember IP addresses or hostnames.
- **Customization:** You can define default settings or override defaults for specific hosts, users, or domains.
- **Security:** Helps in defining specific security-related configurations like key files, known hosts behavior, etc.



##### Example:

let's configure the `ssh_config`  so that we can connect to a server without typing a password.

- ou SSH client configuration must be configured to use the private key `~/.ssh/school` or we can use the default location `~/.ssh/id_rsa`
- our SSH client configuration must be configured to refuse to authenticate using a password

```bash
Host ubuntu_server
	HostName 34.204.101.886
	user ubuntu
	Identityfile ~/.ssh/id_rsa
	PasswordAuthentication no
```

- wa can pass an alias for our server like `ubuntu_server`

- we defined the user

- the path to the private key

- refuse password








