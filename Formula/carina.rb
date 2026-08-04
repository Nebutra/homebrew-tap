class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.9/carina_0.8.9_darwin_arm64.tar.gz"
      sha256 "6522b9e5cf5b47f9aaff2906b5e1ccc3dbc4d7504e3947b7788b2e6d188eba54"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.9/carina_0.8.9_darwin_amd64.tar.gz"
      sha256 "a3c84db6269e996e080ff4752f38e09bacd259913aa5c4f8f2448a6795d9ae8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.9/carina_0.8.9_linux_arm64.tar.gz"
      sha256 "31f4c036ff5c60e0c5e7ad0a107fbdbbe12b7121c01f6f35bcfc706f947ba0af"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.9/carina_0.8.9_linux_amd64.tar.gz"
      sha256 "998c57cbc308609d6ae20c1758b6b88758aa7b92a1a5dbbe31bfe46867d93ffd"
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
