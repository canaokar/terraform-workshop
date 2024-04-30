## Instalation:

### Step 1:

Install Terraform : <https://developer.hashicorp.com/terraform/install>

### Step 2:

1. Install AWS CLI: <https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html>

2. Run command `aws configure` and follow instructions.

## Tasks:

### Step 1: Build an EC2 instance with Terraform

1. Create a directory, use any name you like.

2. Create a `main.tf` file:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_server_[YOUR_NAME]" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  tags = {
    Name = "my-terraform-demo-[YOUR_NAME]"
  }
}
```

3. In the directory, run the command `terraform init`

4. Run `terraform plan`

5. Run `terraform apply`, enter `Yes`.

### Step 2: Change Infrastructure

1. Change the `ami` value in the `main.tf` file to `ami-02e1a4ebef29334f9`

2. Run `terraform plan`

3. Run `terraform apply`, enter `Yes`

### Step 3: Add Variables

1. Create a new file `variables.tf`:

```hcl
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "my-new-terraform-demo-[YOUR_NAME]"
}
```

2. Make changes to the `main.tf` file:

   In the `tags` section, replace `Name = "my-terraform-demo-[YOUR_NAME]` with `Name = var.instance_name`

3. Run `terraform plan`

4. Run `terraform apply`, enter `Yes`

### Step 4: Destroy the Infrastructure

1. Run `terraform destroy`, enter `Yes`
