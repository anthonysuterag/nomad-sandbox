.PHONY: up
up: bin/nomad
	vagrant up

.PHONY: status
status:
	vagrant status

.PHONY: destroy
destroy:
	vagrant destroy -f

.PHONE: verify
verify: bin/nomad
	bin/nomad node status
	bin/nomad run sample-jobs/hello-world.nomad

	@mkdir -p bin
bin/nomad:
	cd bin && curl -o nomad.zip https://releases.hashicorp.com/nomad/1.1.0/nomad_1.1.0_linux_amd64.zip && unzip nomad.zip && rm nomad.zip
