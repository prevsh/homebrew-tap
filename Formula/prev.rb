class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.10.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-darwin-arm64"
      sha256 "6cc1bda4c26789b0651dc150088e54f66c72a8667c7dd9c1dbe30fbfa1d7be3a"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-darwin-amd64"
      sha256 "3b72431db589e84239b671fab5efd4cb01ce3c84ae87b0e1385d04137972bca1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-linux-arm64"
      sha256 "34752f3c51ba53c39aac5b8204248c08ec977ad5bae95c0de34dc074f271f511"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.1/prev-linux-amd64"
      sha256 "a5a5bd280932bdc8c456ca98fbdee00078dcb56aac655117402084039c765f91"
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
