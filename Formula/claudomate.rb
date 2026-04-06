class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "880692c727c78cac8652686dacbb0400fd0eaec1785f02feb6593443707c0223"
  license "MIT"
  version "0.1.0"

  def install
    bin.install "bin/claudomate"
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
