variable "instances" {
    type = map
}

variable "zone_id" {
  default = "Z0673714ZP6J86LIKLFQ"
}

variable "domain_name" {
  default = "devops81s.site"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = "true"
    }
  
}

variable "tags" {
    type = map 
}

variable "environment" {

}