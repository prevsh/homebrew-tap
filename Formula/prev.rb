class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.0/prev-darwin-arm64"
      sha256 "831e2a812afc26a11c78df34b660205505b8d07363dc7b2e62181bfc59894409"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.0/prev-darwin-amd64"
      sha256 "47fc4d3edea5618c0561b1572109af88e649ee7205ee41842f6e7bc80b6a54fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.0/prev-linux-arm64"
      sha256 "0f5f3edbba780c922ef4de4094b4ad451f5360aebfac8dcaec21f1bffef81a1d"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.0/prev-linux-amd64"
      sha256 "41f9cca06dd3889c6fca83226d5815eed3d02ba53eceea1cbf6c12da09e06fc1"
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
