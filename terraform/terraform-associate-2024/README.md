## Installtion of Terraform ##

As below Official link of terraform we can use and download and install the terraform in diffrenet operating systems i.e Windows, Linux, Mac etc.

`Download Link:` https://developer.hashicorp.com/terraform/install

## Terraform Commands ##

terraform init # Command uses initiliaze and download the providers associated with the terraform provider.tf file `Ex:` .terraform/providers/registry.terraform.io/hashicorp

terraform plan # Command is execute the actual plan before creating the resources.

terraform apply # Command is create the resources are defined in terraform configuration.

terraform fmt # Command is used to rewrite Terraform configuration files to a canonical format and style

terraform destroy # Command is used to destroy the resourtces are created from the terraform configuration.

terraform destory `-target <resource type.local resource name>` # If you want destroy for specific resource need to use -target option.

`EX:` resource "aws_instance" "example_instance" 

`Details:` aws_instance is resource type, . is a separator and example_instance is a local resource name

terraform show # Command showcase the state file resources.

## Terraform State File ##

`Terraform state file` When you run the `terraform apply` command it will create the `terraform.tfstate` file with the resources are provided in the terraform configuration.

## Desired State ##

Terraform's primary function is to create, modify and destroy the infrastrucrture resources to match the desired state described in terraform configuration.

`Ex:` resource "aws_instance" "example_Instance" {
    ami           = "ami-01b799c439fd5516a"
    instance_type = "t2.micro"
}  

## Current State ##

Current is a actual state of resource that is currently deployed.

`Ex:` resource "aws_instance" "example_Instance" {
      ami           = "ami-01b799c439fd5516a"
      instance_type = "t2.medium"
}  

`Important Note:` Terraform tries to ensure that the deployed infrastructure is based on the desired state. If there is a difference b/w the two, terraform plan presents a description of the changes necessary to acheive the desired state.

How this tested?

1. Created a EC2 instance by using terraform configuration with the t2. micro
2. Manually stopped the EC2 instance and chnages from t2.micro to t2.medium and started the instance.
3. In Back to terminal and ran the `terraform plan` command it's showing update in-place and 1 to change.
4. After running the `terraform apply` command it's matches the desired state of the Ec2 instance i.e chnages from `t2.medium to t2.micro`.

## Provider Versioning ##

During terraform init, if version argument is not specified the most recent provider will be downloaded during initilization.

`Note:` For production use, you should constrain the acceptable provider version via configuration, to enusre that new versions with breaking changes will not be automatically installed.

`Example code snippet:` 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

## Controlling the versions of terraform provider ## 

>= 1.0.0 - Versions greater than or equal to the 1.0.0.

<= 1.0.0 - Versions lesser than or equal to 1.0.0.

>= 1.0.0, <= 2.0.0 - Any version b/w the 1.0.0 and 2.0.0

~> 1.0.0 - Any version in the 1.X range

`Note:` For version testing earlier i'm not specified any version for provider as below. it's downloaded latest version of aws provider.

# Configure the AWS Provider

provider "aws" {
  region     = "us-east-1"
}

But when i add the as below provider with the specific version constraint terraform lock file is not allowing me to dowload the specific version, due to earlier which is dowloaded the latest version and locked with the file name called `.terraform.lock.hcl`

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 5.0"
    }
  }
}

`Error: Failed to query available provider packages`
│ 
│ Could not retrieve the list of available versions for provider hashicorp/aws: locked provider registry.terraform.io/hashicorp/aws 5.55.0 does not match configured version
│ constraint <= 5.0.0; must use terraform init -upgrade to allow selection of new versions

`Fix:` Delete the `.terraform.lock.hcl` file and re-run the `terraform init` command it's download the `version = "<= 5.0"`

By using `terraform init -upgrade` command you can upgrade the provider version.

## Terraform Refresh ##

`terraform refresh` command chnages the state file when you modified the resources manually in the AWS console.

`1 Example:` You have created Ec2 instance by using terraform, in the instance security group was default. Yoy manually created the custom security group and remove the default one and attached custom SG with the EC2 instance. Then hit the `terraform refresh` it's modified in terraform.tfstate file `default to custom`

`2 Example:` If you change the region in providers.tf form `us-east-1 to us-west-2` and run the `terraform refresh` command `terraform.tfstate` file completely empty and all of our configurations went away and by using `terraform.tfstate.backup` update the `terraform.tfstate` file for our configuration.

`Note:` Don't run manually for the `terraform refresh` command.

## AWS Provider - Authentication Configuration ##

1. Don't add your AWS access keys and secret keys directly in the terraform provider configurations.
2. Create the IAM user and under the user --> security credentials --> create access key and download the keys.
3. Download the aws cli in the specific operating system by using as below link.

`Reference link:` https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

4. Run the `aws configure` and provide the access key id and secret access key from the downloaded credentails from 2nd step.

AWS Access Key ID [****************SD2U]: cxxxxxxxxxxxxxxxxx

AWS Secret Access Key [****************X1GY]: Dxxxxxxxxxxxxxxx

Default region name [us-east-1]: 

Default output format [None]:

5. Now run the terraform commands it's works
6. Another way is add the variables in your terraform configuration and run the terraform commands. i.e refer varaibles.tf 

`For More Details and ways:` https://registry.terraform.io/providers/hashicorp/aws/5.53.0/docs

