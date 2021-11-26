sudo apt install -y curl openssh-server ca-certificates perl
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash 
sleep 20
sudo apt -y install gitlab-ce
curl -LJO "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb" && sudo dpkg -i gitlab-runner_amd64.deb 


