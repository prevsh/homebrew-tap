class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.10.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.2/prev-darwin-arm64"
      sha256 "371cd4fb1abeffa53fdc53bfe8a1946590131a1323bdab35bc2ad80e67443c4a"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.2/prev-darwin-amd64"
      sha256 "a8d4a19afa0a029bcc1948b3282244bd660e44ca2840c49c57f9c0db28d729fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.10.2/prev-linux-arm64"
      sha256 "cdae58325ca50677431f6a9046452d992c93243a3ba05d414d0d9ed02de2df1e"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.10.2/prev-linux-amd64"
      sha256 "8d2a83a5ee5afa514b350f6c9e00f17b46d75fc6bd07fbd3c25cd493372957cf"
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
