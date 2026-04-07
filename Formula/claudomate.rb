class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.9.tar.gz"
  sha256 "329d0ba856771b60032d21437cb9e6fe3dbb9d457484e6398965cf7f7d312007"
  license "MIT"
  version "0.2.9"

  def install
    bin.install "bin/claudomate"
    (prefix/"templates").install Dir["templates/*"]
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
