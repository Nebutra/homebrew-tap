class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.4/carina_0.8.4_darwin_arm64.tar.gz"
      sha256 "3f2466cd4c01a40b71dabad8fb23937132b7fd5ee3f1219a051a257f887f2a8e"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.4/carina_0.8.4_darwin_amd64.tar.gz"
      sha256 "dc6cfd8a5f2f51f0852821fb659451b778addf364e18ca68a64e09880959a12f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.4/carina_0.8.4_linux_arm64.tar.gz"
      sha256 "f935369d4e768bea41a5a7c116c7b73f0441ffe6eefe1c76d80ad7a96b8eeff8"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.4/carina_0.8.4_linux_amd64.tar.gz"
      sha256 "dfad22d8dc21b65cfeffb9d1602d1e38fd6e2f6e7182f36cb9771e91c1c635f7"
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
