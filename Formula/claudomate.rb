class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "5b67d54b9ce88a2401d1238e5cc796270d898b70fcab0858885b620dee88a543"
  license "MIT"
  version "0.2.3"

  def install
    bin.install "bin/claudomate"
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
