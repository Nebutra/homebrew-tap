class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.6.5/carina_0.6.5_darwin_arm64.tar.gz"
      sha256 "ea54a5d6c491c709df559f0b5d5f3f8838e4c0074bbd07b56b384d40de9420c8"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.6.5/carina_0.6.5_darwin_amd64.tar.gz"
      sha256 "8d69472319aba617bf59d262838a633d7b95b061758bb3cf55a1db803e9f8329"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.6.5/carina_0.6.5_linux_arm64.tar.gz"
      sha256 "eb2a5739eb747d440e70e4cf2efa7da0412148e3e7fb17b1fcb76ad73c5024bd"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.6.5/carina_0.6.5_linux_amd64.tar.gz"
      sha256 "7dbc368916f4f224778104e88e337214650f156478d83f27bd0570a68ba6a4bd"
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
