class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.6.0"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/Nebutra/carina/releases/download/v0.6.0/carina_0.6.0_darwin_arm64.tar.gz"
    sha256 "a3272a8c43fa0555d460f7a37068e7caf1d47af21b00afa13e89e74cf7db83ea"
  else
    url "https://github.com/Nebutra/carina/releases/download/v0.6.0/carina_0.6.0_darwin_amd64.tar.gz"
    sha256 "15e5fa22c0c937dce9b36a2142eb8d101e61ccaae708112e7aa653d9a262cd10"
  end

  depends_on :macos

  def install
    bin.install Dir["bin/carina*"]
    bin.install "bin/headroom" if File.exist?("bin/headroom")
  end

  def caveats
    <<~EOS
      Carina does not auto-start a daemon after install.

      Start it explicitly:
        carina-daemon

      The optional Headroom context engine is not bundled in the Homebrew package yet.
    EOS
  end

  test do
    assert_match "carina #{version}", shell_output("#{bin}/carina --version")
    %w[carina-daemon carina-worker carina-tui carina-kernel-service].each do |executable|
      assert_predicate bin/executable, :executable?
    end
  end
end
