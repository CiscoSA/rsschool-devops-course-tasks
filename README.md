# DevOps Course

## The goal

The course aims to offer in-depth knowledge of DevOps principles and essential AWS services necessary for efficient automation and infrastructure management. Participants will gain practical skills in setting up, deploying, and managing Kubernetes clusters on AWS, using tools like Kops and Terraform.

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

# Task: K8s Cluster Configuration and Creation

## Objective

In this task, you will configure and deploy a Kubernetes (K8s) cluster on AWS using either kOps or k3s. You will also verify the cluster by running a simple workload.

## Steps

1. **Choose Deployment Method**

   - Get familiar with both [kOps](https://kops.sigs.k8s.io/) and [k3s](https://k3s.io/).
   - Decide which deployment method is more suitable for you based on the following considerations:
     - kOps handles the creation of most resources for you, while k3s requires you to manage the underlying infrastructure.
     - kOps may lead to additional expenses due to the creation of more AWS resources.
     - kOps requires a domain name or sub-domain.
     - Use AWS EC2 instances from the Free Tier to avoid additional expenses.

2. **Create or Extend Terraform Code**

   - Create or extend Terraform code to manage AWS resources required for the cluster creation.
   - Ensure the code includes the creation of a bastion host.

3. **Deploy the Cluster**

   - Deploy the K8s cluster using the chosen method (kOps or k3s).
   - Ensure the cluster is accessible from your local computer.

4. **Verify the Cluster**

   - Run the `kubectl get nodes` command from your local computer to get information about the cluster.
   - Provide a screenshot of the `kubectl get nodes` command output.

5. **Deploy a Simple Workload**

   - Deploy a simple workload on the cluster using the following command:
     ```sh
     kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml
     ```
   - Ensure the workload runs successfully on the cluster.

6. **Additional Tasks**
   - Implement monitoring for the cluster using Prometheus and Grafana.
   - Document the cluster setup and deployment process in a README file.


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