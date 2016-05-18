class Gag < Formula
  desc "Converts GFF into NCBI tbl format"
  homepage "https://genomeannotation.github.io/GAG/"
  url "https://github.com/nextgenusfs/GAG/archive/0.1.3.tar.gz"
  sha256 "a009c4954f064000840dbc18b5d393ee66ce176c1bd796630bd5cb7555796fe0"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gag.py"
  end

  test do
    system "#{bin}/gag.py --version"
  end
end
