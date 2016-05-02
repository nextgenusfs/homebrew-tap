class Augustus31 < Formula
  desc "predict genes in eukaryotic genomic sequences"
  homepage "http://bioinf.uni-greifswald.de/augustus/"
  # doi "10.1093/nar/gkh379"
  # tag "bioinformatics"

  url "http://bioinf.uni-greifswald.de/augustus/binaries/old/augustus-3.1.tar.gz"
  sha256 "6db15a859537ccab8739e09c9c28f59c31dd9781e19d91f0d4489f60c7c15486"

  option "with-zlib", "Enable gzip compressed input"

  depends_on "bamtools"
  depends_on "boost" if build.with? "zlib"

  def install
    args = []
    args << "ZIPINPUT=true" if build.with? "zlib"

    system "make", "-C", "auxprogs/filterBam/src", "BAMTOOLS=#{Formula["bamtools"].opt_include}/bamtools", *args
    system "make", "INCLUDES=#{Formula["bamtools"].opt_include}/bamtools", *args

    rm_r %w[include src]
    libexec.install Dir["*"]
    bin.install_symlink "../libexec/bin/augustus"
  end

  def caveats; <<-EOS.undent
    Set the environment variable AUGUSTUS_CONFIG_PATH:
      export AUGUSTUS_CONFIG_PATH=#{opt_prefix}/libexec/config
    EOS
  end

  test do
    system "#{bin}/augustus", "--version"
  end
end
