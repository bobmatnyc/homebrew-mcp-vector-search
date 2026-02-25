class McpVectorSearch < Formula
  include Language::Python::Virtualenv

  desc "CLI-first semantic code search with MCP integration"
  homepage "https://github.com/bobmatnyc/mcp-vector-search"
  url "https://files.pythonhosted.org/packages/bd/d5/8b9d0d91963570c7f0d6fbe4c543bbf3b009a989b2c26ee5e39a01f98da8/mcp_vector_search-3.0.22.tar.gz"
  sha256 "2b61731b5517a08a712f86b8f38d9fd0365fadfed9480fdf3b3688354f3fa7a4"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create an isolated virtualenv (without --system-site-packages)
    # This ensures pip and all dependencies are installed in the virtualenv
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec

    # Install the package and all its dependencies
    system libexec/"bin/pip", "install", "-v", buildpath

    # Create symlink for the binary
    bin.install_symlink libexec/"bin/mcp-vector-search"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcp-vector-search --version")
    assert_match "Usage:", shell_output("#{bin}/mcp-vector-search --help")
  end
end
