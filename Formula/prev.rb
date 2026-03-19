class Prev < Formula
  desc "Preview environments for web projects"
  homepage "https://prev.sh"
  version "1.9.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.5/prev-darwin-arm64"
      sha256 "76c037d63672bf0cc4190dcd25293c8700e65bb8790665f4a7d605bcf06d6b9d"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.5/prev-darwin-amd64"
      sha256 "9b690ad606d78a504801f6bf0278d8737f6089a795e693a8515b6d79895aecd4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/pepperpark/apt/releases/download/v1.9.5/prev-linux-arm64"
      sha256 "5d4c60526830a9e617c375ac8bd901a36e61feb6712408a2a3a30a1325ddde46"
    else
      url "https://github.com/pepperpark/apt/releases/download/v1.9.5/prev-linux-amd64"
      sha256 "ca4e24d8396630a4c8a286a9189a6b8a62e68d5cdb686d34bd312de309e443f5"
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
