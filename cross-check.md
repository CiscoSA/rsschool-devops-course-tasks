# Task3: K8s Cluster Configuration and Creation

# Submission

- Provide a PR with the Terraform code for the K8s cluster and bastion host.
- Provide a screenshot of the `kubectl get nodes` command output.
- Ensure that the simple workload is deployed and running successfully on the cluster.
- Provide a PR with the monitoring setup.
- Provide a README file documenting the cluster setup and deployment process.

## Evaluation Criteria (100 points for covering all criteria)

1. **Terraform Code for AWS Resources (10 points)**

   - Terraform code is created or extended to manage AWS resources required for the cluster creation.
     - https://github.com/CiscoSA/rsschool-devops-course-tasks/tree/task_3
   - The code includes the creation of a bastion host.
     - https://github.com/CiscoSA/rsschool-devops-course-tasks/blob/task_3/ec2-bastion.tf

     ![](Screenshots/ec2.png)

2. **Cluster Deployment (60 points)**

   - A K8s cluster is deployed using either kOps or k3s.
   - The deployment method is chosen based on the user's preference and understanding of the trade-offs.

   ![](Screenshots/k3s.png)

3. **Cluster Verification (10 points)**

   - The cluster is verified by running the `kubectl get nodes` command from the local computer.
   - A screenshot of the `kubectl get nodes` command output is provided.

   ![](Screenshots/kubectl.png)

4. **Workload Deployment (10 points)**

   - A simple workload is deployed on the cluster using `kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml`.
   - The workload runs successfully on the cluster.

   ![](Screenshots/kubectl.png)

5. **Additional Tasks (10 points)**
   - Document the cluster setup and deployment process in a README file.
     - https://github.com/CiscoSA/rsschool-devops-course-tasks/blob/task_3/README.md
