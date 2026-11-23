class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.0/prev-darwin-arm64"
      sha256 "330d5d7ca39ac6b5e3d7ba389b3abb53db816182f6befb100f3afc91ee468ba1"
    else
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.0/prev-darwin-amd64"
      sha256 "6239e1427187a1ce88207987b9c2ff09a32330e1fa858d1df597cba07c2a20b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.0/prev-linux-arm64"
      sha256 "5812f3a5b993a1a7f6f4894b01535a0a8aa8dc43fd47329b960cf9fe49dbf012"
    else
      url "https://github.com/prevsh/apt/releases/download/cli-v2.2.0/prev-linux-amd64"
      sha256 "8839d9c3746c9eacff4194d5bad41d510a6a0ae3d4f60886effea48cf865d4c7"
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
