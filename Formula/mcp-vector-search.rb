class McpVectorSearch < Formula
  include Language::Python::Virtualenv

  desc "CLI-first semantic code search with MCP integration"
  homepage "https://github.com/bobmatnyc/mcp-vector-search"
  url "https://files.pythonhosted.org/packages/24/c3/f29b7027016c4a2f54f4263ba185392382e0a4acdd87c84960fb36571678/mcp_vector_search-0.14.0.tar.gz"
  sha256 "22094c2d036cd36599557ee76dfc7576a432a5e5b25db039543ea3602cdf7336"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv = virtualenv_create(libexec, "python3.11")
    system libexec/"bin/python", "-m", "pip", "install", "-v", "--no-cache-dir", buildpath
    bin.install_symlink libexec/"bin/mcp-vector-search"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mcp-vector-search --version")
    assert_match "Usage:", shell_output("#{bin}/mcp-vector-search --help")
  end
end
