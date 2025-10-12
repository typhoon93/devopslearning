# Terraform Output Values

# # EC2 Instance Public IP
# output "instance_publicip" {
#   description = "EC2 Instance Public IP"
#   value       = aws_instance.myec2vm.public_ip
# }
#
# # EC2 Instance Public DNS
# output "instance_publicdns" {
#   description = "EC2 Instance Public DNS"
#   value       = aws_instance.myec2vm.public_dns
# }

# output - for loop with list
output "for_output_list" {
  description = "For Loop with List"
  value       = [for instance in aws_instance.myec2vm : instance.public_dns]
}

# output - for loop with map
output "for_output_map1" {
  description = "For loop with Map"
  value       = {for instance in aws_instance.myec2vm : instance.id => instance.public_dns}
}

# output - for loop with map Advanced
output "for_output_map2" {
  description = "For loop with Map"
  # c here is the "count"
  value       = {for c, instance in aws_instance.myec2vm : c => instance.public_dns}
}

# output legacy splat operator(legacy) - returns the list
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.myec2vm.*.public_dns
}

# output latest Generallized splat operator() - returns the list
output "latest_splat_instance_publicdns" {
  description = "Generalized Latest Splat Operator"
  value = aws_instance.myec2vm[*].public_dns
}