## What Is Terraform ? ##

HashiCorp Terraform is an immutable, declarative infrastructure as code tool that lets you define both cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share. The language is based on HashiCorp Configuration Language (HCL) or JSON for configuration files.

### How does Terraform works? 

Terraform creates and manages resources on cloud platforms and other services through their application programming interfaces (APIs). Providers enable Terraform to work with virtually any platform or service with an accessible API.

![alt text](<How terraform works.png>)

## Advantages of Terraform ##

Infrastructure as Code (IaC) tools allow you to manage infrastructure with configuration files rather than through a graphical user interface.

`Manage any infrastructure` --> Terraform plugins called providers let Terraform interact with cloud platforms and other services via their application programming interfaces (APIs).

`Standardize your deployment workflow` --> Providers define individual units of infrastructure, for example compute instances or private networks, as resources. You can compose resources from different providers into reusable Terraform configurations called modules, and manage them with a consistent language and workflow. 

![alt text](Deployment-Workflow.png)

`Track your infrastructure` --> Terraform keeps track of your real infrastructure in a state file, which acts as a source of truth for your environment.

`Collaborate` --> Terraform allows you to collaborate on your infrastructure with its remote state backends.

`Reference Link:` https://developer.hashicorp.com/terraform/tutorials/aws-get-started/infrastructure-as-code

## Terraform Core Functions ##

The core Terraform workflow has three steps:

  - Write - Author infrastructure as code.

  - Plan - Preview changes before applying.

  - Apply - Provision reproducible infrastructure

## Installtion of Terraform ##

As below Official link of terraform we can use to download and install the terraform in diffrenet operating systems i.e Windows, Linux, Mac etc.

`Download Link:` https://developer.hashicorp.com/terraform/install

## What is Terraform Provider? ##

`A provider is a plugin that enables Terraform to interact with a specific cloud or service provider, such as Amazon Web Services (AWS), Microsoft Azure, or Google Cloud Platform (GCP). Providers are responsible for understanding the APIs and resources the target` infrastructure platform provides and for translating Terraform configuration code into API calls.

## Terraform Commands ##

terraform init # Command uses initiliaze and download the providers associated with the terraform provider.tf file, downloads the required modules referenced in the configuration, initializes the backend configuration

`Ex:` .terraform/providers/registry.terraform.io/hashicorp

terraform init `-backend-config` # Initiliazes the backend with the provided configuration.

terraform init `-migrate-state` # To migrate the existing state file to the specified backend.

terraform validate # It's validates syntax configuration, If no syntax errors the output is Success! The configuration is valid

terraform plan # Command creates an execution plan and determines what changes are required to achieve the desired state in the configuration files.

terraform plan -refresh-only # Command is specifically designed to only refresh the Terraform state to match any changes made to remote objects outside of Terraform.

terraform apply # Command is create the resources are defined in terraform configuration.

terraform apply -refresh-only # Can be used to detect configuration drift by refreshing the state of the infrastructure without making any changes. 

terraform apply -refresh=false # Is used to prevent Terraform from refreshing the state of the infrastructure resources before applying changes

terraform apply -replace # Command manually marks a Terraform-managed resource for replacement, forcing it to be destroyed and recreated on the apply execution.

`Note:` This command replaces terraform taint, which was the command that would be used up until 0.15.x. You may still see terraform taint on the actual exam until it is updated.

terraform fmt # Command is used to rewrite Terraform configuration files to a canonical format and style.

terraform fmt -check -recursive # The `-check option` will make the command return a non-zero exit code if any of the files are not properly formatted and `-recursive` option instructs it go into the sub-directories.

terraform destroy # Command is used to destroy the resources are created from the terraform configuration.

`Note:` You can also simply remove or comment the resource configuration from your code and run `terraform apply`. This will also destroy the resource.

terraform destory `-target <resource type.local resource name>` # If you want destroy for specific resource need to use -target option.

`EX:` resource "aws_instance" "example_instance" 

`Details:` aws_instance is resource type, . is a separator and example_instance is a local resource name

terraform apply -destroy # By using the `-destroy` flag with the `apply` command, you can achieve the same result as the `destroy` command.

terraform show # Command showcase the state file resources.

## Terraform State File ##

`Terraform state file` When you run the `terraform apply` command it will create the `terraform.tfstate` file with the resources are provided in the terraform configuration. State file is a requirement for terraform function.

1. When using local state, the state file is stored in plain-text
2. Terraform Cloud always encrypts state at rest
3. The Terraform state can contain sensitive data, therefore the state file should be protected from unauthorized access.
4. Storing state remotely can provide better security.

## Desired State ##

Terraform's primary function is to create, modify and destroy the infrastrucrture resources to match the desired state described in terraform configuration.

`Ex:` 
```bash
    resource "aws_instance" "example_Instance" {
    ami           = "ami-01b799c439fd5516a"
    instance_type = "t2.micro"
}  
```
## Current State ##

Current is a actual state of resource that is currently deployed.

`Ex:` 
```bash
      resource "aws_instance" "example_Instance" {
      ami           = "ami-01b799c439fd5516a"
      instance_type = "t2.medium"
}
```

`Important Note:` Terraform tries to ensure that the deployed infrastructure is based on the desired state. If there is a difference b/w the two, terraform plan presents a description of the changes necessary to acheive the desired state.

How this tested?

