#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo -e "\n\e[34m╔══════════════════════════════════╗"
echo -e "║\e[32m            Terraform \e[34m            ║"
echo -e "║\e[33m          Destroy Script  \e[34m        ║"
echo -e "╚══════════════════════════════════╝"
echo -e "\e[35m   v0.0.1    🚀  🚀  🚀\n"



source $SCRIPT_DIR/load-env.sh

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo -e "\e[31m»»» 💥 Pass plan name as parameter to this script e.g. $0 foo"
  exit 1
fi

TFPLAN_NAME=${1}

terraform destroy -auto-approve
