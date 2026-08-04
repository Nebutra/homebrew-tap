class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.3/carina_0.8.3_darwin_arm64.tar.gz"
      sha256 "c93b4b38ae65fc1ac8ce7e5a6ede98d04f95f15ecf0e1acb6c1add50265054cf"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.3/carina_0.8.3_darwin_amd64.tar.gz"
      sha256 "8e3417af5c9d08aa88c1028ec928de42b74113565935bf610dcc1b901a7256c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.3/carina_0.8.3_linux_arm64.tar.gz"
      sha256 "c3dc89cc1aad2ec6dc5e098f3ebdb10ade0c29ea60b7cfe7af366c89441ce252"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.3/carina_0.8.3_linux_amd64.tar.gz"
      sha256 "7d7d1c552084a69ea4954a3fa6a4802969fb148ace01afae8a60cc082d7bcf08"
    end
  end

  def install
    bin.install Dir["bin/carina*"]
  end

  def caveats
    <<~EOS
      Carina does not auto-start a daemon after install.

      Start it explicitly:
        carina-daemon
    EOS
  end

  test do
    assert_match "carina #{version}", shell_output("#{bin}/carina --version")
    %w[carina-ui carina-daemon carina-worker carina-kernel-service].each do |executable|
      assert_predicate bin/executable, :executable?
    end
  end
end
