class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "ea3db38b2266df36eb502e585b9acbf6115e91b070e86fe5a29bb962a9d78389"
  license "MIT"
  version "0.2.0"

  def install
    bin.install "bin/claudomate"
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
