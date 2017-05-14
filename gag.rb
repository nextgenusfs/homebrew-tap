class Gag < Formula
  desc "Converts GFF into NCBI tbl format"
  homepage "https://genomeannotation.github.io/GAG/"
  url "https://github.com/genomeannotation/GAG/archive/v2.0.1.tar.gz"
  sha256 "45a2c998f080a122da23eb6c8333dc18e84a3733ff52ce6ef01580b2c916e436"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gag.py"
  end

  test do
    system "#{bin}/gag.py --version"
  end
end