1. Created a EC2 instance by using terraform configuration with the t2. micro
2. Manually stopped the EC2 instance and chnages from t2.micro to t2.medium and start the instance.
3. Back to terminal and ran the `terraform plan` command it's showing update in-place and 1 to change.
4. After running the `terraform apply` command it's matches the desired state of the Ec2 instance i.e chnages from `t2.medium to t2.micro`.

## Provider Versioning ##

During terraform init, if version argument is not specified the most recent provider will be downloaded during initilization.

`Note:` For production use, you should constrain the acceptable provider version via configuration, to enusre that new versions with breaking changes will not be automatically installed.

`Example code snippet:` 

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

## Controlling the versions of terraform provider ## 

`>= 1.0.0 - Versions greater than or equal to the 1.0.0.`

`<= 1.0.0 - Versions lesser than or equal to 1.0.0.`

`>= 1.0.0, <= 2.0.0 - Any version b/w the 1.0.0 and 2.0.0`

`~> 1.0.0 - Any version in the 1.X range`

`Note:` For version testing earlier i'm not specified any version for provider as below. it's downloaded latest version of aws provider.

# Configure the AWS Provider

```bash
provider "aws" {
  region     = "us-east-1"
}
```
But when i add the as below provider with the specific version constraint terraform lock file is not allowing me to dowload the specific version, due to earlier which is dowloaded the latest version and locked with the file name called `.terraform.lock.hcl`

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 5.0"
    }
  }
}
```

`Error: Failed to query available provider packages`

 Could not retrieve the list of available versions for provider hashicorp/aws: locked provider registry.terraform.io/hashicorp/aws 5.55.0 does not match configured version
 constraint <= 5.0.0; must use terraform init -upgrade to allow selection of new versions.

`Fix:` Delete the `.terraform.lock.hcl` file and re-run the `terraform init` command it's download the `version = "<= 5.0"`

By using `terraform init -upgrade` command you can upgrade the provider version.

** Why it is important to declare a required provider version in Terraform?**

`Note:` providers are released on a separate schedule from Terraform itself, therefore a newer version could introduce breaking changes.

## Terraform Refresh ##

`terraform refresh` command chnages the state file when you modified the resources manually in the AWS console.

`1 Example:` You have created Ec2 instance by using terraform, in the instance security group was default. You manually created the custom security group and remove the default one and attached custom SG with the EC2 instance. Then hit the `terraform refresh` it's modified in terraform.tfstate file `default to custom`

`2 Example:` If you change the region in providers.tf form `us-east-1 to us-west-2` and run the `terraform refresh` command `terraform.tfstate` file completely empty and all of our configurations went away and by using `terraform.tfstate.backup` update the `terraform.tfstate` file for our configuration.

`Note:` Don't run manually for the `terraform refresh` command.

## AWS Provider - Authentication Configuration ##

1. Don't add your AWS access keys and secret keys directly in the terraform provider configurations.
2. Create the IAM user, under the user --> security credentials --> create access key and download the keys.
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

`Important Note for terraform Versions`: Just because a better approach is recommended, does not always mean that older approach will stop working. Search for specific version documents you will get the example usage based on your requiremnets.

`Example of New version 5.53.0 approach:`

```bash
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}
```

`Example of Old Version 4.48.0 Approach:`

```bash
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
}
```
`Reference document:` https://registry.terraform.io/providers/hashicorp/aws/5.53.0/docs

## Basics Of Attributes ##

Each resource has its associated set of attributes.
Attributes are the fields in a resource that holds the values that end up in the state.

When you run the terraform apply commands in the `.terraform.tfstate` file we can able to see the attributes.

`Example Attribute`

{
          "schema_version": 0,
          "attributes": {
          "private_dns": null,
          "public_dns": "ec2-100-29-169-75.compute-1.amazonaws.com",
          "public_ip": "100.29.169.75",
          }
}            

`For more Details:` https://registry.terraform.io/providers/hashicorp/aws/5.53.0/docs/resources/instance#attribute-reference

## Cross Referencing Resource Attribute ##

Terraform allows us to refernce the attribute of one resource to be used in a different resource.

`Syntax:`

Ex: `<RESOURCE TYPE>.<NAME>. <ATTRIBUTE>>`

We can specify the resource address with the attribute for cross-referencing.

1. Creating the elastic ip 
2. Creating the security group
3. Creating the inbould rule which we are cross referencing the elastic ip for the cidr ipv4 block.
4. For More details check the cross-reference-attributes.tf file

`Ex:` 

```bash
resource "aws_eip" "lb" {
  domain   = "vpc"
}
```
```bash
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "${aws_eip.lb.public_ip}/32"
}
```
## String Interpolation in Terraform ##

${...}): This syntax indicates that Terraform will replace the expression inside the curly braces with it's calculated value.

`Ex:` cidr_ipv4         = "${aws_eip.lb.public_ip}/32"

### Output Values

Terraform Output values make information about your infrastructure available on the commandline, and can expose information for terraform configurations to use.

Referer the terraform code for `output-values/output-values.tf` file.

`Ex1:` Yo want a `pubic ip` attribute as a output value.

```bash
resource "aws_eip" "lb" {
    domain = "vpc"
}

output "public_ip" {
    value = aws_eip.lb.public_ip
}
```

![alt text](Terraform-Output-Values.png)

`Ex2:` Since you were not decided which attribute needs to output the code block should be like as below and it's output the values are domain, public ip, public dns etc.

```bash
resource "aws_eip" "lb" {
    domain = "vpc"
}

