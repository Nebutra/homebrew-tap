class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.7/carina_0.8.7_darwin_arm64.tar.gz"
      sha256 "4b053fc1268e97bc98df20b88863ffced0bdcb4c1950e11dbb1cc14212b5b64c"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.7/carina_0.8.7_darwin_amd64.tar.gz"
      sha256 "29d7b6dff80f6f6f1039ea1e7bfd1bdd0171f8c54df5578964c77e1f41463780"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.7/carina_0.8.7_linux_arm64.tar.gz"
      sha256 "79f00d56b06db936213d368933915fc34c95ef8704660bcc8ee5b4410d6ec45f"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.7/carina_0.8.7_linux_amd64.tar.gz"
      sha256 "c46a499eba25b9cbd729cd9c0f400774b829bd1a02235bb736303cb706a052cd"
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
