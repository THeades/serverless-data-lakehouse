SHELL := /usr/bin/env bash

.PHONY: tf-apply
tf-apply:
	terraform fmt && terraform init -backend-config environments/${env}/backend.conf -reconfigure && terraform validate && terraform apply -var-file environments/${env}/terraform.tfvars