output "public_ip" {
    value = aws_eip.lb
}
```
![alt text](Terraform-Output-Values-all.png)

`Note:` Output values defined in Project A can be referenced from code in project B as well.

### Variables

Update important values in one central place instead of searching and replacing them throught your code, saving time and potential mistakes. Managing the variables in production env. is one of the very important aspect to keep the code clean and reusable.

Refer `variables/main.tf, variables.tf` for more details.

### TF Vars 

tfvars files are used to store variable definitions. This allows you to externalize your variable definitions and makes it easier to manage them, especially if you have a large number of variables or need to use the same variables in multiple environments.

1. Terraform knows if the values doesn't part of the variables.tf file it will pick from the `terraform.tfvars` file.
2. If you keep the empty `terraform.tfvars` file and it will take value from the `varaibles.tf `file.
3. Even though if the value presents in `varaibles.tf` file it will took value from the `terraform.tfvars` file only.
4. `Note:` HashiCorp recomands creating a separate file with the name of `*.tfvars` to define all variable value in a project.
5. Organization have wide set of environments: Dev, Stage, Prod etc. In this case you need pass the command line arguments explictly.

Ex: `terraform plan -var-file dev.tfvars`

### Variable  Defination Precedence

Terraform loads variables in the following order, with later sources taking precendence over earlier one.

1. Environment variables
2. The terraform.tfvars files, if it's present.
3. The terraform.tfvars.json file, if it's present.
4. Any *.auto.tfvars or *.auto.tfvars.json files, processed in the lexical order of their file names.
5. Any -var and -file-var options on the command line.

**Testing Example1:** Even you have `variables.tf file` in the terraform configuration with the `intsance_type = t2.micro` in the system env `TF_VAR_instance_type=t2.medium`. While running `terraform plan` it's should be considered as a system env only, due to it's having higher Precedence.

**Testing Example2:** Even when you have added as a sytem env `TF_VAR_instance_type=t2.micro` or value in `terraform.tfvars` file having `t2.large` while executing the command line `terraform plan -var="instance_type=m5.large"` it's should be considered as a command line only, due it's having higher Precedence.

**Testing Example3:** Even when you have `variables.tf file` in the terraform configuration with the `intsance_type = t2.micro` and `terraform.tfvars` having `instance_type = t2.large` it's should be considered as `t2.large` due it's having higher Precedence.

## Data Types ##

Data type referes to the `type of the value.` Depending on the requirement we can use wide variety of values in terraform configuration.

**Example Data type:** 

`Hello world` is `string` Refer `data-types/string-type/`

`7576` is a `number`

`true` or `false` is a `boolean`

`list` or `tuple` collection of values, like `["us-west-1a", "us-west-1c"]` i.e See the example of `datatypes/data-type-list.tf`

`set` is acollection of unique values that do not have any secondary identifiers or ordering.

`map` or `object` collection of of key values identified by named labels, like `{name = "Mabel", age = 52}.` Refer `data-types/map-type/map-type.tf`

`null` a value that represents absence or omission. If you set an argument of a resource to null, Terraform behaves as though you had completely omitted it.

`Reference Link`: https://developer.hashicorp.com/terraform/language/expressions/types#types

## Count and Count Index ##

Count referes total no. of instances, users etc. want's to create Ex: Refer `count/count.tf`

Count Index allows us to fetch the index of each iteration in the loop. `${count.index}` will start from zereo. Ex: Refer `count-index/count-index.tf`

`Note:` Having a username like loadbalancer0, loadbalancer1 might not always suitable. Better names like `dev-loadbalancer`, `test-loadbalancer` etc. count.index help such scenario as well.

## Conditional Expression ##

A conditional expression uses the value of `bool` expression to select one of two values.

`Syntax:` condition ? true_val : false_val

`Example:` var.environment == "production" && var.region == "us-east-1" ? "m5.large" : "t2.micro" i.e `production && var.region` is condition as per above syntax then `?` symbol then in `m5.large: t2.micro` `m5.large` is true and `t2.micro` is false. Check more details on code `conditional-expression/conditional.tf`

`Reference Link:` https://developer.hashicorp.com/terraform/language/expressions/conditionals#conditional-expressions

## Terraform Functions ##

A function is a block of code that performs a specific task.

file()reads the contents of a file at the given path and returns them as a string.

`terraform console` allows you to interactively explore your Terraform configuration and state. It is more useful for debugging and exploring the Terraform environment.

`Note:` In order to use this command, the CLI must be able to `lock the state` to prevent changes, ensuring that the state remains consistent during the interactive exploration process.

![alt text](terraform-console.png)

`Importance of file function:` File function can reduce the overall terraform code size by loading contents from external sources during terraform operations. 

`Example:` We have a `functions/functions.tf` we can add the code of `iam-user-policy.json` file also in the same `functions.tf` file. Since we are using the file function to reduce the size of the code and unfortunatley we can change any line of json it won't work.

Refer how we used file function for `iam-user-policy.json` file in the `functions.tf` file.

### Lookup Function

lookup retrieves the value of a single element from a map, given its key. If the given key does not exist, the given default value is returned instead.

`syntax:` lookup(map, key, default) ==> lookup({a="ay", b="bee"}, "a", "what?") ==> map is `{a="ay", b="bee"}` then `"a"` is key and default is `"what?`"

