class DatamcpAgent < Formula
  desc "Local tunnel agent for private PostgreSQL databases"
  homepage "https://datamcp.app"
  url "https://registry.npmjs.org/@datamcp/agent/-/agent-0.1.6.tgz"
  sha256 "61af58472aa68636a9550e60406ad76011012e924e356516fe75fab55a3113a6"
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
