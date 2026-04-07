class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.8.tar.gz"
  sha256 "6b08a2fa077b20b9b08e8f023f6fc6dfa3552827ed6d013b51f82362128714a2"
  license "MIT"
  version "0.2.8"

  def install
    bin.install "bin/claudomate"
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