`Realtime Example:` lookup({"us-east-1" = "ami-08a0d1e16fc3f61ea", "us-west-2" = "ami-0b20a6f09484773af", "ap-south-1" = "ami-0e1d06225679bc1c5"},"us-east-1")

### Length Function

length determines the length of a given list, map, or string.

If given a list or map, the result is the number of elements in that collection. If given a string, the result is the number of characters in the string.

`Syntax:` length(["a", "b"]) ==> The output should be `2` while executing in terminal with the `teraaform console.`

`Realtime Example:` length(["firstec2","secondec2"])

### Element Function

element retrieves a single element from a list. The `index is zero-based`. This function produces an error if used with an empty list. The index must be a non-negative integer.

`Syntax:` element(list, index) ==> element(["a", "b", "c"], 1) ==> The output should be `"b"` since index count starts from zero.

`Realtime Example:` element(["firstec2","secondec2"], 2)

### Formatdate Function

formatdate converts a timestamp into a different time format. In the Terraform language, timestamps are conventionally represented as strings using RFC 3339 "Date and Time format" syntax. formatdate requires the timestamp argument to be a string conforming to this syntax.

`Syntax:` formatdate("DD MMM YYYY hh:mm ZZZ", "2018-01-02T23:12:01Z")

`Realtime Example`: formatdate("DD MMM YYYY hh:mm ZZZ",timestamp()) ==> It will printout the current date in UTC format, in Date, Month, Year, and time.

For More details check `functions/functions-challange/functions-challange.tf` file for execution.

`For More Functions Reference:` https://developer.hashicorp.com/terraform/language/functions

## Local Values ##

A local value assigns a name to an expression, allowing it to be used multiple times with in a module without repeating it.

Local values can be `helpful to avoid repeating the same values or expressions multiple times in a configuration.`

Refer for more details `local-values/local-values.tf`

## Data Sources ##

Data sources allow Terraform to use/fetch information defined outside of Terraform. A data source is accessed via special kind of resource known as data resource, declared using as as data block. The code block of `data-source/data-source.tf` while applying the terraform apply it will read the content of `demo.txt` and available in `terraform.tfstate` attributes: content.

![alt text](Data-Source.png)

`Example Syntax`: data "aws_instance" "foo" {}

`${path.module}` returns the current file system path where your code is located.

## Fetching the Latest OS Image Using Data Source ##

We can fetch the Latset AMI id by using the data source block. check for more details `data-source/data-source-ami.tf`. By using this code we can test by different regions.

## Debugging In Terraform ##

Terraform has detailed logs which can be enabled by setting the `TF_LOG` environment variable to any value. You can set `TF_LOG` to one of the log levels TRACE, DEBUG, INFO, WARN and ERROR to change the verbosoity of the logs.

When you pass the environment variables i.e `export TF_LOG=TRACE` and apply the terraform commands we can able to get the complete log details about the terraform configuration. 

`Note:` export `TF_LOG=TRACE` having the more verbosity comapre to DEBUG.

Instead of getting the logs in command line if you want to store the logs in any file path we can add the variable `export TF_LOG_PATH=/tmp/terraform-crash.log`

**Debugging Models in Terraform**

![alt text](terraform-troubleshooting.png)

1. `Language errors`: When Terraform encounters a syntax error in your configuration, it prints out the line numbers and an explanation of the error.

2. `State errors`: If state is out of sync, Terraform may destroy or change your existing resources. After you rule out configuration errors, review your state. 

3. `Core errors`: Errors produced at this level may be a bug. Later in this tutorial, you will learn best practices for opening a GitHub issue for the core development team.

4. `Provider errors`: The provider plugins handle authentication, API calls, and mapping resources to services. Later in this tutorial, you will learn best practices for opening a GitHub issue for the provider development team.

## Understanding Semantics ##

Terraform generally loads all the configuration files with in the directory specified in the alphabetical order.

The file loaded must be end in either `.tf or .tf.json` to specify the format that is in use.

## Dynamic Block ##

In Many of use-case, there are repeatble nested blocks that needs to defined. This can leads at longer code and it's difficult to manage.

Dynamic block allows us to dynamically construct repeatable nested blocks which is supported inside resource, data, provider, and provisioner blocks. check the details in `dyanamic-block/dyanmic.tf`

## Terraform Replace (Taint) ##

The `-replace` option with terraform apply to force terraform to replace an object even though there are no configuration changes that would require it. we have code block `terraform-replace/replace.tf`

1. We have created EC2 instance normally for `terraform-replace/replace.tf`
2. terraform apply -replace="aws_instance.web"
3. After 2nd step EC2 instance will terminate and re-create.

`Note:` Similar kind of functionality was acheived using terraform taint command in older versions of terraform. For terraform V0.15.2 and later, HashiCorp recommended using the `-replace` option with terraform apply.

## Terraform Graph ##

Terraform graph refers to a visual representation of the dependency relationship b/w resources defined in your terraform configuration.

1. Under terraform-graph/graph.tf run `terrfaorm init`
2. Run the `terraform graph` we can able to see the output.
3. Copy the contntet and paste into the Graphviz Online site we can able to see the graphical represenation of dependencies.
4. Instead of apsting in the public sites we can install the graphviz in the system
5. Install the graphviz in the system based on operating system i.e `brew install graphviz`
6. Get the content of terraform graph to .svg file i.e `terraform graph | dot -Tsvg >graph.svg`
7. Open the file `graph.svg` in any browser we can able to see the graphical represenation of dependencies like as below screenshot.

