class Gag < Formula
  desc "Converts GFF into NCBI tbl format"
  homepage "https://genomeannotation.github.io/GAG/"
  url "https://github.com/genomeannotation/GAG/archive/v2.0-rc.1.tar.gz"
  sha256 "dc1d9cea5bdce0fa39d32c806dc307a19fc63040259f9d8c89820a94efdb32fd"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gag.py"
  end

  test do
    system "#{bin}/gag.py --version"
  end
end
