class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.9.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.10/prev-darwin-arm64"
      sha256 "3d5f96f40528be20120d7bb92cb50288e8e0be90652f37b5b0ff12faae2154b7"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.10/prev-darwin-amd64"
      sha256 "8c803769e0410533934a19d5584880f79c8598d1296c26303f476037a5d23010"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.10/prev-linux-arm64"
      sha256 "6be333b42cf85104d80cb946f05bf04a4def6195ccbe219eeb20cd6e354c6ec7"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.10/prev-linux-amd64"
      sha256 "155899aeee05cc61a0909380fc3e72966fed3869a8d8e89d362e8984215b1257"
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