![alt text](graph.png)

## Save Terraform Plan to File ##

You can run terrform apply by referencing the terraform plan file. This ensures the infrastrucrure state remains exactly as shown in the paln to ensure consistency.

Even though the the resource block changed when applying the `terraform apply` based on the `terraform plan -out infra.plan` file content only works. `terraform apply "infra.plan"`

If you want to read the content of `infra.plan` file use `terraform show infra.plan` command.

**Use-Cases:** Many organizations require documented proof of planned changes before implementation.

## Terraform Output ##

Terraform output command is used to extract the value of an output variable from the state file.

We can use `terrform apply` we can able to see the output and  use the command `terraform output iam_arn` and more details check the code block `terraform-output/output.tf`

![alt text](Terraform-Output-Values-1.png)

## Terraform Settings ##

Terrform settings are used to  project specific terraform behaviors. such as requiring a minimum Terraform version to apply your configuration.

```bash
terraform {
  required_version = "0.13.6"
}
```
Specifying required provider

```bash
terraform {
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
  }
}
```
`Reference:` https://developer.hashicorp.com/terraform/language/settings

## Dealing with Larger Infrastructure ##

The `terraform plan -target=resource` flag can be used to target a specific resource. Generally used as means to operate an isolated portions of very large configurations.

Usually if additional resource will add to existing terraform configuration again we need to run the `terraform plan` command it will refersh the state file along with display what we have added the newly resource.

Instead we can add  terraform plan `-refresh=false` We can prevent terraform from querying the current state during opertions like terraform plan. It will reduce the No. of API calls here.

## Zipmap Function ##

`zipmap constructs a map from a list of keys and a corresponding list of values`. Both keyslist and valueslist must be of the same length. keyslist must be a list of strings, while valueslist can be a list of any type.

`Syntax:` zipmap(keyslist, valueslist)

`Example:` zipmap(["a", "b"], [1, 2]) ==> Output should be as below.
           zipmap(["pineapple","oranges","strawberry"], ["yellow","orange","red"])

```bash
{
  "a" = 1
  "b" = 2
}
```
```bash
{
  "oranges" = "orange"
  "pineapple" = "yellow"
  "strawberry" = "red"
}
```

`Realtime Example:` Check in the `zipmap-function/zip.tf` and output find the screenshot as below.

![alt text](zip-map-outputs.png)

## Resource Behaviour and Meta Arguments ##

A resource block declares that you want particular infrastructure object to exist with the given settings.

**How terraform applies a configuration?**

1. Create a resources that exists in the configuration but are not associated with the real infrastructure object in the state.
2. Destory the resources that exist in the state but no longer exists in the configuration.
3. Update-in place resources whose arguments have changed.i.e in the terrfaorm configuration if changes some configuration.

**What happens if we want to change the default behaviour?**

`Example of Default Behaviour:` By using terraform configuration we have created the EC2 instance with the tag name called `my-first-ec2`. Some one added manually one more tag called `production`. If you run the terraform apply command production tag will be remove since it's not part of terraform configuration.

`Changing the default Behaviour:` By using terraform configuration we have created the EC2 instance. Now we are changing the `AMIID` of Ec2 which is not associated with the linux. now when you run the `terraform plan` command existing Ec2 instance will destory and re-create with the windows `AMIID`.

List of meta arguments available with in the life cycle block.

|   Arguments            |                Description                                                                                                  |
|   ----------           |                ---------                                                                                                    |
| create_before_destroy  | New replacement object is created first and prior object is destroyed after the replacement is created.                     |
|                        |                                                                                                                             |
|  prevent_destroy       | Terraform to reject with an error any plan that would be destroy the infrastructure associated with the resource.           |
|                        | Useful for production environments.                                                                                         |
|                        |                                                                                                                             |
|  ignore_changes        | Ignore certain changes to the live resource that does not match the configuration.                                          |
|                        |                                                                                                                             |
|  replace_triggered_by  | Replaces the resources when any of the referenced items                                                                     |
|                        |                                                                                                                             |
|  for_each              | for_each meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set.         |
|                        |                                                                                                                         
|  depends_on            | Use the depends_on meta-argument to handle hidden resource or module dependencies that Terraform cannot automatically infer |
                                                                                                                       
**How to use meta arguments?**

Terraform allow us to include meta-argument with in the resource block which allows details of this standard resource behaviour to be customized on pre-resource basis.

`Note for ignore changes:` When you add one of the meta argument block as below, Even though if you changed manuallay in AWS console it would ignore and even though if you change in terrfaorm configuration i.e instance_type, tags etc. if you add `ignore_changes =all` in life cycle option, when you execute `terraform plan` command it will shows as no changes in terrafrom configuration and AWS console also. For more details check in `life-cycle-metaarguments/ignore-changes.tf`

