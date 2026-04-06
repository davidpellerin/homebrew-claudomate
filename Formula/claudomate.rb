class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "cdfc70b0d31fed155148a701199587afb59cc8ddaac3a7ffb93f3859645f6593"
  license "MIT"
  version "0.2.2"

  def install
    bin.install "bin/claudomate"
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
