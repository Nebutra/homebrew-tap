class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.16/carina_0.8.16_darwin_arm64.tar.gz"
      sha256 "4f49749118a5f7fa8bc0b0ae5dd1ad138014498a4dda5cdc330a8253564860dd"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.16/carina_0.8.16_darwin_amd64.tar.gz"
      sha256 "e0148e2847bfd7c78f5288e3a25f6aae8d1fbdf07448a433243bd37218429fa2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.16/carina_0.8.16_linux_arm64.tar.gz"
      sha256 "b415e5bf599d5ee25fa4c18ddee056ce380fed2699b4cfb3b4b92fa5c156a96b"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.16/carina_0.8.16_linux_amd64.tar.gz"
      sha256 "057a1faa92b12eb73d1cf169204d3b25b45ca95cbf87b5ad72866c89f28d2275"
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
