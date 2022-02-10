datacenter = "dc1"
name       = "nomad-client-2"

data_dir = "/opt/nomad/data"

client {
  enabled = true
  gc_interval = "48h"
  servers = [
    "10.0.0.10:4647",
  ]
}

bind_addr = "10.0.0.12"

advertise {
  http = "10.0.0.12"
  rpc = "10.0.0.12"
  serf = "10.0.0.12"
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}
