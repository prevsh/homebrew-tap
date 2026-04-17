class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.9.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.8/prev-darwin-arm64"
      sha256 "4b225876917d3e5c559fb694d2b739d27218a427afb4ae6fb78565d965452191"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.8/prev-darwin-amd64"
      sha256 "3aff146fcdcd218fef8e38e38d031f255b3636935cc96cec4a6431784fec1319"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.8/prev-linux-arm64"
      sha256 "5a2664a92e9ecf7870698a1e0d585976f1dfa713c74337a0bbe235ce49612a5e"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.8/prev-linux-amd64"
      sha256 "8f189d65624c9547af8d0bb0853fc92ce87d1f956c24558b952569286021aa66"
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
