class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.6.6/carina_0.6.6_darwin_arm64.tar.gz"
      sha256 "8bb43d588f14b5b00d3e3aa86c76cc98811eb0d8f8c7e28b1aeb8ce7efd02edb"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.6.6/carina_0.6.6_darwin_amd64.tar.gz"
      sha256 "e3db48381f96c4fbad1d023ae7989911dc6a570f17f339f701bb9d6bbc52a19c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.6.6/carina_0.6.6_linux_arm64.tar.gz"
      sha256 "e738c76b7dfc430f8a7e344120b1dc2cc330e6950be6836665420e18c4cc3c6d"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.6.6/carina_0.6.6_linux_amd64.tar.gz"
      sha256 "b400938ca9b4262aa8242f29289f1473c608ecfd4e0b2e67a13a58082ea531a0"
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