```bash
lifecycle {
        ignore_changes = [tags]
}
````

**Note for prevent destroy**: After adding the `prevent_destroy = true` your resources shouldn't be deleted even though if you apply the `terrform destroy` command. check the configuration details `life-cycle-metaargument/prevent-destroy`.  

![alt text](prevent-destroy.png)

**count Meta argument**: If a resource or module block includes a count argument whose value is a number, Terraform will create that many no. of resources. Check `count/count.tf`

**for each meta argument**: for each argument code block expects to create a key pair, created manually in AWS console and downloaded .pem file. By using generated .pub key
`ssh-keygen -f file.pem -y > public.pub` and then executed. for more details check `life-cycle-metaargument/for-each.tf` 

## Provisioners ##

Provisioners are used to execute scripts on a local or remote machine as part of resource creation or destruction.

Example: After VM launched, install software package required for application.

Types of provisioners:

1. local-exec ==> provisioner is the important block.
Example: After EC2 instance launched, fetch the IP and store it in the file server_ip.txt. check the code block for details `provisioners/local-exec.tf`

2. remote-exec ==> connection and provisioner are important blocks. 
Example: After EC2 instance launched, install "apache" software. Since commands are executed on remote server, we have to provide way for Terraform to connect to remote server. Manually create a security group and add the security group id in the terraform code block. For details check on `provisioners/remote-exec.tf`

**Trouble shooting**: While connecting EC2 instance with the terraform some times faces the issue. Try to login with the manually if you can able to do it or not. If not troubleshoot as per the error.

**Create time and destroy time provisioner** While executing the terraform code, when resource creating, creation provisioner will execute and when resource is destroying, destroy provisioner will execute. Check the code block `provisioner/create-destroy-time-provisioner`. 

**Points to note**: Provisioners are used not only `aws_instance` resources, but also We can use other resources as well. Whenever the provisioner failed to execute resource are `tainted` we can check in`terrfaorm.tfstate` file. When you ran again with `terraform apply` it will destroy and re-create the resource.

## Terraform Modules ##

Terraform modules allows us to centralize the resource configuration and it makes it easier for multiple projects to re-use the terraform code for projects.

## Choosing the Right Module ##

Inspect the modules source code on Github or another platform. Clean and well-structured code is a good sign. Number of forks and starts of the repo. Modules maintained by hashicorp partner.

## Benfits of Modules ##

1. Enables code reuse
2. Supports modules stored locally or remotely
3. Supports versioning to maintain compatibility

**Which modules do organizations Use?**

In most of the scenarios, Organizations maintain their own set of modules. They might initially fork a modules from the terraform registry and modify it based on their use case.

`Reference Link for Modules:` https://registry.terraform.io/search/modules?namespace=terraform-aws-modules

`Root Modules`: Root modules resides in the main working directory of your terraform configuration. This is the entry point of your infrastructure defination.

```bash
module "ec2" {
    source = "../../../modules/ec2-module"
}
```

`Child Modules`: A module that has been called by another module is often refered to as child module.

```bash
resource "aws_instance" "my-ec2" {
  ami = "ami-085f9c64a9b75eed5"
  instance_type = "t2.micro"
}
```

**By default, a child module will have access to all variables set in the calling (parent) module?**

`Note:` No, A child module in Terraform does not inherit all variables set in the calling (parent) module. The parent module must explicitly pass variables to the child module by defining input variables in the child module's configuration. This approach helps maintain clear boundaries between modules and prevents unintended variable leakage.

**Publishing Modules**

Anyonbe can publish and share the modules on the terraform registry. Published modules can support versioning, automatically generate documentation allow browsing version histories, shows examples and READMEs, and more.

|   Requirements           |                Description                                                                                                       |
|   -----------            |                -----------                                                                                                       |
| GitHub                   | The module must be on GitHub and must be a public repo. This is only a requirement for the public registry.                      |
|                          |                                                                                                                                  |
| Named                    | Module repositories must use this three-part name format, where <NAME> reflects the type of infrastructure the module            |
|                          | manages and <PROVIDER> is the main provider where it creates that infrastructure.                                                |
|                          |                                                                                                                                  |
| Repository description   | The GitHub repository description is used to populate the short description of the module.                                       |
|                          |                                                                                                                                  |
| Standard module structure| The module must adhere to the standard module structure.                                                                         |
|                          |                                                                                                                                  |
| x.y.z tags for releases  | The registry uses tags to identify module versions. Release tag names must be a semantic version, which can optionally 
be prefixed with a V.

`Reference Link:` https://developer.hashicorp.com/terraform/registry/modules/publish

## Terraform Workspace ##

Terraform workspaces enables us to manage multiple set of deployments form the same sets of configuration file. Each workspace having it's own `.tf state file`. Workspaces containing `terraform.tfstate.d` file as well.

terraform workspace # It will give the list of subcommand options 

terraform workspace `list` # List out the available workpsaces

terraform workspace `show` # It will shows the current workspace 

terraform workspace `select dev` # If you want to switch the workspace

terraform workspace `new prod` # It will create the new workspace name called prod and switch the same workspace.

terraform workspace `delete`   # If you want to delete the workspace.

**Terraform .gitignore**

When you ran the terraform init, plan and apply commands there are certain folders were created i.e .`terraform, .terraform.lock.hcl, terraform.tfstate, terraform.tfvars, terraform.tfstate.backup` etc. All this folders and files not required to push into the source code repo, due to security/sensitive constraints.

Create a `.gitignore` and add the names of all this folder and file names git will ignore while pushing the changes into the git repo.

## Terraform Backends ##

**Local Backend**

```bash
terraform {
    backend "local" {
        path = "DevOps/terraform/terraform-associate-2024/terraform.tfstate"
    }
}
```

`Challanges with local backend`: Not versioned, No state locking, State file corruption, Not suitable for collaboration etc.

**Remote Backend**

Terraform uses persisted state data to keep track of the resources it manages. There are so many available backends are there i.e remote, azurerm, consual, s3, kubernetes etc. In our use case we are using s3 backend.

1. Create the bucket manually in any region.
2. Create a folder path where you want to store the `terraform.tfstate` file.
3. Add backend configuration in your terraform configuration files `backend.tf`.
4. Check the more detilas for `remote-backend/backend.tf`

**State File Locking**

 Whenever you are performing write operation, terraform would lock the state file. This is important as otherwise during your ongoing terraform apply operations, if others also try the same, it can corrupt the state file.

 `Note:` Teraaform has a `terraform force-unlock <LOCK_ID>` command is specifically designed to force unlock the state file and allow modifications to be made.

**State locking in S3**

1. Create the dynamodb table and add the Partition key name `LockID` with type of String.
2. Add the dyanmodb_table name in the `backend.tf` configuration.

By default s3 doesn't support state locking functionality. You need to make use of `dynamodb table to acheive state locking functionality`.

State locking with the dynamodb check the details `remote-backend/backend.tf`

**Terraform State Management**

The `terraform state` command can indeed be used to modify the current state by removing items. This is useful for managing the state of resources in Terraform.

terraform state list # List out the resources with in the state file.

terraform state show `aws_instance.myec2` # Here `aws_instance.myec2` is one of the resource of state file, the command displays detailed state data about one resource.

terraform state pull  # Pull current state and output to stdout

terraform state push  # Update remote state from a local state file

terraform state rm  # Is used to remove items from the terraform state 

terraform state mv aws_instance.myec2 aws_instance.my-demo-ec2  # It's moving the resoure name without destroying and re-creating the resource.

`Note:` 1. variables marked as sensitive are still stored in the state file, even though the values are obfuscated from the CLI output.

        2. The default value will be found in the state file if no other value was set for the variable.

        3. The variable name itself is not stored in the state file and description of a variable is not written to the state file.

**Fetching the Remote State Data**

We have a network team and security team, under network team creating the elastic ip with the remote backend. Under security team creating the security group and fetching the output value of elastic ip with the help of remote state backend.

`For more details:` fetch-remote-state-data/network/ and fetch-remote-state-data/sg 

**Terraform Import**

Terraform can import existing infrastructure resources. This functionality lets you bring existing resources under Terraform management.

1. Create a resource manually for the security group with the inbound rules i.e http, https, ssh etc.
2. Added the terraform configuration with the import block or we can use `terraform import `command to import the existing resources into Terraform.

```bash
import {
  to = aws_security_group.mysg
  id = "sg-0dd1bd5484b8c30c6"
}
```

3. Now run the terraform plan command with the output generate `terraform plan -generate-config-out=mysg.tf` this command will import the manual configuration resource in file named called `mysg.tf`

4. Run the `terraform apply` command it will create the terraform configuration with the imported resource data.

5. Manually modified the terraform configuration in the file `mysg.tf` and re-run the `terraform apply` command will take apply the changes.

6. Finally run the `terraform destroy` command to delete the terraform resource configuration.

`Check the details:` terraform-import/import.tf

`Reference Link for More Details:` https://developer.hashicorp.com/terraform/cli/commands/import

## Multiple Provider Configurationss ##

To create multiple configurations for a given provider, include multiple provider blocks with the same provider name. For each additional non-default configuration, use the `alias` meta-argument to provide an extra name segment.

`Note:` A provider alias is used to differentiate between multiple instances of the same provider within a Terraform configuration file. This allows you to configure and use the `same provider with different settings for different resources`, ensuring flexibility and customization in your infrastructure deployment.

`Example Check for More Details:` terraform-associate-2024/multi-provider/multiprovider.tf

`Reference Link`: https://developer.hashicorp.com/terraform/language/providers/configuration

**Sensitive Parameter**

Adding sensitive parameter ensures that you do not accidently expose this data in CLI output and log output. While we ran `terraform plan` the content will display in the terminal, to avoid such sensitive information we can use variable parameter as below. We can use local sensitive file resource type as well.

```bash
resource "local_file" "foo" {
  content  = "supersecretpassw0rd"
  filename = "password.txt"
}
```
```bash
variable "password" {
  default = "supersecretpassw0rd"
  sensitive = "true"
}
resource "local_file" "foo" {
  content  = var.password
  filename = "password.txt"
}
```

```bash
resource "local_sensitive_file" "foo" {
  content  = "supersecretpassw0rd"
  filename = "password.txt"
}

