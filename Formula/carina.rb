class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.14/carina_0.8.14_darwin_arm64.tar.gz"
      sha256 "713034d8946a2696d7b87f950faacf364e04fa04007122c8dd34e782deb71524"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.14/carina_0.8.14_darwin_amd64.tar.gz"
      sha256 "19b196948f644a8382e0c2e18a2c91e7d37dcfd4268c0bbb14036433a73af200"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.14/carina_0.8.14_linux_arm64.tar.gz"
      sha256 "3c1b67a19b14524954d8528efa4dee00840e2e9625f88969308c0223668d4c0e"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.14/carina_0.8.14_linux_amd64.tar.gz"
      sha256 "942b2d04b3ad598eba1d07761ed5eab58834d5658736cf70d2c7efb2a428932c"
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
