class Carina < Formula
  desc "Local-first runtime for AI coding agents"
  homepage "https://github.com/Nebutra/carina"
  version "0.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.5/carina_0.8.5_darwin_arm64.tar.gz"
      sha256 "6aa12efec789badadee991956c66d1269e4aec2496f66a4e102185532efce2d4"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.5/carina_0.8.5_darwin_amd64.tar.gz"
      sha256 "b5fd7f0bc3afccc826457594a6760d9f2b770cc722816afc9c1aa73dc05fde8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Nebutra/carina/releases/download/v0.8.5/carina_0.8.5_linux_arm64.tar.gz"
      sha256 "1931a5f6f8fc6c00c4e032818685966362be5fe655281062cd8c5dece1a8c8b5"
    else
      url "https://github.com/Nebutra/carina/releases/download/v0.8.5/carina_0.8.5_linux_amd64.tar.gz"
      sha256 "14783d6c108f5dbc087176f50ad258525dae34f35318297b76508a41eb840b0c"
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