output "pass" {
  value = local_sensitive_file.foo.content
}
```

`Reference Links:` https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
                   https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/sensitive_file

**Hashicorp Vault**

Hashicorp Vault allows organizations to securly store secrets like tokens, passwords, certificates along with the access management for protecting secrets. Vault provider allows terrform to read from, write to and configure HashiCorp Vault.
`Note:` Interacting with Vault from terraform causes any `secrets that you read and write to be persisted in both terraform's state file.`

## Terraform Cloud ##

Terraform cloud manaages Terraform runs in a  consistent and reliable environment with various features like access controls, private registry for sharing modules, policy controls, remote runs, VCS connection and others.

**How to access the Terraform Cloud**?

1. Create a free account i.e https://app.terraform.io/
2. Login with the user credentials i.e usename and password.
3. Create a organization under organizations and create a workspace under organization. i.e demo-workspace
4. Under workspace click on varaibels and add i.e aws_access_key_id, aws_secret_access_key with the sensitive check mark.
5. Create a sample github repo for demo purpose and add the terraform code for testing in terraform cloud.
6. Authenticate Github with the terraform cloud --> Select the repo you want to authorize and connect.
7. Then go back to workspace click on new run select plan apply start.
8. It will trigger the plan code it will finish, if it's having any issue through an error fix it re-run again.
9. Confirm & apply with comments i.e `terraform apply` it will run and execute the resource as per the terraform configuration.
10. Go and observere the AWS console GUI either the resource has been created or not.
11. Finally if you want to destroy the resource under demo-workspace settings click on Destruction and Deletion--> Queue destroy plan--> Enter the name of the workspace.
12. Your terraform configuration resource will be destroyed.
13. When workspaces are linked to a VCS repository, Terraform Cloud can automatically initiate terraform runs when changes are committed to specified branch `terraform plan` automatically trigger a speculative plan.

