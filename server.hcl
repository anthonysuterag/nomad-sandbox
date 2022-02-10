data_dir = "/opt/nomad/data"
bind_addr = "0.0.0.0"

advertise {
  http = "10.0.0.10"
  rpc =  "10.0.0.10"
  serf = "10.0.0.10"
}

server {
  enabled = true
  bootstrap_expect = 1
}
