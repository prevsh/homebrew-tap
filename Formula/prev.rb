class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.16.0/prev-darwin-arm64"
      sha256 "e9401e7df0260ae685d1cfdc998852fa1c40bc1c94559872623da4db98599a9a"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.16.0/prev-darwin-amd64"
      sha256 "e3200527ea8c2cf2c3759f57ede063368553fb8e5256ad5560da13ab070bea29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.16.0/prev-linux-arm64"
      sha256 "579376d0773a7f202b640331d4be0169321e5db121d914d69c501091c06b670b"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.16.0/prev-linux-amd64"
      sha256 "95143f2b55facb8fa33687e38f8d8712632054cf3f09f74968caa2416f856a93"
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
