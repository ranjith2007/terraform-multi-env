resource "aws_instance" "expense" {
    for_each = var.instances #this varibale is map
    #for_each will give us a special variable with each name
    ami = "ami-09c813fb71547fc4f" 
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
    subnet_id = "subnet-0f481d19b685aac95" # No default subnet in my aws account
    tags = merge (
        var.common_tags,
        var.tags,
        {
            Name = each.key
        }
    )
}
resource "aws_security_group" "allow_ssh_terraform" {
    name = "allow_ssh_${var.environment}"
    description = "allow port number 22 for ssh access"
    vpc_id = "vpc-04bd84d041dcee061" # No default vpc in my aws account
    

    #usually we allow everything in egress
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
    }

   tags = merge (
        var.common_tags,
        var.tags,
        {
            Name = "allow_ssh_${var.environment}"
        }
    )
}
