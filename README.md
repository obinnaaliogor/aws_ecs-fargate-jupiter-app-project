# AWS Fargate 3-Tier Application Deployment

This repository contains a Dockerfile for building a 3-tier application that will be deployed on AWS Fargate using a Load Balancer. The application uses the Apache HTTP server and is designed to run on Amazon Linux.

## Overview

The application consists of three layers:

1. **Frontend Layer**: This layer serves as the web frontend and will be accessible through the Load Balancer's public endpoint. It provides a user interface for interacting with the application.

2. **Application Layer**: The application logic resides in this layer. It handles requests from the frontend and processes data accordingly.

3. **Database Layer**: This is the backend layer that stores and retrieves data for the application. It will be decoupled from the frontend and application layers.

## Prerequisites

Before deploying the application, make sure you have the following services set up on AWS:

1. **Amazon VPC**: Create a Virtual Private Cloud (VPC) to host the application resources.

2. **Amazon ECS**: Set up an ECS cluster to manage the Fargate tasks.

3. **Amazon RDS**: Create an RDS instance for the database layer.

4. **Application Load Balancer (ALB)**: Set up an ALB to distribute incoming traffic to the Fargate tasks.

## Deployment Steps

Follow these steps to deploy the application on AWS Fargate:

### Step 1: Clone the Repository

```bash
git clone https://github.com/obinnaaliogor/aws_ecs-fargate-jupiter-app-project.git
cd aws_ecs-fargate-jupiter-app-project
```

### Step 2: Build the Docker Image

Use the provided Dockerfile to build the Docker image for the application. The image will be used in the Fargate tasks.

```bash
docker build -t jupiter-app .
```

### Step 3: Push the Docker Image (Optional)

If you plan to use Amazon ECR to store the Docker image, push the image to your ECR repository.

```bash
# Assuming you have already set up the AWS CLI and logged in.
aws ecr get-login-password --region <AWS_REGION> | docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com
docker tag jupiter-app:latest <ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com/jupiter-app:latest
docker push <ACCOUNT_ID>.dkr.ecr.<AWS_REGION>.amazonaws.com/jupiter-app:latest
```

### Step 4: Create Fargate Task Definition

Create a Fargate task definition that uses the Docker image created in Step 2. Specify the appropriate environment variables and resource requirements.

### Step 5: Configure the Application Load Balancer

Set up the Application Load Balancer with listeners and target groups. Point the target group to the Fargate task created in Step 4.

### Step 6: Deploy the Fargate Service

Create an ECS service that uses the task definition created in Step 4. Configure the service to use the Application Load Balancer created in Step 5.

### Step 7: Access the Application

After the service is up and running, you can access the application through the Load Balancer's public DNS or domain name.

## Cleaning Up

To avoid incurring unnecessary costs, make sure to clean up the resources when you are done testing or using the application.

## Disclaimer

This repository is provided as a sample for educational and testing purposes only.
For more information on deploying applications on AWS Fargate and setting up a 3-tier architecture, please refer to the official AWS documentation.

Happy coding! 😊