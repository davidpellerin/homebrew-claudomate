class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.16.tar.gz"
  sha256 "32e5cdf39f92336b2080baf4b9ad9115c667d1d9662a09a3963c4b4560ae16d6"
  license "MIT"
  version "0.2.16"

  def install
    bin.install "bin/claudomate"
    (prefix/"templates").install Dir["templates/*"]
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
