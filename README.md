# DevOps Course

## The goal

The course aims to offer in-depth knowledge of DevOps principles and essential AWS services necessary for efficient automation and infrastructure management. Participants will gain practical skills in setting up, deploying, and managing Kubernetes clusters on AWS, using tools like Kops and Terraform.

# Task: K8s Cluster Configuration and Creation

## File Structure
- **```.github/workflows/```**:
  The directory is where GitHub-specific files are stored, particularly workflows for GitHub Actions.
- **```Screenshots/```**:  
  The directory contains screenshots that are required in some of the tasks.
- **```.gitignore```**:  
  The file specifies which folders or files should be ignored when tracking changes with Git.
- **```README.md```**:  
  This file you're reading.
- **```*.tf```**:  
  Configuration files of Terraform.

## How to Use

1. **Clone the repository**
Clone the repository and navigate to the project directory:
```
git clone git@github.com:CiscoSA/rsschool-devops-course-tasks.git
cd rsschool-devops-course-tasks
git branch task_3
```
2. **Initialize Terraform:**  
   ```terraform init```

3. **Plan and Apply Changes:**  

   ```terraform plan```  

   ```terraform apply```

4. **Deploy the Cluster**
    
    K3s provides an installation script that is a convenient way to install it as a service on systemd or openrc based systems. This script is available at https://get.k3s.io. To install K3s using this method, just run:

    ```curl -sfL https://get.k3s.io | sh -```

    To install additional agent nodes and add them to the cluster, run the installation script with the K3S_URL and K3S_TOKEN environment variables. Here is an example showing how to join an agent:

    ```curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -```

5. **Verify the Cluster**

    Connect to this server from your local computer in any way convenient for you. It can be OpenVPN, Wireguard, SSH-tunnel or using port forwarding with AWS Systems Manager.

    Using the registry configuration of the cluster run the ```kubectl get nodes``` command from your local computer to get information about the cluster.

6. **Deploy a Simple Workload**

    Deploy a simple workload on the cluster using the following command:
    ```kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml```
    
    Ensure the workload runs successfully on the cluster.
    ```kubectl get pods```


