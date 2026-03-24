class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.9.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.6/prev-darwin-arm64"
      sha256 "aeadb109160e0ac8c18efbc9e46a0f45478a082c101205839c17c77cad716978"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.6/prev-darwin-amd64"
      sha256 "a51b7922bdf377de78a182aeb89875ae9875ac7df032962faa16bf953fe8d710"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.6/prev-linux-arm64"
      sha256 "e783ec319383cc76fe1ce4a97c16b304cd7e97c64695b4ac69f10be4baef98a8"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.6/prev-linux-amd64"
      sha256 "95f8bfcee19cbc773f5b771c3f04382ac5eace521f4f68ce177dc5f1f8493242"
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
