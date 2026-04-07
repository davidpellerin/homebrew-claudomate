class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "b3aa40847385498ebb19652d3ddc772923c100f52ef1c962747ca68fdab44d82"
  license "MIT"
  version "0.2.5"

  def install
    bin.install "bin/claudomate"
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
