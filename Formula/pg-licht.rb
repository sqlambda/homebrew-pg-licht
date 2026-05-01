class PgLicht < Formula
  desc "PostgreSQL MCP server for schema exploration over JSON-RPC 2.0"
  homepage "https://github.com/sqlambda/pg_licht"
  url "https://github.com/sqlambda/pg_licht/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "9bcf2cc5497a64601571c60f21250733f13f617a6fe56f55e6d1b2686d962494"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "libpqxx"
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
