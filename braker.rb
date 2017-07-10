class Braker < Formula
  desc "Automated training of AUGUSTUS and GeneMark"
  homepage "http://exon.gatech.edu/genemark/braker1.html"
  url "http://bioinf.uni-greifswald.de/augustus/binaries/BRAKER1_v1.11.tar.gz"
  version "1.11"
  sha256 "cb2d9abe1720ed58753d362eee4af3791007efc617754804882d31f9fe2eab00"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"braker.pl"
    bin.install_symlink libexec/"helpMod.pm"
    bin.install_symlink libexec/"filterGeneMark.pl"
    bin.install_symlink libexec/"filterIntronsFindStrand.pl"
  end

  test do
    system "#{bin}/braker.pl --version"
  end
end
