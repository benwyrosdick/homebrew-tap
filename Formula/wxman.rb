class Wxman < Formula
  desc "A terminal-based weather application"
  homepage "https://github.com/benwyrosdick/wxman"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/benwyrosdick/wxman/releases/download/v#{version}/wxman-aarch64-apple-darwin.tar.gz"
      sha256 "77c7fcc2166885802fe7932634c35ebf773e5351711391c3d96bc29fa37eb787"
    else
      url "https://github.com/benwyrosdick/wxman/releases/download/v#{version}/wxman-x86_64-apple-darwin.tar.gz"
      sha256 "061c8be582d98980556331fe15e798002053f9bbb355da59b20b3083610359a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "wxman is not currently supported on Linux ARM"
    else
      url "https://github.com/benwyrosdick/wxman/releases/download/v#{version}/wxman-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06cedd9ce29d7957f0e94788b248e315b54153d913d2492fb59470c7e1148244"
    end
  end

  def install
    bin.install "wxman"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wxman --version")
  end
end
