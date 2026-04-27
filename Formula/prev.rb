class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.9.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.9/prev-darwin-arm64"
      sha256 "484bc65b10e2cb7b3d01448b17d144f930bd4e15f675ad175dd6d58eb49325ae"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.9/prev-darwin-amd64"
      sha256 "d731a7aa322e635e1d5d361b63573cbd41506d17e9ca535b8d017c8533dd21e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.9/prev-linux-arm64"
      sha256 "3c2c85bda7535c85a38e4eda0701fa15ac4304f1a103a406b47625781afec20d"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.9/prev-linux-amd64"
      sha256 "2d1c7d7b885705fe72a6b2349010f37cc07726be0f10937e6b1f6107991074b2"
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
