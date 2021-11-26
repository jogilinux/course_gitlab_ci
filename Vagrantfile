# -*- mode: ruby -*-
# vi: set ft=ruby :

box = "debian/buster64"

machines = {
  "gitlab"       => {"memory"=>"5076", "cpus"=>"2", "ip" => "10" , "installDocker" => "yes"},
  "homolog-01"    => {"memory"=>"758" , "cpus"=>"1", "ip" => "20" , "installDocker" => "yes"},
}

Vagrant.configure("2") do |config|
  config.vm.box = box
  
  machines.each do |name,conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.network "private_network", ip: "192.168.56.#{conf["ip"]}"
      machine.vm.hostname = "#{name}.example.com"
      machine.vm.provider "virtualbox" do |vb|
        vb.cpus = "#{conf["cpus"]}"
	vb.memory = "#{conf["memory"]}"
	vb.name = "#{name}"
	vb.gui = false
      end
 
      machine.vm.provision "shell" do |s|
       s.path = "provision/prereq.sh"
       s.args = [box]
      end
 
      if "#{conf["installDocker"]}" == "yes" then
         machine.vm.provision "shell" do |s|
           s.path = "provision/install_docker.sh"
           s.args = [box]
         end
      
        if "#{name}" == "gitlab" then
          machine.vm.provision "shell", path: "provision/install_gitlab.sh"
#          machine.vm.provision "shell", path: "provision/run_gitlab_container.sh"
        end
      end
      

    end

  end
end
