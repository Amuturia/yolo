# Yolomy E-commerce

Welcome to the Yolomy E-commerce website where you get all your client needs satisfied upon the completion of the depolyment of our custom DevOps class assignment.

## Overview
This documentation provides an overview of setting up and running an eCommerce application within a Vagrant environment. The application is built using a typical full-stack architecture, including a frontend client, backend server, and a MongoDB database, all managed within a Vagrant virtual machine (VM). Docker is used to containerize the application components.

## Prerequisites
Before starting, ensure that the following software is installed on your host machine:

* Vagrant: Used to create and manage the virtual machine.
* VirtualBox: The provider for running the VM.
* Docker: Installed inside the Vagrant VM for container management.

# Setup Instructions
## 1. Vagrant Environment Setup
After installing both Vagrant and VirtualBox, verify that they are working together by running:

    vagrant version

You should see both the Vagrant version and the version of VirtualBox that Vagrant is using.

## 2. Adding a Vagrant Box

A Vagrant box is a pre-packaged virtual environment that Vagrant uses to create a virtual machine. You can think of it as a base image for your virtual environment.
Adding a Vagrant Box

**Search for a Box:**
Vagrant boxes are available on the Vagrant Cloud repository. You can browse and select a box that suits your needs. For example, you might choose ubuntu/bionic64 for an Ubuntu 18.04 environment.

**Add the Box:**
To add a box to your local environment, use the following command:

    vagrant box add ubuntu/bionic64
Replace **"ubuntu/bionic64"** with the name of the box you want to add.
Vagrant will download the box and add it to your local repository. This may take some time depending on your internet speed.

**Verify the Box:**
To confirm that the box was added successfully, list the available boxes:

    vagrant box list
You should see the newly added box in the list.

## 3. Initializing a Vagrant Environment

Once you have added a Vagrant box, you can initialize a new Vagrant environment.
First, create a directory where you want to store your Vagrant project:

    mkdir my-vagrant-project
    cd my-vagrant-project

**Initialize Vagrant:**
Inside your project directory, run the following command to initialize a Vagrant environment:

    vagrant init ubuntu/bionic64
Replace **ubuntu/bionic64** with the name of the box you want to use.

This command creates a Vagrantfile in your directory. The Vagrantfile is a Ruby-based configuration file that defines the properties of the VM, including the box to use, network settings, and synced folders.

**Customize the Vagrantfile (Optional):**
Open the Vagrantfile in a text editor to customize the configuration. For example, you might want to change the amount of memory allocated to the VM, or forward specific ports.

Example of customizing memory allocation:

    Vagrant.configure("2") do |config|
      config.vm.box = "ubuntu/bionic64"
      config.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
    end
**Start the Virtual Machine**

**Boot the VM:**
To start the VM, run the following command in your project directory:

    vagrant up
Vagrant will create and boot the VM based on the configuration in the Vagrantfile.

**SSH into the VM:**
Once the VM is running, you can SSH into it using:

    vagrant ssh
This command will log you into the VM, where you can start developing or configuring your environment.

**Halt the VM:**
To stop the VM, use:

    vagrant halt
This will shut down the VM.

**Destroy the VM:**
If you no longer need the VM, you can destroy it to free up resources:

	vagrant destroy
## 4. Implementing `playbook.yaml`

The `playbook.yaml` is where you define tasks that Ansible will execute on the target hosts. Here’s a guide on how to create and structure this file:

### Create `playbook.yaml`

1.  **Create the `playbook.yaml` File**: In the same project directory, create a file named `playbook.yaml`:

		touch playbook.yaml
### Example `playbook.yaml`

Below is an example of a simple Ansible playbook that installs Apache on a remote host:
				
	---
	- name: Install and configure Apache
	  hosts: webservers
	  become: true
	  tasks:

	    - name: Update apt cache
	      apt:
	        update_cache: yes

	    - name: Install Apache
	      apt:
	        name: apache2
	        state: present

	    - name: Start Apache service
	      service:
	        name: apache2
	        state: started
	        enabled: yes

	    - name: Create a simple index.html
	      copy:
	        content: |
	          <html>
	          <body>
	          <h1>Welcome to your web server!</h1>
	          </body>
	          </html>
	        dest: /var/www/html/index.html
	        owner: www-data
	        group: www-data
	        mode: '0644'
#### Playbook Breakdown
-   **name**: A human-readable name for the playbook.
-   **hosts**: Specifies the target group defined in the inventory file (`inventory.ini`) where these tasks will be executed.
-   **become**: Indicates that the tasks should be executed with elevated privileges (sudo).
-   **tasks**: A list of tasks to be executed on the target hosts.

### Running the Playbook:
 **Execute the Playbook**: Run the playbook using the following command:
		
		ansible-playbook playbook.yaml

## 5. Implementing the Ansible.cfg

### Setting Up ansible.cfg
The ansible.cfg file is used to configure various options in Ansible, such as inventory file locations, remote user settings, and SSH configurations. Here’s how to create and configure this file:

Create the ansible.cfg File:
In your project directory, create a file named ansible.cfg:

    touch ansible.cfg
Below is a sample configuration for ansible.cfg:

	[defaults]
	inventory = inventory.ini
	remote_user = vagrant
	private_key_file = ~/.vagrant.d/insecure_private_key
	host_key_checking = False
This guide has walked you through setting up the `ansible.cfg` file, creating a simple `playbook.yaml`, and running the playbook. With these configurations, you can manage your infrastructure efficiently using Ansible.

# Conclusion

This setup allows you to develop, test, and run a complete eCommerce application within a controlled Vagrant environment. 
