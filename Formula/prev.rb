class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.1/prev-darwin-arm64"
      sha256 "3cff5eaacc57fdab053fff7015fc1575ddd2fe00e17d0e6cfd0fd177b47046f2"
    else
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.1/prev-darwin-amd64"
      sha256 "b7844d6a251c7232514c736feb97595d1e82bc29c34b367a77243452bef9694c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.1/prev-linux-arm64"
      sha256 "a51b407fb0fdfd66e2db13e6fede02564c0d261a6ea727e24a8b7ab74e85a6bb"
    else
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.1/prev-linux-amd64"
      sha256 "51140e9e4109116a12a6a830f9072e31715a7f3c516690e6cf26fd2c2aead719"
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
