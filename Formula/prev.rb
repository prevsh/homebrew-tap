class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-darwin-arm64"
      sha256 "65ef9554537edcee91e32250a488f4b8c5c3fba7813f776a02b50975bea1d9c3"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-darwin-amd64"
      sha256 "246a3f0d64dde8a19eb625d4cd32467f6d14d8c574f4b714e588a09108d3beba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-linux-arm64"
      sha256 "fdf58a3e0b729e24de2001fef760440bc79f80c16532149eda8add4b5bffc552"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-linux-amd64"
      sha256 "bef07a9249fdb31db1b11ad183ae3c61a02fecaf43524a461cb3ffd7a8b582c8"
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
