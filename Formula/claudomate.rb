class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.15.tar.gz"
  sha256 "d926407d69f910133f81beef6ca29f6aa23f94325450408a5e06c64f9fa5a4b8"
  license "MIT"
  version "0.2.15"

  def install
    bin.install "bin/claudomate"
    (prefix/"templates").install Dir["templates/*"]
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
