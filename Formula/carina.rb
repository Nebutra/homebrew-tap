class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.19/carina_0.8.19_darwin_arm64.tar.gz"
      sha256 "9eff8f5174de7e31dc89d48ae59d0332b4f8ab079c46a655653b53c659fc65b1"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.19/carina_0.8.19_darwin_amd64.tar.gz"
      sha256 "1d7ff9dfa5b4db13249c871cd9905d2e608760c9d011d794489e781b38c4fb85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.19/carina_0.8.19_linux_arm64.tar.gz"
      sha256 "c2c7346d9586704460734ca3266b3dc43b853df06aba7973295dca0d78b07dec"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.19/carina_0.8.19_linux_amd64.tar.gz"
      sha256 "bc0569f1057053e5915b3278388c186e0f7d6033a514b327f86befd59c3e810c"
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
