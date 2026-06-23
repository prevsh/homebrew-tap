class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.12.1/prev-darwin-arm64"
      sha256 "9df139afaa60aeee77c5ecb15607d44c046cbca2bb04bdfdea60c941e2aea695"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.12.1/prev-darwin-amd64"
      sha256 "9686c6c6765b5f1b1f83475f260d8ee4b953aadadebe1438795be1c682ca8665"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.12.1/prev-linux-arm64"
      sha256 "88bbd68b58894a5fb373f32c03042e401c1a2999db4bb7a150dea21a0a16ceff"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.12.1/prev-linux-amd64"
      sha256 "94b8c0c8431ed2d148602f93d27969526db8d2ec433390507821e29c383bcd9e"
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
