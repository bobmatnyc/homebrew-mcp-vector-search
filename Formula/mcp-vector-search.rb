class McpVectorSearch < Formula
  include Language::Python::Virtualenv

  desc "CLI-first semantic code search with MCP integration"
  homepage "https://github.com/bobmatnyc/mcp-vector-search"
  url "https://files.pythonhosted.org/packages/79/a0/3945df8aa19a56c3984482e3a3152fbc52967fac203b23532de1fb210c29/mcp_vector_search-4.1.4.tar.gz"
  sha256 "bf028ae9dceea013a60434f4e792558eaa4726357e223a506048eef2735c5d92"
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
