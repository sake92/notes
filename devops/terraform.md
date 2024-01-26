

## Usage

```sh
# initialize terraform state (usually kept in an S3 bucket + dynamodb table)
terraform init

# what terraform thinks it needs to do
terraform plan

# do the stuff, apply needed changes
terraform apply
```

# Remove everything
terraform destroy


--------------

## Terraform & AWS

### Authentication
You can do either:
- `aws configure` and terraform will use those creds, OR
- export `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`

### Locking Bootstrap

1. initialize state in local file
2. create s3 bucket and dynamodb table
3. AGAIN initialize state in s3
4. off you go!

```sh
# first initialize terraform state in LOCAL FILE
terraform init
```

Then create s3 bucket (storing state(s)) and dynamodb table (used for locking):
```
resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name

  // This is only here so we can destroy the bucket as part of automated tests. You should not copy this for production
  // usage
  force_destroy = true

}

# Enable versioning so you can see the full revision history of your
# state files
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Explicitly block all public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

```

Again initialize the state, the local one is copied to s3.  
From now on, when someone does `terraform apply`, terraform will 
- first acquire a lock
- apply the changes
- release the lock

This will prevent concurrent changes.


## Basic concepts

- "resource" - thing you want to create: s3 bucket, ec2 instance, role, permission..
- "variable" - input variable for terraform module
- "local" - local variable in a terraform module
- "output" - output variable, printed after `terraform apply`, so we can use them
- "data" - *reference* to an **existing resource**, usually not managed by terraform, e.g. "default VPC" or whatevs

Variables are like function parameters,  
locals are local variables,  
outputs are return values.

When you reference a variable, terraform will make a dependency graph, so it knows in which order to create/update resources.

When you run `terraform apply`, it will take all `.tf` files (will **not** go into subdirectories!) and merge them to create a final config.  
You can split your files into logical components, for example:
- `main.tf`
- `variables.tf`
- `outputs.tf`
- `db.tf`
- `my_other_stuff.tf`

### Terraform workspace

Logical separation of terraform executions.  
There is always a "default" one, used by.. default.

You might have multiple envs: "staging", "prod"..  
`terraform workspace new staging`

So you can do 
```sh
terraform workspace select staging
terraform apply
```

Or set `TF_WORKSPACE=staging` and then run terraform.

### Referencing other terraform stuff

You can set up "terraform_remote_state" to reference another terraform setup.  
Maybe you have multiple setups:
- one for networking, doesnt changes often
- one for IAM
- one for databases
- one for your apps

If you need IAM stuff, you could use terraform_remote_state to use those vars.  
E.g. `data.terraform_remote_state.iam.outputs.whatever`
