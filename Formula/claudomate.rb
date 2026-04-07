class Claudomate < Formula
  desc "Claude Code automation CLI for any repo"
  homepage "https://github.com/davidpellerin/homebrew-claudomate"
  url "https://github.com/davidpellerin/homebrew-claudomate/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "c76583e16f49b4524bf4524946e5263d8af4048a02cfbe0db1d9e8fa09eb1fcf"
  license "MIT"
  version "0.2.6"

  def install
    bin.install "bin/claudomate"
  end

  test do
    assert_match "claudomate #{version}", shell_output("#{bin}/claudomate version")
  end
end
