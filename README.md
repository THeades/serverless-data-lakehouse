# The Serverless Data-Lakehouse
This will be an example project of showing how to setup and build a serverless Data Lakehouse on AWS using Terraform.


The idea is to add step after step new components to this project. If you are interested in a specific feature or technology, I would appreciate to hear from you :)

## Prologue
In my current role as "Cloud DataOps Engineer", I face every day new challenges to bringing more value to the company where I work.
I created this project to share some of my experience of building a Data Lakehouse and to support other Data and DataOps Engineers to be more agile in their work.

## The advantage of Terraform
As main technology in this project, I will be using Terraform to describe the infrastructure. From my perspective, managing "backend" tasks (What also includes Data Engineering in a rougher sense) on a infrastructure level makes much more sense.
The idea is to encapsulate every single part of the (business) logic that needs to be built as one part of the infrastructure.
At this point Terraform comes into play. I see Terraform similar to a very flexible type of framework but for infrastructure. With this approach, any kind of complex infrastructure can be described using reusable modules and automation.
Like known Frontend Frameworks, Terraform can be utilized to get the same effect of being fast, agile and productive on backend and infrastructure development.

The above mentioned effects of Terraform especially come into place by using serverless components.

## What is serverless?
It depends on the perspective how to define serverless, but in general one can say that serverless is a more efficient way of using computing resources in hyper-scaler environments like AWS.
This is done by a soft layer of administration on top of physical servers. Using serverless services, you can have the following advantages:

### 1. Pay-As-You-Go Model:
This means, you only pay when you use something and you only pay as much of resources as you need. In other words, the payment is coupled on the dimensions time and compute size. In difference to classical provisioning servers, you always pay a certain amount for resource, even when they are in idle.

### 2. No need of Administration:
Using serverless services, the lower level of administration of the underlying systems are done by the provider of the service. In most cases this includes software and security patches, but also the distribution on a cluster and scaling of the services.

### 3. Easy integration into the Ecosystem:
Serverless services in a cloud environment like AWS mostly have a strong integration into the existing ecosystem. This means that building complex infrastructures using serverelss componentens can be well integrated with each other by using pre defined interfaces to provide a highly scalable interchange of data.
In AWS, most serverless components can be connected directly or indirectly with each other using pipeline, streaming or messaging technologies.

#### All of these advantages will be a part of this example project.


## What is a Data Lakehouse?
From my experience as Data and DataOps Engineer, I would define a Data Lakehouse as a Datalake with Data Warehouse capabilities.
So the focus is more on the Datalake side than on the Data Warehouse side. But this can be different for every single domain and how the exact implementation looks like to serve the use cases.


# Roadmap (Will change over time)

1. Providing the first ingesting layer by adding the Database Migration Service. (Ongoing)
2. Turn raw data into Apache Iceberg tables for high query performance on large data amounts. (Waiting)


# Installation

## Prerequisites

You need:
1. AWS Account
2. AWS CLI v2 (Set the credentials into the [default] and [serverless-data-lakehouse] profiles.)
3. Terraform CLI
4. Make
5. Python 3.9 oder newer

### Initialize Terraform
There are multiple ways of handling the Terraform state and lock. I can recommend to use the AWS hosted variant using an S3 Bucket and a DynamoDB.

1. Create a Bucket in you AWS Account where you want to store the tfstate file per environment.
2. Create a DynamoDB to handle the state lock.
3. Edit the file ```environments/[env]/backend.conf``` and set the Bucket and Table name to the one you set in your account.
4. To initialize the Terraform backend, run this command: ```terraform init```
5. To execute the Terraform apply you can use the Makefile provided in this project as a short cut: ```make tf-apply env=[env]``` (set env equals to "dev" or "prod")