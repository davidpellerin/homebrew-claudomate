class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.12.tar.gz"
  sha256 "597c32f0b02097665d25e2123b80a56782f44ee87429bfca5f3142eea33ab68a"
  license "MIT"
  version "0.2.12"

  def install
    bin.install "bin/claudomate"
    (prefix/"templates").install Dir["templates/*"]
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
