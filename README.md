# Three-tier Web Application

![three tier web app](https://github.com/sudo-justinwilson/three-tier-web-app/blob/master/.three-tier-web-app-diagram.png)

## Getting Started

This builds a three-tier web application. It contai
This builds
The following components are built:

* A VPC with a public subnet and 2 private subnets.
* An ECS cluster with autoscaling in the middle private subnet.
* An RDS DB instance in the bottom private subnet with scalable storage.
* A reverse web proxy container in front of a web application container in ECS with the ability to scale.
* An public facing application load-balancer in front of the reverse proxy.

### Prerequisites

- There is an assumption that AWS credentials are available.

## Deployment

Use the following steps to deploy the stack.

1) Clone this repository

```
git clone https://github.com/sudo-justinwilson/three-tier-web-app.git
```

2) Change to the repo directory:

```
cd ${/PATH/TO/REPO}
```

3) Install Terraform by following instructions [here](https://learn.hashicorp.com/terraform/getting-started/install.html)

4) Once Terraform is installed and the terraform command is available, run the following commands to build the environment

```
$ terraform init
$ terraform plan
$ terraform apply     
```
- _Note:_ This infrastructure is built in the _ap-southeast-2_ region by default. To change the region, edit the `./variables.tf`.

5) `terraform apply` will return multiple outputs, including an `alb_dns_name` output, which is the DNS record that points to the application load-balancer.
Point your browser at the DNS record to see the web application.

## Modules
Each directory in the 'modules/' directory is a Terraform module, that can be reused in other projects.

* ecs-cluster
* db (RDS)
* alb
* service (The Docker containers)

### Tearing down the test environment

Once we're done testing, we can tear-down the environment with the following command:

```
$ terraform destroy
```

## Built With

* [Terraform](https://terraform.io) - Used to automate the building of infrastructure

## Contributing

Submit bugs & feature requests via [Github](https://github.com/sudo-justinwilson/three-tier-web-app)

## Authors

* **Justin Wilson** - *Initial work* - [Github](https://github.com/sudo-justinwilson/)

## License

This project is licensed under the GPL3.0 License - see the [LICENSE.md](LICENSE.md) file for details

