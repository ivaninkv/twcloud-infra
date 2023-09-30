output "external_server_ip" {
  description = "External IP of the server"
  value = twc_server.server.main_ipv4
}
