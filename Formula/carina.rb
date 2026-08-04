class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.8/carina_0.8.8_darwin_arm64.tar.gz"
      sha256 "ba33cbe4c06265c4f27193154860a2a71534651b7734465d7a60e74b49bf4379"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.8/carina_0.8.8_darwin_amd64.tar.gz"
      sha256 "fa231643cb82ca0eb6516a13af20604b30f35c2daea19a51a6c875e0e448bf63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.8/carina_0.8.8_linux_arm64.tar.gz"
      sha256 "09ddb5a165172e437ce4a58cc0d9bb214a179cd71099456bf5e8da2591a14060"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.8/carina_0.8.8_linux_amd64.tar.gz"
      sha256 "8f7cf0385eb5808f158c68652c81583cd0dcd04b3a76719c4b2e0f5835597663"
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
