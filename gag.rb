class Gag < Formula
  desc "Converts GFF into NCBI tbl format"
  homepage "https://genomeannotation.github.io/GAG/"
  url "https://github.com/genomeannotation/GAG/archive/v2.0.tar.gz"
  sha256 "2767be8929bd1870c045a60f792e87491221c5fc616f96475c8eec8996aa478a"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gag.py"
  end

  test do
    system "#{bin}/gag.py --version"
  end
end
