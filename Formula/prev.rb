class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.13.0/prev-darwin-arm64"
      sha256 "afbe555c276f2ea85c246ad3f9529fc06e905708a1f2f917aeeefbbeedeb007a"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.13.0/prev-darwin-amd64"
      sha256 "b59750f9ca82a0677214c165592cd7a7fcd7685e6b22a001aeed03784bec0c45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.13.0/prev-linux-arm64"
      sha256 "553d652bdd55e7990706fcb8323562ff05550ad0f4ac62d31219add1eba0aaaf"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.13.0/prev-linux-amd64"
      sha256 "0271132507ddbbbbb5b302b872ff0dcd52eacb96f7a7c37a4a3a1088d7e925f2"
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
