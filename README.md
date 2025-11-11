# API Gateway Deployment with Terraform using Cloud Build

This repository automates deployment of **Google Cloud API Gateway** using **Terraform** and **Cloud Build**.

## 🔁 Flow

1. Developer updates `environments/*.tfvars` and pushes changes to `main`.
2. Cloud Build trigger runs automatically.
3. Terraform initializes, plans, and applies infrastructure.
4. API Gateway is deployed and linked to the backend service (e.g., Cloud Run).

## ⚙️ Prerequisites

Enable required APIs:
```bash
gcloud services enable apigateway.googleapis.com cloudbuild.googleapis.com run.googleapis.com iam.googleapis.com
