class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.9.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.7/prev-darwin-arm64"
      sha256 "0c8b6efd5706f1d228ea5212c65ebb54c8c8f60c3a63504075a64cf064c47256"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.7/prev-darwin-amd64"
      sha256 "8580699d3101925c3a7cbb93a65f5ca709494c6891635e532ed4bce74bed21d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.7/prev-linux-arm64"
      sha256 "f24ec22610e968a078b8dd821e774ec4419a87621e931af630ee7d996f1cd320"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.7/prev-linux-amd64"
      sha256 "7147c95eae772bc778a7231902c35695581bf31f49a3ab29d224dd037c047812"
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
