class PgLicht < Formula
  desc "PostgreSQL MCP server for schema exploration over JSON-RPC 2.0"
  homepage "https://github.com/sqlambda/pg_licht"
  url "https://github.com/sqlambda/pg_licht/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "2c4f3e88cb5f484c2c3a977d4f96f6ee84fc8e51258f1894ba51ee6bb095b997"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libpqxx"
  depends_on "libpq"
  depends_on "nlohmann-json"

  def install
    system "cmake", "-S", "cpp", "-B", "build",
           "-DBUILD_TESTING=OFF",
           *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_predicate bin/"pg_licht_mcp", :exist?
  end
end
