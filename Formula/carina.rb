class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.2/carina_0.8.2_darwin_arm64.tar.gz"
      sha256 "9a9d15c6aa2099a506ab25ef66b2fc58e5ddfc0682e465174718ad4c3346586e"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.2/carina_0.8.2_darwin_amd64.tar.gz"
      sha256 "61fc5f31a9eeb761f4bb7dcf25b3b78c1c1d90d80c1008583f8e37eaddf9c9bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.2/carina_0.8.2_linux_arm64.tar.gz"
      sha256 "ccb924103f0fea3c6a3c28c3e8cfe35c59590f0e831c4c2b458ffdb1a4e1bdf4"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.2/carina_0.8.2_linux_amd64.tar.gz"
      sha256 "53102659bee5e2363c7627fc9ca378850e1cd717f45ede13b2cd6c4972923396"
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
