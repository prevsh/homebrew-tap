class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.12.0/prev-darwin-arm64"
      sha256 "879ca53d7625b7ba2ce1e9079a7061bd930d0a90bc15c7d2cf34a5063614ef6c"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.12.0/prev-darwin-amd64"
      sha256 "3e5104e0946f819337e03d5069dd0d5603a91490df066293b4147f70aa9e5433"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.12.0/prev-linux-arm64"
      sha256 "45353ba8ad8e3371014fcbe5cc94892372552282e0e8b88c0a009f3e4a3c059a"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.12.0/prev-linux-amd64"
      sha256 "d32f15b000116e6d7abbbbb58bc68f03de0c8e10e1181fd09b9460b55fa26009"
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
