class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.1/carina_0.8.1_darwin_arm64.tar.gz"
      sha256 "99702e01d13ad89622d74544eec225f08fb4259dde4bcbbe150a5e57267db339"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.1/carina_0.8.1_darwin_amd64.tar.gz"
      sha256 "9a97a59c980248946fb859409b3aafb4d284c22be6b01c92558035b020a7f317"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.1/carina_0.8.1_linux_arm64.tar.gz"
      sha256 "12b6aca64768ca3c6ba75c7be75d6f38e400a037435dc5daf3401bc42d35fc2a"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.1/carina_0.8.1_linux_amd64.tar.gz"
      sha256 "09b06b8d4bd65d1dc4ae50645c210cca890afff76c166c47fa56ed1fad13a2fc"
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
