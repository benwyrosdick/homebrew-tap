class Restui < Formula
  desc "A TUI API testing tool like Postman"
  homepage "https://github.com/benwyrosdick/restui"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/benwyrosdick/restui/releases/download/v#{version}/restui-aarch64-apple-darwin.tar.gz"
      sha256 "3f010999d7c4305e3ce44d205d456415a728e777fbc0d58e2134f954b9a95bd9"
    else
      url "https://github.com/benwyrosdick/restui/releases/download/v#{version}/restui-x86_64-apple-darwin.tar.gz"
      sha256 "e03fbc9d0778f01050242eb4fe4b559d1b5fa1de3ed1ef68cea672171bb1954d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "restui is not currently supported on Linux ARM"
    else
      url "https://github.com/benwyrosdick/restui/releases/download/v#{version}/restui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db30f68ac3353b4da78bd604df5e33c05d3b32008488352f60d3d83d8215039e"
    end
  end

  def install
    bin.install "restui"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/restui --version")
  end
end
