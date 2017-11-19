class Braker < Formula
  desc "Automated training of AUGUSTUS and GeneMark"
  homepage "http://exon.gatech.edu/genemark/braker1.html"
  url "http://bioinf.uni-greifswald.de/augustus/binaries/BRAKER_v2.0.tar.gz"
  version "2.0"
  sha256 "e0d8630c0fdacac9f6dcf8a681832419666f175a961d6c2d60cfffeeef72f61b"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"braker.pl"
    bin.install_symlink libexec/"helpMod.pm"
    bin.install_symlink libexec/"filterGeneMark.pl"
    bin.install_symlink libexec/"filterIntronsFindStrand.pl"
    bin.install_symlink libexec/"startAlign.pl"
    bin.install_symlink libexec/"align2hints.pl"
  end

  test do
    system "#{bin}/braker.pl --version"
  end
end
