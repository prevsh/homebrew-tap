class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.15.0/prev-darwin-arm64"
      sha256 "e53c720af4f51b0c289de2760d9671277f936eab90f14537c357b331fb5ff1b0"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.15.0/prev-darwin-amd64"
      sha256 "1a15e69b000d49ba71e37fe1eaf9ce08afe255c5b85c97c219e79e76aef09863"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.15.0/prev-linux-arm64"
      sha256 "1e9c367bd4edd1fbcd4f8588067f7a4c1432254f415f26d2f854d0fb7ba509b3"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.15.0/prev-linux-amd64"
      sha256 "ae3cd8e2e5ee1ad1aba66e34010c3755012053e1ba84c42b15c0f334a387d898"
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
