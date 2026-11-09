class DatamcpAgent < Formula
  desc "Local tunnel agent for private PostgreSQL databases"
  homepage "https://datamcp.app"
  url "https://registry.npmjs.org/@datamcp/agent/-/agent-0.1.9.tgz"
  sha256 "db57f583bdb157d2b7a4d0b1c4faafe157e0121e47835865d6f5053fdb52999c"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/datamcp-agent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/datamcp-agent --version")
  end
end
