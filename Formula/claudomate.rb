class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "971caf434c21f4e243530756accdcf684429e4eb2ac6f905ef2f5f9c1d932250"
  license "MIT"
  version "0.2.7"

  def install
    bin.install "bin/claudomate"
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
