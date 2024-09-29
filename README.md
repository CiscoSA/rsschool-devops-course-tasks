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
- **```main.tf```**:  
  The main configuration file where the core infrastructure is defined.
- **```outputs.tf```**:  
  This file contains the output definitions for the Terraform resources.
- **```providers.tf```**:  
  This file specifies the providers needed for Terraform configuration.
- **```variables.tf```**:  
  This file defines input variables for Terraform configuration. 
- **```iam.tf```**:  
  This file contains the IAM resource declarations.
- **```s3.tf```**:  
  This file contains the S3 resource declarations.

## How to Use

1. **Clone the repository**
Clone the repository and navigate to the project directory:
```
git clone git@github.com:CiscoSA/rsschool-devops-course-tasks.git
cd rsschool-devops-course-tasks
```
2. **Initialize Terraform:**  
   ```terraform init```

3. **Plan and Apply Changes:**  

   ```terraform plan```  

   ```terraform apply```
