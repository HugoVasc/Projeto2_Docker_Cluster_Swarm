machines = {
  "master" => {"memory" => "1024", "cpu" => "1", "ip" => "200", "image" => "bento/ubuntu-22.04"},
  "node01" => {"memory" => "1024", "cpu" => "1", "ip" => "201", "image" => "bento/ubuntu-22.04"},
  "node02" => {"memory" => "1024", "cpu" => "1", "ip" => "202", "image" => "bento/ubuntu-22.04"},
  "node03" => {"memory" => "1024", "cpu" => "1", "ip" => "203", "image" => "bento/ubuntu-22.04"}
}

Vagrant.configure("2") do |config|
  VAGRANT_EXPERIMENTAL="dependency_provisioners"
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      machine.vm.network "private_network", ip: "10.0.0.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
        
      end
      machine.vm.provision "shell", path: "instalar-docker.sh"
      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master.sh"
        machine.vm.provision "start-app", type: "shell" , path: "start-app.sh", after: :all
      else
        machine.vm.provision "shell", path: "worker.sh"
        machine.vm.provision "shell", path: "nfs-client.sh"
      end
    end
  end
end
