class Repeatscout < Formula
  homepage "http://bix.ucsd.edu/repeatscout/"
  # doi "10.1093/bioinformatics/bti1018"
  # tag "bioinformatics"

  url "http://repeatscout.bioprojects.org/RepeatScout-1.0.5.tar.gz"
  sha256 "bda6f782382f2b7dcb6a004b7da586d5046b3c12429b158e24787be62de6199c"

  depends_on "trf" => :optional

  def install
    system "make"
    rm_r prefix
    system *%W[make install INSTDIR=#{prefix}]
    bin.install_symlink "../RepeatScout"
  end

  test do
    system "#{bin}/RepeatScout 2>&1 |grep RepeatScout"
  end
end