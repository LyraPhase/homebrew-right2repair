class RancherMachine < Formula
  desc "Create Rancher hosts locally and on cloud providers"
  homepage "https://github.com/rancher/machine"
  version "0.15.0-rancher119"
  url "https://github.com/rancher/machine/archive/refs/tags/v#{version}.tar.gz"
  sha256 "e9496937c91a6ea7d6736a7358a4d31f79e5ca3edcc99a37cf135ea558eabc0c"
  license "Apache-2.0"
  head "https://github.com/rancher/machine.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = "-s -w"
    ldflags += " -extldflags '-static'"
    ldflags += " -X github.com/rancher/machine/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/rancher-machine"

    Dir["contrib/completion/bash/*.bash", "contrib/completion/zsh/_docker-machine"].each do |path|
      inreplace path do |s|
        s.gsub!("docker-machine", "rancher-machine")
        s.gsub!("docker_machine", "docker_machine")
      end
      dest_path = path.gsub("docker-machine", "rancher-machine")
      File.rename(path, dest_path) unless File.exist?(dest_path)
    end

    bash_completion.install Dir["contrib/completion/bash/*.bash"]
    zsh_completion.install "contrib/completion/zsh/_rancher-machine"
  end

  service do
    run [opt_bin/"rancher-machine", "start", "default"]
    environment_variables PATH: std_service_path_env
    run_type :immediate
    working_dir HOMEBREW_PREFIX
  end

  test do
    assert_match version.to_s, shell_output(bin/"rancher-machine --version")
  end
end
