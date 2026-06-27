class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.17.0/prev-darwin-arm64"
      sha256 "46789dcc9a415c6ff80380cb4472ff3e94b0a63da48b7a88f2c59f7f79139903"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.17.0/prev-darwin-amd64"
      sha256 "3dba00cf4c7518d00b68c38509f4ce5176a418b8501b696451193b677b4f21bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.17.0/prev-linux-arm64"
      sha256 "e363889fef51c95f1e30fa86292cf1e9c06550ed099f97a6231329c86951dd3c"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.17.0/prev-linux-amd64"
      sha256 "dcbac348b7e88e01d401e441b7c91fa6eb3af3b54f2c48a8627ecd4559e88ad7"
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
