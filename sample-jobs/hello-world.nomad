job "hello" {
  datacenters = ["dc1"]

  type = "batch"

  group "hello" {
    count = 1

    restart {
      interval = "20s"
      attempts = 2
      delay    = "5s"
      mode     = "delay"
    }

    task "hello" {
      driver = "raw_exec"

      config {
        command = "echo"
        args = [ "Hello", "World" ]
      }
    }
  }
}
