class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.14.0/prev-darwin-arm64"
      sha256 "118807d2aeb67abebb30edda4993c218d21e0d0cfacee315fec9fd7a7b10aa1a"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.14.0/prev-darwin-amd64"
      sha256 "a0ba791108c7f8bc3fe5a4bdfac9b123e4a6ccf50276459ca0b78c82c9f270d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.14.0/prev-linux-arm64"
      sha256 "31a749c19c5b5d6dad86abd6c2708fb94c6b9dc8841fcbff193233743724bb72"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.14.0/prev-linux-amd64"
      sha256 "4e572116cbb125c2256b3113cca31873366a3edb1696265335e9f0b6bb3f10d8"
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
