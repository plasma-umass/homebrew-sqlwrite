class Sqlwrite < Formula
  desc "Command-line tool for SQL tasks"
  homepage "https://github.com/plasma-umass/sqlwrite"
  url "https://github.com/plasma-umass/sqlwrite.git", branch: "main"
  license "Apache-2.0"
  head "https://github.com/plasma-umass/sqlwrite.git", branch: "main"

  version "0.0.0" # Set a placeholder version

  depends_on "pkg-config" => :build
  depends_on "curl"

  def install
    # Set the flags for the linker to find Homebrew's curl
    ENV.append "LDFLAGS", "-L#{Formula["curl"].opt_lib}"
    ENV.append "CPPFLAGS", "-I#{Formula["curl"].opt_include}"

    # Build using make
    system "make"
    # Install the binary
    bin.install "sqlwrite"
  end

  test do
    # Test the installation
    system "#{bin}/sqlwrite", "--version"
  end
end
