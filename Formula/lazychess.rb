class Lazychess < Formula
  desc 'A chess analysis TUI with Stockfish integration'
  homepage 'https://github.com/benwyrosdick/lazychess'
  version '0.1.0'
  license 'GPL-3.0'

  depends_on 'stockfish' => :recommended

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/benwyrosdick/lazychess/releases/download/v#{version}/lazychess-aarch64-apple-darwin.tar.gz"
      sha256 'c60257c0ffcb6bf101a49a510057aede8997e07eefbd479a53a66b5461e0d5c7'
    else
      url "https://github.com/benwyrosdick/lazychess/releases/download/v#{version}/lazychess-x86_64-apple-darwin.tar.gz"
      sha256 '85f4f3accde42770261b771223c251f3bebf7f7e8566872a05d9051cb877eeac'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie 'lazychess is not currently supported on Linux ARM'
    else
      url "https://github.com/benwyrosdick/lazychess/releases/download/v#{version}/lazychess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 '8ccc0b1af7f19606ae76651749d8e8c26113f75276892bccc535de1cc80ddcdb'
    end
  end

  def install
    bin.install 'lazychess'
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lazychess --version")
  end
end
