class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "2.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.2/prev-darwin-arm64"
      sha256 "bd4b4650489852e34ef815187cca1488d1e29bae480e075010c7cde5b03108d1"
    else
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.2/prev-darwin-amd64"
      sha256 "38ed2bdf02516df258cbddd6cf10c13570324b1d93d41b8e81660c7e1a2ebd67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.2/prev-linux-arm64"
      sha256 "44ed857ac23c0659effdf9d1cf23f2f1706262f7e68fa530e498d474152f2549"
    else
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.2/prev-linux-amd64"
      sha256 "2e56f391bc9a36cb433cd8183de4d942fef0ee21d4e4630a0e89b2fd92042dff"
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
