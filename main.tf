# aws_instance.newec2:
resource "aws_instance" "newec2_tfc" {
    lifecycle {
      create_before_destroy = true
    }

    timeouts {
      create = "60m"
      delete = "2h"
    }

#    count = 2
    for_each = {
      "tfc": "tfc",
#      "num": "newec2-2",
      #"indexing":  "value3",
      #"example":   "value4",
    }
    ami                          = "ami-0a809ad76fc7e8390"
#    ami                          = "data.aws_ami.centos.id"
    availability_zone            = "cn-northwest-1b"
#    cpu_core_count               = 1
#    cpu_threads_per_core         = 1
    disable_api_termination      = false
    ebs_optimized                = false
    get_password_data            = false
    hibernation                  = false
    iam_instance_profile         = "AmazonSSMRoleForInstancesQuickSetup"
    instance_type                = "t2.micro"
  #  instance_type                = "t2.medium"
    ipv6_address_count           = 0
    ipv6_addresses               = []
    key_name                     = "lindh-awscn"
    user_data    		 = templatefile("setup.sh", {ec2_priv_hostname = "awscn-${each.value}"})
    monitoring                   = false
    security_groups              = [
        "tfe-sg",
    ]
    source_dest_check            = true
    tags                         = {
        "FQDN" = "${each.key}.better-service.cloud"
        "Name" = "awscn-${each.value}"
    }
    tenancy                      = "default"
    volume_tags                  = {}
    vpc_security_group_ids       = [
        "sg-0b83dc0257a8484b3",
    ]

    credit_specification {
        cpu_credits = "standard"
    }

    root_block_device {
        delete_on_termination = true
        encrypted             = true
        iops                  = 100
       # volume_size           = 60
        volume_size           = 10
        volume_type           = "gp2"
    }

    #timeouts {}
}

#data "aws_security_groups" "tfe-sg" {
#  filter {
#    name   = "tfe-sg"
#    values = ["default"]
#  }
#}



