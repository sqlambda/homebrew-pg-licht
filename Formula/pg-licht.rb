class PgLicht < Formula
  desc "PostgreSQL MCP server for schema exploration over JSON-RPC 2.0"
  homepage "https://github.com/sqlambda/pg_licht"
  url "https://github.com/sqlambda/pg_licht/archive/refs/tags/v4.2.2.tar.gz"
  sha256 "bab04475bad5498307301188f60ad5e1b60977a98944d2d77399e6ca16b1cfde"
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
