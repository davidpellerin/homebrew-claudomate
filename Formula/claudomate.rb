class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "b5ab09643674ed74081e9ea412889676f2ebf9e09df5cdafeda3a1142f19058d"
  license "MIT"
  version "0.2.4"

  def install
    bin.install "bin/claudomate"
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
