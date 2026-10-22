class DatamcpAgent < Formula
  desc "Local tunnel agent for private PostgreSQL databases"
  homepage "https://datamcp.app"
  url "https://registry.npmjs.org/@datamcp/agent/-/agent-0.1.7.tgz"
  sha256 "a3b3a154830523097b4083f566e72519c8235d0de4ea4f13a3a94cee8be8171f"
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
