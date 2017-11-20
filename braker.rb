class Braker < Formula
  desc "Automated training of AUGUSTUS and GeneMark"
  homepage "http://exon.gatech.edu/genemark/braker1.html"
  url "http://bioinf.uni-greifswald.de/augustus/binaries/BRAKER2.tar.gz"
  version "2.0.1"
  sha256 "bb6c1a832e0228ad8e48db9d17591fab8b03962a46d55dd0693f461104f6681e"

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
