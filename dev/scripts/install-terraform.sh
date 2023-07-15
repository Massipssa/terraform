TERRAFORM_VERSION="0.12.26"
TERRAFORM_ZIP="terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
PROFILE_PATH="$(echo ${HOME})/.bashrc"


wget https://releases.hashicorp.com/terraform/0.12.26/${TERRAFORM_ZIP} -O $TERRAFORM_ZIP

echo "[Step-2] --> Extract ZIP"

echo "File to extract ${TERRAFORM_ZIP}"

unzip ${TERRAFORM_ZIP}

echo "[Step-3] --> Export to PATH"

# shellcheck disable=SC2129
echo -e "\n## Terraform" >> ${PROFILE_PATH}
echo "export TERRAFORM_HOME=$(pwd)/terraform" >> ${PROFILE_PATH}
echo "export PATH=\$PATH:\$TERRAFORM_HOME" >> ${PROFILE_PATH}
source ${PROFILE_PATH}
