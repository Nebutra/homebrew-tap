class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.6/carina_0.8.6_darwin_arm64.tar.gz"
      sha256 "e500a70810ae6faf762899600175ff3618e3ae5f6dc3165d72305a202a380c90"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.6/carina_0.8.6_darwin_amd64.tar.gz"
      sha256 "f0f8943b1ca60304a5e273afae9fe418c3fbe95b30f4d87b9318d68f0e639cae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.6/carina_0.8.6_linux_arm64.tar.gz"
      sha256 "d8ba3c2c8bde9628fecf650c0fd5aafa8c0e8a7e243afbd4d1aaaa6e7737f86f"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.6/carina_0.8.6_linux_amd64.tar.gz"
      sha256 "da3f2a18eedd7f0d4a84b77f455e6c7ef0b9a83d01d2fb6c3c7605a4fed5491c"
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
