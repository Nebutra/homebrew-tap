class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.13/carina_0.8.13_darwin_arm64.tar.gz"
      sha256 "4f96aaa785a0ece99dbd34f59a926fa093f52bed3b325143e35d53abf8b48cb6"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.13/carina_0.8.13_darwin_amd64.tar.gz"
      sha256 "180668c330c1eaeb191af8acd5e7dd3cd53cd1f9ccb7372c546e54f906987b0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.13/carina_0.8.13_linux_arm64.tar.gz"
      sha256 "c9f87b5efdb8f95ccc6174d10b05bcd628684af71ac9bc1583f33465d117edce"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.13/carina_0.8.13_linux_amd64.tar.gz"
      sha256 "721d34eb3fab758d37d9468305be85feb1c38db08a133575fee3ccee4fe94b62"
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
