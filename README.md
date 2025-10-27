# k8s-on-wsl (Ubuntu)
This repo provides scripts for installing Kubernetes on Windows Subsystem for Linux (WSL2) 

## Pre-requisits
  1. Install Docker Desktop </br>
     **Note**: The Docker Desktop Installer does not allow you to choose the insttallation directory. It installs it into the "Program Files" directory. The preseence of spaces in the directory name will cause K3s to fail; logs indicate "Failed to start ContainerManager"  (see [stackoverflow](https://stackoverflow.com/questions/76658490/why-run-k3s-server-on-win11-wsl2-errorfailed-to-start-containermanager-err-s)) </br> 
     To install Docker Desktop in a drectory that does not contain spaces you must used the command-line installer:
       * Pre-create directories for Docker binaries and images 
       * Open the Windows Commmand shell as an adminustrator
       * Run the command-line installer. Substitute your directories in the following example:
         ```
         start /w "" "Docker Desktop Installer.exe" install -accept-license  --installation-dir=D:\Docker\bin --wsl-default-data-root=D:\Docker\images
         ```
  1. Configure Docker Desktop 
     * Click the gear icon at the top-right
     * Click "Resources" on the left hand menu pane
     * Click the "WSL integration" tab
     * Enable WSL integration for your distro(s)

  1. Verify Docker installation
     * Open the shell for your WSL distro
     * Enter the following commands to verify Docker is installed and functioning
       ```
       docker --version
       socker run hello-world
       ```

  1. Verify curl is installed
     ```
     curl --version
     ```
     If not install it (Ubuntu example)
     ```
     sudo apt-get install curl
     ```

## Install a Kubernetes Distribution
### K3s
K3s [k3s.io](https://k3s.io/), derived from the official Kubernetes distro, is packaged as an easy to install binary. The initial installation creates a single node cluster. The binary can be installed on other servers such that they join the master node. 

  1. Install `K3s` <\br>
     Convenience script: `k3s\install.sh`
     ```
     curl -sfL https://get.k3s.io | sh -
     ```
     * Downloads the K3s binary
     * Installs and configures K3s as a systemd service
     * Configures the control plane and starts the cluster 

  1. Verify `K3s` installation     
     ```
     k3s check-configuration
     ```

  1. Configure `kubectl`
     Add the following to your `.bashrc` file and source the file
     ```
     export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
     ```

  1. Verify `kubctl`
     ```
     kubectl get nodes
     kubectl get pods -A
     ```

  1. Convenience scripts
     * `k3s/install` - Installs K3s using the command listed above
     * `k3s/logs` - Display logs 
     * `k3s/status` - Display K3s status 
     * `k3s/uninstall` - Uninstall K3s


## Configure kubectl command completion (Optional)
  1. Issue the following command to verify bash_completion is enabled:
     ```
     type _init_completion
     ```
     If not, add the following line to your `.bashrc` source your `.bashrc` to reload:
     ```
     source /usr/share/bash-completion/bash_completion
     ```
  1. Update `.bashrc`
     ```
     echo 'source <(kubectl completion bash)' >>~/.bashrc
     ```

  1. If you invoke `kubectl` using an alias enable completion for the alias:
     For example, if you defined `kc` as an alias:
     ```
     echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
     ```

   * Notes:
        * [Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#enable-shell-autocompletion)

## Install Helm
There are a variety of methods for installing Helm (see [Install Helm - helm.sh](https://helm.sh/docs/intro/install/)). 

  1. Install helm using apt-get </br>
     Convenience script: `helm/install.sh`
    
    ```
    sudo apt-get install curl gpg apt-transport-https --yes
    curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get install helm
    ```


## Install Desired Services
### Kubernetes Dashboard
Reference: [Deploy and Access the Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)


## Resources
  * [What is the differrence between K3s and K3d](https://shyam.kubeify.com/2025/03/what-is-difference-between-k3s-and-k3d.html)
  * [Getting started with Docker containers on WSL - Microsoft Learn](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers)




