class Sqlwrite < Formula
  desc "Command-line tool for SQL tasks"
  homepage "https://github.com/plasma-umass/sqlwrite"
  url "https://github.com/plasma-umass/sqlwrite.git", branch: "main"
  license "Apache-2.0"

  depends_on "pkg-config" => :build # Add other dependencies if needed

  # Dynamically set the version based on the latest commit hash
  version `git rev-parse --short HEAD`.strip

  def install
    # Build using make
    system "make"
    # Install the binary
    bin.install "sqlwrite"
  end

  test do
    # Test the installation
    assert_match version.to_s, shell_output("#{bin}/sqlwrite --version")
  end
end
