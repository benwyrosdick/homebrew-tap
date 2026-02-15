class Lazychess < Formula
  desc 'A chess analysis TUI with Stockfish integration'
  homepage 'https://github.com/benwyrosdick/lazychess'
  version '0.1.0'
  license 'GPL-3.0'

  depends_on 'stockfish' => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/benwyrosdick/lazychess/releases/download/v#{version}/lazychess-aarch64-apple-darwin.tar.gz"
      sha256 '3f16e00ca6fc1f6861158941daf7df2b400ed1cb265f5e101de2a45a422c2b4b'
    else
      url "https://github.com/benwyrosdick/lazychess/releases/download/v#{version}/lazychess-x86_64-apple-darwin.tar.gz"
      sha256 '76472e2ffe1c21472cb5cc8aeba2b9235842adafe80f9bc2eb3d0c40e8a58c2e'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie 'lazychess is not currently supported on Linux ARM'
    else
      url "https://github.com/benwyrosdick/lazychess/releases/download/v#{version}/lazychess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 '284aed1459051db03d7bffed269867947ea34804899b10a84028ab4c8a9f353a'
    end
  end

  def install
    bin.install 'lazychess'
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazychess --version")
  end
end
