output "PublicDNS-1" {
  value       = aws_instance.newec2_tfc["tfe"].public_dns
  description = "AWS EC2 public DNS"
}

#output "PublicDNS-2" {
#  value       = aws_instance.newec2_tfc["num2"].public_dns
#  description = "AWS EC2 public DNS"
#}

#output "PublicIP" {
#  value       = aws_instance.newec2_tfc.public_ip
#  description = "AWS EC2 public IP"
#}


#output "PrivateDNS" {
#  value       = aws_instance.newec2_tfc.public_dns
#  description = "AWS EC2 private DNS"
#}

#output "PrivateIP-1" {
#  value       = aws_instance.newec2_tfc["num1"].private_ip
#  description = "AWS EC2 private IP"
#}




