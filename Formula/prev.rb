class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.19.0/prev-darwin-arm64"
      sha256 "ae962743f21ac0311c34e0a82b9c96e64c0e28ebdb0b7e27e466b748aaa02e9e"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.19.0/prev-darwin-amd64"
      sha256 "d9cdf46d3c9cddc49b78b02318cd5b062b0213c89f4a71d2e29c0ea53a4c9fe4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.19.0/prev-linux-arm64"
      sha256 "744016f1ad77ae4719facd4f2ad8edb0f854db460e628b316553063ff302d3e8"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.19.0/prev-linux-amd64"
      sha256 "505b4b5669a2d6b2631789da5b11dc83f6ab71b55ebd42e5e49f0b0d31f77e61"
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
