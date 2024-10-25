class Sqlwrite < Formula
  desc "Command-line tool for SQL tasks"
  homepage "https://github.com/plasma-umass/sqlwrite"
  url "https://github.com/plasma-umass/sqlwrite.git", branch: "main"
  license "Apache-2.0"
  version "1.0"

  depends_on "make" # Add other dependencies if needed

  def install
    # Clone and build using make
    system "make"
    # Install the binaries, assuming 'sqlwrite' is the main executable
    bin.install "sqlwrite"
  end

  test do
    # Test the installation
    system "#{bin}/sqlwrite", "--version"
  end
end
