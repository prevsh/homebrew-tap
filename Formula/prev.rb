class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.9.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.3/prev-darwin-arm64"
      sha256 "534a2dd9bc8cc390e02ea02d6c477eb169c97b30dd6bdecd64cf3ee1e6ee98ab"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.3/prev-darwin-amd64"
      sha256 "8d4382c382f76b95eacbfdd8091e65543032f52008e0466520b28981e92bf79a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.3/prev-linux-arm64"
      sha256 "d7c11859095b4eefaef0a5e52be2653e9adf03efaa07ec11430736cdd4e7ecd6"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.3/prev-linux-amd64"
      sha256 "af5de0f1e39d877bd912ecd6d22c1c51e1c18755d7d76d6e9b8092e9b6ac6741"
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
