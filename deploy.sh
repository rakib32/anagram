#! /bin/sh

[[ $# -lt 1 ]] && echo "Usage: $0[ Env ('stage' / 'prod') ]" && exit 1
set -e

anagram_env="$1"


cd terraform-provisioner/${anagram_env}
terraform init
terraform plan
terraform apply -auto-approve