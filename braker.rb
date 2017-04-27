class Braker < Formula
  desc "Automated training of AUGUSTUS and GeneMark"
  homepage "http://exon.gatech.edu/genemark/braker1.html"
  url "http://bioinf.uni-greifswald.de/augustus/binaries/BRAKER1.tar.gz"
  version "1.10"
  sha256 "9a941992535e8fe0c324ad9c4cc58fbf76e36400a5541d45ec7236618487cd04"

  def install
    inreplace "braker.pl", "/usr/bin/perl", "/usr/bin/env perl"
    inreplace "filterGenemark.pl", "/usr/bin/perl", "/usr/bin/env perl"
    inreplace "filterIntronsFindStrand.pl", "/usr/bin/perl", "/usr/bin/env perl"
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
