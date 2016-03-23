class Braker < Formula
  desc "Automated training of AUGUSTUS and GeneMark"
  homepage "http://exon.gatech.edu/genemark/braker1.html"
  url "http://exon.gatech.edu/GeneMark/Braker/BRAKER1.tar.gz"
  version "1.9"
  sha256 "9e959984f739208d2a0aab4cc978e7b11db11a86a25fcc5b8f71c9a31e9239f2"

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
