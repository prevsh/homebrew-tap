class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prevsh/apt/releases/download/cli-v2.1.0/prev-darwin-arm64"
      sha256 "3742ffed7a53cbb91fbc471b7df7a410cb11a991275e4ee9ffe77caed4dc82bd"
    else
      url "https://github.com/prevsh/apt/releases/download/cli-v2.1.0/prev-darwin-amd64"
      sha256 "da4166a2b6692c229733d80af70965ed8f8a0959a86a038ad400ca836bba0943"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prevsh/apt/releases/download/cli-v2.1.0/prev-linux-arm64"
      sha256 "1682697dc92921c34ba04d04c42e4e961012c1564ed29472fc0a464daae60453"
    else
      url "https://github.com/prevsh/apt/releases/download/cli-v2.1.0/prev-linux-amd64"
      sha256 "113eab0a83197981ae826b7cae69f21b9757329726203be7314fe031795a3991"
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
