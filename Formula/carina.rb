class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.21/carina_0.8.21_darwin_arm64.tar.gz"
      sha256 "a4450fb3dd91860b31e8e7c3beca3d4863db27e8c195833156744a9541e69f30"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.21/carina_0.8.21_darwin_amd64.tar.gz"
      sha256 "9e0a588bf9d235b37b52ffdcd07c45ef1a755bb9f1e2dbc00f02895680ad0f88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.21/carina_0.8.21_linux_arm64.tar.gz"
      sha256 "e18d11f63c45081e345e6fa3bf974eedcf65ace3642615180af3632f8d121b2b"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.21/carina_0.8.21_linux_amd64.tar.gz"
      sha256 "3741bc3c98edafbc7aa0dbfc31894940015d3fde7f7f49453a9018db0fa1dcc2"
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
