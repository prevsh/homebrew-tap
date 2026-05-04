class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-darwin-arm64"
      sha256 "27f526b30c7f6c6f812da13c3a4e27adae6e0fb6d876ed2e94d656d8cee5c75d"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-darwin-amd64"
      sha256 "b3dffdddd725431904d5b70d07e88ef871ff067ee0d251130ee0ec67caa1d247"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-linux-arm64"
      sha256 "1bbaa7822f134c36bf429fec355fa0c852ce897867da12ef490503216945444c"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-linux-amd64"
      sha256 "46124d204b8400c8edb855479fba8367080cd2d1f4c50e82cb83b2e89f665109"
    end
  end

  def install
    binary = Dir["prev-*"].first || "prev"
    mv binary, "prev" if binary != "prev"
    bin.install "prev"
  end

  test do
    assert_match "prev", shell_output("#{bin}/prev --version")
  end
end
