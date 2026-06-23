class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.12.0/prev-darwin-arm64"
      sha256 "d003a277beb3070e34c2dbd832293c985c8df9b05753aef043bbdc388258b2e2"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.12.0/prev-darwin-amd64"
      sha256 "404c89c88f3e093136476d99c6f59c41b463c199f846aba1aa02bec15ea277f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.12.0/prev-linux-arm64"
      sha256 "8ce90d0e372c652c04d710efdfb946b42ddd4d81d609f3c6baded40a1623cebf"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.12.0/prev-linux-amd64"
      sha256 "65568290de862d6d60e8724e0fbadee62bc202dbd8e44f01c4f5bf434b42e453"
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
