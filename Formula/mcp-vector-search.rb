class McpVectorSearch < Formula
  include Language::Python::Virtualenv

  desc "CLI-first semantic code search with MCP integration"
  homepage "https://github.com/bobmatnyc/mcp-vector-search"
  url "https://files.pythonhosted.org/packages/source/m/mcp-vector-search/mcp_vector_search-0.14.0.tar.gz"
  sha256 "22094c2d036cd36599557ee76dfc7576a432a5e5b25db039543ea3602cdf7336"
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
