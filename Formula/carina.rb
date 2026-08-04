class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.10/carina_0.8.10_darwin_arm64.tar.gz"
      sha256 "9a353af8a71646b08dd191cfcf3e8d957de1ba2b53bce1270e3c9dde89ba03b4"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.10/carina_0.8.10_darwin_amd64.tar.gz"
      sha256 "ef04d67007c45ecc81e3880100fd98f178a0cc503307c437d5459af0d4213c83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.10/carina_0.8.10_linux_arm64.tar.gz"
      sha256 "aba5760580aa2b36189b8e1ecaae41beb627774e5704d25def9bc41a620a24a2"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.10/carina_0.8.10_linux_amd64.tar.gz"
      sha256 "a1f155cb2ac1e551850c23923bffd9411da08bd5543916c84221e52676477af6"
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
