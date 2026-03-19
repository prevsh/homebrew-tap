class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.9.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.4/prev-darwin-arm64"
      sha256 "ae29b8a87a9c9b0b2d783f8b8e39de72c6e02be9266d1670a8ef3f8f4c898dfc"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.4/prev-darwin-amd64"
      sha256 "46711c6840da1aabe2d6ce207fd67fecb8d0bc48165a21298f8aa845433d6d28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.4/prev-linux-arm64"
      sha256 "149bc4ae6e2604bedc55020df47068a17f10f30b367bc094669bcfe40904f575"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.4/prev-linux-amd64"
      sha256 "0227f0c6003604dee2b4ba583d4ae064bf3e74239661603209f32df068098651"
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
