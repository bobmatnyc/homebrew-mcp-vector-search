class McpVectorSearch < Formula
  include Language::Python::Virtualenv

  desc "CLI-first semantic code search with MCP integration"
  homepage "https://github.com/bobmatnyc/mcp-vector-search"
  url "https://files.pythonhosted.org/packages/89/20/9735eb7fe787e397d0de7c621afcee3870cc439a862ea619c5e993bbaf3c/mcp_vector_search-3.0.68.tar.gz"
  sha256 "d2b8467d035abeb5dcafa310c51771b77324f4b7612e2c1633eba4fb13dd98d3"
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