**What is the primary function of Terraform Cloud agents?**

Terraform Cloud `agents are primarily responsible for executing Terraform plans and applying changes to infrastructure`. They act as the bridge between the Terraform Cloud service and the target infrastructure.

**Sentinel and OPA Policy**

Sentinel is an embeddable policy as code framework to enable fine-grained, logic-based policy decisions that can be extended to source external information to make decisions. Ensuring standardization and cost controls are in place before resources are provisioned with Terraform

HashiCorp also supports Open Policy Agent (OPA) in Terraform Cloud.

`Note:` Sentinel policies are paid feature. Sentinel policies are enforced after the terraform plan, run tasks, and cost estimation phases but before the apply phase in Terraform Cloud.

**Remote Backends For Terraform Cloud**

When using full remote operations, like terraform plan or terraform apply can be executed in Terraform cloud's run environment, with log output streaming to the local terminal.

If you want authenticate terrafrom cloud by using CLI in your system terminal

1. terraform login --> Do you want to proceed --> yes --> Terraform must now open a web browser to the tokens page for app.terraform.io.
2. Generate a api token using your browser, and copy-paste it into the CLI terminal.
3. terraform init
4. terraform plan
5. terraform apply 

`Note:` The workspace which we are working if it's connected to version control system it won't work. SInce it requires single source of truth.

![alt text](Remote-backend-terraform-cloud.png)

6. Eventhough if you ran from the CLI for `terraform plan` terraform cloud has been triggered  i.e Triggered via CLI.

![alt text](terraform-plan.png)

7. If you want to Remove the authentication based VCS and run the `terraform apply` from CLI based i.e under demo-workspace--> Version Control select the CLI based driven.
8. Now run the `terraform apply` in the CLI and observe in the `terraform cloud UI` under demo-workspace runs.

**Air Gap Environments**

Air gap is a network security measure employed to ensure that a secure computer network is physically isolated from unsecured networks, such as a public network.

Air gap based method is possible for terraform enterprise editions.

`Reference Link:` https://www.hashicorp.com/blog/deploying-terraform-enterprise-in-airgapped-environments

`Scenario-1`: Create any resource in AWS by using terraform, then go to AWS console change some modification manually and come back to terminal and run the terraform apply and observe the changes.

1. Created a tag manually for Ec2 instance after creation of EC2 by using terraform
2. In the terminal ran the `terraform apply` it's showing your resource is in update in-place and manual modifications are destroying since those resource are not available in terraform configuration.

![alt text](Scenario1-EC2.png)

`Scenario-2`: Create 2 EC2 instances with terraform, delete one from state file, run the terraform apply and check the behaviour?

1. Created 2 EC2 instances by using terraform code
2. Removed one instance from state file `terraform state rm resource_type.resource_name`
3. Ran the `terraform apply`, created the one EC2 instance since we have removed the state file for one EC2
4. When we check the AWS console now 3 EC2 instances, but when you ran the `terraform destroy` 2 instances were destroyed and 1 is available since state was removed.

`Scenario-3`: What Terraform command can you use to reconcile the state with the real-world infrastructure in order to detect any drift from the last-known state?

1. There is already some existing setup in AWS by using terraform configurations.
2. Your teammate changed manullay some configurations in AWS console.
3. You want to sync those changes into your state file `terraform apply -refresh-only`
4. Find as below screenshot for more reference details.

![alt text](<terraform apply -refresh-only.png>)

`Scenario-4`: If you want replace the existing resource how you will do?

1. There is already existing configuration which you have provisioned already.
2. You want replace the existing resource `terraform apply -replace <resource_tye.resource_name> it will destroy the existing resource and recreate with new one.

`Scenario-5`: Amit is calling a child module to deploy infrastructure for organization. Just as a good architect does (and suggested by HashiCorp), Amit specifies the module version he wants to use even though there are newer versions available. During a terrafom init, Terraform downloads v5.4.0 just as expected.

What would happen if Amit removed the version parameter in the module block and ran a terraform init again?

```bash
module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = "5.4.0"
}
```
1. Create a folder structure for modules which you want to test.
2. Add as above code in the modules.tf file and run the `terraform init` command
3. And observe the `./terraform/modules/modules.json` file the version should be 5.4.0
4. Remove the version part and re-run the `terraform init` command it's did not downalod the newer version of module. It reused the existing module already downloaded because once a specific version is dowloaded, Terraform caches it locally unless explicitly updated.




