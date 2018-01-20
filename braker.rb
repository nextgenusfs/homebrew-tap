class Braker < Formula
  desc "Automated training of AUGUSTUS and GeneMark"
  homepage "http://exon.gatech.edu/genemark/braker1.html"
  url "http://bioinf.uni-greifswald.de/augustus/binaries/BRAKER2.tar.gz"
  version "2.0.2"
  sha256 "e2097a9cfa9c44fe09cfc1d9c1e57605a29480a91c564aa932e0555bd57c78ab"

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
