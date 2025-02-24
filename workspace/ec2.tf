resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = ["sg-0f575d808e73f7ee2"]
    subnet_id = "subnet-0f481d19b685aac95" # No default subnet in my aws account
    tags = {
        Name = "terraform-${terraform.workspace}"
    }
}