class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.18.tar.gz"
  sha256 "7fbd46027de4d58e09cbded16d419e584171ecaf11071cc672de26973d84b6e5"
  license "MIT"
  version "0.2.18"

  def install
    bin.install "bin/claudomate"
    (prefix/"templates").install Dir["templates/*"]
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
