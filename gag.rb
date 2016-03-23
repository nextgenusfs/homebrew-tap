class Gag < Formula
  desc "Converts GFF into NCBI tbl format"
  homepage "http://genomeannotation.github.io/GAG/"
  url "https://github.com/nextgenusfs/GAG/archive/0.1.2.tar.gz"
  version "0.1.2"
  sha256 "6caa54f04a0f43346082f8636a8c899d58555e459a2425cc8a22c98f6efb4706"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"gag.py"
  end

  test do
    system "#{bin}/gag.py --version"
  end
end
