class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.18.0/prev-darwin-arm64"
      sha256 "67c6757444dc8c4983fd3a7c01d28a391121659da51ac0fbce30a3915349145c"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.18.0/prev-darwin-amd64"
      sha256 "ebc07c47930161dfc393d4458a7d655a42e240cb21427f70a103d2cd50356504"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.18.0/prev-linux-arm64"
      sha256 "80990283f55956e419776e54b07e8f1db127d62e8af57320da635deeb77ad7da"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.18.0/prev-linux-amd64"
      sha256 "51ca2c11110ee4ec55d8c296f2d240d2be805ca457a80e54725f534f1619dd04"
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
