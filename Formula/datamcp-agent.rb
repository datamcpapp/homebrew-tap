class DatamcpAgent < Formula
  desc "Local tunnel agent for private PostgreSQL databases"
  homepage "https://datamcp.app"
  url "https://registry.npmjs.org/@datamcp/agent/-/agent-0.1.8.tgz"
  sha256 "6d4bc30f64c6c02c2a99992c15fc108269d18f6e4473c7a13bae11d89ea15818"
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
